namespace FlexCoreService.CartCtrl.Models.vm
{
	public class OnSaleCategoryVM
	{
		public int id { get; set; }
		public string? SalesCategoryName { get; set; }
		public string? SalesCategoryStr
		{
			get
			{
				switch(SalesCategoryName)
				{
					case "男裝":
						return "Men";
					case "女裝":
						return "Women";
					case "童裝":
						return "Kid";
					default:
						return string.Empty;	
				}
			}
		}
	}
}
