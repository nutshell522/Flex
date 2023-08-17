using EFModels.Models;
using FlexCoreService.ActivityCtrl.Interface;
using FlexCoreService.ActivityCtrl.Models.Dtos;
using FlexCoreService.ActivityCtrl.Models.VM;

namespace FlexCoreService.ActivityCtrl.Service
{
    public class ReservationService
    {
        private IReservationDPRepository _repo;
        private AppDbContext _db;

        public ReservationService(IReservationDPRepository repo, AppDbContext context)
        {
            _repo = repo;
            _db = context;
        }

        public async Task<IEnumerable<ReservationDTO>> GetAllAsync()
        {
            var result = await _repo.GetAllAsync();
            return result;
        }
        
        public async Task<SpeakerDetailDTO> GetSpeakerInfoAsync(int id)
        {
            var speaker = await _repo.GetSpeakerInfoAsync(id);
            return speaker;

        }

        public async Task<IEnumerable<ReservationHistoryDTO>> GetReservationHistoryAsync (int id)
        {
            var result = await _repo.GetReservationHistoryAsync(id);
            return result;

        }

        public async Task AddReservationAsync (AddReservationDTO dto)
        {
            await _repo.AddReservationAsync(dto);
            
        }
    }
}
