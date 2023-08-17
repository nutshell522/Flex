using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class ProductSubCategory
    {
        public ProductSubCategory()
        {
            Products = new HashSet<Product>();
        }

        public int ProductSubCategoryId { get; set; }
        public string ProductSubCategoryName { get; set; } = null!;
        public int FkProductCategoryId { get; set; }
        public string SubCategoryPath { get; set; } = null!;

        public virtual ProductCategory FkProductCategory { get; set; } = null!;
        public virtual ICollection<Product> Products { get; set; }
    }
}
