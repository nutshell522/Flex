using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class OrderItem
    {
        public int Id { get; set; }
        public int OrderId { get; set; }
        public string? ProductName { get; set; }
        public int? PerPrice { get; set; }
        public int? Quantity { get; set; }
        public string? DiscountName { get; set; }
        public int? Subtotal { get; set; }
        public int? DiscountSubtotal { get; set; }
        public string? ItemsDescription { get; set; }
        public int? FkTypeId { get; set; }

        public virtual Type? FkType { get; set; }
        public virtual Order Order { get; set; } = null!;
    }
}
