using Dapper;
using FlexCoreService.ActivityCtrl.Interface;
using FlexCoreService.ActivityCtrl.Models.Dtos;
using FlexCoreService.ProductCtrl.Models.Dtos;
using Microsoft.Data.SqlClient;

namespace FlexCoreService.ActivityCtrl.Infra.DPRepository
{
    public class ActivityDPRepository : IActivityDPRepository
    {
        private string _connStr;
        private IConfiguration _configuration;

        public ActivityDPRepository(IConfiguration configuration)
        {
            _configuration = configuration;
            _connStr = _configuration.GetConnectionString("AppDbContext");
        }
        public ActivityInfoDto GetActivityInfo(int id)
        {
            string sql = @"select ActivityName, ActivityDate, ActivityCategoryName, ActivityAge, ActivitySalePrice, ActivityOriginalPrice, ActivityPlace, ActivityDescription
From Activities
Join ActivityCategories
On Activities.fk_ActivityCategoryId = ActivityCategories.ActivityCategoryId
WHERE ActivityId = @id";

            using(var conn = new SqlConnection(_connStr))
            {
                return conn.QueryFirstOrDefault<ActivityInfoDto>(sql, new {id});
            }
        }
    }
}

