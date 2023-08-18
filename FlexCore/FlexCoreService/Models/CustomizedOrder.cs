using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class CustomizedOrder
    {
        public int CustomizedId { get; set; }
        public string CustomizedNumber { get; set; } = null!;
        public int? CustomizedShoesId { get; set; }
        public int? FkForMemberCustomizedId { get; set; }
        public int? CustomizedEyelet { get; set; }
        public int? CustomizedEdgeProtection { get; set; }
        public int? CustomizedRear { get; set; }
        public int? CustomizedTongue { get; set; }
        public int? CustomizedToe { get; set; }
        public string? Remark { get; set; }
        public DateTime? OrderCreateTime { get; set; }
        public DateTime? OrderEditTime { get; set; }

        public virtual CustomizedMaterial? CustomizedEdgeProtectionNavigation { get; set; }
        public virtual CustomizedMaterial? CustomizedEyeletNavigation { get; set; }
        public virtual CustomizedMaterial? CustomizedRearNavigation { get; set; }
        public virtual CustomizedShoesPo? CustomizedShoes { get; set; }
        public virtual CustomizedMaterial? CustomizedToeNavigation { get; set; }
        public virtual CustomizedMaterial? CustomizedTongueNavigation { get; set; }
        public virtual Member? FkForMemberCustomized { get; set; }
    }
}
