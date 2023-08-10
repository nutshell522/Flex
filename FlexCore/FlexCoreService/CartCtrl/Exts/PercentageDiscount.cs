using FlexCoreService.CartCtrl.Models.vm;

namespace FlexCoreService.CartCtrl.Exts
{
    public class PercentageDiscount : BaseDiscountStrategy
    {
        public override IEnumerable<ProductDiscountVM> Process(CartContext cartItems)
        {
            throw new NotImplementedException();
        }
    }
}
