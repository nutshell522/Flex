using FlexCoreService.ActivityCtrl.Models.Dtos;
using FlexWebAPI.Models.DTO;

namespace FlexCoreService.ActivityCtrl.Interface
{
    public interface IActivityDPRepository
    {
        ActivityInfoDto GetActivityInfo(int id);

        Task<MemberDTO> GetMembreInfoAsync(int id);
    }

}
