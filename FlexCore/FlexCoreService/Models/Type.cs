using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class Type
    {
        public Type()
        {
            OrderItems = new HashSet<OrderItem>();
            Orders = new HashSet<Order>();
            PointHistories = new HashSet<PointHistory>();
            PointManages = new HashSet<PointManage>();
        }

        public int TypeId { get; set; }
        public string TypeName { get; set; } = null!;

        public virtual ICollection<OrderItem> OrderItems { get; set; }
        public virtual ICollection<Order> Orders { get; set; }
        public virtual ICollection<PointHistory> PointHistories { get; set; }
        public virtual ICollection<PointManage> PointManages { get; set; }
    }
}
