using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class ShoesCategory
    {
        public ShoesCategory()
        {
            CustomizedShoesPos = new HashSet<CustomizedShoesPo>();
        }

        public int ShoesCategoryId { get; set; }
        public string ShoesCategoryName { get; set; } = null!;

        public virtual ICollection<CustomizedShoesPo> CustomizedShoesPos { get; set; }
    }
}
