using EFModels.Models;
using FlexCoreService.UserCtrl.Dtos;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;
using System.Xml.Linq;
using Newtonsoft.Json;
using System.Text;
using System.Net.Mail;
using System.Net;
using System.Security.Principal;
using Newtonsoft.Json.Linq;
using FlexCoreService.ProductCtrl.Models.Dtos;
using FlexCoreService.UserCtrl.Interface;
using FlexCoreService.UserCtrl.Service;
using FlexCoreService.UserCtrl.Infa;

namespace FlexCoreService.Controllers
{
    [EnableCors("AllowAny")]
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly AppDbContext _db;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private IFavoriteDPRepository _repo;
        public UsersController(AppDbContext db, IHttpContextAccessor httpContextAccessor, IFavoriteDPRepository repo)
        {
            _db = db;
            _repo = repo;
            _httpContextAccessor = httpContextAccessor;
        }

        /// <summary>
        /// 取得會員信箱
        /// </summary>
        /// <param name="account"></param>
        /// <returns></returns>
        [HttpGet("account/{account}")]
        public async Task<ActionResult<string>> GetUserEmail(string account)
        {
            //檢查帳號是否存在
            Member member = await _db.Members.FirstOrDefaultAsync(x => x.Account == account);

            if (_db.Members == null)
            {
                return NotFound();
            }
            string userEmail = member.Email;

            //把密碼設為預設密碼
            member.EncryptedPassword = "d52hlew";
            await _db.SaveChangesAsync();

            //todo寄有預設密碼的信
            ForgetPwdEmail sendEmail = new ForgetPwdEmail();
            sendEmail.Sendemail(userEmail);

            return Ok(userEmail);
        }

        /// <summary>
        /// 取得會員資料
        /// </summary>
        /// <param name="account"></param>
        /// <returns></returns>
        [HttpGet("{memberId}")]
        //[Authorize]
        public async Task<ProfileDto> GetUserProfil(int memberId)
        {
            ClaimsPrincipal user = HttpContext.User;

            if (_db.Members == null)
            {
                return null;
            }
            ProfileDto proDto = _db.Members.Where(m => m.MemberId == memberId).Select(m => new ProfileDto
            {
                MemberId = m.MemberId,
                fk_Level = m.fk_LevelId,
                LevelName = m.fk_Level.LevelName,
                Name = m.Name,
                Email = m.Email,
                Mobile = m.Mobile,
                Gender = m.Gender,
                Birthday = m.Birthday,
                CommonAddress = m.CommonAddress,
                AlternateAddress1 = m.AlternateAddress.AlternateAddress1,
                AlternateAddress2 = m.AlternateAddress.AlternateAddress2,
                IsSubscribeNews = m.IsSubscribeNews,
                ImgPath=m.MemberImgs.FirstOrDefault(p=>p.fk_memberId== memberId).ImgPath,
            }).First();


            return proDto;
        }

        /// <summary>
        /// 登入中
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        [HttpPost("Login")]
        public async Task<IActionResult> Login([FromBody] LoginDto value)
        {
            var userData = (from m in _db.Members
                            where m.Account == value.Account
                            select m).SingleOrDefault();

            var userPassword = string.Empty;


            if (userData == null)
            {
                //欄位或帳號驗證失敗
                return Ok(null);
            }
            else
            {
                var memberImg = _db.MemberImgs
                     .Where(img => img.fk_memberId== userData.MemberId)
                     .FirstOrDefault();

                //驗證密碼
                userPassword = userData.EncryptedPassword;

                if (userPassword == value.EncryptedPassword)
                {
                    var claims = new List<Claim>
                    {
                    new Claim(ClaimTypes.Name, userData.Account),
                    new Claim("UserPassword", userData.EncryptedPassword),
                    new Claim("FullName", userData.Name),
                    new Claim("MemberId",userData.MemberId.ToString()),//MemberId為自訂宣告的Type名稱
                    new Claim("MemberImg", userData.MemberImgs.FirstOrDefault()?.ImgPath ?? "member.jpg")

                   // new Claim(ClaimTypes.Role, "Administrator")//管理角色
                    };

                    var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);

                    var authProperties = new AuthenticationProperties
                    {
                        IsPersistent = true,
                        ExpiresUtc = DateTime.UtcNow.AddDays(7),
                    };
                    //todo 帳號沒有被驗證就要擋下來

                    //控制登入狀態
                    await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(claimsIdentity));

                    return Ok(JsonConvert.SerializeObject(claims));
                }
                return Ok(userData.Account);
            }
        }

        /// <summary>
        /// 登出
        /// </summary>
        [HttpDelete("Logout")]
        public string Logout()
        {
            HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            return "ok";
        }

        /// <summary>
        /// 測試登入狀態
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public bool IsLogin()
        {
            return User.Identity.IsAuthenticated;
        }

        /// <summary>
        /// 未登入
        /// </summary>
        /// <returns></returns>
        [HttpGet("NoLogin")]
        public string NoLogin()
        {
            return "未登入";
        }

        /// <summary>
        /// 註冊
        /// </summary>
        /// <param name="regdto"></param>
        /// <returns></returns>
        [HttpPost("Register")]
        public async Task<RegisterDto> Register([FromBody] RegisterDto regdto)
        {
            //如果有照片代表示google註冊的

            if (regdto.ImgPath != "")
            {
                MemberImg memberImg = new MemberImg
                {
                    ImgPath = regdto.ImgPath
                };
                Member member = new Member
                {
                    Account = regdto.Email,
                    EncryptedPassword = regdto.Email,
                    Name = regdto.Name,
                    Email = regdto.Email,
                    Mobile = "0921554545",//todo自動給或留空
                    fk_LevelId = 1//一般會員                
                };
                _db.Members.Add(member);

            }
            else
            {
                Member member = new Member
                {
                    Account = regdto.Account,
                    EncryptedPassword = regdto.EncryptedPassword,
                    Name = regdto.Name,
                    Email = regdto.Email,
                    Birthday = regdto.Birthday,
                    Mobile = regdto.Mobile,
                    CommonAddress = regdto.CommonAddress,
                    fk_LevelId = 1//一般會員                
                };
                //發送驗證信
                SendEmail sendEmail = new SendEmail();
                sendEmail.Sendemail(regdto.Email);

                _db.Members.Add(member);
            }            
            
            await _db.SaveChangesAsync();
            return regdto;
        }

        /// <summary>
        /// 編輯會員照片
        /// </summary>
        /// <param name="id"></param>
        /// <param name="image"></param>
        /// <returns></returns>
        [HttpPost("EditUserPhoto")]
        public async Task<ActionResult<string>> EditUserPhoto(int id, IFormFile image)
        {
            Member member = await _db.Members.FindAsync(id); //FindAsync 根據主键查找對應的紀錄

            if (member == null)
            {
                return NotFound("找不到對應的會員資料");
            }

            try
            {
                if (image == null)
                {
                    return BadRequest("找不到圖片");
                }

                // 查詢是否已經有對應的照片記錄
                MemberImg existingImg = await _db.MemberImgs.FirstOrDefaultAsync(img => img.fk_memberId == id);

                if (existingImg != null)
                {
                    // 如果已經有照片記錄，更新它
                    string targetDirectory = @"D:\FlexFrontend\FlexFrontendNew\flex_vue\public\imgs";
                    string imagePath = Path.Combine(targetDirectory, image.FileName);

                    using (var stream = new FileStream(imagePath, FileMode.Create))
                    {
                        await image.CopyToAsync(stream);
                    }

                    existingImg.ImgPath = image.FileName;
                }
                else
                {
                    // 如果沒有照片記錄，新增一條照片記錄
                    MemberImg img = new MemberImg();
                    img.fk_memberId = id;

                    string targetDirectory = @"D:\FlexFrontend\FlexFrontendNew\flex_vue\public\imgs";
                    string imagePath = Path.Combine(targetDirectory, image.FileName);

                    using (var stream = new FileStream(imagePath, FileMode.Create))
                    {
                        await image.CopyToAsync(stream);
                    }

                    img.ImgPath = image.FileName;
                    _db.MemberImgs.Add(img);
                }

                await _db.SaveChangesAsync();

                return Ok("更新圖片成功");
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, $"發生錯誤: {ex.Message}");
            }
        }


        /// <summary>
        /// 編輯會員資料
        /// </summary>
        /// <param name="account"></param>
        /// <returns></returns>
        [HttpPut("Id")]
        public async Task<ActionResult<string>> EditUserProfile(int id, ProfileDto prodto)
        {

            //檢查id是否存在
            Member member = await _db.Members.FindAsync(id); //FindAsync 根據主键查找對應的紀錄
                                                             // 查詢是否已經有對應的照片記錄
            MemberImg existingImg = await _db.MemberImgs.FirstOrDefaultAsync(img => img.fk_memberId == id);

            if (member == null)
            {
                return NotFound("找不到對應的會員資料");
            }

            member.Email = prodto.Email;
            member.Mobile = prodto.Mobile;
            member.Gender = prodto.Gender;
            member.Birthday = prodto.Birthday;
            member.CommonAddress = prodto.CommonAddress;
            member.IsSubscribeNews = prodto.IsSubscribeNews;

            //AlternateAddress 
            if (member.AlternateAddress == null)
            {
                member.AlternateAddress = new AlternateAddress(); // 建立新的 AlternateAddress 物件
            }


            AlternateAddress address = await _db.AlternateAddresses.FirstOrDefaultAsync(x => x.fk_MemberId == id);

            //沒有新增備用地址
            if (address == null)
            {

            }
            else
            {
                //新增備用地址
                address.AlternateAddress1 = prodto.AlternateAddress1;
                address.AlternateAddress2 = prodto.AlternateAddress2;
            }

            try
            {
                await _db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MemberExists(id))
                {
                    return "編輯會員資料失敗!";
                }
                else
                {
                    throw;
                }
            }
            //檢查資料都填寫




            return Ok("編輯會員資料成功");
        }

        /// <summary>
        /// 更新密碼
        /// </summary>
        /// <param name="account"></param>
        /// <returns></returns>
        [HttpPut("UpdatePwd")]
        public async Task<ActionResult<string>> UpdatePassword(int id, ProfileDto prodto)
        {
            Member member = await _db.Members.FindAsync(id); //FindAsync 根據主键查找對應的紀錄

            if (member == null)
            {
                return NotFound("找不到對應的會員資料");
            }
            member.EncryptedPassword = prodto.EncryptedPassword;
            try
            {
                await _db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MemberExists(id))
                {
                    return "更新密碼失敗!";
                }
                else
                {
                    throw;
                }
            }
            return Ok("更新密碼成功");
        }

        /// <summary>
        /// 重新設定密碼
        /// </summary>
        /// <param name="logindto"></param>
        /// <returns></returns>
        [HttpPut("ResetPwd")]
        public async Task<ActionResult<string>> ResetPwd(LoginDto logindto)
        {
            var member = (from m in _db.Members
                          where m.Account == logindto.Account
                          select m).SingleOrDefault();


            if (member == null)
            {
                return NotFound("找不到對應的會員資料");
            }

            member.EncryptedPassword = logindto.EncryptedPassword;

            try
            {
                //雜湊密碼
                await _db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MemberExists(member.Account))
                {
                    return "重設密碼失敗!";
                }
                else
                {
                    throw;
                }
            }
            return Ok("重設密碼成功");
        }

        /// <summary>
        /// 驗證會員身分
        /// </summary>
        /// <param name="logindto"></param>
        /// <returns></returns>
        [HttpPost("Verify")]
        public async Task<ActionResult<string>> VerifyUser(LoginDto logindto)
        {
            Member member = await _db.Members.FirstOrDefaultAsync(x => x.Account == logindto.Account);
            if (member == null)
            {
                return NotFound("找不到對應的會員資料");
            }
            else if (member.EncryptedPassword == logindto.EncryptedPassword)
            {
                return Ok("驗證通過");
            }
            else
            {
                return BadRequest("密碼不正確");
            }

        }

        /// <summary>
        /// 收藏喜愛商品
        /// </summary>
        /// <param name="favoritesdto"></param>
        /// <returns></returns>
        [HttpPost("SaveFavorites")]

        public async Task<ActionResult<string>> SaveFavoritesProduct(FavoritesDto favoritesdto)
        {

            var product = await _db.Products.FirstOrDefaultAsync(p => p.ProductId == favoritesdto.ProductId);
            if (product == null)
            {
                return Ok("無此商品");
            }
            var service = new FavoriteService(_repo);
            var result = service.SaveFavoritesProduct(favoritesdto.MemberId, favoritesdto.ProductId);
            if (result.IsSuccess)
            {
                return Ok("喜愛商品收藏成功");
            }else
            {
                return Ok("喜愛商品收藏失敗");
            }
            
        }

        /// <summary>
        /// 取得喜愛商品
        /// </summary>
        /// <param name="memberId"></param>
        /// <returns></returns>
        [HttpGet("GetFavorites")]
        public async Task<ActionResult<IEnumerable<ProductCardDto>>> GetFavorites(int memberId)
        {
            //List<string> favoriteProductIds = await _db.Favorites.Where(f=>f.fk_memberId == memberId).Select(f=>f.fk_productId).ToListAsync();

            //if (favoriteProductIds.Count == 0)
            //{
            //    return Ok("尚未收藏商品喔!");
            //}
            //else
            //{
            //    return Ok(favoriteProductIds);
            //}
            var service = new FavoriteService(_repo);
            var pro = service.GetFavorites(memberId);

            var result = new List<ProductCardDto>();
            return Ok(pro);
        }


        [HttpGet("IsFavorite")]
        public async Task<ActionResult<bool>> GetIsFavorite(int memberId,string productId)
        {

            var service = new FavoriteService(_repo);
            var isFavorite = service.GetIsFavorite(memberId, productId);

            return Ok(isFavorite);
        }

        [HttpDelete("DeleteFavorite")]
        public async Task<ActionResult<string>>DeleteFavoriteProduct(FavoritesDto dto)
        {
            var checkIsFavorite = await _db.Favorites.FirstOrDefaultAsync(p => p.fk_memberId == dto.MemberId && p.fk_productId == dto.ProductId);
            if (checkIsFavorite==null)
            {
                return Ok("查無收藏紀錄");
            }
            var service=new FavoriteService(_repo);
            var result = service.DeleteFavoriteProduct(dto.MemberId,dto.ProductId);
            if (result.IsSuccess)
            {
                return Ok("已成功取消收藏");
            }
            return Ok("取消收藏失敗");
        }

        private bool MemberExists(int id)
        {
            return (_db.Members?.Any(e => e.MemberId == id)).GetValueOrDefault();
        }
        private bool MemberExists(string account)
        {
            return (_db.Members?.Any(e => e.Account == account)).GetValueOrDefault();
        }

    }
}
