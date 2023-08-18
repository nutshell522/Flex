using FlexCoreService.ProductCtrl.Models.Dtos;

namespace FlexCoreService.UserCtrl.Interface
{
    public interface IFavoriteDPRepository
    {
        IEnumerable<ProductCardDto> GetFavorites(int memberId);
    }
}
