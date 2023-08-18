using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class CustomizedMaterial
    {
        public CustomizedMaterial()
        {
            CustomizedOrderCustomizedEdgeProtectionNavigations = new HashSet<CustomizedOrder>();
            CustomizedOrderCustomizedEyeletNavigations = new HashSet<CustomizedOrder>();
            CustomizedOrderCustomizedRearNavigations = new HashSet<CustomizedOrder>();
            CustomizedOrderCustomizedToeNavigations = new HashSet<CustomizedOrder>();
            CustomizedOrderCustomizedTongueNavigations = new HashSet<CustomizedOrder>();
            ShoesGroups = new HashSet<ShoesGroup>();
        }

        public int ShoesmaterialId { get; set; }
        public string MaterialName { get; set; } = null!;

        public virtual ICollection<CustomizedOrder> CustomizedOrderCustomizedEdgeProtectionNavigations { get; set; }
        public virtual ICollection<CustomizedOrder> CustomizedOrderCustomizedEyeletNavigations { get; set; }
        public virtual ICollection<CustomizedOrder> CustomizedOrderCustomizedRearNavigations { get; set; }
        public virtual ICollection<CustomizedOrder> CustomizedOrderCustomizedToeNavigations { get; set; }
        public virtual ICollection<CustomizedOrder> CustomizedOrderCustomizedTongueNavigations { get; set; }
        public virtual ICollection<ShoesGroup> ShoesGroups { get; set; }
    }
}
