using FlexCoreService.CustomeShoes.Models.Dtos;

namespace FlexCoreService.CustomeShoes.Models.VMs
{
	public class ShoesCategoryVM
	{
        public IEnumerable<ShoesCategoryDto> ShoesCategories { get; set; }
        public ShoesCategoryVM()
        {
            ShoesCategories = new List<ShoesCategoryDto>();
        }
    }
}
