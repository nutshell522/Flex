using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class ShoesSize
    {
        public ShoesSize()
        {
            ShoesOrders = new HashSet<ShoesOrder>();
        }

        public int SizeId { get; set; }
        public string SizeName { get; set; } = null!;

        public virtual ICollection<ShoesOrder> ShoesOrders { get; set; }
    }
}
