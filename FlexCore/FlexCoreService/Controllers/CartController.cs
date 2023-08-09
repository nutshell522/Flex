using EFModels.Models;
using FlexCoreService.CartCtrl.Exts;
using FlexCoreService.CartCtrl.Interface;
using FlexCoreService.CartCtrl.Models.vm;
using FlexCoreService.CartCtrl.Service;
using FlexCoreService.ProductCtrl.Exts;
using FlexCoreService.ProductCtrl.Interface;
using FlexCoreService.ProductCtrl.Models.VM;
using FlexCoreService.ProductCtrl.Service;
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
            int memberId = 1;
            var cartItems = await Task.Run(() => _service.GetCartItems(memberId).Select(x => x.ToViewModel()));
            return Ok(cartItems);
        }
        // PUT: api/Cart/updateItem
        [HttpPut("updateItem")]
        public async Task<ActionResult<Result>> updateItem(string? categoryName = null, string? subCategoryName = null)
        {
            int salesId = 1;
            var server = new ProductService(_repo);
            var products = server.SearchProducts(salesId, categoryName, subCategoryName).Select(p => p.ToCardVM()).ToList();
            if (products.Count == 0)
            {
                return NotFound();
            }
            return products;
        }
    }
}
