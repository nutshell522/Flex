using FlexCoreService.CartCtrl.Models.Dtos;
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
				Product = dto.Product == null ? null : dto.Product.ToViewModel(),
				TotalDiscountValue = dto.TotalDiscountValue,
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
				MatchDiscounts = dto.MatchDiscounts == null ? null : dto.MatchDiscounts.Select(x => x.ToViewModel()),
				SalesCategoryName = dto.SalesCategoryName,
				DiscountValue = dto.DiscountValue,
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

		public static CartItemDto ToDto(this CartItemVM vm)
		{
			return new CartItemDto
			{
				CartId = vm.CartId,
				CartItemId = vm.CartItemId,
				ProductId = vm.ProductId,
				Qty = vm.Qty,
				Product = vm.Product == null ? null : vm.Product.ToDto(),
				TotalDiscountValue = vm.TotalDiscountValue,
			};
		}
		public static CartItemProductDto ToDto(this CartItemProductVM vm)
		{
			return new CartItemProductDto
			{
				Color = vm.Color,
				ImgPath = vm.ImgPath,
				ProductName = vm.ProductName,
				ProductSaleId = vm.ProductSaleId,
				SalesPrice = vm.SalesPrice,
				Size = vm.Size,
				UnitPrice = vm.UnitPrice,
				MatchDiscounts = vm.MatchDiscounts == null ? null : vm.MatchDiscounts.Select(x => x.ToDto()),
				SalesCategoryName = vm.SalesCategoryName,
				DiscountValue = vm.DiscountValue,
			};
		}
		public static ProductDiscountDto ToDto(this ProductDiscountVM vm)
		{
			return new ProductDiscountDto
			{
				ConditionType = vm.ConditionType,
				ConditionValue = vm.ConditionValue,
				DiscountDescription = vm.DiscountDescription,
				DiscountName = vm.DiscountName,
				DiscountOrder = vm.DiscountOrder,
				DiscountType = vm.DiscountType,
				DiscountValue = vm.DiscountValue,
				DiscountId = vm.DiscountId,
			};
		}
		public static ProductSizeDto ToDto(this ProductSizeVM vm)
		{
			return new ProductSizeDto
			{
				Size = vm.Size,
				ProductSaleId = vm.ProductSaleId,
				Qty = vm.Qty,
				ProductId = vm.ProductId,
				Color = vm.Color,
				
			};
		}
		public static ProductSizeVM ToViewModel(this ProductSizeDto dto)
		{
			return new ProductSizeVM
			{
				Size = dto.Size,
				ProductSaleId = dto.ProductSaleId,
				Qty = dto.Qty,
				ProductId = dto.ProductId,
				Color = dto.Color,
			};
		}
	}
}
