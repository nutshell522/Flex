using EFModels.Models;
using FlexCoreService.CartCtrl.Interface;
using FlexCoreService.CartCtrl.Models.Dtos;

namespace FlexCoreService.CartCtrl.Service
{
	public class SaleService
	{
		private ISaleRepository _repo;
		public SaleService(ISaleRepository repo)
		{
			_repo = repo;
		}
		public IEnumerable<ActiveDiscountDto> GetActiveDiscounts()
			=> _repo.GetActiveDiscounts();
		public IEnumerable<OnSaleCategoryDto> GetCategories()
			=> _repo.GetAllProductCategories();
		public IEnumerable<OnSaleProductDto> GetOnSaleProducts(int discountId, int? productCategoryId = null)
			=> _repo.GetOnSaleProducts(discountId, productCategoryId);
		
	}
}
