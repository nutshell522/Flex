using FlexCoreService.CartCtrl.Models.vm;

namespace FlexCoreService.CartCtrl.Exts
{
    public abstract class BaseDiscountStrategy
    {
        public int Id;
        public string? Name;
        public string? Note;
        public abstract IEnumerable<ProductDiscountVM> Process(CartContext cartItems);
    }
}
