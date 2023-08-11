using EFModels.Models;
using FlexCoreService.CartCtrl.Models.vm;

namespace FlexCoreService.CartCtrl.Exts
{
    public class BuyMoreItemsPercentageDiscount : BaseDiscountStrategy
    {
        // 門檻數量
        private readonly int _itemsCount;
        // 折扣, 20表示八折
        private readonly int _percentOff;
        public BuyMoreItemsPercentageDiscount(ProductDiscountVM vm)
        {
            _itemsCount = vm.DiscountValue.Value;
            _percentOff = vm.ConditionValue.Value;
        }
        
        public override IEnumerable<Discount> Process(CartContext cart)
        {
            throw new NotImplementedException();
            //List<CartItemVM> matchedProducts = new List<CartItemVM>();

            //foreach (CartItemVM p in cart.CartItems)
            //{
            //    matchedProducts.Add(p);
            //    if (matchedProducts.Count == _itemsCount)
            //    {
            //        // 數量符合門檻, 產生折扣
            //        yield return new Discount()
            //        {
            //            Rule = this,
            //            Products = matchedProducts.ToArray(),
            //            Amount = (decimal)matchedProducts.Sum(x => x.SubTotal) * _percentOff / 100
            //        };
            //        matchedProducts.Clear();
            //    }
            //}
        }
    }
}
