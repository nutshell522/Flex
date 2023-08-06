using EFModels.Models;
using FlexCoreService.CartCtrl.Interface;
using FlexCoreService.CartCtrl.Models.vm;
using FlexCoreService.ProductCtrl.Interface;

namespace FlexCoreService.CartCtrl.Service
{
	public class CartService
	{
		private ICartRepository _repo;
		public CartService(ICartRepository repo)
		{
			_repo = repo;
		}

		public IEnumerable<CartItemDto> GetCartItems(int memberId)
		{
			return _repo.GetCartItems(memberId);
		}
	}
}
