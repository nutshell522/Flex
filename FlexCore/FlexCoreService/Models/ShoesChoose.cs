using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class ShoesChoose
    {
        public ShoesChoose()
        {
            ShoesGroups = new HashSet<ShoesGroup>();
        }

        public int OptionId { get; set; }
        public string OptinName { get; set; } = null!;

        public virtual ICollection<ShoesGroup> ShoesGroups { get; set; }
    }
}
