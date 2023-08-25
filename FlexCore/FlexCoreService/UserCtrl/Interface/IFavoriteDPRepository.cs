using FlexCoreService.ProductCtrl.Exts;
using FlexCoreService.ProductCtrl.Models.Dtos;

namespace FlexCoreService.UserCtrl.Interface
{
    public interface IFavoriteDPRepository
    {
        IEnumerable<ProductCardDto> GetFavorites(int memberId);
        bool GetIsFavorite(int memberId, string productId);
        void DeleteFavoriteProduct(int memberId, string productId);
        void SaveFavoritesProduct(int memberId, string productId);
    }
}
