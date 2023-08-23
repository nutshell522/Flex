using EFModels.Models;
using FlexCoreService.CartCtrl.Interface;
using FlexCoreService.CartCtrl.Models.vm;
using FlexCoreService.CartCtrl.Service;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace FlexCoreService.Controllers
{
	[EnableCors("AllowAny")]
	[Route("api/[controller]")]
	[ApiController]
	public class SaleController : ControllerBase
	{
		private readonly SaleService _service;
		public SaleController(SaleService service)
		{
			_service = service;
		}

		// POST: api/Sale/
		//[HttpPost]
		//public async Task<ActionResult<IEnumerable<CartItemVM>>> GetAllActiveDiscount()
		//{
		//	//var cartItems = await Task.Run(() => _service.GetCartItems(memberId).Select(x => x.ToViewModel()));
		//	//return Ok(cartItems);
		//}
	}
}
