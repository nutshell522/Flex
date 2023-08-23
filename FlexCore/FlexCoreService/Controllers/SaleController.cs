using EFModels.Models;
using FlexCoreService.CartCtrl.Exts;
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

		//GET: api/Sale/
		[HttpGet]
		public async Task<ActionResult<IEnumerable<ActiveDiscountVM>>> GetAllActiveDiscount()
		{
			var result = await Task.Run(() => _service.GetActiveDiscounts().Select(x => x.ToViewModel()));
			return Ok(result);
		}
		//GET: api/Sale/GetProductCategories
		[HttpGet("GetProductCategories")]
		public async Task<ActionResult<IEnumerable<OnSaleCategoryVM>>> GetProductCategories()
		{
			var result = await Task.Run(() => _service.GetCategories().Select(x => x.ToViewModel()));
			return Ok(result);
		}
		//GET: api/Sale/
		[HttpGet("GetDiscountProducts/{discountId}/{productCategoryId}")]
		public async Task<ActionResult<IEnumerable<OnSaleProductVM>>> GetDiscountProducts(int discountId, int? productCategoryId = null)
		{
			if (productCategoryId == 0) productCategoryId = null;
			var result = await Task.Run(() => _service.GetOnSaleProducts(discountId,productCategoryId).Select(x => x.ToViewModel()));
			return Ok(result);
		}
	}
}
