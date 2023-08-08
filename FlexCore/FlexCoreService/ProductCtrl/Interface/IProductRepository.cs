using FlexCoreService.ProductCtrl.Models.Dtos;

namespace FlexCoreService.ProductCtrl.Interface
{
    public interface IProductRepository
    {
        //IEnumerable<ProductCardDto> SearchProducts();

        IEnumerable<ProductCardDto> SearchProducts(int salesId, string? categoryName, string? subCategoryName);

        IEnumerable<ProductDetailDto> GetProductDetail(string productId);
    }
}
