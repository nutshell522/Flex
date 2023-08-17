using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class PointTradeIn
    {
        public int PointTradeInId { get; set; }
        public int FkMemberId { get; set; }
        public int? FkOrderId { get; set; }
        public string GiftThreshold { get; set; } = null!;
        public string? GetPoints { get; set; }
        public string? MaxGetPoints { get; set; }
        public DateTime EffectiveDate { get; set; }
        public DateTime ExpirationDate { get; set; }

        public virtual Member FkMember { get; set; } = null!;
        public virtual Order? FkOrder { get; set; }
    }
}
