using EFModels.Models;
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
    public class CategoryController : ControllerBase
    {
        private ICategoryRepository _repo;
        private AppDbContext _db;
        public CategoryController(AppDbContext db, ICategoryRepository repo)
        {
            _db = db;
            _repo = repo;
        }
        // Get: api/Category/
        //[HttpGet]
        //public async Task<ActionResult<CategoryVM>> GetAllCategory()
        //{
        //    var server = new CategoryService(_repo);
        //    var category = server.GetAllCategory().Select(p => p.ToVM()).ToList();
        //    if (category.Count == 0)
        //    {
        //        return NotFound();
        //    }
        //    return category;
        //}

        //Get: api/Category/
        [HttpPost("Men")]
        public async Task<ActionResult<CategoryVM>> GetCategoryMen()
        {
            var server = new CategoryService(_repo);
            var category = server.GetCategoryMen().ToCategoryVM();
            if (category == null)
            {
                return NotFound();
            }
            return category;
        }
    }
}
