using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class CouponCategory
    {
        public CouponCategory()
        {
            Coupons = new HashSet<Coupon>();
        }

        public int CouponCategoryId { get; set; }
        public string CouponCategoryName { get; set; } = null!;

        public virtual ICollection<Coupon> Coupons { get; set; }
    }
}
