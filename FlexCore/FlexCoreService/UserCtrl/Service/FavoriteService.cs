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
    }
}
