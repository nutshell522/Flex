using EFModels.Models;
using FlexCoreService.ActivityCtrl.Exts;
using FlexCoreService.ActivityCtrl.Interface;
using FlexCoreService.ActivityCtrl.Models.Dtos;
using FlexCoreService.ActivityCtrl.Models.VM;
using FlexCoreService.ActivityCtrl.Service;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace FlexCoreService.Controllers
{
    [EnableCors("AllowAny")]
    [Route("api/[controller]")]
    [ApiController]
    public class ReservationController : ControllerBase
    {
        private AppDbContext _db;
        private IReservationDPRepository _repo;
        private ReservationService _service;
        public ReservationController(AppDbContext context, IReservationDPRepository repo)
        {
            _db = context;
            _repo = repo;
            _service = new ReservationService(repo, context);

        }

        [HttpGet("index")]
        public async Task<ActionResult<IEnumerable<ReservationDTO>>> GetAll()
        {
            var result = await _service.GetAllAsync();
            if (result == null)
            {
                return NotFound();
            }

            return Ok(result);


        }

        [HttpGet("id")]
        public async Task<ActionResult> GetSpeakerInfo(int id)
        {
            var speaker = await _service.GetSpeakerInfoAsync(id);
            var result = speaker.ToDetailVM();
            if(result == null)
            {
                return NotFound();
            }
            return Ok(result);     
            
        }

        [HttpGet("GetReservationHistory{id}")]
        public async Task<IEnumerable<ReservationHistoryVM>> GetReservationHistory (int id)
        {
            var historyTime = await _service.GetReservationHistoryAsync(id);
            var result = historyTime.Select(x => x.ToVM());
            if (result.Count() == 0)
            {
                Enumerable.Empty<ReservationHistoryVM>();
            }
            return result;
        }

        // 琬馨記警告2

        [HttpPost("AddReservation")]
        public async Task<IActionResult> AddReservationAsync(AddReservationVM vm)
        {
            AddReservationDTO dto = new AddReservationDTO();
            dto.fk_BookerId = vm.fk_BookerId;
            dto.ReservationStartTime = vm.ReservationStartTime;
            dto.ReservationEndTime = vm.ReservationStartTime.AddHours(2);
            dto.fk_ReservationSpeakerId = vm.fk_ReservationSpeakerId;
            dto.fk_BranchId = vm.fk_BranchId;
            dto.fk_ReservationStatusId = 0;

            await _service.AddReservationAsync(dto);
            return Ok("成功");

        }
    }
}
