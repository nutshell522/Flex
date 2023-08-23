using EFModels.Models;
using FlexCoreService.CustomeShoes.Interface;
using FlexCoreService.CustomeShoes.Models.Dtos;
using FlexCoreService.ProductCtrl.Interface;
using FlexCoreService.ProductCtrl.Models.Dtos;

namespace FlexCoreService.CustomeShoes.Service
{
	public class ShoesCategoryService
	{
		private IShoesCategoryRepository _repo;
		public ShoesCategoryService(IShoesCategoryRepository repo)
		{
			_repo = repo;
		}
		public IEnumerable<ShoesCategoryDto> GetAllCategory()
		{
			var result = _repo.GetAllCategory();
			return result;
		}

        public IEnumerable<ShoesCategoryDto> SearchCategory()
        {
            var result = _repo.SearchCategory();
            return result;
        }

    }
}
