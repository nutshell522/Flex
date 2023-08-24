using BCryptHelper = BCrypt.Net.BCrypt;

namespace FlexCoreService.UserCtrl.Infa
{
    public class Cryptography
    {
        public static string Hash(string Text, out string Salt)
        {
            Salt = BCryptHelper.GenerateSalt();
            return BCryptHelper.HashPassword(Text, Salt);
        }
        public static bool VerifyHash(string Text, string HashedText)
        {
            return BCryptHelper.Verify(Text, HashedText);
        }
    }
}
