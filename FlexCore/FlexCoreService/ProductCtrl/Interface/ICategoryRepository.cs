using FlexCoreService.ProductCtrl.Models.Dtos;

namespace FlexCoreService.ProductCtrl.Interface
{
    public interface ICategoryRepository
    {
        IEnumerable<CategoryDto> GetAllCategory();

        IEnumerable<CategoryDto> GetCategoryMen();

        IEnumerable<CategoryDto> GetCategoryWomen();

        IEnumerable<CategoryDto> GetCategoryKid();
    }
}
