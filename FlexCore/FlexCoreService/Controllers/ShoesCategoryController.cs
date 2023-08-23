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
        public async Task<ActionResult<ShoesCategoryVM>> GetShoesCategory()
        {
            var server = new ShoesCategoryService(_repo);

            var category = server.SearchCategory().ToList();

            var vm = category.ToCategoryVM();

            if (vm == null)
            {
                return NotFound();
            }

            return vm;
        }


    }
}
