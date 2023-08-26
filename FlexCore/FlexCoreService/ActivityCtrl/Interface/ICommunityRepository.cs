using FlexCoreService.ActivityCtrl.Models.Dtos;

namespace FlexCoreService.ActivityCtrl.Interface
{
    public interface ICommunityRepository
    {
        Task<int> AddPost(NewPostDTO dto);
        Task<IEnumerable<HistoryPostsDTO>> GetAllPost();
        Task<IEnumerable<HistoryPostsDTO>> GetCategoryPostAsync(PostSearchDTO dto);
    }
}
