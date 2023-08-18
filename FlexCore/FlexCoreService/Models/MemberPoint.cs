using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class MemberPoint
    {
        public MemberPoint()
        {
            PointHistories = new HashSet<PointHistory>();
        }

        public int MemberPointsId { get; set; }
        public int PointSubtotal { get; set; }
        public int FkMemberId { get; set; }

        public virtual Member FkMember { get; set; } = null!;
        public virtual ICollection<PointHistory> PointHistories { get; set; }
    }
}
