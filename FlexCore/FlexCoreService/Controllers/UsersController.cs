using EFModels.Models;
using FlexCoreService.UserCtrl.Dtos;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace FlexCoreService.Controllers
{
    [EnableCors("AllowAny")]
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly AppDbContext _db;
        public UsersController(AppDbContext db)
        {
            _db=db;
        }

        /// <summary>
        /// 取得會員資料
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet("{account}")]
        public async Task<ProfileDto> GetUserProfil(string account)
        {
            if (_db.Members==null)
            {
                return null;
            }
            ProfileDto proDto = _db.Members.Include(m=>m.fk_Level).Where(m=>m.Account==account).Select(m=>new ProfileDto
            {
                MemberId = m.MemberId,
                fk_Level=m.fk_LevelId,
                LevelName =m.fk_Level.LevelName,
                Name=m.Name,                
                Email=m.Email,
                Mobile=m.Mobile,
                Gender=m.Gender,
                Birthday=m.Birthday,
                CommonAddress=m.CommonAddress,
                AlternateAddress1=m.AlternateAddress.AlternateAddress1,
                IsSubscribeNews=m.IsSubscribeNews
            }).Single();
            return proDto;
        }

    }
}
