using FlexCoreService.CartCtrl.Models.vm;

namespace FlexCoreService.CartCtrl.Exts
{
    public class AmountDiscount : BaseDiscountStrategy
    {
        public AmountDiscount(ProductDiscountVM vm)
        {
            
        }
        public override IEnumerable<ProductDiscountVM> Process(CartContext cartItems)
        {
            throw new NotImplementedException();
        }
    }
}
