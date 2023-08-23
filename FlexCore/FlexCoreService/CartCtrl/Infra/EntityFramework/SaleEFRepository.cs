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

		public IEnumerable<ActiveDiscountDto> GetactiveDiscounts()
		{
			var activeDiscounts = _db.Discounts
				.AsNoTracking()
				.Where(x => x.EndDate > DateTime.Now && x.StartDate <= DateTime.Now && x.Status == true)
				.Select(x => new ActiveDiscountDto
				{
					DiscountId = x.DiscountId,
					DiscountName = x.DiscountName,
					DiscountDescription = x.DiscountDescription,
					ProjectTagId = x.fk_ProjectTagId,
					StartDate = x.StartDate,
					EndDate = x.EndDate
				});

			return activeDiscounts;
		}

		public IEnumerable<OnSaleProductDto> GetOnSaleProducts(int discountId, int productCategoryId)
		{
			var result = _db.ProjectTagItems
				.Join(_db.ProjectTags, pti => pti.fk_ProjectTagId, pt => pt.ProjectTagId, (pti, pt) => new { pti, pt })
				.Join(_db.Discounts, j1 => j1.pt.ProjectTagId, d => d.fk_ProjectTagId, (j1, d) => new { j1.pti, j1.pt, d })
				.Join(_db.Products, j2 => j2.pti.fk_ProductId, p => p.ProductId, (j2, p) => new { j2.pti, j2.pt, j2.d, p })
				.Join(_db.ProductSubCategories, j3 => j3.p.fk_ProductSubCategoryId, psc => psc.ProductSubCategoryId, (j3, psc) => new { j3.pti, j3.pt, j3.d, j3.p, psc })
				.Join(_db.ProductCategories, j4 => j4.psc.fk_ProductCategoryId, pc => pc.ProductCategoryId, (j4, pc) => new { j4.pti, j4.pt, j4.d, j4.p, j4.psc, pc })
				.Join(_db.SalesCategories, j5 => j5.pc.fk_SalesCategoryId, ssc => ssc.SalesCategoryId, (j5, ssc) => new { j5.pti, j5.pt, j5.d, j5.p, j5.psc, j5.pc, ssc })
				.Join(
					_db.ProductImgs.Where(pi => pi.ProductImgId == _db.ProductImgs
						.Where(pi2 => pi2.fk_ProductId == pi.fk_ProductId)
						.OrderBy(pi2 => pi2.ProductImgId)
						.Select(pi2 => pi2.ProductImgId)
						.FirstOrDefault()
					),
					j6 => j6.p.ProductId,
					pir => pir.fk_ProductId,
					(j6, pir) => new { j6.pti, j6.pt, j6.d, j6.p, j6.psc, j6.pc, j6.ssc, pir }
				)
				.Where(j7 => j7.d.DiscountId == discountId && j7.ssc.SalesCategoryId == productCategoryId)
				.Select(j7 => new
				{
					j7.pti,
					j7.pt,
					j7.d,
					j7.p,
					j7.psc,
					j7.pc,
					j7.ssc,
					j7.pir
				});

			foreach (var item in result)
			{
				yield return new OnSaleProductDto
				{
					ProductId=item.p.ProductId,
					ProductDescription = item.p.ProductDescription,
					ProductName = item.p.ProductName,
					SalesPrice = item.p.SalesPrice,
					UnitPrice = item.p.UnitPrice,
					ImgPath = item.pir.ImgPath,
				};
			}
		}
	}
}
