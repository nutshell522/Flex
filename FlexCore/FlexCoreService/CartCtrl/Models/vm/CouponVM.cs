namespace FlexCoreService.CartCtrl.Models.vm
{
    public class CouponVM
    {
        public int Id { get; set; }
        public int CouponCategoryId { get; set; }
        public int SendingId { get; set; }
        public string CouponName { get; set; }
        public int MinimumPurchaseAmount { get; set; }
        public int DiscountType { get; set;}
        public int DiscountValue { get; set; }
        public DateTime StartDate { get; set; }
        public string StartDateStr { get => StartDate.ToString("yyyy-MM-dd HH:mm"); }
        public DateTime? EndDate { get; set; }

		public string EndDateStr { get => EndDate==null?"無使用期限":EndDate.Value.ToString("yyyy-MM-dd HH:mm"); }
	}
}
