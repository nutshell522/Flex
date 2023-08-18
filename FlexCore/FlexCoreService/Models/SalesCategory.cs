using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class SalesCategory
    {
        public SalesCategory()
        {
            ProductCategories = new HashSet<ProductCategory>();
        }

        public int SalesCategoryId { get; set; }
        public string SalesCategoryName { get; set; } = null!;

        public virtual ICollection<ProductCategory> ProductCategories { get; set; }
    }
}
