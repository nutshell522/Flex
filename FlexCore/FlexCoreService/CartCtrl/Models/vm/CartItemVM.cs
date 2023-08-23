namespace FlexCoreService.CartCtrl.Models.vm
{
	public class CartItemVM
	{
		public int? CartItemId { get; set; }
		public int? CartId { get; set; }
		public int? ProductId { get; set; }
		public int? Qty { get; set; }
		public CartItemProductVM? Product { get; set; }
		public int? TotalDiscountValue { get; set; }
		public int? SubTotal => Product != null ? Product.SalesPrice * Qty : 0;
		public int? UnitSubTotal => Product != null ? Product.UnitPrice * Qty : 0;
	}

	public class CartItemUpdateVM
	{
		public int MemberId { get; set; }
		public CartItemVM? CartItem { get; set; }
	}

	public class CartItemsVM
	{
		public int MemberId { get; set; }
		public CartItemVM[]? CartItems { get; set; }
	}
}
