using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class ProjectTagItem
    {
        public int FkProjectTagId { get; set; }
        public string FkProductId { get; set; } = null!;

        public virtual Product FkProduct { get; set; } = null!;
    }
}
