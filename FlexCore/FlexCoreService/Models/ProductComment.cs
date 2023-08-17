using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class ProductComment
    {
        public int Id { get; set; }
        public int FkMemberId { get; set; }
        public int FkProductGroupId { get; set; }
        public string Description { get; set; } = null!;
        public int Score { get; set; }
        public bool Status { get; set; }
        public DateTime CreateTime { get; set; }

        public virtual Member FkMember { get; set; } = null!;
        public virtual ProductGroup FkProductGroup { get; set; } = null!;
    }
}
