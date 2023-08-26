using EFModels.Models;
using FlexCoreService.ActivityCtrl.Interface;
using FlexCoreService.ActivityCtrl.Models.Dtos;
using FlexCoreService.ActivityCtrl.Service;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Collections;

namespace FlexCoreService.Controllers
{
    [EnableCors("AllowAny")]
    [Route("api/[controller]")]
    [ApiController]
    public class CommunityController : ControllerBase
    {
        private ICommunityRepository _repo;
        private CommunityService _service;
        private AppDbContext _db;

        public CommunityController(ICommunityRepository repo, AppDbContext context)
        {
            _db = context;
            _repo = repo;
            _service = new CommunityService(repo, context);
        }

        [HttpPost]
        public async Task<ActionResult<string>> uploadImage (IFormFile file)
        {
            string savingPlace = @"C:\FLEX0825\Flex\FlexCore\FlexCoreService\wwwroot\Public\Img";
            string imagePath = Path.Combine(savingPlace, file.FileName);
            string baseAddress = @"https://localhost:7183/Public/Img/";

            using(var stream = new FileStream(imagePath, FileMode.Create))
            {
                await file.CopyToAsync(stream);
            }
            string result = Path.Combine(baseAddress, file.FileName);
            return Ok(result);
        }

        [HttpPost("AddPost")]
        public async Task<ActionResult<int>> AddPost([FromBody]NewPostDTO post)
        {

            var result = await _service.AddPost(post);
            return Ok(result);

        }

        [HttpGet("GetAllPost")]
        public async Task<IEnumerable<HistoryPostsDTO>> GetAllPost()
        {
            var result = await _service.GetAllPost();
            return result;
        }

        [HttpPost("CategorySearch")]
        public async Task<IEnumerable<HistoryPostsDTO>> GetCategoryPostAsync(PostSearchDTO dto)
        {
            var result = await _service.GetCategoryPostAsync(dto);
            return result;
        }
    }
}
