using EFModels.Models;

namespace FlexCoreService.CartCtrl.Exts.Coupon_dll
{
    public abstract class BaseCouponStrategy
    {
        public int Id { get; set; }
        public string Name { get; set; }
        //public BaseCouponStrategy(CouponVM vm)
        //{
        //}
        public abstract void Process(CartContext cart);
    }
}
