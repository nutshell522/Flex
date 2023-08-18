using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class Return
    {
        public int Id { get; set; }
        public DateTime? 退貨日期 { get; set; }
        public int? Fk訂單 { get; set; }
        public int? 退貨轉帳帳號 { get; set; }
        public bool? 退款狀態 { get; set; }
        public int? 退貨理由 { get; set; }

        public virtual Order? Fk訂單Navigation { get; set; }
        public virtual ReturnReson? 退貨理由Navigation { get; set; }
    }
}
