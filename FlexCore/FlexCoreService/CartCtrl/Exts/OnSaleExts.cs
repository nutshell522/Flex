using FlexCoreService.CartCtrl.Models.Dtos;
using FlexCoreService.CartCtrl.Models.vm;

namespace FlexCoreService.CartCtrl.Exts
{
	public static class OnSaleExts
	{
		public static OnSaleProductVM ToViewModel(this OnSaleProductDto dto)
		{
			return new OnSaleProductVM
			{
				ProductId = dto.ProductId,
				ProductName = dto.ProductName,
				ProductDescription = dto.ProductDescription,
				ImgPath = dto.ImgPath,
				SalesPrice = dto.SalesPrice,
				UnitPrice = dto.UnitPrice,
				SalesCategoryId = dto.SalesCategoryId
			};
		}
		public static OnSaleCategoryVM ToViewModel(this OnSaleCategoryDto dto)
		{
			return new OnSaleCategoryVM
			{
				SalesCategoryName = dto.SalesCategoryName,
				id = dto.id
			};
		}
		public static ActiveDiscountDto ToViewModel(this ActiveDiscountDto dto)
		{
			return new ActiveDiscountDto
			{
				DiscountDescription = dto.DiscountDescription,
				DiscountId = dto.DiscountId,
				DiscountName = dto.DiscountName,
				EndDate = dto.EndDate,
				ProjectTagId = dto.ProjectTagId,
				StartDate = dto.StartDate,
			};
		}

	}
}
