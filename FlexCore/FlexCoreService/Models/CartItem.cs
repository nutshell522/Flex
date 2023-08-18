using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class CartItem
    {
        public int CartItemId { get; set; }
        public int FkCardId { get; set; }
        public int FkProductId { get; set; }
        public string Description { get; set; } = null!;
        public int Qty { get; set; }

        public virtual ShoppingCart FkCard { get; set; } = null!;
        public virtual ProductGroup FkProduct { get; set; } = null!;
    }
}
