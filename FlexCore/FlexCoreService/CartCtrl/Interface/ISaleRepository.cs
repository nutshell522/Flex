using FlexCoreService.CartCtrl.Models.Dtos;

namespace FlexCoreService.CartCtrl.Interface
{
	public interface ISaleRepository
	{
		IEnumerable<ActiveDiscountDto> GetactiveDiscounts();
		IEnumerable<OnSaleProductDto> GetOnSaleProducts(int discountId, int productCategoryId);
	}
}
