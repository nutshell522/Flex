using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class CustomizedShoesPo
    {
        public CustomizedShoesPo()
        {
            CustomizedOrders = new HashSet<CustomizedOrder>();
            ShoesGroups = new HashSet<ShoesGroup>();
            ShoesPictures = new HashSet<ShoesPicture>();
        }

        public int ShoesProductId { get; set; }
        public string ShoesName { get; set; } = null!;
        public string? ShoesDescription { get; set; }
        public string? ShoesOrigin { get; set; }
        public int ShoesUnitPrice { get; set; }
        public DateTime? StartTime { get; set; }
        public DateTime? EndTime { get; set; }
        public bool? Status { get; set; }
        public int? FkShoesCategoryId { get; set; }
        public int? FkShoesColorId { get; set; }
        public DateTime DataCreateTime { get; set; }
        public DateTime DataEditTime { get; set; }

        public virtual ShoesCategory? FkShoesCategory { get; set; }
        public virtual ShoesColorCategory? FkShoesColor { get; set; }
        public virtual ICollection<CustomizedOrder> CustomizedOrders { get; set; }
        public virtual ICollection<ShoesGroup> ShoesGroups { get; set; }
        public virtual ICollection<ShoesPicture> ShoesPictures { get; set; }
    }
}
