using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class Order
    {
        public Order()
        {
            OrderItems = new HashSet<OrderItem>();
            PointHistories = new HashSet<PointHistory>();
            PointTradeIns = new HashSet<PointTradeIn>();
            Returns = new HashSet<Return>();
        }

        public int Id { get; set; }
        public DateTime Ordertime { get; set; }
        public int FkMemberId { get; set; }
        public int TotalQuantity { get; set; }
        public int LogisticsCompanyId { get; set; }
        public int OrderStatusId { get; set; }
        public int PayMethodId { get; set; }
        public int PayStatusId { get; set; }
        public string? CouponName { get; set; }
        public int? CouponDiscount { get; set; }
        public int? Freight { get; set; }
        public string Cellphone { get; set; } = null!;
        public string? Receipt { get; set; }
        public string? Receiver { get; set; }
        public string? RecipientAddress { get; set; }
        public string? OrderDescription { get; set; }
        public int TotalPrice { get; set; }
        public bool? Close { get; set; }
        public DateTime? CloseTime { get; set; }
        public int? FkTypeId { get; set; }

        public virtual Member FkMember { get; set; } = null!;
        public virtual Type? FkType { get; set; }
        public virtual LogisticsCompany LogisticsCompany { get; set; } = null!;
        public virtual OrderStatus OrderStatus { get; set; } = null!;
        public virtual PayMethod PayMethod { get; set; } = null!;
        public virtual PayStatus PayStatus { get; set; } = null!;
        public virtual ICollection<OrderItem> OrderItems { get; set; }
        public virtual ICollection<PointHistory> PointHistories { get; set; }
        public virtual ICollection<PointTradeIn> PointTradeIns { get; set; }
        public virtual ICollection<Return> Returns { get; set; }
    }
}
