using FlexCoreService.CartCtrl.Models.Dtos;

namespace FlexCoreService.CartCtrl.Interface
{
	public interface ISaleRepository
	{
		IEnumerable<ActiveDiscountDto> GetActiveDiscounts();
		IEnumerable<OnSaleCategoryDto> GetAllProductCategories();
		IEnumerable<OnSaleProductDto> GetOnSaleProducts(int discountId, int? productCategoryId);
	}
}
