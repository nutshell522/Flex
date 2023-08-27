namespace FlexCoreService.CartCtrl.Models.Dtos
{
    public class CouponSendingDto
    {
        public int? CouponId { get; set; }
        public int? EndType { get; set; }
		public int? EndDays { get; set; }
		public DateTime? EndDate { get; set; }
        public int? RequirementType { get; set; }
        public int? Requirement { get; set; }
    }
}
