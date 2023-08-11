using FlexCoreService.CartCtrl.Models.vm;

namespace FlexCoreService.CartCtrl.Exts
{
    public class BuyMoreItemsAmountDiscount : BaseDiscountStrategy
    {
        public BuyMoreItemsAmountDiscount(ProductDiscountVM vm)
        {
            
        }
        public override IEnumerable<Discount> Process(CartContext cartItems)
        {
            throw new NotImplementedException();
        }
    }
}
