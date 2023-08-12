using EFModels.Models;
using FlexCoreService.ActivityCtrl.Interface;
using FlexCoreService.ActivityCtrl.Models.Dtos;

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
        
    }
}
