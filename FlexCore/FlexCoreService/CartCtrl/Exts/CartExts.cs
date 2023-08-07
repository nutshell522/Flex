using FlexCoreService.CartCtrl.Models.vm;

namespace FlexCoreService.CartCtrl.Exts
{
	public static class CartExts
	{
		public static CartItemVM ToViewModel(this CartItemDto dto)
		{
			return new CartItemVM
			{
				CartId = dto.CartId,
				CartItemId = dto.CartItemId,
				ProductId = dto.ProductId,
				Qty = dto.Qty,
				Product = dto.Product.ToViewModel(),
            };
		}
		public static CartItemProductVM ToViewModel(this CartItemProductDto dto)
		{
			return new CartItemProductVM
			{
				Color = dto.Color,
				ImgPath = dto.ImgPath,
				ProductName = dto.ProductName,
				ProductSaleId = dto.ProductSaleId,
				SalesPrice = dto.SalesPrice,
				Size = dto.Size,
				UnitPrice = dto.UnitPrice,
				MatchDiscounts = dto.MatchDiscounts.Select(x => x.ToViewModel()),
				SalesCategoryName = dto.SalesCategoryName,

			};
		}
		public static ProductDiscountVM ToViewModel(this ProductDiscountDto dto)
		{
			return new ProductDiscountVM
			{
				ConditionType = dto.ConditionType,
				ConditionValue = dto.ConditionValue,
				DiscountDescription = dto.DiscountDescription,
				DiscountName = dto.DiscountName,
				DiscountOrder = dto.DiscountOrder,
				DiscountType = dto.DiscountType,
				DiscountValue = dto.DiscountValue,
				DiscountId = dto.DiscountId,
			};
		}
	}
}
