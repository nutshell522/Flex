using System.Net.Mail;
using System.Net;

namespace FlexCoreService.UserCtrl.Infa
{
    public class SendEmail
    {
        public void Sendemail(string email)
        {
            var senderemail = "fuen28flex@gmail.com";
            var password = "tvmalpfpzkcghuas";

            MailMessage mms = new MailMessage();
            mms.From = new MailAddress(senderemail);
            mms.To.Add(email);
            mms.Subject = "flex 註冊驗證信";
            mms.Body = "感謝您註冊成為 flex 的會員!請點擊連結...來啟用您的帳戶";

            //設定郵件主機
            SmtpClient client = new SmtpClient("smtp.gmail.com");
            client.Port = 587;
            client.Credentials = new NetworkCredential(senderemail, password);
            client.EnableSsl = true;

            //寄出郵件
            try
            {
                client.Send(mms);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }

        }
    }
}
