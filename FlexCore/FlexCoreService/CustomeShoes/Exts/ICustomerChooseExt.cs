﻿using FlexCoreService.CustomeShoes.Models.Dtos;
using FlexCoreService.CustomeShoes.Models.VMs;
using FlexCoreService.ProductCtrl.Models.Dtos;

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

        public static ShoesDetailVM ToDetailVM(this ShoesDetailDto dto, IEnumerable<ShoesSizeDto> dto1) 
        {
            return new ShoesDetailVM
            {
                ShoesProductId = dto.ShoesProductId,
                ShoesName = dto.ShoesName,
                ShoesCategoryName = dto.ShoesCategoryName, 
                ShoesDescription = dto.ShoesDescription,
                ColorName = dto.ColorName,
                ColorCode = dto.ColorCode,
                ShoesOrigin = dto.ShoesOrigin,
                ShoesUnitPrice = dto.ShoesUnitPrice,
                ShoesImgs = dto.ShoesImgs,
                Qty = dto.Qty,
                ShoesSize = dto1.ToList(),

            };        
        }
    }
}
