using EFModels.Models;
using FlexCoreService.ProductCtrl.Models.Dtos;
using FlexCoreService.ProductCtrl.Models.VM;

namespace FlexCoreService.ProductCtrl.Exts
{
    public static class ProductsExts
    {
        public static ProductCardVM ToCardVM(this ProductCardDto dto)
        {
            return new ProductCardVM
            {
                ProductId = dto.ProductId,
                ProductName = dto.ProductName,
                UnitPrice = dto.UnitPrice,
                SalesPrice = dto.SalesPrice,
                FirstImgPath = dto.FirstImgPath,
            };
        }

        public static ProductDetailVM ToDetailVM(this IEnumerable<ProductDetailDto> dto)
        {
            var group = new Dictionary<string, List<ColorGroupDto>>();

            foreach(var detail in dto)
            {
                var colorGroup = new ColorGroupDto()
                {
                    ProductGroupId = detail.ProductGroupId,
                    SizeName = detail.SizeName,
                    Qty = detail.Qty,
                    DefaultColorImg = detail.DefaultColorImg,
                };
                if (!group.ContainsKey(detail.ColorName))
                {
                    group[detail.ColorName]= new List<ColorGroupDto> { colorGroup };
                }
                else
                {
                    group[detail.ColorName].Add(colorGroup);
                }
            }

            var vm = new ProductDetailVM()
            {
                ProductId = dto.FirstOrDefault().ProductId,
                ProductName = dto.FirstOrDefault().ProductName,
                ProductDescription = dto.FirstOrDefault().ProductDescription,
                ProductMaterial = dto.FirstOrDefault().ProductMaterial,
                ProductOrigin = dto.FirstOrDefault().ProductOrigin,
                UnitPrice = dto.FirstOrDefault()?.UnitPrice,
                SalesPrice = dto.FirstOrDefault().SalesPrice,
                //DefaultColorImg = new Dictionary<string, string>(),
                ProductGroup=group
            };
            //foreach (var item in dto)
            //{
            //    if (!vm.DefaultColorImg.ContainsKey(item.ColorName)) 
            //    {
            //        vm.DefaultColorImg[item.ColorName] = item.DefaultColorImg;
            //    }
            //}
            return vm;
        }
    }
}
