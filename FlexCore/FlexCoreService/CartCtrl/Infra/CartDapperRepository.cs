using Dapper;
using EFModels.Models;
using FlexCoreService.CartCtrl.Interface;
using FlexCoreService.CartCtrl.Models.vm;
using Microsoft.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Data.Common;

namespace FlexCoreService.CartCtrl.Infra
{
	public class CartDapperRepository : ICartRepository
	{
		private IConfiguration _configuration;
		private string _connStr;
		public CartDapperRepository(IConfiguration configuration)
		{
			_configuration = configuration;
			_connStr = _configuration.GetConnectionString("AppDbContext");
		}

		public IEnumerable<CartItemDto> GetCartItems(int memberId)
		{
			using (IDbConnection dbConnection = new SqlConnection(_connStr))
			{
				dbConnection.Open();

				string sql = @"select 
ci.CartItemId, c.CartId, pg.ProductGroupId as ProductId, ci.Qty, p.ProductId as ProductSaleId, 
p.ProductName, p.UnitPrice, p.SalesPrice, sc.SizeName as Size, cc.ColorName as Color, 
pir.ImgPath, ssc.SalesCategoryName, d.DiscountId, d.DiscountName, d.DiscountDescription, 
d.DiscountType, d.DiscountValue, d.ConditionType, d.ConditionValue, d.OrderBy as DiscountOrder
from CartItems as ci
inner join ShoppingCarts as C on c.CartId = ci.fk_CardId
inner join ProductGroups as pg on pg.ProductGroupId = ci.fk_ProductId
inner join Products as p on p.ProductId = pg.fk_ProductId
inner join ColorCategories as cc on cc.ColorId = pg.fk_ColorId
inner join SizeCategories as sc on sc.SizeId = pg.fk_SizeId
inner join ProductSubCategories as psc on psc.ProductSubCategoryId = p.fk_ProductSubCategoryId
inner join ProductCategories as pc on pc.ProductCategoryId = psc.fk_ProductCategoryId
inner join SalesCategories as ssc on ssc.SalesCategoryId = pc.fk_SalesCategoryId
left join ProjectTagItems as pti on pti.fk_ProductId = p.ProductId
left join(
    SELECT
        pi.fk_ProductId,
        pi.ProductImgId,
        pi.ImgPath
    FROM ProductImgs AS pi
    WHERE pi.ProductImgId = (
        SELECT TOP 1 pi2.ProductImgId
        FROM ProductImgs AS pi2
        WHERE pi2.fk_ProductId = pi.fk_ProductId
        ORDER BY pi2.ProductImgId
    )
) AS pir ON pir.fk_ProductId = p.ProductId
left join Discounts as d on d.fk_ProjectTagId = pti.fk_ProjectTagId
where p.Status=0 and p.LogOut=0 and c.fk_MemberID = 1 
GROUP BY
ci.CartItemId, c.CartId, pg.ProductGroupId, ci.Qty, p.ProductId,
p.UnitPrice, p.SalesPrice, sc.SizeName, cc.ColorName, pir.ImgPath,
d.DiscountId, d.DiscountName, d.DiscountDescription, d.DiscountType, d.DiscountValue,
d.ConditionType, d.ConditionValue, d.OrderBy, ssc.SalesCategoryName ,p.ProductName
ORDER BY p.ProductId asc, d.OrderBy asc;
";

				var cartItems = dbConnection.Query<CartItemDto, CartItemProductDto, ProductDiscountDto, CartItemDto>(
					sql,
					(cartItem, product, discount) =>
					{
						cartItem.Product = product;
						if (cartItem.Product != null)
						{
							cartItem.Product.MatchDiscounts = new List<ProductDiscountDto> { discount };
						}
						return cartItem;
					},
					new { memberId = memberId },
					splitOn: "ProductId,ProductSaleId,DiscountId"
				);

				// 將獲得資料組合起來 (相同商品不同折扣)
				var groupedCartItems = cartItems.GroupBy(cartItem => cartItem.CartItemId).Select(group =>
				{
					var firstCartItem = group.First();
					firstCartItem.Product.MatchDiscounts = group.Select(cartItem => cartItem.Product.MatchDiscounts.FirstOrDefault()).Where(discount => discount != null).ToList();
					return firstCartItem;
				});

				return groupedCartItems;
			}
		}
	}
}
