using Dapper;
using FlexCoreService.CustomeShoes.Interface;
using FlexCoreService.CustomeShoes.Models.Dtos;
using FlexCoreService.ProductCtrl.Models.Dtos;
using FlexCoreService.ProductCtrl.Models.VM;
using Microsoft.Data.SqlClient;
using System.Data;

namespace FlexCoreService.CustomeShoes.Infra.DPRepository
{
	public class ShoesCategoryDPRepository : IShoesCategoryRepository
	{
		private string _connStr;
		private IConfiguration _configuration;
		public ShoesCategoryDPRepository(IConfiguration configuration)
		{
			_configuration = configuration;
			_connStr = _configuration.GetConnectionString("AppDbContext");
		}
		public IEnumerable<ShoesCategoryDto> GetAllCategory()
		{
			string sql = @"select sc.ShoesCategoryId, sc.ShoesCategoryName from ShoesCategories as sc
";

			using IDbConnection dbConnection = new SqlConnection(_connStr);
			var result = dbConnection.Query<ShoesCategoryDto>(sql);
			return result;
		}

        public IEnumerable<ShoesCategoryCardDto> SearchShoesCategory(int shoescategoryId)
        {
            string sql = @"select CustomizedShoesPo.ShoesProductId, CustomizedShoesPo.ShoesName, CustomizedShoesPo.ShoesUnitPrice, ShoesCategories.ShoesCategoryId, ShoesCategories.ShoesCategoryName,MIN(ShoesPictures.ShoesPictureUrl) AS FirstImgPath from CustomizedShoesPo
join ShoesCategories on ShoesCategories.ShoesCategoryId = CustomizedShoesPo.fk_ShoesCategoryId
join ShoesPictures on CustomizedShoesPo.ShoesProductId = ShoesPictures.fk_ShoesPictureProduct_Id
group by CustomizedShoesPo.ShoesProductId, CustomizedShoesPo.ShoesName, CustomizedShoesPo.ShoesUnitPrice,ShoesCategories.ShoesCategoryId,ShoesCategories.ShoesCategoryName
having ShoesCategories.ShoesCategoryId=" + shoescategoryId;

            using IDbConnection dbConnection = new SqlConnection(_connStr);
            var result = dbConnection.Query<ShoesCategoryCardDto>(sql, new { shoescategoryId });
            return result;
        }
    }
}
