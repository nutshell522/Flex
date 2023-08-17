using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class ProductCategory
    {
        public ProductCategory()
        {
            ProductSubCategories = new HashSet<ProductSubCategory>();
        }

        public int ProductCategoryId { get; set; }
        public string ProductCategoryName { get; set; } = null!;
        public int FkSalesCategoryId { get; set; }
        public string CategoryPath { get; set; } = null!;

        public virtual SalesCategory FkSalesCategory { get; set; } = null!;
        public virtual ICollection<ProductSubCategory> ProductSubCategories { get; set; }
    }
}
