namespace FlexCoreService.ProductCtrl.Models.VM
{
    public class ProductDetailVM
    {
        public string ProductId { get; set; }
        public string ProductName { get; set; }
        public int? UnitPrice { get; set; }
        public int SalesPrice { get; set; }

        public Dictionary<string,List<string>> ColorAndSize { get; set; }

    }
}
