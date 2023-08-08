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

namespace FlexCoreService.Controllers
{
    [EnableCors("AllowAny")]
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly AppDbContext _db;
        private readonly IHttpContextAccessor _httpContextAccessor;
        public UsersController(AppDbContext db, IHttpContextAccessor httpContextAccessor)
        {
            _db = db;
            _httpContextAccessor = httpContextAccessor;
        }

        /// <summary>
        /// 取得會員資料
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet("{account}")]
        [Authorize]
        public async Task<ProfileDto> GetUserProfil(string account)
        {
            //StringBuilder sb = new StringBuilder();
            //sb.AppendLine("<ul>");
            //foreach (Claim claim in HttpContext.User.Claims)
            //{
            //    sb.AppendLine($@"<li> claim.Type:{claim.Type} , claim.Value:{claim.Value}</li>");
            //}
            ClaimsPrincipal user = HttpContext.User;

            if (_db.Members == null)
            {
                return null;
            }
            ProfileDto proDto = _db.Members.Include(m => m.fk_Level).Where(m => m.Account == account).Select(m => new ProfileDto
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
                IsSubscribeNews = m.IsSubscribeNews
            }).Single();

            
            return proDto;
        }

        /// <summary>
        /// 登入中
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        [HttpPost("Login")]
        public string Login([FromBody] LoginDto value)
        {
            var userData = (from m in _db.Members
                            where m.Account == value.Account
                            select m).SingleOrDefault();

            var userPassword=string.Empty;
            

            if (userData == null)
            {
                //欄位或帳號驗證失敗
                return "帳號錯誤";
            }
            else
            {                
                //驗證密碼
                userPassword = userData.EncryptedPassword;

                if (userPassword == value.EncryptedPassword)
                {
                    var claims = new List<Claim>
                    {
                    new Claim(ClaimTypes.Name, userData.Account),
                    new Claim("UserPassword", userData.EncryptedPassword),
                    new Claim("FullName", userData.Name),
                    new Claim("MemberId",userData.MemberId.ToString())//MemberId為自訂宣告的Type名稱
                   // new Claim(ClaimTypes.Role, "Administrator")//管理角色
                    };

                    var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);

                    //控制登入狀態
                    HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(claimsIdentity));
                    
                    return JsonConvert.SerializeObject(claims);
                }               
                return userData.Account;
            }
        }


        //public void ss (LoginDto value)
        //{
        //    var Claim = _contextAccessor.HttpContext.User.Claims.First();
        //    //var memId=Claim.Where(m=>m.Type=="MemberId").FirstOrDefault();
        //    //12-3
        //}


        /// <summary>
        /// 登出
        /// </summary>
        [HttpDelete]
        [AllowAnonymous]//不需要身分驗證
        public void Logout()
        {
            HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
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

    }
}
