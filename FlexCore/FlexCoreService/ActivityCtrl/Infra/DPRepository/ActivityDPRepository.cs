using Dapper;
using FlexCoreService.ActivityCtrl.Interface;
using FlexCoreService.ActivityCtrl.Models.Dtos;
using FlexCoreService.ProductCtrl.Models.Dtos;
using FlexWebAPI.Models.DTO;
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
            string sql = @"select TOP(1)  ActivityName, ActivityDate, ActivityCategoryName, ActivityAge, ActivitySalePrice, ActivityOriginalPrice, ActivityPlace, ActivityDescription, SpeakerName, ImgPath
FROM
    Activities
JOIN
    ActivityCategories ON Activities.fk_ActivityCategoryId = ActivityCategories.ActivityCategoryId
JOIN
    Speakers ON Activities.fk_SpeakerId = Speakers.SpeakerId
Join ActivityImg ON ActivityImg.fk_ActivityId = Activities.ActivityId
WHERE ActivityId = @id
";

            using(var conn = new SqlConnection(_connStr))
            {
                return conn.QueryFirstOrDefault<ActivityInfoDto>(sql, new {id});
            }
        }

        public async Task<MemberDTO> GetMembreInfoAsync(int id)
        {
            string sql = @" select Name , Gender, CommonAddress, Mobile,  Email,  Birthday
 From Members
 Where MemberId =@id";


            using (var conn = new SqlConnection(_connStr))
            {
                return await conn.QueryFirstOrDefaultAsync<MemberDTO>(sql, new {id});
            }
        }

   
    }
}

