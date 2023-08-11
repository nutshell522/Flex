using FlexCoreService.CustomeShoes.Models.Dtos;
using FlexCoreService.ProductCtrl.Models.Dtos;

namespace FlexCoreService.CustomeShoes.Interface
{
	public interface ICustomeShoesRepository
	{
		IEnumerable<CustomeShoesDto> SearchCustomeShoes();

        CustomeShoesDto SearchOneCustomeShoes(int Id);

        IEnumerable<ShoesDetailDto> GetShoesDetail(string shoesproductId);
    }
}
