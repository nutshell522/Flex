using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class LogisticsCompany
    {
        public LogisticsCompany()
        {
            Orders = new HashSet<Order>();
        }

        public int Id { get; set; }
        public string? Name { get; set; }
        public string? Tel { get; set; }
        public string? LogisticsDescription { get; set; }

        public virtual ICollection<Order> Orders { get; set; }
    }
}
