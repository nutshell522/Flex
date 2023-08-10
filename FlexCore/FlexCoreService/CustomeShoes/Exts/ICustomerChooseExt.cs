using FlexCoreService.CustomeShoes.Models.Dtos;
using FlexCoreService.CustomeShoes.Models.VMs;

namespace FlexCoreService.CustomeShoes.Exts
{
    public static class ICustomerChooseExt
    {
        public static CustomeShoesVM ToAllVM(this CustomeShoesDto dto, IEnumerable<ShoesOptionsDto> dto1, IEnumerable<ShoesColorCategoriesDto> dto2, IEnumerable<CustomizedMaterialsDto> dto3)
        {
            return new CustomeShoesVM
            {
                ShoesProductId = dto.ShoesProductId,
                ShoesName = dto.ShoesName,
                ShoesCategoryName = dto.ShoesCategoryName,
                ShoesUnitPrice = dto.ShoesUnitPrice,
                FirstImgPath = dto.FirstImgPath,
                ShoesOptions = dto1.ToList(),
                ShoesColors = dto2.ToList(),
                ShoesMaterials = dto3.ToList(),

            };
        }
    }
}
