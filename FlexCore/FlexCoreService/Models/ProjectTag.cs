using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class ProjectTag
    {
        public ProjectTag()
        {
            Coupons = new HashSet<Coupon>();
            Discounts = new HashSet<Discount>();
        }

        public int ProjectTagId { get; set; }
        public string ProjectTagName { get; set; } = null!;
        public DateTime CreateAt { get; set; }
        public DateTime ModifiedAt { get; set; }
        public bool? Status { get; set; }

        public virtual ICollection<Coupon> Coupons { get; set; }
        public virtual ICollection<Discount> Discounts { get; set; }
    }
}
