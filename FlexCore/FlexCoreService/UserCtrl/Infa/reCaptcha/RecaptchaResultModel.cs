namespace FlexCoreService.UserCtrl.Infa.reCaptcha
{
    public class RecaptchaResultModel
    {
        public bool Success { get; set; }
        public string? ChallengeTs { get; set; }
        public string? Hostname { get; set; }
        public List<string>? ErrorCodes { get; set; }
    }
}
