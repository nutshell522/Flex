using FlexCoreService.CartCtrl.Models.vm;

namespace FlexCoreService.CartCtrl.Exts
{
    public abstract class BaseDiscountStrategy
    {
        public int Id;
        public string? Name;
        public string? Note;
        public BaseDiscountStrategy(ProductDiscountVM vm)
        {
			this.Id = vm.DiscountId;
			this.Name = vm.DiscountName;
			this.Note = vm.DiscountDescription;
		}
        public abstract ItemDiscount Process(CartContext cartItems);
        public string? Exclusivetag = null;
    }
}
