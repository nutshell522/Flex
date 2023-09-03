using EFModels.Models;
using FlexCoreService.CartCtrl.Interface;
using FlexCoreService.CartCtrl.Models.Dtos;
using Microsoft.EntityFrameworkCore;

namespace FlexCoreService.CartCtrl.Infra.EntityFramework
{
	public class SaleEFRepository : ISaleRepository
	{
		private readonly AppDbContext _db;
		public SaleEFRepository(AppDbContext db)
		{
			_db = db;
		}

		public IEnumerable<ActiveDiscountDto> GetActiveDiscounts()
		{
			return _db.Discounts
				.AsNoTracking()
				.Where(x => (x.EndDate > DateTime.Now || x.EndDate == null)  && x.StartDate <= DateTime.Now && x.Status == true)
				.Select(x => new ActiveDiscountDto
				{
					DiscountId = x.DiscountId,
					DiscountName = x.DiscountName,
					DiscountDescription = x.DiscountDescription,
					ProjectTagId = x.fk_ProjectTagId,
					StartDate = x.StartDate,
					EndDate = x.EndDate
				});
		}

		public IEnumerable<OnSaleCategoryDto> GetAllProductCategories()
		{
			return _db.SalesCategories
				.AsNoTracking()
				.Select(x => new OnSaleCategoryDto
				{
					id = x.SalesCategoryId,
					SalesCategoryName = x.SalesCategoryName
				});
		}

		public IEnumerable<OnSaleProductDto> GetOnSaleProducts(int discountId, int? productCategoryId)
		{
			var query = from pti in _db.ProjectTagItems
						join pt in _db.ProjectTags on pti.fk_ProjectTagId equals pt.ProjectTagId
						join d in _db.Discounts on pt.ProjectTagId equals d.fk_ProjectTagId
						join p in _db.Products on pti.fk_ProductId equals p.ProductId
						join psc in _db.ProductSubCategories on p.fk_ProductSubCategoryId equals psc.ProductSubCategoryId
						join pc in _db.ProductCategories on psc.fk_ProductCategoryId equals pc.ProductCategoryId
						join ssc in _db.SalesCategories on pc.fk_SalesCategoryId equals ssc.SalesCategoryId
						join pir in (
							from pi in _db.ProductImgs
							where pi.ProductImgId == (
								from pi2 in _db.ProductImgs
								where pi2.fk_ProductId == pi.fk_ProductId
								orderby pi2.ProductImgId
								select pi2.ProductImgId
							).FirstOrDefault()
							select pi
						) on p.ProductId equals pir.fk_ProductId
						where d.DiscountId == discountId && (productCategoryId == null || ssc.SalesCategoryId == productCategoryId) && p.LogOut==false && p.Status==false 
						select new
						{
							ProjectTagItem = pti,
							ProjectTag = pt,
							Discount = d,
							Product = p,
							ProductSubCategory = psc,
							ProductCategory = pc,
							SalesCategory = ssc,
							ProductImg = pir
						};

			foreach (var item in query)
			{
				yield return new OnSaleProductDto
				{
					ProductId = item.Product.ProductId,
					ProductDescription = item.Product.ProductDescription,
					ProductName = item.Product.ProductName,
					SalesPrice = item.Product.SalesPrice,
					UnitPrice = item.Product.UnitPrice,
					ImgPath = item.ProductImg.ImgPath,
					SalesCategoryId = item.SalesCategory.SalesCategoryId,
				};
			}
		}
	}
}
