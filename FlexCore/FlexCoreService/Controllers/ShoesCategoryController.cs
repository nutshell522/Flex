using EFModels.Models;
using FlexCoreService.ActivityCtrl.Models.Dtos;
using FlexCoreService.CustomeShoes.Exts;
using FlexCoreService.CustomeShoes.Interface;
using FlexCoreService.CustomeShoes.Models.VMs;
using FlexCoreService.CustomeShoes.Service;
using FlexCoreService.ProductCtrl.Exts;
using FlexCoreService.ProductCtrl.Interface;
using FlexCoreService.ProductCtrl.Models.VM;
using FlexCoreService.ProductCtrl.Service;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;

namespace FlexCoreService.Controllers
{
	[EnableCors("AllowAny")]
	[Route("api/[controller]")]
	[ApiController]
	public class ShoesCategoryController : ControllerBase
    {
		private IShoesCategoryRepository _repo;
		private AppDbContext _db;
		public ShoesCategoryController(AppDbContext db, IShoesCategoryRepository repo)
		{
			_db = db;
			_repo = repo;
		}

        // Get: api/ShoesCategory/
        [HttpGet("CategoryList")]
        public async Task<ActionResult<IEnumerable<ShoesCategoryVM>>> GetAllCategory() 
        {
            var server = new ShoesCategoryService(_repo);

            var category = server.GetAllCategory();

            var vm = category.Select(p => p.ToCategoryVM()).ToList();

            if (vm == null)
            {
                return NotFound();
            }

            return vm;

        }

        [HttpGet("Categories")]
        public async Task<ActionResult<IEnumerable<ShoesCategoryCardVM>>> SearchShoesCategory(int shoescategoryId) 
        {
            var server = new ShoesCategoryService(_repo);

            var searchshoes = server.SearchShoesCategory(shoescategoryId);

            var vm = searchshoes.Select(p => p.ToCategoryCardVM()).ToList();

            if (vm == null)
            {
                return NotFound();
            }

            return vm;
        }

    }
}
