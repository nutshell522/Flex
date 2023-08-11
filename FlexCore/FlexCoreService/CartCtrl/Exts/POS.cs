namespace FlexCoreService.CartCtrl.Exts
{
	public class POS
	{
		public readonly List<BaseDiscountStrategy> ActivedRules = new List<BaseDiscountStrategy>();

		public bool checkoutprocess(CartContext cart)
		{
			// reset cart
			cart.AppliedDiscounts.Clear();

			cart.TotalPrice = (decimal)(cart.CartItems.Select(p => p.SubTotal.Value).Sum());
			foreach (var rule in this.ActivedRules)
			{
				var discounts = rule.Process(cart);
				cart.AppliedDiscounts.AddRange(discounts);
				if (rule.Exclusivetag != null)
				{
					foreach (var d in discounts)
					{
						foreach (var p in d.Products) p.Tags.Add(rule.Exclusivetag);
					}
				}
				cart.TotalPrice -= discounts.Select(d => d.Amount).Sum();
			}
			return true;
		}
	}
}
