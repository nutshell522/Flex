using EFModels.Models;
using Microsoft.AspNetCore.Mvc;
using System.Text;
using System.Web;
using System.Security.Cryptography;
using Microsoft.AspNetCore.Cors;
using FlexCoreService.ActivityCtrl.Infra.DPRepository;
using FlexCoreService.ActivityCtrl.Models.Dtos;
using NuGet.Protocol.Plugins;
using FlexCoreService.CustomeShoes.Interface;
using FlexCoreService.CustomeShoes.Infra.DPRepository;
using FlexCoreService.CartCtrl.Models.vm;
using FlexCoreService.CartCtrl.Service;
using Bogus;
using Newtonsoft.Json;
using FlexCoreService.CartCtrl.Exts.Coupon_dll;
using FlexCoreService.CartCtrl.Exts.Discount_dll;
using FlexCoreService.CartCtrl.Exts;
using System.Dynamic;
using FlexCoreService.CustomeShoes.Models.Dtos;

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
		private CustomeShoesDPRepository _csdRepo;
		private IConfiguration _configuration;
		private CartService _cartService;
		public PaymentController(AppDbContext context, PaymentDPRepository repo, IConfiguration configuration, ActivityDPRepository actRepo, CustomeShoesDPRepository csdRepo, CartService cartService)
		{
			_db = context;
			_repo = repo;
			_configuration = configuration;
			_actRepo = actRepo;
			_cartService = cartService;
			_csdRepo = csdRepo;
		}

		[HttpGet("{id}")]
		public Dictionary<string, string> MakePayment(int id)
		{
			var orderId = Guid.NewGuid().ToString().Replace("-", "").Substring(0, 20);
			var website = $"https://localhost:7183";

			var activityInfo = _actRepo.GetActivityInfo(id);

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

		[HttpPost("ProductMakePayment")]
		public async Task<Dictionary<string, string>> ProductMakePayment([FromBody] CheckOutVM vm)
		{
			var orderId = Guid.NewGuid().ToString().Replace("-", "").Substring(0, 20);
			var website = $"https://localhost:7183";

			var cartItems = await Task.Run(() => _cartService.GetCartItemsByIds(vm.CartItemIds, vm.MemberId).Select(item => item.ToViewModel()));
			int couponId = vm.CouponId.HasValue && vm.CouponId.Value != 0 ? vm.CouponId.Value : 0;
			string c1 = $"{vm.MemberId},{couponId}";
			foreach (var item in vm.CartItemIds) {
				c1 += $",{item}";
			}
			string c2 = $"{vm.checkoutData.ContactInfo.ContactName},{vm.checkoutData.ContactInfo.Email},{vm.checkoutData.ContactInfo.Phone}";
			string c3 = $"{vm.checkoutData.BillingAddress.Name},{vm.checkoutData.BillingAddress.Phone},{vm.checkoutData.BillingAddress.Address}";
			string c4 = $"{vm.checkoutData.ContactInfo.Address}";
			BaseCouponStrategy? coupon;
			if (couponId!=0)
			{
				coupon = await Task.Run(() => LoadCoupon(vm.CouponId.Value));
			}
			else
			{
				coupon = null;
			}
			CartContext cart = CheckoutProcess(cartItems, coupon);
			StringBuilder stringBuilder = new StringBuilder();
			foreach (var cartItem in cartItems)
			{
				stringBuilder.Append(cartItem.Product.ProductName);
				stringBuilder.Append('#');
			}
			var pdName = stringBuilder.ToString();

			var order = new Dictionary<string, string>
			{
				{ "MerchantID", "3002607" }, //商店編號
                { "MerchantTradeNo", orderId }, //訂單編號
                { "MerchantTradeDate", DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss") }, //交易時間
                { "PaymentType", "aio" }, //交易類型，固定填aio
                { "TotalAmount", $"{cart.TotalPrice }"}, //金額
                { "TradeDesc", "Flex產品消費" },//交易描述
                { "ItemName", pdName },//品名
                { "ReturnURL",  $"{website}/api/Payment/addPayInfo/{orderId}"}, //付款完成通知回傳網址
                { "ChoosePayment", "ALL" }, //預設付款方式
                { "EncryptType", "1" },//CheckMacValue加密類型，固定填1
                { "ClientBackURL", "http://localhost:8080/" },//Client端返回商店的按鈕連結
                { "OrderResultURL", $"https://localhost:7183/api/Payment/AddPayInfoProduct/{orderId}"}, //client端回傳付款結果網址
				{ "CustomField1", c1}, //客製化欄位
				{ "CustomField2", c2}, //客製化欄位
				{ "CustomField3", c3}, //客製化欄位
				{ "CustomField4", c4}, //客製化欄位
            };
			order["CheckMacValue"] = GetCheckMacValue(order); //為 order 物件添加一個名為 "CheckMacValue" 【檢查碼】的屬性，並將其值設定為 GetCheckMacValue(order)

			return order;
		}

		[HttpGet("Shoes/{id}")]
		public Dictionary<string, string> ShoesMakePayment(int id)
		{
			var orderId = Guid.NewGuid().ToString().Replace("-", "").Substring(0, 20);

			var website = $"https://localhost:7183";

			var shoesInfo = _csdRepo.GetShoesDetail2(id);

			var order = new Dictionary<string, string>
			{
				{ "MerchantID", "3002607" }, //商店編號
                { "MerchantTradeNo", orderId }, //訂單編號
                { "MerchantTradeDate", DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss") }, //交易時間
                { "PaymentType", "aio" }, //交易類型，固定填aio
                { "TotalAmount", shoesInfo.ShoesUnitPrice.ToString() }, //金額
                { "TradeDesc", "Flex客製化商品結帳" },//交易描述
                { "ItemName", shoesInfo.ShoesName },//品名
                { "ReturnURL",  $"https://localhost:7183/api/Payment/addPayInfo/{orderId}"}, //付款完成通知回傳網址
                { "ChoosePayment", "ALL" }, //預設付款方式
                { "EncryptType", "1" },//CheckMacValue加密類型，固定填1
                { "ClientBackURL", "http://localhost:8080/" },//Client端返回商店的按鈕連結
                { "OrderResultURL", $"https://localhost:7183/api/Payment/addShoesPayInfo/{orderId}"} //client端回傳付款結果網址
                  
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

			var newId = _repo.UpdateOrderInfo(orders);

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

		[HttpPost("addShoesPayInfo/{id}")]
		public async Task<IActionResult> AddPayInfoShoes([FromForm] AddPayInfoDTO info)
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

			ShoesOrderDetailDto result = _csdRepo.GetTradeDesc(tradeNo);
			string tradeDesc = result.ShoesName;
			string encodedString = HttpUtility.UrlEncode(tradeDesc);

			var member = await _actRepo.GetMembreInfoAsync(result.MemberID);
			var shoes = _csdRepo.GetShoesDetail2(result.ItemId);
			ShoesToOrderDto orders = new ShoesToOrderDto
			{
				ordertime = DateTime.Parse(result.TradeDate),
				fk_member_Id = result.MemberID,
				pay_method_Id = info.PaymentType.Contains("TWQR") ? 3 : 2,
				cellphone = member.Mobile,
				receiver = member.Name,
				recipient_address = member.CommonAddress,
				orderCode = info.TradeNo
			};

			var newId = _csdRepo.UpdateOrderInfo(orders);

			ShoesItemToOrderDto item = new ShoesItemToOrderDto
			{
				order_Id = newId,
				product_name = tradeDesc,
				per_price = info.TradeAmt,
				subtotal = info.TradeAmt,
				discount_subtotal = info.TradeAmt

			};
			_csdRepo.UpdateShoesItemInfo(item);

			return Redirect($"https://localhost:8080/paymentSuccess/{info.TradeAmt}/{tradeNo}/{encodedString}");

		}


		[HttpPost("AddPayInfoProduct/{id}")]
		public async Task<IActionResult> AddPayInfoProduct([FromForm] AddPayInfoDTO info)
		{
			var cartInfo = new CheckOutVM();
			string[] idsStr = info.CustomField1.Split(',');
			int.TryParse(idsStr[0],out int memberId);
			int.TryParse(idsStr[1],out int couponId);
			cartInfo.MemberId = memberId;
			cartInfo.CouponId = couponId;
			int[] itemIds = new int[idsStr.Length-2];
			for (int i = 2; i < idsStr.Length; i++)
			{
				if (int.TryParse(idsStr[i], out int number))
				{
					itemIds[i-2] = number;
				}
			}
			cartInfo.CartItemIds = itemIds;
			cartInfo.checkoutData = new CheckoutDataVM();
			cartInfo.checkoutData.PaymentInfo = new PaymentInfoVM();
			cartInfo.checkoutData.ContactInfo = new ContactInfoVM();
			cartInfo.checkoutData.BillingAddress = new BillingAddressVM();
			switch (info.PaymentType)
			{
				case "Credit_CreditCard":
					cartInfo.checkoutData.PaymentInfo.PaymentMethod = 2;
					break;
				case "TWQR_OPAY":
					cartInfo.checkoutData.PaymentInfo.PaymentMethod = 3;
					break;
			}
			string[] c2 = info.CustomField2.Split(',');
			cartInfo.checkoutData.ContactInfo.ContactName = c2[0];
			cartInfo.checkoutData.ContactInfo.Email = c2[1];
			cartInfo.checkoutData.ContactInfo.Phone = c2[2];
			cartInfo.checkoutData.ContactInfo.Address = info.CustomField4;
			string[] c3 = info.CustomField3.Split(',');
			cartInfo.checkoutData.BillingAddress.Name = c3[0];
			cartInfo.checkoutData.BillingAddress.Phone = c3[1];
			cartInfo.checkoutData.BillingAddress.Address = c3[2];

			var cartItems = await Task.Run(() => _cartService.GetCartItemsByIds(cartInfo.CartItemIds, cartInfo.MemberId).Select(item => item.ToViewModel()));
			BaseCouponStrategy? coupon;
			if (cartInfo.CouponId.HasValue && cartInfo.CouponId.Value != 0)
			{
				coupon = await Task.Run(() => LoadCoupon(cartInfo.CouponId.Value));
			}
			else
			{
				coupon = null;
			}
			CartContext cart = CheckoutProcess(cartItems, coupon);
			cart.MemberId = cartInfo.MemberId;
			cart.checkoutData = cartInfo.checkoutData;
			var result = _cartService.Checkout(cart);
			return Ok("ok");
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
		public async Task<string> ReservationAddOrder([FromBody] ReservationAddOrderDTO dto)
		{
			var memberInfo = await _actRepo.GetMembreInfoAsync(dto.memberId);
			var order = new ReservationToOrdersDTO
			{
				orderCode = Guid.NewGuid().ToString().Replace("-", "").Substring(0, 16),
				ordertime = DateTime.Now,
				fk_member_Id = dto.memberId,
				cellphone = memberInfo.Mobile,
				receiver = dto.speakerName,
				recipient_address = dto.branchAddress,
				close_time = dto.startTime
			};


			var orderId = _repo.UpdateReservationOrderInfo(order);

			var orderItem = new ReservationToOrderItemDTO
			{
				order_Id = orderId
			};

			_repo.UpdateReservationOrderItemInfo(orderItem);
			return ("新增預約資料成功");
		}

		private CartContext CheckoutProcess(IEnumerable<CartItemVM> cartItems, BaseCouponStrategy? coupon = null)
		{
			CartContext cart = new CartContext(cartItems, coupon);
			POS pos = new POS();
			pos.ActivedRules.AddRange(LoadDiscount());
			pos.CheckoutProcess(cart);
			return cart;
		}

		private IEnumerable<BaseDiscountStrategy> LoadDiscount()
		{
			var vms = _cartService.GetActiveDiscounts().Select(x => x.ToViewModel());
			foreach (var vm in vms)
			{
				// 折扣類型如為1是百分比折扣，0則是金額折扣
				if (vm.DiscountType == 1)
				{
					// 門檻類型為1為數量門檻，0為金額門檻
					if (vm.ConditionType == 1)
					{
						yield return new BuyMoreItemsPercentageDiscount(vm);
					}
					else
					{
						yield return new PercentageDiscount(vm);
					}
				}
				else
				{
					if (vm.ConditionType == 1)
					{
						yield return new BuyMoreItemsAmountDiscount(vm);
					}
					else
					{
						yield return new AmountDiscount(vm);
					}
				}
			}
		}
		private BaseCouponStrategy LoadCoupon(int sendingId)
		{
			var vm = _cartService.GetCouponById(sendingId).ToViewModel();
			// 折扣類型如為1是百分比折扣，0則是金額折扣,2是免運費
			if (vm.DiscountType == 1) return new PercentageCoupon(vm);
			else if (vm.DiscountType == 2) return new FreeShippingCoupon(vm);
			else return new AmountCoupon(vm);
		}
	}
}
