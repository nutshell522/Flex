﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace FlexCoreService.Models.EFModels
{
    public partial class PointTradeIn
    {
        public int PointTradeInId { get; set; }
        public int fk_MemberId { get; set; }
        public int? fk_OrderId { get; set; }
        public string GiftThreshold { get; set; }
        public string GetPoints { get; set; }
        public string MaxGetPoints { get; set; }
        public DateTime EffectiveDate { get; set; }
        public DateTime ExpirationDate { get; set; }

        public virtual Member fk_Member { get; set; }
        public virtual order fk_Order { get; set; }
    }
}