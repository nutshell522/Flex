using Dapper;
using FlexCoreService.ActivityCtrl.Interface;
using FlexCoreService.ActivityCtrl.Models.Dtos;
using Microsoft.Data.SqlClient;

namespace FlexCoreService.ActivityCtrl.Infra.DPRepository
{
    public class ReservationDPRepositorycs : IReservationDPRepository
    {
        private string _connStr;
        private IConfiguration _configuration;

        public ReservationDPRepositorycs(IConfiguration configuration)
        {
            _configuration = configuration;
            _connStr = _configuration.GetConnectionString("AppDbContext");
        }
        public async Task<IEnumerable<ReservationDTO>> GetAllAsync()
        {
            string sql = @"select SpeakerId, SpeakerName, FieldName, SpeakerImg 
From Speakers
Join SpeakerFields
ON Speakers.fk_SpeakerFieldId = SpeakerFields.FieldId";

            using(var conn = new SqlConnection(_connStr))
            {
                return await conn.QueryAsync<ReservationDTO>(sql);
            }
        }
    }
}
