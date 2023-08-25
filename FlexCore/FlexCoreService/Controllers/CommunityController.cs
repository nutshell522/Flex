using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace FlexCoreService.Controllers
{
    [EnableCors("AllowAny")]
    [Route("api/[controller]")]
    [ApiController]
    public class CommunityController : ControllerBase
    {
        [HttpPost]
        public async Task<ActionResult<string>> uploadImage (IFormFile file)
        {
            string savingPlace = @"C:\Flex\Flex\FlexCore\FlexCoreService\wwwroot\Public\Img";
            string imagePath = Path.Combine(savingPlace, file.FileName);
            string baseAddress = @"https://localhost:7183/Public/Img/";

            using(var stream = new FileStream(imagePath, FileMode.Create))
            {
                await file.CopyToAsync(stream);
            }
            string result = Path.Combine(baseAddress, file.FileName);
            return Ok(result);
        }
    }
}
