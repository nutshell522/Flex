using EFModels.Models;
using FlexCoreService.ActivityCtrl.Infra.DPRepository;
using FlexCoreService.ActivityCtrl.Interface;
using FlexCoreService.ActivityCtrl.Models.Dtos;
using FlexWebAPI.Models.DTO;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.CSharp.Syntax;

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

        //[HttpGet("index")]
        //public async Task<IEnumerable<ActivityIndexDTO>> GetAll(ActivitySearchDTO? dto)
        //{
        //    if (!_context.Activities.Any())
        //    {
        //        return Enumerable.Empty<ActivityIndexDTO>();
        //    }

        //    var all =await  _repo.GetAllAsync();

        //   if (dto == null)
        //    {
        //        return all;
        //    }
        //    else
        //    {

        //        if (dto.SearchArea == null)
        //        {
        //            var result = all.Where(a => a.ActivityCategoryName.Contains(dto.Option1) || a.ActivityCategoryName.Contains(dto.Option2)).ToList();
        //            return result;
        //        }
        //        else
        //        {
        //            var result = all.Where(a => (a.ActivityCategoryName.Contains(dto.Option1) || a.ActivityCategoryName.Contains(dto.Option2)) && a.ActivityPlace.Contains(dto.SearchArea)).ToList();
        //            return result;
        //        };

        //    };

        //}


        [HttpPost("index")]
        public async Task<IEnumerable<ActivityIndexDTO>> GetAll(ActivitySearchDTO? dto)
        {
            if (!_context.Activities.Any())
            {
                return Enumerable.Empty<ActivityIndexDTO>();
            }

            var all = await _repo.GetAllAsync();

            if (string.IsNullOrEmpty(dto.Option1) && string.IsNullOrEmpty(dto.Option2) && string.IsNullOrEmpty(dto.SearchArea))
            {
                return all;
            }
            else
            {
                if (string.IsNullOrEmpty(dto.SearchArea))
                {
                    if (string.IsNullOrEmpty(dto.Option2))
                    {
                        var result = all.Where(a => a.ActivityCategoryName.Contains(dto.Option1));
                        return result;
                    }
                    else
                    {
                        var result = all.Where(a => a.ActivityCategoryName.Contains(dto.Option1) || a.ActivityCategoryName.Contains(dto.Option2)).ToList();
                        return result;
                    }
                }
                else
                {
                    if (string.IsNullOrEmpty(dto.Option2))
                    {
                        var result = all.Where(a => a.ActivityCategoryName.Contains(dto.Option1) && a.ActivityPlace.Contains(dto.SearchArea));
                        return result;
                    }
                    else
                    {
                        var result = all.Where(a => (a.ActivityCategoryName.Contains(dto.Option1) || a.ActivityCategoryName.Contains(dto.Option2)) && a.ActivityPlace.Contains(dto.SearchArea)).ToList();
                        return result;
                    }
                }
            }
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

        //[HttpPost("Search")]
        //public async Task<IEnumerable<ActivityIndexDTO>> Search([FromBody] ActivitySearchDTO dto)
        //{
        //    dto.Option1 = "自行車";
        //    dto.Option2 = "路跑";
        //    dto.SearchArea = "聖德";
        //   var result = await _repo.SearchByPlaceAndCategoryAsync(dto);
        //    result.Where(p=>p.ActivityName== dto.Option1)
        //    return result;

        //}
    }
}
