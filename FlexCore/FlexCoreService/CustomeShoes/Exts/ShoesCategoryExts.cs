using FlexCoreService.CustomeShoes.Models.Dtos;
using FlexCoreService.CustomeShoes.Models.VMs;
using FlexCoreService.ProductCtrl.Models.Dtos;
using FlexCoreService.ProductCtrl.Models.VM;

namespace FlexCoreService.CustomeShoes.Exts
{
	public static class ShoesCategoryExts
	{
        public static ShoesCategoryVM ToCategoryVM(this ShoesCategoryDto dto)
        {
            return new ShoesCategoryVM
            {        
                ShoesCategoryId = dto.ShoesCategoryId,
                ShoesCategoryName = dto.ShoesCategoryName,
            };
        }

        public static ShoesCategoryCardVM ToCategoryCardVM(this ShoesCategoryCardDto dto) 
        {
            return new ShoesCategoryCardVM
            {
                ShoesCategoryId = dto.ShoesCategoryId,
                ShoesCategoryName = dto.ShoesCategoryName,
                ShoesName = dto.ShoesCategoryName,
                ShoesProductId = dto.ShoesProductId,
                ShoesUnitPrice = dto.ShoesUnitPrice,
                FirstImgPath = dto.FirstImgPath,
            };
        }

    }
}
