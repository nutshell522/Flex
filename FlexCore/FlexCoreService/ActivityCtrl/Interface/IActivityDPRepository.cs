using FlexCoreService.ActivityCtrl.Models.Dtos;

namespace FlexCoreService.ActivityCtrl.Interface
{
    public interface IActivityDPRepository
    {
        ActivityInfoDto GetActivityInfo(int id);
    }

}
