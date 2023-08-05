using EFModels.Models;
using FlexCoreService.ActivityCtrl.Infra.DPRepository;
using FlexCoreService.ActivityCtrl.Interface;
using FlexCoreService.ActivityCtrl.Models.Dtos;
using FlexWebAPI.Models.DTO;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace FlexCoreService.Controllers
{
    [EnableCors("AllowAny")]
    [Route("api/[controller]")]
    [ApiController]
    public class ActivityController : ControllerBase
    {
        private AppDbContext _context;
        private ActivityDPRepository _repo;
        private IConfiguration _configuration;
        public ActivityController(AppDbContext context, ActivityDPRepository repo, IConfiguration configuration)
        {
            _context = context;
            _repo = repo;
            _configuration = configuration;
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<ActivityInfoDto>> GetOneActivity(int id)
        {
           
            var result = _repo.GetActivityInfo(id);
            if(result ==null)
            {
                return NotFound();
            }
            return result;

        }

        [HttpGet("SignUp{id}")]
        public async Task<ActionResult<MemberDTO>> GetMemberInfoAsnyc(int id)
        {
            var memberInfoDto = await _repo.GetMembreInfoAsync(id);
            if(memberInfoDto == null)
            {
                return NotFound();
            }
            return memberInfoDto;
        }
    }
}
