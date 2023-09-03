using ECPay.Payment.Integration.Extensions;
using FlexCoreService.CartCtrl.Models.vm;

namespace FlexCoreService.CartCtrl.Exts.Discount_dll
{
	public class BuyMoreItemsAmountDiscount : BaseDiscountStrategy
	{
		// 門檻數量
		private readonly int _itemsCount;
		// 折扣, 20表示八折
		private readonly int _discountAmount;
		public BuyMoreItemsAmountDiscount(ProductDiscountVM vm) : base(vm)
		{
			_itemsCount = vm.ConditionValue.Value;
			_discountAmount = vm.DiscountValue.Value;
		}

		public override ItemDiscount Process(CartContext cart)
		{
			List<CartItemVM> matchedProducts = new List<CartItemVM>();
			int totalQty = 0;

			foreach (CartItemVM p in cart.CartItems)
			{
				if (p.Product.MatchDiscounts.Any(x => x.DiscountId == Id))
				{
					totalQty += p.Qty.Value;
					matchedProducts.Add(p);
				}
			}

			if (totalQty >= _itemsCount)
			{
				decimal totalDiscountAmount = _discountAmount;
				decimal average = Math.Ceiling((decimal)totalDiscountAmount / totalQty);
				
				foreach (CartItemVM p in matchedProducts)
				{
					decimal value = (int)average*p.Qty.Value;
					totalDiscountAmount-=value;
					if (totalDiscountAmount != 0 && totalDiscountAmount / average < 1)
					{
						value += totalDiscountAmount;
					}
					p.Product.DiscountValue = (int)value;
				}
				return new ItemDiscount()
				{
					Rule = this,
					Products = matchedProducts.Select(x => x.Product).ToArray(),
					Amount = _discountAmount
				};
			}
			return null;
		}
	}
}
