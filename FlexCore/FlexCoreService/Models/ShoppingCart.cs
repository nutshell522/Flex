using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class ShoppingCart
    {
        public ShoppingCart()
        {
            CartItems = new HashSet<CartItem>();
        }

        public int CartId { get; set; }
        public int FkMemberId { get; set; }

        public virtual Member FkMember { get; set; } = null!;
        public virtual ICollection<CartItem> CartItems { get; set; }
    }
}
