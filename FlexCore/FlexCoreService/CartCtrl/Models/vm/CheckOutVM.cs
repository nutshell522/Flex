namespace FlexCoreService.CartCtrl.Models.vm
{
	public class CheckOutVM
	{
        public int MemberId { get; set; }
        public int[] CartItemIds { get; set; }
        public int? CouponId { get; set; }
        public CheckoutDataVM? checkoutData { get; set; }
	}
}
