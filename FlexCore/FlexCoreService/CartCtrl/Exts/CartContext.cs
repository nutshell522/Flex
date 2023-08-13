using EFModels.Models;
using FlexCoreService.CartCtrl.Models.vm;

namespace FlexCoreService.CartCtrl.Exts
{
	public class CartContext
	{
		public IEnumerable<CartItemVM> CartItems { get; }
		public List<ItemDiscount> AppliedDiscounts { get; set; }
        public decimal OriginalTotalAmount { get; set; }
        public decimal DeliveryFee { get; set; }
        public decimal TotalPrice { get; set; }
		public CartContext(IEnumerable<CartItemVM> vms)
		{
			CartItems = vms;
			AppliedDiscounts = new List<ItemDiscount>();
			TotalPrice = 0m;
			DeliveryFee = 500;

		}
	}
}
