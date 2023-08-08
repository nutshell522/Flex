namespace FlexCoreService.ProductCtrl.Models.Dtos
{
    public class ProductDetailDto
    {
        public string ProductId { get; set; }
        public string ProductName { get; set; }
        public int? UnitPrice { get; set; }
        public int SalesPrice { get; set; }
        public string ColorName { get; set; }
        public string SizeName { get; set; }
        //public int Qty { get; set; }
    }
}
