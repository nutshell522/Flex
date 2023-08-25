using System.Net.Mail;
using System.Net.Mime;
using System.Net;

namespace FlexCoreService.UserCtrl.Infa
{
    public class ForgetPwdEmail
    {
        public void Sendemail(string email)
        {
            var senderemail = "fuen28flex@gmail.com";
            var password = "tvmalpfpzkcghuas";

            MailMessage mms = new MailMessage();
            mms.From = new MailAddress(senderemail);
            mms.To.Add(email);
            mms.Subject = "flex 重新設定密碼驗證信";


            // 使用 AlternateView 添加 HTML 內容，包含圖片
            string htmlBody = @"
        <html>
            <body>
                <h1>以下為 flex 提供的預設密碼</h1>
                <h3>預設密碼:</h3>               
                <h3>d52hlew</h3>

                <h3>請使用「預設密碼」登入您的帳戶以後至 會員中心>個人資料>變更密碼 進行密碼修改:<a href='https://localhost:8080/login'> 馬上登入重新設定密碼 </a></h3>
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
