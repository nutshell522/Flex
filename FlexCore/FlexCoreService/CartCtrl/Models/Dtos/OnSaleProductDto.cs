namespace FlexCoreService.CartCtrl.Models.Dtos
{
	public class OnSaleProductDto
	{
        public string? ProductId { get; set; }
		public string? ProductName { get; set; }
		public int SalesPrice { get; set; }
		public int? UnitPrice { get; set; }
		public string? ProductDescription { get; set; }
		public string? ImgPath { get; set; }
		public int SalesCategoryId { get; set; }

	}
}
