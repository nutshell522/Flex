using FlexCoreService.CustomeShoes.Models.Dtos;
using FlexCoreService.CustomeShoes.Models.VMs;
using FlexCoreService.ProductCtrl.Models.Dtos;
using FlexCoreService.ProductCtrl.Models.VM;

namespace FlexCoreService.CustomeShoes.Exts
{
	public static class ShoesCategoryExts
	{
        public static ShoesCategoryVM ToCategoryVM(this IEnumerable<ShoesCategoryDto> dto)
        {
            return new ShoesCategoryVM
            {        
                ShoesCategories = dto.ToList(),
            };
        }
    }
}
