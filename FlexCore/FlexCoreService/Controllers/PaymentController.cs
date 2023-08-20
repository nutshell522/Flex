using EFModels.Models;
using Microsoft.AspNetCore.Mvc;
using System.Text;
using System.Web;
using System.Security.Cryptography;
using Microsoft.AspNetCore.Cors;
using FlexCoreService.ActivityCtrl.Infra.DPRepository;
using FlexCoreService.ActivityCtrl.Models.Dtos;

namespace FlexCoreService.Controllers
{
    [EnableCors("AllowAny")]
    [Route("api/[controller]")]
    [ApiController]
    public class PaymentController : ControllerBase
    {
        private AppDbContext _db;
        private PaymentDPRepository _repo;
        private IConfiguration _configuration;
        public PaymentController(AppDbContext context, PaymentDPRepository repo, IConfiguration configuration)
        {
            _db = context;
            _repo = repo;
            _configuration = configuration;
        }

        [HttpGet]
        public Dictionary<string, string> MakePayment()
        {
            var orderId = Guid.NewGuid().ToString().Replace("-", "").Substring(0, 20);
            var website = $"https://localhost:7183";



            var order = new Dictionary<string, string>
            {
                { "MerchantID", "3002607" }, //商店編號
                { "MerchantTradeNo", orderId }, //訂單編號
                { "MerchantTradeDate", DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss") }, //交易時間
                { "PaymentType", "aio" }, //交易類型，固定填aio
                { "TotalAmount", "52777" }, //金額
                { "TradeDesc", "我大綠界終於串完啦" },//交易描述
                { "ItemName", "綠界串完要環遊世界啦" },//品名
                { "ReturnURL",  $"https://localhost:7183/api/Payment/addPayInfo/{orderId}"}, //付款完成通知回傳網址
                { "ChoosePayment", "ALL" }, //預設付款方式
                { "EncryptType", "1" },//CheckMacValue加密類型，固定填1
                { "ClientBackURL", "http://localhost:8080/" },//Client端返回商店的按鈕連結
                { "OrderResultURL", $"https://localhost:7183/api/Payment/addPayInfo/{orderId}"} //client端回傳付款結果網址
                  
        };
            order["CheckMacValue"] = GetCheckMacValue(order); //為 order 物件添加一個名為 "CheckMacValue" 【檢查碼】的屬性，並將其值設定為 GetCheckMacValue(order)

            return order;

        }

        [HttpPost("addOrder")]
        public string AddOrders([FromBody] MakeOrderDTO order)
        {
            string msg = "";
            EcpayOrder entity = new EcpayOrder
            {
                MerchantTradeNo = order.MerchantTradeNo,
                MemberID = order.MemberID,
                RtnCode = 0, //未付款
                RtnMsg = "訂單成功尚未付款",
                TradeNo = order.MerchantID,
                TradeAmt = order.TotalAmount,
                PaymentDate = null, //付款時間
                PaymentType = order.PaymentType,
                PaymentTypeChargeFee = "0",
                TradeDate = order.MerchantTradeDate,  //訂單成立時間          
                SimulatePaid = 0,
                TradeDesc = order.TradeDesc,
                fk_typeId = 2,
                ItemId = order.ActivityId,

            };

            try
            {
                _db.EcpayOrders.Add(entity);
                _db.SaveChanges();
                msg = "終於成功進DB拉拉拉拉拉!!!灑花~";

            }
            catch (Exception ex)
            {
                msg = ex.ToString();
            }

            return msg;

        }

        [HttpPost("addPayInfo/{id}")]
        public IActionResult AddPayInfo([FromForm] AddPayInfoDTO info)
        {
            //用AddPayInfoDTO接一個綠界回傳的JSON物件
            if (info.RtnMsg.Contains("Succeeded"))
            {
                info.RtnMsg = "已付款";
            }

            switch (info.PaymentType)
            {
                case "Credit_CreditCard":
                    info.PaymentType = "信用卡";
                    break;
                case "TWQR_OPAY":
                    info.PaymentType = "歐付寶TWQR 行動支付";
                    break;

            }



            _repo.UpdatePayInfo(info);
            //return ("成功啦啦啦啦啦啦 收工下班!!!");

            var tradeNo = info.TradeNo;

            OrderDetailDTO result = _repo.GetTradeDesc(tradeNo);
            string tradeDesc = result.TradeDesc;
            string encodedString = HttpUtility.UrlEncode(tradeDesc);
            //return Ok(tradeDesc);




            return Redirect($"https://localhost:8080/paymentSuccess/{info.TradeAmt}/{tradeNo}/{encodedString}");

        }


        //[HttpPost("addPayInfo")]
        //public string AddPayInfo(AddPayInfoDTO info)
        //{
        //   // 用AddPayInfoDTO接一個綠界回傳的JSON物件

        //    info.RtnMsg = "已付款";
        //    _repo.UpdatePayInfo(info);
        //    return ("成功啦啦啦啦啦啦 收工下班!!!");

        //}



        //[HttpPost("addPayInfo")]
        //public string AddPayInfo(IFormCollection collection)
        //{
        //    var data = new Dictionary<string, string>();
        //    foreach (string key in collection.Keys)
        //    {
        //        data.Add(key, collection[key]);
        //    }

        //    string temp = collection["MerchantTradeNo"]; //寫在LINQ(下一行)會出錯，
        //    var ecpayOrder = _db.EcpayOrders.Where(m => m.MerchantTradeNo == temp).FirstOrDefault();
        //    if (ecpayOrder != null)
        //    {
        //        ecpayOrder.RtnCode = int.Parse(collection["RtnCode"]);
        //        if (collection["RtnMsg"] == "Succeeded") ecpayOrder.RtnMsg = "八月十七已付款";
        //        ecpayOrder.PaymentDate = Convert.ToDateTime(collection["PaymentDate"]);
        //        ecpayOrder.SimulatePaid = int.Parse(collection["SimulatePaid"]);
        //        _db.SaveChanges();
        //    }
        //    return ("成功");
        //}

        //[HttpPost("addPayInfo/{id}")]
        //public string addPayInfo([FromForm] IFormCollection col)
        //{
        //    var data = new Dictionary<string, string>();
        //    foreach (string key in col.Keys)
        //    {
        //        data.Add(key, col[key]);
        //    }
        //    var Orders = _context.EcpayOrders.ToList().Where(m => m.MerchantTradeNo == col["MerchantTradeNo"]).FirstOrDefault();
        //    Orders.RtnCode = int.Parse(col["RtnCode"]);
        //    if (col["RtnMsg"] == "Succeeded")
        //    {
        //        Orders.RtnMsg = "已付款";
        //        Orders.PaymentDate = Convert.ToDateTime(col["PaymentDate"]);
        //        Orders.SimulatePaid = int.Parse(col["SimulatePaid"]);
        //        await _context.SaveChangesAsync();
        //    }
        //    return ("成功");
        //}

        //[HttpPost("addPayInfo/{id}")]
        //public string addPayInfo()
        //{
        //    var data = new Dictionary<string, string>();
        //    foreach (string key in col.Keys)
        //    {
        //        data.Add(key, col[key]);
        //    }
        //    //var Orders = _context.EcpayOrders.ToList().Where(m => m.MerchantTradeNo == col["MerchantTradeNo"]).FirstOrDefault();
        //    Orders.RtnCode = int.Parse(col["RtnCode"]);
        //    if (col["RtnMsg"] == "Succeeded")
        //    {
        //        Orders.RtnMsg = "已付款";
        //        Orders.PaymentDate = Convert.ToDateTime(col["PaymentDate"]);
        //        Orders.SimulatePaid = int.Parse(col["SimulatePaid"]);
        //        await _context.SaveChangesAsync();
        //    }
        //    return ("成功");
        //}




        private string GetCheckMacValue(Dictionary<string, string> order)

        {
            var param = order.Keys.OrderBy(x => x).Select(key => key + "=" + order[key]).ToList();
            string checkValue = string.Join("&", param);
            //測試用的 HashKey
            var hashKey = "pwFHCqoQZGmho4w6";
            //測試用的 HashIV
            var HashIV = "EkRm7iFT261dpevs";
            checkValue = $"HashKey={hashKey}" + "&" + checkValue + $"&HashIV={HashIV}";
            checkValue = HttpUtility.UrlEncode(checkValue).ToLower();
            checkValue = GetSHA256(checkValue);
            return checkValue.ToUpper();
        }

        private string GetSHA256(string value)
        {
            var result = new StringBuilder();
            var sha256 = SHA256.Create();
            var bts = Encoding.UTF8.GetBytes(value);
            var hash = sha256.ComputeHash(bts);
            for (int i = 0; i < hash.Length; i++)
            {
                result.Append(hash[i].ToString("X2"));
            }
            return result.ToString();
        }
    }
}
