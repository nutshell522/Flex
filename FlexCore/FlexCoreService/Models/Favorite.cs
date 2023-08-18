using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class Favorite
    {
        public int Id { get; set; }
        public string FkProductId { get; set; } = null!;
        public int FkMemberId { get; set; }

        public virtual Member FkMember { get; set; } = null!;
        public virtual Product FkProduct { get; set; } = null!;
    }
}
