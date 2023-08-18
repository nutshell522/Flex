using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class ShoesColorCategory
    {
        public ShoesColorCategory()
        {
            CustomizedShoesPos = new HashSet<CustomizedShoesPo>();
            ShoesGroups = new HashSet<ShoesGroup>();
        }

        public int ShoesColorId { get; set; }
        public string ColorName { get; set; } = null!;
        public string? ColorCode { get; set; }

        public virtual ICollection<CustomizedShoesPo> CustomizedShoesPos { get; set; }
        public virtual ICollection<ShoesGroup> ShoesGroups { get; set; }
    }
}
