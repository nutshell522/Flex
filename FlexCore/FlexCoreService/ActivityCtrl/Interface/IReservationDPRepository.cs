using FlexCoreService.ActivityCtrl.Models.Dtos;

namespace FlexCoreService.ActivityCtrl.Interface
{
    public interface IReservationDPRepository
    {
        Task<IEnumerable<ReservationDTO>> GetAllAsync();
    }
}
