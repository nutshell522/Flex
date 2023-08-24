using System.Net.Mail;
using System.Net;
using System.Net.Mime;

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
            

            // 使用 AlternateView 添加 HTML 內容，包含圖片
            string htmlBody = @"
        <html>
            <body>
                <h1>感謝您註冊成為 flex 的會員!</h1>                
                <h3>請點擊「啟用帳戶」連結來啟用您的帳戶:<a href='https://localhost:8080/login'> 啟用帳戶</a></h3>
                <br>
                <img src='cid:logo'>
            </body>
        </html>
    ";
            AlternateView avHtml = AlternateView.CreateAlternateViewFromString(htmlBody, null, MediaTypeNames.Text.Html);

            // 添加圖片附件，並設定 ContentId 以供引用
            LinkedResource logoResource = new LinkedResource("D:\\FlexFrontend\\FlexFrontendNew\\FlexCore\\FlexCoreService\\wwwroot\\Public\\Img\\Icon.png", MediaTypeNames.Image.Jpeg);
            logoResource.ContentId = "logo";
            avHtml.LinkedResources.Add(logoResource);

            mms.AlternateViews.Add(avHtml);

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
