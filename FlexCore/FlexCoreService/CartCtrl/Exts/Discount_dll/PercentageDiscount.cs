using FlexCoreService.CartCtrl.Models.vm;
using Newtonsoft.Json.Linq;

namespace FlexCoreService.CartCtrl.Exts.Discount_dll
{
	public class PercentageDiscount : BaseDiscountStrategy
	{
		// 門檻金額
		private readonly int _itemsAmount;
		// 折扣, 20表示八折
		private readonly int _percentOff;
		public PercentageDiscount(ProductDiscountVM vm) : base(vm)
		{
			_itemsAmount = vm.ConditionValue.Value;
			_percentOff = vm.DiscountValue.Value;
		}

		public override ItemDiscount Process(CartContext cart)
		{
			//throw new NotImplementedException();
			List<CartItemVM> matchedProducts = new List<CartItemVM>();

			foreach (CartItemVM p in cart.CartItems)
			{
				if (p.Product.MatchDiscounts.Any(x => x.DiscountId == Id))
				{
					matchedProducts.Add(p);
				}
			}
			var totalAmount = matchedProducts.Sum(x => x.SubTotal);

			if (totalAmount >= _itemsAmount)
			{
				foreach (CartItemVM p in matchedProducts)
				{
					int value = (int)Math.Round((decimal)(p.SubTotal.Value * _percentOff / 100), MidpointRounding.AwayFromZero);
					p.Product.DiscountValue = value;
				}
				return new ItemDiscount()
				{
					Rule = this,
					Products = matchedProducts.Select(x => x.Product).ToArray(),
					Amount = Math.Round((decimal)matchedProducts.Sum(x => x.SubTotal) * _percentOff / 100, MidpointRounding.AwayFromZero)
				};
			}
			return null;
		}
	}
}
