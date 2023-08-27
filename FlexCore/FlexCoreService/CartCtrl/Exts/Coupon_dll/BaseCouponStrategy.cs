using EFModels.Models;
using FlexCoreService.CartCtrl.Models.vm;

namespace FlexCoreService.CartCtrl.Exts.Coupon_dll
{
    public abstract class BaseCouponStrategy
    {
        public int? Id { get; set; }
        public string? Name { get; set; }
		public int? SendingId { get; set; }
        public int? DiscountType { get; set; }

		public BaseCouponStrategy(CouponVM vm)
        {
            Id = vm.Id;
            Name = vm.CouponName;
            SendingId = vm.SendingId;
            DiscountType = vm.DiscountType;
        }
        public abstract void Process(CartContext cart);
    }
}
