using Dapper;
using FlexCoreService.ProductCtrl.Exts;
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

        public void DeleteFavoriteProduct(int memberId, string productId)
        {

            string sql = @"delete from Favorites 
where fk_memberId=@memberId and fk_productId=@productId";
            using IDbConnection dbConnection = new SqlConnection(_connStr);
            dbConnection.Execute(sql, new { memberId = memberId, productId = productId });
           
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

        public bool GetIsFavorite(int memberId, string productId)
        {
            string sql = @"select case when exists(
select 1 from Favorites as f 
where f.fk_memberId=@memberId and f.fk_productId=@productId)
then 'true' else 'false'
end as result";

            using IDbConnection dbConnection=new SqlConnection(_connStr);
            var result = dbConnection.QueryFirstOrDefault<string>(sql, new { memberId = memberId, productId = productId });

            return result=="true"?true:false;
        }

        public void SaveFavoritesProduct(int memberId, string productId)
        {
            string sql = @"insert Favorites(fk_memberId,fk_productId) values 
(@memberId,@productId)";
            using IDbConnection dbConnection=new SqlConnection(_connStr);
            dbConnection.Execute(sql, new {memberId= memberId, productId= productId});
        }
    }
}
