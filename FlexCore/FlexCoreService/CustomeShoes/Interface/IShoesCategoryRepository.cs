using FlexCoreService.CustomeShoes.Models.Dtos;
using FlexCoreService.ProductCtrl.Models.Dtos;

namespace FlexCoreService.CustomeShoes.Interface
{
	public interface IShoesCategoryRepository
	{
		public IEnumerable<ShoesCategoryDto> GetAllCategory();

		public IEnumerable<ShoesCategoryCardDto> SearchShoesCategory(int shoescategoryId);

    }
}
