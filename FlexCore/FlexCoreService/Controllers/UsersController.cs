using Bogus;
using Bogus.DataSets;
using EFModels.Models;
using FlexCoreService.CartCtrl.Infra.Dapper;
using FlexCoreService.CartCtrl.Interface;
using FlexCoreService.CartCtrl.Service;
using FlexCoreService.ProductCtrl.Models.Dtos;
using FlexCoreService.UserCtrl.Infa;
using FlexCoreService.UserCtrl.Infa.reCaptcha;
using FlexCoreService.UserCtrl.Interface;
using FlexCoreService.UserCtrl.Models.Dtos;
using FlexCoreService.UserCtrl.Models.VM;
using FlexCoreService.UserCtrl.Service;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Routing;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System.Diagnostics.Metrics;
using System.Reflection;
using System.Security.Claims;



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
        private readonly IUrlHelperFactory _urlHelperFactory;
        private readonly IWebHostEnvironment _environment;
        private CartService _cartService;
        public string imgPath = string.Empty;

        public UsersController(AppDbContext db, IHttpContextAccessor httpContextAccessor, IFavoriteDPRepository repo, IUrlHelperFactory urlHelperFactory, IWebHostEnvironment environment, CartService cartService)
        {
            _db = db;
            _repo = repo;
            _httpContextAccessor = httpContextAccessor;
            _urlHelperFactory = urlHelperFactory;
            _cartService = cartService;
            _environment = environment;

            //信箱裡照片
            var emailImgPath = Path.Combine(_environment.WebRootPath, "Public", "Img");
            imgPath = Path.Combine(emailImgPath, "FlexLogo.png");
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
                ImgPath = m.MemberImgs.FirstOrDefault(p => p.fk_memberId == memberId).ImgPath,
            }).First();


            return proDto;
        }

        /// <summary>
        /// 啟用帳號
        /// </summary>
        /// <param name="memberName"></param>
        /// <param name="confirmCode"></param>
        /// <returns></returns>
        [HttpGet("ActivationAccount")]
        public async Task<IActionResult> ActivationAccount(string memberAcc, string confirmCode)
        {
            ProcessActivationAccount(memberAcc, confirmCode);

            return Ok("帳戶成功啟用");
        }

        /// <summary>
        /// 登入中
        /// </summary>
        /// <param name="logindto"></param>
        /// <returns></returns>
        [HttpPost("Login")]
        public async Task<IActionResult> Login([FromBody] LoginDto logindto)
        {
            //todo email登入
            var userData = (from m in _db.Members
                            where m.Account == logindto.Account
                            select m).SingleOrDefault();

            if (userData == null)
            {
                return BadRequest("找不到會員紀錄");
            }

            bool result = userData.ConfirmCode == "Confirmed";

            if (result == false)
            {
                return Ok("notEnabled");
            }

            if (logindto.EncryptedPassword != null && result)
            {
                var salt = HashUtility.GetSalt();
                var userEnterPwd = HashUtility.ToSHA256(logindto.EncryptedPassword, salt);
                var userPwdInDb = userData.EncryptedPassword;

                var memberImg = _db.MemberImgs
                 .Where(img => img.fk_memberId == userData.MemberId)
                 .FirstOrDefault();

                if (userEnterPwd == userPwdInDb)
                {
                    var claims = new List<Claim>
            {
                new Claim(ClaimTypes.Name, userData.Account),
                new Claim("UserPassword", userData.EncryptedPassword),
                new Claim("FullName", userData.Name),
                new Claim("MemberId", userData.MemberId.ToString()),
                new Claim("MemberImg", userData.MemberImgs.FirstOrDefault()?.ImgPath ?? "member.jpg")
            };

                    var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);

                    var authProperties = new AuthenticationProperties
                    {
                        IsPersistent = true,
                        ExpiresUtc = DateTime.UtcNow.AddDays(7),
                    };

                    // 控制登入狀態
                    await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(claimsIdentity));

                    return Ok(JsonConvert.SerializeObject(claims));
                }
                else
                {
                    return BadRequest("會員登入失敗");
                }
            }
            return Ok(userData.Account);
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
            var salt = HashUtility.GetSalt();
            var userEnterPwd = HashUtility.ToSHA256(regdto.EncryptedPassword, salt);
            int memberId = 0;
            //google註冊
            if (regdto.ImgPath != null)
            {
                MemberImg memberImg = new MemberImg
                {
                    ImgPath = regdto.ImgPath
                };
                Member member = new Member
                {
                    Account = regdto.Email,
                    EncryptedPassword = HashUtility.ToSHA256(regdto.Email, salt),
                    Name = regdto.Name,
                    Email = regdto.Email,
                    Mobile = Guid.NewGuid().ToString("N").Substring(0, 10),
                    ConfirmCode = "Confirmed",
                    fk_LevelId = 1
                };
                _db.Members.Add(member);
                await _db.SaveChangesAsync();
                memberId = member.MemberId;

            }
            else
            {
                //一般註冊
                Member member = new Member
                {
                    Account = regdto.Account,
                    EncryptedPassword = userEnterPwd,
                    Name = regdto.Name,
                    Email = regdto.Email,
                    Birthday = regdto.Birthday,
                    Mobile = regdto.Mobile,
                    CommonAddress = regdto.CommonAddress,
                    fk_LevelId = 1
                };
                //填入confirmCode
                var confirmCode = Guid.NewGuid().ToString("N");
                member.ConfirmCode = confirmCode;
                _db.SaveChanges();

                string url = "https://localhost:8080/ActivationAcc";
                string resetUrl = $"{url}?memberAcc={regdto.Account}&confirmCode={confirmCode}";

                //發送驗證信
                new EmailHelper().SendConfirmRegisterEmail(resetUrl, member.Name, member.Email,imgPath);

                //reCAPTCHA

                _db.Members.Add(member);
                await _db.SaveChangesAsync();
                memberId = member.MemberId;
            }

            _cartService.SendCoupons(2, memberId);

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
            var UserImgPath = Path.Combine(_environment.WebRootPath, "Public", "UserImgs");
            if (member == null)
            {
                return NotFound("找不到對應的會員資料");
            }

            string updatePhoto = string.Empty;

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
                    string imagePath = Path.Combine(UserImgPath, image.FileName);

                    using (var stream = new FileStream(imagePath, FileMode.Create))
                    {
                        await image.CopyToAsync(stream);
                    }

                    existingImg.ImgPath = image.FileName;
                    updatePhoto = existingImg.ImgPath;
                }
                else
                {
                    // 如果沒有照片記錄，新增一條照片記錄
                    MemberImg img = new MemberImg();
                    img.fk_memberId = id;

                    string imagePath = Path.Combine(UserImgPath, image.FileName);

                    using (var stream = new FileStream(imagePath, FileMode.Create))
                    {
                        await image.CopyToAsync(stream);
                    }

                    img.ImgPath = image.FileName;
                    updatePhoto = img.ImgPath;
                    _db.MemberImgs.Add(img);
                }

                await _db.SaveChangesAsync();

                return Ok(updatePhoto);
            }
            catch (Exception ex)
            {
                if (ex.InnerException != null)
                {
                    return StatusCode(StatusCodes.Status500InternalServerError, $"發生錯誤: {ex.InnerException.Message}");
                }
                else
                {
                    return StatusCode(StatusCodes.Status500InternalServerError, $"發生錯誤: {ex.Message}");
                }
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
        /// 變更密碼
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

            var salt = HashUtility.GetSalt();
            member.EncryptedPassword = HashUtility.ToSHA256(prodto.EncryptedPassword, salt);

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
        /// 忘記密碼
        /// </summary>
        /// <param name="vm"></param>
        /// <returns></returns>
        [HttpPost("ForgetPassword")]
        public async Task<ActionResult> ForgetPassword(ForgetPasswordVM vm)
        {

            Member member = await _db.Members.FirstOrDefaultAsync(x => x.Account == vm.Account);

            if (member == null)
            {
                return NotFound();
            }
            string userEmail = member.Email;

            var urlHelper = _urlHelperFactory.GetUrlHelper(ControllerContext);


            var urlTemplate = urlHelper.Action("ResetPassword", "Users", new
            {
                memberId = vm.Account,
                confirmCode = member.Email
            }, HttpContext.Request.Scheme);


            Result result = ProcessResetPassword(vm.Account, member.Email, urlTemplate);

            if (result.IsFail)
            {
                ModelState.AddModelError(string.Empty, result.ErrorMessage);
                return BadRequest("重新設定密碼申請失敗");
            }

            return Ok(userEmail);
        }

        /// <summary>
        /// 忘記之重設密碼
        /// </summary>
        /// <param name="vm"></param>
        /// <param name="memberId"></param>
        /// <param name="confirmCode"></param>
        /// <returns></returns>
        [HttpPost("ResetPassword")]
        public async Task<ActionResult> ResetPassword(ResetPasswordVM vm, int memberId, string confirmCode)
        {
            //if (ModelState.IsValid == false) return View(vm);
            Result result = ProcessChangePassword(memberId, confirmCode, vm.Password);

            if (result.IsFail)
            {
                ModelState.AddModelError(string.Empty, result.ErrorMessage);
                return BadRequest("重新設定密碼失敗");
            }

            return Ok("重新設定密碼成功");
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

            // 取出用戶密碼

            var salt = HashUtility.GetSalt();
            var userEnterPwd = HashUtility.ToSHA256(logindto.EncryptedPassword, salt);
            var userPwdInDb = member.EncryptedPassword;

            if (userEnterPwd == userPwdInDb)
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
            }
            else
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
            var service = new FavoriteService(_repo);
            var pro = service.GetFavorites(memberId);

            var result = new List<ProductCardDto>();
            return Ok(pro);
        }


        [HttpGet("IsFavorite")]
        public async Task<ActionResult<bool>> GetIsFavorite(int memberId, string productId)
        {
            var service = new FavoriteService(_repo);
            var isFavorite = service.GetIsFavorite(memberId, productId);

            return Ok(isFavorite);
        }

        /// <summary>
        /// 刪除喜愛商品
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        [HttpDelete("DeleteFavorite")]
        public async Task<ActionResult<string>> DeleteFavoriteProduct(FavoritesDto dto)
        {
            var checkIsFavorite = await _db.Favorites.FirstOrDefaultAsync(p => p.fk_memberId == dto.MemberId && p.fk_productId == dto.ProductId);
            if (checkIsFavorite == null)
            {
                return Ok("查無收藏紀錄");
            }
            var service = new FavoriteService(_repo);
            var result = service.DeleteFavoriteProduct(dto.MemberId, dto.ProductId);
            if (result.IsSuccess)
            {
                return Ok("已成功取消收藏");
            }
            return Ok("取消收藏失敗");
        }

        /// <summary>
        /// reCAPTCHA驗證
        /// </summary>
        /// <param name="token"></param>
        /// <returns></returns>
        [HttpPost("reCaptcha")]
        public async Task<ActionResult> GetReCAPTCHAResult([FromBody] TokenRequestModel request)
        {
            // 調用Google reCAPTCHA驗證API来驗證前端傳來的reCAPTCHA token
            var googleRecaptchaSecretKey = "6LdZBLonAAAAAP33Gz1IGemw5q2Wo2mTRU8cge3B"; // reCAPTCHA密鑰

            using var httpClient = new HttpClient();
            var parameters = new Dictionary<string, string>
    {
        { "secret", googleRecaptchaSecretKey },
        { "response", request.token }
    };

            var response = await httpClient.PostAsync("https://www.google.com/recaptcha/api/siteverify", new FormUrlEncodedContent(parameters));

            if (response.IsSuccessStatusCode)
            {
                var responseData = await response.Content.ReadAsStringAsync();
                var recaptchaResult = JsonConvert.DeserializeObject<RecaptchaResultModel>(responseData);

                if (recaptchaResult.Success)
                {
                    return Ok("驗證成功");
                }
                else
                {
                    return BadRequest("驗證失敗");
                }
            }
            else
            {
                return StatusCode(500, "reCAPTCHA驗證請求失敗");
            }

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
        /// 註冊測試資料
        /// </summary>
        /// <returns></returns>
        [HttpGet("GetTestUserRegData")]
        public async Task<ActionResult<RegisterDto>> GetTestUserRegData()
        {
            // 建立一個假資料產生器
            var faker = new Faker();

            string username = faker.Internet.UserName();
            string password = "ASDF456a";
            string fullName = "小吳";
            string email = "fuen28flex@gmail.com";
            DateTime birthday = faker.Date.Past(18, DateTime.Now.AddYears(-30)).Date;
            string phoneNumber = faker.Phone.PhoneNumber("09########");
            string address = "320桃園市中壢區新生路二段421號";

            RegisterDto testUserRegData = new RegisterDto
            {
                Account = username,
                EncryptedPassword = password,
                Name = fullName,
                Email = email,
                Birthday = birthday,
                Mobile = phoneNumber,
                fk_LevelId = 1,
                CommonAddress = address
            };

            return testUserRegData;
        }
        private bool MemberExists(int id)
        {
            return (_db.Members?.Any(e => e.MemberId == id)).GetValueOrDefault();
        }
        private bool MemberExists(string account)
        {
            return (_db.Members?.Any(e => e.Account == account)).GetValueOrDefault();
        }

        private Result ProcessResetPassword(string account, string email, string urlTemplate)
        {

            // 檢查account,email正確性
            var memberInDb = _db.Members.FirstOrDefault(m => m.Account == account);

            if (memberInDb == null) return Result.Fail("帳號或 Email 錯誤");

            if (string.Compare(email, memberInDb.Email, StringComparison.CurrentCultureIgnoreCase) != 0) return Result.Fail("帳號或 Email 錯誤");

            // 檢查 IsConfirmed必需是true, 因為只有已啟用的帳號才能重設密碼
            if (memberInDb.IsConfirmed == false) return Result.Fail("您還沒有啟用本帳號, 請先完成才能重設密碼");

            // 更新記錄, 填入 confirmCode
            var confirmCode = Guid.NewGuid().ToString("N");
            memberInDb.ConfirmCode = confirmCode;
            _db.SaveChanges();


            var url = "https://localhost:8080/ResetPassword";
            string resetUrl = $"{url}?memberId={memberInDb.MemberId}&confirmCode={confirmCode}";

            new EmailHelper().SendForgetPasswordEmail(resetUrl, memberInDb.Name, email);

            return Result.Success();
        }

        private Result ProcessChangePassword(int memberId, string confirmCode, string newPassword)
        {

            // 驗證 memberId, confirmCode是否正確
            var memberInDb = _db.Members.FirstOrDefault(m => m.MemberId == memberId && m.ConfirmCode == confirmCode);
            if (memberInDb == null) return Result.Fail("找不到對應的會員記錄");

            // 更新密碼,並將 confirmCode清空
            var salt = HashUtility.GetSalt();
            var encryptedPassword = HashUtility.ToSHA256(newPassword, salt);

            memberInDb.EncryptedPassword = encryptedPassword;
            memberInDb.ConfirmCode = "Confirmed";

            _db.SaveChanges();

            return Result.Success();
        }

        private Result ProcessActivationAccount(string memberAcc, string confirmCode)
        {
            var memberInDb = _db.Members.FirstOrDefault(m => m.Account == memberAcc && m.ConfirmCode == confirmCode);
            if (memberInDb == null) return Result.Fail("找不到對應的會員記錄");

            memberInDb.ConfirmCode = "Confirmed";

            _db.SaveChanges();

            return Result.Success();
        }

    }
}
