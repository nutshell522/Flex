namespace FlexCoreService.ProductCtrl.Models.Dtos
{
    public class ProductCardDto
    {
        public string? ProductId { get; set; }
        public string? ProductName { get; set; }
        public int? UnitPrice { get; set; }
        public int SalesPrice { get; set; }
        public int SalesCategoryId { get; set; }
        public string? SalesCategoryName { get; set; }
        public string? ProductCategoryName { get; set; }
        public string? ProductSubCategoryName { get; set; }
        public string? FirstImgPath { get; set; }
        public string? Path
        {
            get
            {
                if (SalesCategoryId == 1) { return "men"; }
                else if (SalesCategoryId == 2) { return "women"; }
                else { return "kid"; }
            }
        }
        public bool IsShow
        {
            get { return true; }
  
        }
    }
}
