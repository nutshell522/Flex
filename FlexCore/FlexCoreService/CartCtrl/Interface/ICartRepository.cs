using FlexCoreService.CartCtrl.Models.vm;
using FlexCoreService.ProductCtrl.Models.Dtos;

namespace FlexCoreService.CartCtrl.Interface
{
	public interface ICartRepository
	{
		IEnumerable<CartItemDto> GetCartItems(int memberId);
		int GetCartId(int memberId);
		int CreateCart(int memberId);
		bool ExistsCart(int memberId);
		void CreateCartItem(CartItemDto dto);
		void UpdateCartItemQty(CartItemDto dto);
		void DeleteCartItem(CartItemDto dto);
		(bool DoesExist, int CartItemId) ExistsCartItem(int memberId, int productId);
		
	}
}
