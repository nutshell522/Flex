using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class SizeCategory
    {
        public SizeCategory()
        {
            ProductGroups = new HashSet<ProductGroup>();
        }

        public int SizeId { get; set; }
        public string SizeName { get; set; } = null!;

        public virtual ICollection<ProductGroup> ProductGroups { get; set; }
    }
}
