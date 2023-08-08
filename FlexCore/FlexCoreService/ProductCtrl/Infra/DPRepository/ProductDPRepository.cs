using Dapper;
using FlexCoreService.ProductCtrl.Interface;
using FlexCoreService.ProductCtrl.Models.Dtos;
using Microsoft.Data.SqlClient;
using System.Data;

namespace FlexCoreService.ProductCtrl.Infra.DPRepository
{
    public class ProductDPRepository : IProductRepository
    {
        private string _connStr;
        private IConfiguration _configuration;
        public ProductDPRepository(IConfiguration configuration)
        {
            _configuration = configuration;
            _connStr = _configuration.GetConnectionString("AppDbContext");
        }

        public IEnumerable<ProductDetailDto> GetProductDetail(string productId)
        {
            string sql = @"select p.ProductId,p.ProductName,p.UnitPrice,p.SalesPrice,cc.ColorName,
sc.SizeName,pg.Qty
from Products as p
join ProductGroups as pg on pg.fk_ProductId=p.ProductId
join ColorCategories as cc on cc.ColorId=pg.fk_ColorId
join SizeCategories as sc on sc.SizeId=pg.fk_SizeId
where p.Status=0 and p.LogOut=0 and p.ProductId= '"+ @productId+"'";

            using IDbConnection dbConnection = new SqlConnection(_connStr);
            var result = dbConnection.Query<ProductDetailDto>(sql, new { productId });
            return result;
        }

        //        public IEnumerable<ProductCardDto> SearchProducts()
        //        {
        //            string sql = @"select p.ProductId, p.ProductName, p.UnitPrice, p.SalesPrice, MIN(pi.ImgPath) AS FirstImgPath 
        //from Products as p
        //join ProductImgs as pi on p.ProductId = pi.fk_ProductId
        //group by p.ProductId, p.ProductName, p.UnitPrice, p.SalesPrice, p.Status, p.LogOut
        //having p.Status=0 and p.LogOut=0
        //order by p.ProductId";

        //            using IDbConnection dbConnection = new SqlConnection(_connStr);
        //            var result = dbConnection.Query<ProductCardDto>(sql);
        //            return result;
        //        }

        public IEnumerable<ProductCardDto> SearchProducts(int salesId, string? categoryName, string? subCategoryName)
        {
            string sql = @"select p.ProductId, p.ProductName, p.UnitPrice,p.SalesPrice,s.SalesCategoryId,
pc.ProductCategoryName,ps.ProductSubCategoryName,MIN(pi.ImgPath) AS FirstImgPath 
from Products as p
join ProductImgs as pi on p.ProductId = pi.fk_ProductId
join ProductSubCategories as ps on ps.ProductSubCategoryId=p.fk_ProductSubCategoryId
join ProductCategories as pc on pc.ProductCategoryId=ps.fk_ProductCategoryId
join SalesCategories as s on s.SalesCategoryId=pc.fk_SalesCategoryId
group by p.ProductId, p.ProductName, p.UnitPrice, p.SalesPrice, p.Status,
p.LogOut,s.SalesCategoryId,pc.ProductCategoryName,ps.ProductSubCategoryName
having p.Status=0 and p.LogOut=0 and 
s.SalesCategoryId = " + @salesId +
" and pc.ProductCategoryName like '%" + @categoryName + "%'" +
" and ps.ProductSubCategoryName like '%" + @subCategoryName + "%'" +
" order by p.SalesPrice";

            using IDbConnection dbConnection = new SqlConnection(_connStr);
            var result = dbConnection.Query<ProductCardDto>(sql, new { salesId , categoryName , subCategoryName });
            return result;
        }

    }
}
