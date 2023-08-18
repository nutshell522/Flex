using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class PayStatus
    {
        public PayStatus()
        {
            Orders = new HashSet<Order>();
        }

        public int Id { get; set; }
        public string? PayStatus1 { get; set; }

        public virtual ICollection<Order> Orders { get; set; }
    }
}
