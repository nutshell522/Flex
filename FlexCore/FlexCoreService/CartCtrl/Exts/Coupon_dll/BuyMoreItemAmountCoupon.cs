using FlexCoreService.CartCtrl.Models.vm;

namespace FlexCoreService.CartCtrl.Exts.Coupon_dll
{
    public class BuyMoreItemAmountCoupon
    {
        //// 門檻數量
        //private readonly int _itemsCount;
        //// 折扣, 20表示八折
        //private readonly int _discountAmount;
        //public BuyMoreItemAmountCoupon(CouponVM vm) : base(vm)
        //{
        //    _itemsCount = vm.ConditionValue.Value;
        //    _discountAmount = vm.DiscountValue.Value;
        //}

        //public override ItemDiscount Process(CartContext cart)
        //{
        //    //throw new NotImplementedException();
        //    List<CartItemVM> matchedProducts = new List<CartItemVM>();

        //    foreach (CartItemVM p in cart.CartItems)
        //    {
        //        if (p.Product.MatchDiscounts.Any(x => x.DiscountId == this.Id))
        //        {
        //            matchedProducts.Add(p);
        //        }
        //    }

        //    if (matchedProducts.Count >= _itemsCount)
        //    {
        //        return new ItemDiscount()
        //        {
        //            Rule = this,
        //            Products = matchedProducts.Select(x => x.Product).ToArray(),
        //            Amount = (decimal)matchedProducts.Sum(x => x.SubTotal) - _discountAmount
        //        };
        //    }
        //    return null;
        //}
    }
}
