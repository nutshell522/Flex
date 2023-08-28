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
        public async Task<ActionResult<string>> uploadImage(IFormFile file)
        {
            // 獲取應用程序的根目錄
            string rootPath = Directory.GetCurrentDirectory();

            // 定義保存圖片的相對路徑
            string relativePath = "wwwroot/Public/Img";

            // 將相對路徑轉換為絕對路徑
            string savingPlace = Path.Combine(rootPath, relativePath);

            // 確保目錄存在，如果不存在，則創建它
            Directory.CreateDirectory(savingPlace);

            // 使用Guid生成一個唯一的文件名，以避免文件名衝突
            string uniqueFileName = Guid.NewGuid().ToString() + "_" + file.FileName;

            // 組合完整的文件路徑
            string imagePath = Path.Combine(savingPlace, uniqueFileName);

            // 定義基本地址
            string baseAddress = @"https://localhost:7183/Public/Img/";

            using (var stream = new FileStream(imagePath, FileMode.Create))
            {
                await file.CopyToAsync(stream);
            }

            // 返回上傳後的圖片路徑
            string result = Path.Combine(baseAddress, uniqueFileName);
            return Ok(result);
        }


        //public async Task<ActionResult<string>> uploadImage (IFormFile file)
        //{
        //    string savingPlace = @"C:\FLEX0825\Flex\FlexCore\FlexCoreService\wwwroot\Public\Img";
        //    string imagePath = Path.Combine(savingPlace, file.FileName);
        //    string baseAddress = @"https://localhost:7183/Public/Img/";

        //    using(var stream = new FileStream(imagePath, FileMode.Create))
        //    {
        //        await file.CopyToAsync(stream);
        //    }
        //    string result = Path.Combine(baseAddress, file.FileName);
        //    return Ok(result);
        //}

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
