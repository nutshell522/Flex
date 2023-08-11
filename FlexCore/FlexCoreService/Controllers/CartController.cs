using EFModels.Models;
using FlexCoreService.CartCtrl.Exts;
using FlexCoreService.CartCtrl.Interface;
using FlexCoreService.CartCtrl.Models.vm;
using FlexCoreService.CartCtrl.Service;
using FlexCoreService.ProductCtrl.Exts;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace FlexCoreService.Controllers
{
	[EnableCors("AllowAny")]
	[Route("api/[controller]")]
	[ApiController]
	public class CartController : ControllerBase
	{
		private readonly AppDbContext _db;
		private ICartRepository _repo;
		private CartService _service;
		private int memberId = 1;

		public CartController(AppDbContext context, ICartRepository repo)
		{
			_db = context;
			_repo = repo;
			_service = new CartService(_repo);
		}

		// POST: api/Cart/
		[HttpPost]
		public async Task<ActionResult<IEnumerable<CartItemVM>>> GetCartItems()
		{
            var cartItems = await Task.Run(() => _service.GetCartItems(memberId).Select(x => x.ToViewModel()));
            return Ok(cartItems);
        }
		// PUT: api/Cart/UpdateItem
		[HttpPut("UpdateItem")]
		public async Task<ActionResult<Result>> UpdateItem(CartItemVM vm)
		{
			var result = await Task.Run(() => _service.UpdateCartItemQty(vm.ToDto(),memberId));
			return Ok(result);
		}

		private IEnumerable<BaseDiscountStrategy> LoadDiscount()
		{
			var vms = _service.GetActiveDiscounts().Select(x=>x.ToViewModel());
			foreach (var vm in vms)
			{
				if(vm.DiscountType == 1)
				{
					yield return new PercentageDiscount(vm);
				}
				else
				{
					yield return new AmountDiscount(vm);
				}
			}
		}
	}
}
