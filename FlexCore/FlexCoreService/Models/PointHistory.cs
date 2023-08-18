using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class PointHistory
    {
        public int PointHistoryId { get; set; }
        public bool GetOrDeduct { get; set; }
        public int UsageAmount { get; set; }
        public DateTime EffectiveDate { get; set; }
        public int? FkMemberId { get; set; }
        public int? FkOrderId { get; set; }
        public int? FkTypeId { get; set; }
        public int? FkMemberPointsId { get; set; }

        public virtual Member? FkMember { get; set; }
        public virtual MemberPoint? FkMemberPoints { get; set; }
        public virtual Order? FkOrder { get; set; }
        public virtual Type? FkType { get; set; }
    }
}
