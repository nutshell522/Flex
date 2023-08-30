namespace FlexCoreService.UserCtrl.Models.Dtos
{
    public class RegisterDto
    {
        public int? MemberId{ get; set; }
        public string? Account { get; set; }

        public string? EncryptedPassword { get; set; }

        public string? Name { get; set; }

        public string? Email { get; set; }

        public DateTime? Birthday { get; set; }

        public string? Mobile { get; set; }

        public string? CommonAddress { get; set; }

        public int? fk_LevelId { get; set; }

        public string? ImgPath { get; set; }

    }
}
