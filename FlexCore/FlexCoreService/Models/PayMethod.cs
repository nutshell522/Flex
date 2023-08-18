using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class PayMethod
    {
        public PayMethod()
        {
            Orders = new HashSet<Order>();
        }

        public int Id { get; set; }
        public string? PayMethod1 { get; set; }

        public virtual ICollection<Order> Orders { get; set; }
    }
}
