namespace FlexCoreService.CartCtrl.Models.vm
{
	public class OnSaleProductVM
	{
		public string? ProductId { get; set; }
		public string? ProductName { get; set; }
		public int SalesPrice { get; set; }
		public int? UnitPrice { get; set; }
		public string? ProductDescription { get; set; }
		public string? ImgPath { get; set; }
		public int SalesCategoryId { get; set; }
		public string SalesCategoryStr
		{
			get
			{
				switch (SalesCategoryId)
				{
					case 1:
						return "men";
					case 2:
						return "women";
					case 3:
						return "kid";
					default:
						return string.Empty;
				}
			}
		}
	}
}
