using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class ShoesOrder
    {
        public ShoesOrder()
        {
            ShoesGroups = new HashSet<ShoesGroup>();
        }

        public int ShoesOrderId { get; set; }
        public int Qty { get; set; }
        public int FkShoesSizeId { get; set; }
        public string? Remark { get; set; }

        public virtual ShoesSize FkShoesSize { get; set; } = null!;
        public virtual ICollection<ShoesGroup> ShoesGroups { get; set; }
    }
}
