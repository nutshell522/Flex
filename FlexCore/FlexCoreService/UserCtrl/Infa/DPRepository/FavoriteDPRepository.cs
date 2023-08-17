using Dapper;
using FlexCoreService.ProductCtrl.Models.Dtos;
using FlexCoreService.UserCtrl.Interface;
using Microsoft.Data.SqlClient;
using System.Data;

namespace FlexCoreService.UserCtrl.Infa.DPRepository
{
    public class FavoriteDPRepository : IFavoriteDPRepository
    {
        private string _connStr;
        private IConfiguration _configuration;
        public FavoriteDPRepository(IConfiguration configuration)
        {
            _configuration = configuration;
            _connStr = _configuration.GetConnectionString("AppDbContext");
        }

        public IEnumerable<ProductCardDto> GetFavorites(int memberId)
        {
            string sql = @"select p.ProductId, p.ProductName, p.UnitPrice,p.SalesPrice,s.SalesCategoryId,
pc.ProductCategoryName,ps.ProductSubCategoryName,s.SalesCategoryName,
MIN(pi.ImgPath) AS FirstImgPath 
from Favorites as f
join Products as p on p.ProductId=f.fk_productId
join ProductImgs as pi on p.ProductId = pi.fk_ProductId
join ProductSubCategories as ps on ps.ProductSubCategoryId=p.fk_ProductSubCategoryId
join ProductCategories as pc on pc.ProductCategoryId=ps.fk_ProductCategoryId
join SalesCategories as s on s.SalesCategoryId=pc.fk_SalesCategoryId
group by p.ProductId, p.ProductName, p.UnitPrice, p.SalesPrice, p.Status,
p.LogOut,s.SalesCategoryId,pc.ProductCategoryName,ps.ProductSubCategoryName,s.SalesCategoryName ,f.fk_memberId
having p.Status=0 and p.LogOut=0 and f.fk_memberId=@memberId " +
" order by p.SalesPrice";

            using IDbConnection dbConnection = new SqlConnection(_connStr);
            var result = dbConnection.Query<ProductCardDto>(sql, new { memberId= memberId });
            return result;
        }

    }
}
