using FlexCoreService.CartCtrl.Models.vm;
using FlexCoreService.ProductCtrl.Models.Dtos;

namespace FlexCoreService.CartCtrl.Interface
{
	public interface ICartRepository
	{
		IEnumerable<CartItemDto> GetCartItems(int memberId);
	}
}
