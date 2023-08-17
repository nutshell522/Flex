using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class Product
    {
        public Product()
        {
            Favorites = new HashSet<Favorite>();
            ProductGroups = new HashSet<ProductGroup>();
            ProductImgs = new HashSet<ProductImg>();
            ProjectTagItems = new HashSet<ProjectTagItem>();
        }

        public string ProductId { get; set; } = null!;
        public string ProductName { get; set; } = null!;
        public string ProductDescription { get; set; } = null!;
        public string? ProductMaterial { get; set; }
        public string ProductOrigin { get; set; } = null!;
        public int? UnitPrice { get; set; }
        public int SalesPrice { get; set; }
        public DateTime? StartTime { get; set; }
        public DateTime? EndTime { get; set; }
        public bool? Status { get; set; }
        public bool LogOut { get; set; }
        public string? Tag { get; set; }
        public int FkProductSubCategoryId { get; set; }
        public DateTime CreateTime { get; set; }
        public DateTime EditTime { get; set; }

        public virtual ProductSubCategory FkProductSubCategory { get; set; } = null!;
        public virtual ICollection<Favorite> Favorites { get; set; }
        public virtual ICollection<ProductGroup> ProductGroups { get; set; }
        public virtual ICollection<ProductImg> ProductImgs { get; set; }
        public virtual ICollection<ProjectTagItem> ProjectTagItems { get; set; }
    }
}
