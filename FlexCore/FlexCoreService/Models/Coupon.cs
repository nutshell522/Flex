using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class Coupon
    {
        public Coupon()
        {
            CouponSendings = new HashSet<CouponSending>();
        }

        public int CouponId { get; set; }
        public int FkCouponCategoryId { get; set; }
        public string CouponName { get; set; } = null!;
        public string? CouponDescription { get; set; }
        public string? CouponCode { get; set; }
        public int MinimumPurchaseAmount { get; set; }
        public int DiscountType { get; set; }
        public int DiscountValue { get; set; }
        public DateTime StartDate { get; set; }
        public bool? EndType { get; set; }
        public int? EndDays { get; set; }
        public DateTime? EndDate { get; set; }
        public int? PersonMaxUsage { get; set; }
        public int? RequirementType { get; set; }
        public int? Requirement { get; set; }
        public int? FkRequiredProjectTagId { get; set; }
        public bool? Status { get; set; }

        public virtual CouponCategory FkCouponCategory { get; set; } = null!;
        public virtual ProjectTag? FkRequiredProjectTag { get; set; }
        public virtual ICollection<CouponSending> CouponSendings { get; set; }
    }
}
