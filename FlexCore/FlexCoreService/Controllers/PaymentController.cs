using EFModels.Models;
using Microsoft.AspNetCore.Mvc;
using System.Text;
using System.Web;
using System.Security.Cryptography;
using Microsoft.AspNetCore.Cors;
using FlexCoreService.ActivityCtrl.Infra.DPRepository;
using FlexCoreService.ActivityCtrl.Models.Dtos;
using NuGet.Protocol.Plugins;

namespace FlexCoreService.Controllers
{
    [EnableCors("AllowAny")]
    [Route("api/[controller]")]
    [ApiController]
    public class PaymentController : ControllerBase
    {
        private AppDbContext _db;
        private PaymentDPRepository _repo;
        private ActivityDPRepository _actRepo;
        private IConfiguration _configuration;
        public PaymentController(AppDbContext context, PaymentDPRepository repo, IConfiguration configuration, ActivityDPRepository actRepo)
        {
            _db = context;
            _repo = repo;
            _configuration = configuration;
            _actRepo = actRepo;
        }

        [HttpGet("{id}")]
        public Dictionary<string, string> MakePayment(int id)
        {
            var orderId = Guid.NewGuid().ToString().Replace("-", "").Substring(0, 20);
            var website = $"https://localhost:7183";

            var activityInfo = _actRepo.GetActivityInfo(id) ;
            

            var order = new Dictionary<string, string>
            {
                { "MerchantID", "3002607" }, //商店編號
                { "MerchantTradeNo", orderId }, //訂單編號
                { "MerchantTradeDate", DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss") }, //交易時間
                { "PaymentType", "aio" }, //交易類型，固定填aio
                { "TotalAmount", activityInfo.ActivitySalePrice.ToString() }, //金額
                { "TradeDesc", "Flex活動報名" },//交易描述
                { "ItemName", activityInfo.ActivityName },//品名
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
        public async Task<IActionResult> AddPayInfo([FromForm] AddPayInfoDTO info)
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
            string tradeDesc = result.ActivityName;
            string encodedString = HttpUtility.UrlEncode(tradeDesc);

            var member = await _actRepo.GetMembreInfoAsync(result.MemberID);
            var activity = _actRepo.GetActivityInfo(result.ItemId);
            ActivityToOrdersDTO orders = new ActivityToOrdersDTO
            {
                ordertime = DateTime.Parse(result.TradeDate),
                fk_member_Id = result.MemberID,
                pay_method_Id = info.PaymentType.Contains("TWQR") ? 3 : 2,
                cellphone = member.Mobile,
                receiver = activity.SpeakerName,
                recipient_address = activity.ActivityPlace,
                close_time = activity.ActivityDate,
                orderCode = info.TradeNo
            };

            var newId=_repo.UpdateOrderInfo(orders);

            ActivityToOrderItemDTO item = new ActivityToOrderItemDTO
            {
                order_Id = newId,
                product_name = tradeDesc,
                per_price = info.TradeAmt,
                subtotal = info.TradeAmt,
                discount_subtotal = info.TradeAmt
            };
            _repo.UpdateOrderItemInfo(item);


            return Redirect($"https://localhost:8080/paymentSuccess/{info.TradeAmt}/{tradeNo}/{encodedString}");

        }


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


        [HttpPost("addReservationOrderInfo")]
        public string ReservationAddOrder(int memberId, string cellphone, string speakerName, string branchAddress, DateTime startTime)
        {
            var order = new ReservationToOrdersDTO
            {
                orderCode = Guid.NewGuid().ToString().Replace("-", "").Substring(0, 16),
                ordertime = DateTime.Now,
                fk_member_Id = memberId,
                cellphone = cellphone,
                receiver = speakerName,
                recipient_address = branchAddress,
                close_time = startTime
            };


            var orderId = _repo.UpdateReservationOrderInfo(order);

            var orderItem = new ReservationToOrderItemDTO
            {
                order_Id = orderId
            };

            _repo.UpdateReservationOrderItemInfo(orderItem);
            return ("新增預約資料成功");
        }

       
    }
}
