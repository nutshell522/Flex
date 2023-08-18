using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class ProductImg
    {
        public int ProductImgId { get; set; }
        public string FkProductId { get; set; } = null!;
        public int? FkColorId { get; set; }
        public string ImgPath { get; set; } = null!;

        public virtual ColorCategory? FkColor { get; set; }
        public virtual Product FkProduct { get; set; } = null!;
    }
}
