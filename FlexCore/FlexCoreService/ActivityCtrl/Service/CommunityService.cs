using EFModels.Models;
using FlexCoreService.ActivityCtrl.Interface;
using FlexCoreService.ActivityCtrl.Models.Dtos;

namespace FlexCoreService.ActivityCtrl.Service
{
    public class CommunityService
    {
        private ICommunityRepository _repo;
        private AppDbContext _db;

        public CommunityService(ICommunityRepository repo, AppDbContext context)
        {
            _repo = repo;
            _db = context;
        }

        public async Task<int> AddPost(NewPostDTO dto)
        {
            var result = await _repo.AddPost(dto);
            return result;
        }

        public async Task<IEnumerable<HistoryPostsDTO>> GetAllPost()
        {
            var result = await _repo.GetAllPost();
            return result;
        }

        public async Task<IEnumerable<HistoryPostsDTO>> GetCategoryPostAsync(PostSearchDTO dto)
        {
            var result = await _repo.GetCategoryPostAsync(dto);
            return result;
        }
    }
}
