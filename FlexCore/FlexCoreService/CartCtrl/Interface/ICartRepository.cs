using FlexCoreService.CartCtrl.Models.Dtos;
using FlexCoreService.CartCtrl.Models.vm;
using FlexCoreService.ProductCtrl.Models.Dtos;

namespace FlexCoreService.CartCtrl.Interface
{
	public interface ICartRepository
	{
		IEnumerable<CartItemDto> GetCartItems(int memberId);
		CartItemDto GetCartItemById(int cartItemId);
		int GetCartId(int memberId);
		int CreateCart(int memberId);
		bool ExistsCart(int memberId);
		void CreateCartItem(CartItemDto dto);
		void UpdateCartItemQty(CartItemDto dto);
		void DeleteCartItem(CartItemDto dto);
		(bool DoesExist, int CartItemId,int Qty) ExistsCartItem(int memberId, int productId);
		IEnumerable<ProductDiscountDto> GetActiveDiscounts();
		IEnumerable<CouponDto> GetMemberCoupons(int memberId);
		CouponDto GetCouponById(int sendingId);
		void UpdateCouponUsage(CouponDto dto, DateTime date);
		
	}
}
