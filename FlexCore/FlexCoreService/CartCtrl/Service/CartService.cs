using FlexCoreService.CartCtrl.Exts;
using FlexCoreService.CartCtrl.Interface;
using FlexCoreService.CartCtrl.Models.Dtos;
using FlexCoreService.CartCtrl.Models.vm;
using FlexCoreService.ProductCtrl.Exts;

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
			=> _repo.GetCartItems(memberId);

		public IEnumerable<CartItemDto> GetCartItemsByIds(int[] cartItemIds, int memberId)
		{
			var items = new List<CartItemDto>();
			foreach (var cartItemId in cartItemIds)
			{
				// TODO 驗證cartItemId是否為member的
				items.Add(_repo.GetCartItemById(cartItemId));
			}

			return items;
		}

		public Result UpdateCartItemQty(CartItemDto dto, int memberId)
		{
			// 驗證有無傳入商品跟數量
			if (dto.ProductId == null) return Result.Failed(string.Empty);
			if (dto.Qty == null) return Result.Failed(string.Empty);

			// 驗證購物車
			if (!_repo.ExistsCart(memberId)) _repo.CreateCart(memberId);
			dto.CartId = _repo.GetCartId(memberId);
			// 驗證商品是否已存在購物車中
			var existResult = _repo.ExistsCartItem(memberId, dto.ProductId.Value);

			// 如沒有，創建購物車項目
			if (!existResult.DoesExist)
			{
				_repo.CreateCartItem(dto);
				return Result.Success();
			}

			// 如有，更新購物車項目
			dto.CartItemId = existResult.CartItemId;

			dto.Qty += existResult.Qty;

			// 若商品數量小於等於0 刪除購物車項目
			if (dto.Qty <= 0)
			{
				_repo.DeleteCartItem(dto);
				return Result.Success();
			}

			_repo.UpdateCartItemQty(dto);
			return Result.Success();
		}

		public IEnumerable<ProductDiscountDto> GetActiveDiscounts()
		{
			return _repo.GetActiveDiscounts();
		}

		public IEnumerable<CouponDto> GetMemberCoupons(int MemberId)
		{
			return _repo.GetMemberCoupons(MemberId);
		}
		public CouponDto GetCouponById(int SendingId)
		{
			return _repo.GetCouponById(SendingId);
		}
		public Result DeleteCartItem(int cartItemId, int MemberId)
		{
			//TODO 驗證cartItem是否為該會員

			_repo.DeleteCartItem(cartItemId);
			return Result.Success();
		}
		public IEnumerable<ProductSizeDto> GetAllSize(IEnumerable<ProductSizeVM> vms)
		{
			var dtos = vms.Select(x => x.ToDto());
			List<ProductSizeDto> productSizeDtos = new List<ProductSizeDto>();
			foreach (var dto in dtos)
			{
				if (dto.Color != null && dto.ProductSaleId != null)
				{
					productSizeDtos.AddRange(_repo.GetAllSize(dto.ProductSaleId, dto.Color));
				}
			}
			return productSizeDtos;
		}
		public Result Checkout(CartContext cart)
		{
			#region 驗證
			// 驗證商品數量
			var existQtyResult = ExistProductQty(cart.CartItems.Select(x => x.ToDto()));
			if (existQtyResult.IsFailed)
			{
				return existQtyResult;
			}
			// TODO 驗證券是否是該會員的

			// TODO 驗證券是否過期及是否已用過
			#endregion

			#region 生成訂單編號
			const string characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
			Random random = new Random();
			char[] code = new char[16];
			for (int i = 0; i < 16; i++)
			{
				code[i] = characters[random.Next(characters.Length)];
			}
			string orderCode = new string(code);
			#endregion

			//TODO 驗證訂單編號是否重複

			foreach (var item in cart.CartItems)
			{
				int qty = _repo.GetOriginProductQty(item.ToDto());
				qty -= item.Qty.Value;
				_repo.UpdateProductGroupQty(item.ToDto(), qty);
			}


			int newId = _repo.CreateOrder(cart, orderCode);
			foreach (var item in cart.CartItems)
			{
				int? TotalDiscount;
				TotalDiscount = cart.AppliedDiscounts
									   .SelectMany(discount => discount.Products)
									   .Where(product => product.ProductName == item.Product.ProductName && product.Color == item.Product.Color && product.Size == item.Product.Size)
									   .Sum(product => product.DiscountValue);

				TotalDiscount = TotalDiscount != null ? TotalDiscount : 0;
				_repo.CreateOrderItem(item.ToDto(), newId, TotalDiscount.Value);
				_repo.DeleteCartItem(item.ToDto());
			}

			if (cart.Coupon != null && cart.Coupon.SendingId != null && cart.Coupon.SendingId != 0)
			{
				_repo.UpdateCouponUsage(cart.Coupon.SendingId.Value);
			}
			// 寄送禮物券
			var presentCoupons = _repo.GetCoupons(4);
			if (presentCoupons != null)
			{
				foreach (var coupon in presentCoupons)
				{
					if (coupon.Requirement <= cart.TotalPrice && cart.MemberId.HasValue)
					{
						if (coupon.EndType == 1 && coupon.EndDays.HasValue)
						{
							coupon.EndDate = DateTime.Today.AddDays(coupon.EndDays.Value) + new TimeSpan(23, 59, 59);
						}
						else if (coupon.EndType == 0 && coupon.EndDate.HasValue)
						{
							coupon.EndDate = coupon.EndDate.Value.Date + new TimeSpan(23, 59, 59);
						}
						_repo.SendCoupon(coupon, cart.MemberId.Value);
					}
				}
			}
			return Result.Success();
		}

		public Result SendCoupons(int couponCategoryId, int memberId)
		{
			var coupons = _repo.GetCoupons(couponCategoryId);

			foreach (var coupon in coupons)
			{
				if (coupon.EndType == 1 && coupon.EndDays.HasValue)
				{
					coupon.EndDate = DateTime.Today.AddDays(coupon.EndDays.Value) + new TimeSpan(23, 59, 59);
				}
				else if (coupon.EndType == 0 && coupon.EndDate.HasValue)
				{
					coupon.EndDate = coupon.EndDate.Value.Date + new TimeSpan(23, 59, 59);
				}
				_repo.SendCoupon(coupon, memberId);
			}

			return Result.Success();
		}

		public Result UpdateCartItemsForCheckOut(int[] cartItemIds, int memberId)
		{
			var result = ExistProductQty(cartItemIds, memberId);
			if (result.IsFailed)
			{
				return result;
			}
			string idsStr = string.Join(",", cartItemIds);
			_repo.UpdateCartItemsForCheckOut(idsStr, memberId, true);
			return Result.Success();
		}

		public Result ExistProductQty(int[] cartItemIds, int memberId)
		{
			// TODO 驗證是否為會員的
			List<CartItemDto> dtos = new List<CartItemDto>();
			foreach (var item in cartItemIds)
			{
				dtos.Add(_repo.GetCartItemById(item));
			}

			return ExistProductQty(dtos);
		}
		public Result ChangeSize(int newProductId, int originItemId, int qty, int cartId, int memberId)
		{
			var result = _repo.ExistsCartItem(memberId, newProductId);
			if (result.DoesExist)
			{
				qty += result.Qty;
				var dto = new CartItemDto
				{
					Qty = qty,
					CartItemId = result.CartItemId
				};
				_repo.UpdateCartItemQty(dto);
				_repo.DeleteCartItem(originItemId);
				return Result.Success();
			}
			else
			{
				var dto = new CartItemDto
				{
					CartId = cartId,
					Qty = qty,
					ProductId = newProductId
				};
				_repo.CreateCartItem(dto);
				_repo.DeleteCartItem(originItemId);
				return Result.Success();
			}
		}


		public Result ExistProductQty(IEnumerable<CartItemDto> dto)
		{
			bool ExistProductQtyFlag = true;
			string errorMessage = string.Empty;
			foreach (var item in dto)
			{
				if (!_repo.CheckIfProductGroupHasSufficientQty(item))
				{
					ExistProductQtyFlag = false;
					errorMessage += $"{item.Product.ProductName}-{item.Product.Color}-{item.Product.Size} \r\n";
				}
			}
			if (!ExistProductQtyFlag)
			{
				errorMessage += "數量不足";
				return Result.Failed(errorMessage);
			}
			return Result.Success();
		}

	}
}
