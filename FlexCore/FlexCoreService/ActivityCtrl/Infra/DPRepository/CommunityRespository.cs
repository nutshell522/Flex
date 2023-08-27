using Dapper;
using FlexCoreService.ActivityCtrl.Interface;
using FlexCoreService.ActivityCtrl.Models.Dtos;
using Microsoft.Data.SqlClient;

namespace FlexCoreService.ActivityCtrl.Infra.DPRepository
{
    public class CommunityRespository : ICommunityRepository
    {
        private string _connStr;
        private IConfiguration _configuration;

        public CommunityRespository(IConfiguration configuration)
        {
            _configuration = configuration;
            _connStr = _configuration.GetConnectionString("AppDbContext");
        }

        public async Task<int> AddPost(NewPostDTO dto)
        {
            string sql = @"
INSERT INTO Articles (Category, Content, Title, PublishTime, Author)
VALUES (@category, @content, @title, @publishTime, @author);
SELECT CAST(SCOPE_IDENTITY() AS INT);
";
            using (var conn = new SqlConnection(_connStr))
            {
                conn.Open();
                int postId = conn.Query<int>(sql, new
                {
                    category = dto.Category,
                    content = dto.Content,
                    title = dto.Title,
                    publishTime = dto.PublishTime,
                    author = dto.Author

                }).Single();

                return postId;
            }
        }

        public async Task<IEnumerable<HistoryPostsDTO>> GetAllPost()
        {
            string sql = @"
SELECT *
From Articles
";
            using (var conn = new SqlConnection(_connStr))
            {
                return await conn.QueryAsync<HistoryPostsDTO>(sql);
            }
        }

        public async Task<IEnumerable<HistoryPostsDTO>> GetCategoryPostAsync(PostSearchDTO dto)
        {
            string sql = @"
SELECT *
From Articles
Where Category = @category
Order By PublishTime Desc
";
            using (var conn = new SqlConnection(_connStr))
            {
                return await conn.QueryAsync<HistoryPostsDTO>(sql, new
                {
                    category = dto.Category
                });
            }
        }
    }
}
