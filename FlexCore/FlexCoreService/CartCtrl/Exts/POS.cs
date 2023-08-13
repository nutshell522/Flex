namespace FlexCoreService.CartCtrl.Exts
{
	public class POS
	{
		public readonly List<BaseDiscountStrategy> ActivedRules = new List<BaseDiscountStrategy>();

		public bool CheckoutProcess(CartContext cart)
		{
			// reset cart
			cart.AppliedDiscounts.Clear();

			cart.TotalPrice = (decimal)(cart.CartItems.Select(p => p.SubTotal.Value).Sum());
			foreach (var rule in this.ActivedRules)
			{
				
				var discounts = rule.Process(cart);
				if(discounts != null)
				{
					cart.AppliedDiscounts.Add(discounts);
					cart.TotalPrice -= discounts.Amount;
				}
			}
			return true;
		}
	}
}
