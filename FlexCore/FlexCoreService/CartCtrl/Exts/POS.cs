namespace FlexCoreService.CartCtrl.Exts
{
	public class POS
	{
		public readonly List<BaseDiscountStrategy> ActivedRules = new List<BaseDiscountStrategy>();

		//public bool CheckoutProcess(CartContext cart)
		//{
		//	// reset cart
		//	cart.AppliedDiscounts.Clear();

		//	cart.TotalPrice = cart.PurchasedItems.Select(p => p.Price).Sum();
		//	foreach (var rule in this.ActivedRules)
		//	{
		//		var discounts = rule.Process(cart);
		//		cart.AppliedDiscounts.AddRange(discounts);
		//		if (rule.ExclusiveTag != null)
		//		{
		//			foreach (var d in discounts)
		//			{
		//				foreach (var p in d.Products) p.Tags.Add(rule.ExclusiveTag);
		//			}
		//		}
		//		cart.TotalPrice -= discounts.Select(d => d.Amount).Sum();
		//	}
		//	return true;
		//}
	}
}
