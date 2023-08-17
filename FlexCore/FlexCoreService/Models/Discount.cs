using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class Discount
    {
        public int DiscountId { get; set; }
        public string DiscountName { get; set; } = null!;
        public string? DiscountDescription { get; set; }
        public int? FkProjectTagId { get; set; }
        public int DiscountType { get; set; }
        public int DiscountValue { get; set; }
        public int ConditionType { get; set; }
        public int ConditionValue { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public int? OrderBy { get; set; }
        public bool? Status { get; set; }

        public virtual ProjectTag? FkProjectTag { get; set; }
    }
}
