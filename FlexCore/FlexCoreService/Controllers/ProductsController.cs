using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Cors;
using FlexCoreService.ProductCtrl.Interface;
using FlexCoreService.ProductCtrl.Models.VM;
using FlexCoreService.ProductCtrl.Service;
using FlexCoreService.ProductCtrl.Exts;
using EFModels.Models;

namespace FlexCoreService.Controllers
{
    [EnableCors("AllowAny")]
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        private readonly AppDbContext _db;
        private IProductRepository _repo;

        public ProductsController(AppDbContext context, IProductRepository repo)
        {
            _db = context;
            _repo = repo;
        }

        [HttpGet("SearchProductByKeyword")]
        public async Task<ActionResult<IEnumerable<ProductCardVM>>> SearchProductByKeyword(string? keyword,int? salesId)
        {
            var result=new List<ProductCardVM>();

            if (string.IsNullOrEmpty(keyword))
            {
                return Ok(result);
            }
            if (salesId == 0)
            {
                salesId = null;
            }
            var service = new ProductService(_repo);
            result = service.SearchProductByKeyword(keyword, salesId).Select(p=>p.ToCardVM()).ToList();
            return Ok(result);

        }

        // GET: api/Products/
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ProductCardVM>>> GetProducts(string? categoryPath, string? categoryName = null, string? subCategoryName = null,int? minPrice=null,int? maxPrice=null,int page=1)
        {
            int pageSize = 16;
            int? salesId=null;

            if (categoryPath != null)
            {
                if (categoryPath.Contains("women"))
                {
                    salesId = 2;
                }
                else if (categoryPath.Contains("men"))
                {
                    salesId = 1;
                }
                else if (categoryPath.Contains("kid"))
                {
                    salesId = 3;
                }
            }

            var server = new ProductService(_repo);
            var products = new List<ProductCardVM>();
            products = server.SearchProducts(salesId, categoryName, subCategoryName).Select(p => p.ToCardVM()).ToList();

            if (minPrice > 0 && maxPrice > 0 && minPrice < maxPrice)
            {
                products = products.Where(p => p.SalesPrice >= minPrice && p.SalesPrice <= maxPrice).ToList();
            }else if (minPrice > 0 && (maxPrice==null || minPrice> maxPrice))
            {
                products=products.Where(p => p.SalesPrice >= minPrice).ToList();
            }else if (maxPrice > 0 && (minPrice==null || maxPrice > minPrice))
            {
                products=products.Where(p => p.SalesPrice <= maxPrice).ToList();
            }

            products= products.Take(pageSize*page).ToList();

            return Ok(products);
        }

        //GET: api/Products/Detial/productId
        [HttpGet("Detail/{productId}")]
        public async Task<ActionResult<ProductDetailVM>> GetProductDetail(string productId)
        {
            var service = new ProductService(_repo);

            var products = service.GetProductDetail(productId).ToDetailVM();

            if (products == null)
            {
                return BadRequest();
            }

            return Ok(products);
        }

        //GET: api/Products/Detial/productId
        [HttpGet("Imgs/{productId}")]
        public async Task<ActionResult<IEnumerable<ProductImgsVM>>> GetProductImgs(string productId)
        {
            var service = new ProductService(_repo);

            var products = service.GetProductImgs(productId).Select(i => i.ToImgVM());

            if (products == null)
            {
                return BadRequest();
            }

            return Ok(products);
        }


        //GET: api/Products/Comment/productId
        [HttpGet("Comment/{productId}")]
        public async Task<ActionResult<IEnumerable<ProductCommentVM>>> GetProductComment(string productId,int page=1,int pageSize=3)
        {
            var service=new ProductService(_repo);
            var result = service.GetProductComment(productId).Select(c=>c.ToCommentVM());
            if(result == null)
            {
                return BadRequest();
            }

            int totalCount=result.Count();//總筆數
            int totalPage = (int)Math.Ceiling((double)totalCount / pageSize);//頁數

            result = result.Skip(pageSize * (page - 1)).Take(pageSize).ToList();
            bool firstDefault = false;
            foreach(var product in result)
            {
                if (!firstDefault)
                {
                    product.totalPage = totalPage;
                    firstDefault=true;
                }
            }

            return Ok(result);
        }


        //GET: api/Products/Similar/productId
        [HttpGet("Similar/{productId}")]
        public async Task<ActionResult<IEnumerable<ProductCardVM>>> GetSimilarProducts(string productId)
        {
            var service = new ProductService(_repo);
            var products = service.GetSimilarProducts(productId).Select(p=>p.ToCardVM());
            if (products == null)
            {
                return BadRequest();
            }
            return Ok(products);
        }

        [HttpGet("GetHotSalesOrNewProduct")]
        public async Task<ActionResult<IEnumerable<ProductCardVM>>> GetHotSalesOrNewProduct(bool isNewProduct)
        {
            var service = new ProductService(_repo);
            var product = service.GetHotSales(isNewProduct).Select(p=>p.ToCardVM());
            return Ok(product);
        }

        //// GET: api/Products
        //[HttpGet]
        //public async Task<ActionResult<IEnumerable<Product>>> GetProducts()
        //{
        //    if (_db.Products == null)
        //    {
        //        return NotFound();
        //    }
        //    return await _db.Products.ToListAsync();
        //}

        //// GET: api/Products/5
        //[HttpGet("{id}")]
        //public async Task<ActionResult<Product>> GetProducts(string id)
        //{
        //    if (_db.Products == null)
        //    {
        //        return NotFound();
        //    }
        //    var products = await _db.Products.FindAsync(id);

        //    if (products == null)
        //    {
        //        return NotFound();
        //    }

        //    return products;
        //}

        //// PUT: api/Products/5
        //// To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        //[HttpPut("{id}")]
        //public async Task<IActionResult> PutProducts(string id, Product products)
        //{
        //    if (id != products.ProductId)
        //    {
        //        return BadRequest();
        //    }

        //    _db.Entry(products).State = EntityState.Modified;

        //    try
        //    {
        //        await _db.SaveChangesAsync();
        //    }
        //    catch (DbUpdateConcurrencyException)
        //    {
        //        if (!ProductsExists(id))
        //        {
        //            return NotFound();
        //        }
        //        else
        //        {
        //            throw;
        //        }
        //    }

        //    return NoContent();
        //}

        //// POST: api/Products
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        //[HttpPost]
        //public async Task<ActionResult<Products>> PostProducts(Products products)
        //{
        //    if (_db.Products == null)
        //    {
        //        return Problem("Entity set 'AppDbContext.Products'  is null.");
        //    }
        //    _db.Products.Add(products);
        //    await _db.SaveChangesAsync();

        //    return CreatedAtAction("GetProducts", new { id = products.ProductId }, products);
        //}

        // DELETE: api/Products/5

        //[HttpDelete("{id}")]
        //public async Task<IActionResult> DeleteProducts(string id)
        //{
        //    if (_db.Products == null)
        //    {
        //        return NotFound();
        //    }
        //    var products = await _db.Products.FindAsync(id);
        //    if (products == null)
        //    {
        //        return NotFound();
        //    }

        //    _db.Products.Remove(products);
        //    await _db.SaveChangesAsync();

        //    return NoContent();
        //}

        private bool ProductsExists(string id)
        {
            return (_db.Products?.Any(e => e.ProductId == id)).GetValueOrDefault();
        }
    }
}
