using FlexCoreService.ProductCtrl.Exts;
using FlexCoreService.ProductCtrl.Models.Dtos;
using FlexCoreService.UserCtrl.Interface;

namespace FlexCoreService.UserCtrl.Service
{
    public class FavoriteService
    {
        private IFavoriteDPRepository _repo;
        public FavoriteService(IFavoriteDPRepository repo)
        {
            _repo = repo;
        }
        public IEnumerable<ProductCardDto> GetFavorites(int memberId)
        {
           var result=_repo.GetFavorites(memberId);
            return result;
        }
        public bool GetIsFavorite(int memberId, string productId)
        {
            var result = _repo.GetIsFavorite(memberId, productId);
            return result;
        }

        public Result DeleteFavoriteProduct(int memberId, string productId)
        {
            _repo.DeleteFavoriteProduct(memberId, productId);
            return Result.Success();
        }

        public Result SaveFavoritesProduct(int memberId, string productId)
        {
            _repo.SaveFavoritesProduct(memberId, productId);
            return Result.Success();
        }
    }
}
