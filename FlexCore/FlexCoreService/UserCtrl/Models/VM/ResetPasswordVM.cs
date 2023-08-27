using System.ComponentModel.DataAnnotations;

namespace FlexCoreService.UserCtrl.Models.VM
{
    public class ResetPasswordVM
    {
        [Display(Name ="新密碼")]
        public string? Password { get; set; }

        [Display(Name = "確認密碼")]
        [Compare(nameof(Password))]
        public string? ConfirmPassword { get; set; }
    }
}
