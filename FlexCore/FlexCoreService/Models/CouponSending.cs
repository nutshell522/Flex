using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class CouponSending
    {
        public int SendingId { get; set; }
        public int FkCouponId { get; set; }
        public int? FkMemberId { get; set; }
        public DateTime SentDate { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public bool RedemptionStatus { get; set; }
        public DateTime? RedeemedDate { get; set; }

        public virtual Coupon FkCoupon { get; set; } = null!;
        public virtual Member? FkMember { get; set; }
    }
}
