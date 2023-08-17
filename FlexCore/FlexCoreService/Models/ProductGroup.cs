using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class ProductGroup
    {
        public ProductGroup()
        {
            CartItems = new HashSet<CartItem>();
        }

        public int ProductGroupId { get; set; }
        public string FkProductId { get; set; } = null!;
        public int FkColorId { get; set; }
        public int FkSizeId { get; set; }
        public int Qty { get; set; }

        public virtual ColorCategory FkColor { get; set; } = null!;
        public virtual Product FkProduct { get; set; } = null!;
        public virtual SizeCategory FkSize { get; set; } = null!;
        public virtual ICollection<CartItem> CartItems { get; set; }
    }
}
