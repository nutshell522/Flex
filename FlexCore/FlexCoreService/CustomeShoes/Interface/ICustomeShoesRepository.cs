using FlexCoreService.CustomeShoes.Models.Dtos;

namespace FlexCoreService.CustomeShoes.Interface
{
	public interface ICustomeShoesRepository
	{
		IEnumerable<CustomeShoesDto> SearchCustomeShoes();

        CustomeShoesDto SearchOneCustomeShoes(int Id);
    }
}
