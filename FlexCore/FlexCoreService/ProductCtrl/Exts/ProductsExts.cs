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
            var groupby = dto.GroupBy(dto => dto.ColorName, dto => dto.SizeName, (color, size) => new
            {
                ColorName = color,
                SizeName = size.ToList()
            });

            var vm = new ProductDetailVM()
            {
                ProductId = dto.FirstOrDefault().ProductId,
                ProductName = dto.FirstOrDefault().ProductName,
                UnitPrice = dto.FirstOrDefault()?.UnitPrice,
                SalesPrice = dto.FirstOrDefault().SalesPrice,
                ColorAndSize = new Dictionary<string, List<string>>()
            };
            foreach (var item in groupby)
            {
                //if (!vm.ColorAndSize.ContainsKey(item.ColorName))
                //{
                //    vm.ColorAndSize[item.ColorName]=new List<string>();
                //}
                vm.ColorAndSize[item.ColorName]= item.SizeName;
            }
            return vm;
        }
    }
}
