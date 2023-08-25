namespace FlexCoreService.CartCtrl.Models.vm
{
	public class ActiveDiscountVM
	{
		public int DiscountId { get; set; }
		public string? DiscountName { get; set; }
		public string? DiscountDescription { get; set; }
		public int? ProjectTagId { get; set; }
		public DateTime StartDate { get; set; }
		public DateTime? EndDate { get; set; }
	}
}
