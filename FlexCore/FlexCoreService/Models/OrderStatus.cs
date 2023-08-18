using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class OrderStatus
    {
        public OrderStatus()
        {
            Orders = new HashSet<Order>();
        }

        public int Id { get; set; }
        public string? OrderStatus1 { get; set; }

        public virtual ICollection<Order> Orders { get; set; }
    }
}
