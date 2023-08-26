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
                        <h1>以下為 flex 提供的預設密碼</h1>
                        <h3>{name}，您好</h3>  

                        <h3>請使用以下連結登入您的帳戶以後至 會員中心>個人資料>變更密碼 進行密碼修改:<a href='{resetUrl}'> 馬上登入重新設定密碼 </a></h3>
                        <br>
                        <img src='cid:logo'>
                    </body>
                </html>
            ";
            // 使用 AlternateView 添加 HTML 內容，包含圖片
            AlternateView avHtml = AlternateView.CreateAlternateViewFromString(body, null, MediaTypeNames.Text.Html);

            // 添加圖片附件，並設定 ContentId 以供引用
            LinkedResource logoResource = new LinkedResource("D:\\FlexFrontend\\FlexFrontendNew\\FlexCore\\FlexCoreService\\wwwroot\\Public\\Img\\Icon.png", MediaTypeNames.Image.Jpeg);
            logoResource.ContentId = "logo";
            avHtml.LinkedResources.Add(logoResource);

            var from = senderEmail;
            var to = email;

            SendFromGmail(from, to, subject, body);
        }

        public void SendConfirmRegisterEmail(string url, string name, string email)
        {
            //            var subject = "[新會員確認信]";
            //            var body = $@"Hi {name},
            //<br />
            //請點擊此連結 [<a href='{url}' target='_blank'>的確是我申請會員</a>], 如果您沒有提出申請, 請忽略本信, 謝謝";

            //            var from = senderEmail;
            //            var to = email;

            //            SendFromGmail(from, to, subject, body);
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

        public virtual void SendFromGmail(string from, string to, string subject, string body)
        {

            // 寄出信
            // ref https://dotblogs.com.tw/chichiblog/2018/04/20/122816
            var smtpAccount = from;

            // TODO 請在這裡填入密碼,或從web.config裡讀取
            var smtpPassword = "tvmalpfpzkcghuas";

            var smtpServer = "smtp.gmail.com";
            var SmtpPort = 587;

            MailMessage mms = new MailMessage();
            mms.From = new MailAddress(smtpAccount);
            mms.Subject = subject;
            mms.Body = body;
            mms.IsBodyHtml = true;
            mms.SubjectEncoding = Encoding.UTF8;
            mms.To.Add(new MailAddress(to));

            using (var client = new SmtpClient(smtpServer, SmtpPort))
            {
                client.EnableSsl = true;
                client.Credentials = new NetworkCredential(smtpAccount, smtpPassword);//寄信帳密 
                client.Send(mms); //寄出信件
            }

        }

    }
}
