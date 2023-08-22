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
        public Result ChangeCouponUseageStatus(CouponDto dto, int MemberId)
        {
            // TODO 驗證券是否是該會員的

            // TODO 驗證券是否過期及是否已用過

            DateTime date = DateTime.Now;
            _repo.UpdateCouponUsage(dto, date);
            return Result.Success();
        }
        public Result Checkout(CartContext cart)
        {
            bool ExistProductQtyFlag = true;
            string errorMessage = string.Empty;
            foreach (var item in cart.CartItems)
            {
                if(!_repo.CheckIfProductGroupHasSufficientQty(item.ToDto(), cart.MemberId.Value))
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

            // 生成16碼訂單編號
            const string characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            Random random = new Random();
            char[] code = new char[16];
            for (int i = 0; i < 16; i++)
            {
                code[i] = characters[random.Next(characters.Length)];
            }
            string orderCode =  new string(code);
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
                _repo.CreateOrderItem(item.ToDto(), newId);
            }
            return Result.Success();
        }
    }
}
