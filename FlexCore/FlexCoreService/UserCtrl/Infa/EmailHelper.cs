using System.Net.Mail;
using System.Net;
using System.Text;
using System.Net.Mime;

namespace FlexCoreService.UserCtrl.Infa
{
    public class EmailHelper
    {
        private string senderEmail = "fuen28flex@gmail.com"; // 寄件者

        public void SendForgetPasswordEmail(string resetUrl, string name, string email)
        {
            var subject = "[flex 重新設定密碼通知信]";
            string body = $@"
                <html>
                    <body>
                        <h1>{name}，您好，歡迎重新設定密碼</h1>
                        <h3>請點擊「重新設定密碼」連結來設定您新的密碼:<a href='{resetUrl}'> 重新設定密碼 </a></h3>
                        <br>
                        <img src='https://github.com/LanceLun/FlexSite/blob/main/FlexCore/FlexCoreService/wwwroot/Public/Img/FlexLogo.png?raw=true' style='width: 500px;height: 500px'>
                    </body>
                </html>
            ";
            //使用 AlternateView 添加 HTML 內容，包含圖片
            AlternateView avHtml = AlternateView.CreateAlternateViewFromString(body, null, MediaTypeNames.Text.Html);

            var from = senderEmail;
            var to = email;

            SendFromGmail(from, to, subject, body);
        }

        public void SendConfirmRegisterEmail(string resetUrl, string name, string email, string imgPath)
        {
            var subject = "[flex 新會員註冊驗證信]";
            string body = $@"
        <html>
            <body>
                <h1>{name}，您好，感謝您註冊成為 flex 的會員!</h1>                
                <h3>請點擊「啟用帳號」連結來啟用您的帳號:<a href='{resetUrl}'> 啟用帳號</a></h3>
                <br>
                <img src='https://github.com/LanceLun/FlexSite/blob/main/FlexCore/FlexCoreService/wwwroot/Public/Img/FlexLogo.png?raw=true' style='width: 500px;height: 500px'>
            </body>
        </html>
    ";
            // 使用 AlternateView 添加 HTML 內容，包含圖片
            AlternateView avHtml = AlternateView.CreateAlternateViewFromString(body, null, MediaTypeNames.Text.Html);

            var from = senderEmail;
            var to = email;

            SendFromGmail(from, to, subject, body);
        }

        public virtual void SendFromGmail(string from, string to, string subject, string body)
        {
            // 寄出信
            // ref https://dotblogs.com.tw/chichiblog/2018/04/20/122816
            var smtpAccount = from;
            var smtpPassword = "wbfcehcsdicqejcs";

            var smtpServer = "smtp.gmail.com";
            var SmtpPort = 587;

            MailMessage mms = new MailMessage();
            mms.From = new MailAddress(smtpAccount);
            mms.Subject = subject;
            mms.Body = body;
            mms.IsBodyHtml = true;
            mms.SubjectEncoding = Encoding.UTF8;
            mms.To.Add(to);

            using (var client = new SmtpClient(smtpServer, SmtpPort))
            {
                client.EnableSsl = true;
                client.Credentials = new NetworkCredential(smtpAccount, smtpPassword);
                client.Send(mms); 
            }

        }

    }
}
