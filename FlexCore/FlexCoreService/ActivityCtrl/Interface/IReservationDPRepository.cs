using FlexCoreService.ActivityCtrl.Models.Dtos;
using FlexCoreService.ActivityCtrl.Models.VM;

namespace FlexCoreService.ActivityCtrl.Interface
{
    public interface IReservationDPRepository
    {
        Task<IEnumerable<ReservationDTO>> GetAllAsync();

        Task<SpeakerDetailDTO> GetSpeakerInfoAsync(int id);
    }
}
