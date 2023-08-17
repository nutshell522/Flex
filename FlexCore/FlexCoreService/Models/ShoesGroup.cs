using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class ShoesGroup
    {
        public int ShoesGroupId { get; set; }
        public int FkShoesMainId { get; set; }
        public int FkOptionId { get; set; }
        public int FkMaterialId { get; set; }
        public int FkShoesColorId { get; set; }
        public int FkCustomerOrderId { get; set; }

        public virtual ShoesOrder FkCustomerOrder { get; set; } = null!;
        public virtual CustomizedMaterial FkMaterial { get; set; } = null!;
        public virtual ShoesChoose FkOption { get; set; } = null!;
        public virtual ShoesColorCategory FkShoesColor { get; set; } = null!;
        public virtual CustomizedShoesPo FkShoesMain { get; set; } = null!;
    }
}
