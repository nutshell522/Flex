using Dapper;
using ECPay.Payment.Integration;
using FlexCoreService.ActivityCtrl.Interface;
using FlexCoreService.ActivityCtrl.Models.Dtos;
using Microsoft.Data.SqlClient;
using static System.Runtime.CompilerServices.RuntimeHelpers;

namespace FlexCoreService.ActivityCtrl.Infra.DPRepository
{
    public class PaymentDPRepository : IPaymentDPRepository
    {
        private string _connStr;
        private IConfiguration _configuration;

        public PaymentDPRepository(IConfiguration configuration)
        {
            _configuration = configuration;
            _connStr = _configuration.GetConnectionString("AppDbContext");
        }
        public void UpdatePayInfo(AddPayInfoDTO info)
        {
            string sql = @"Update EcpayOrders set RtnCode =@rtnCode, RtnMsg =@rtnMsg, TradeNo=@tradeNo, PaymentDate=@paymentDate, PaymentType=@paymentType where MerchantTradeNo = @merchantTradeNo";

            using (var conn = new SqlConnection(_connStr))
            {
                conn.Execute(sql, new
                {
                    rtnCode = info.RtnCode,
                    rtnMsg = info.RtnMsg,
                    tradeNo = info.TradeNo,
                    paymentDate = info.PaymentDate,
                    paymentType = info.PaymentType,
                    merchantTradeNo = info.MerchantTradeNo

                });
                
            }
        }

        public OrderDetailDTO GetTradeDesc (string tradeNo)
        {
            string sql = @"select TradeDesc
from EcpayOrders
WHERE TradeNo = @tradeNo";

            using (var conn = new SqlConnection(_connStr))
            {
                return conn.QueryFirstOrDefault< OrderDetailDTO>(sql, new { tradeNo });
            }
        }
    }
}
