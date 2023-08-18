using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class ColorCategory
    {
        public ColorCategory()
        {
            ProductGroups = new HashSet<ProductGroup>();
            ProductImgs = new HashSet<ProductImg>();
        }

        public int ColorId { get; set; }
        public string ColorName { get; set; } = null!;

        public virtual ICollection<ProductGroup> ProductGroups { get; set; }
        public virtual ICollection<ProductImg> ProductImgs { get; set; }
    }
}
