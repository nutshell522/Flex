using Dapper;
using ECPay.Payment.Integration;
using EFModels.Models;
using FlexCoreService.ActivityCtrl.Interface;
using FlexCoreService.ActivityCtrl.Models.Dtos;
using Microsoft.Data.SqlClient;
using NuGet.Protocol.Plugins;
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
            string sql = @"select ActivityName, MemberID, ItemId, TradeDate
from EcpayOrders
Join Activities
On EcpayOrders.ItemId = Activities.ActivityId
WHERE TradeNo = @tradeNo";

            using (var conn = new SqlConnection(_connStr))
            {
                var result = conn.QueryFirstOrDefault< OrderDetailDTO>(sql, new { tradeNo });
                return result;
            }
        }

        public int UpdateOrderInfo(ActivityToOrdersDTO order)
        {
            string sql = @"
INSERT INTO Orders (ordertime, fk_member_Id, total_quantity, logistics_company_Id, order_status_Id, pay_method_Id, pay_status_Id, coupon_name, coupon_discount, freight, cellphone, receipt, receiver, recipient_address, order_description, total_price, [close], close_time, fk_typeId, orderCode, biller, bill_address, bill_cellphone, agreement)
VALUES
    (@orderTime, @fk_member_Id, 1, null, 1, @pay_method_Id, 2, null, null, null, @cellphone, null, @receiver, @recipient_address, '活動', 0, null, @close_time, 2, @orderCode, null, null, null, 'true');
SELECT CAST(SCOPE_IDENTITY() AS INT);
";
            using (var conn = new SqlConnection(_connStr))
            {
                conn.Open();

                int insertedId = conn.Query<int>(sql, new
                {
                    orderTime = order.ordertime,
                    fk_member_Id = order.fk_member_Id,
                    pay_method_Id = order.pay_method_Id,
                    cellphone = order.cellphone,
                    receiver = order.receiver,
                    recipient_address = order.recipient_address,
                    close_time = order.close_time,
                    orderCode = order.orderCode
                }).Single();

                return insertedId;
            }
        }

        public void UpdateOrderItemInfo (ActivityToOrderItemDTO orderItem)
        {
            string sql = @"
INSERT INTO Flex.dbo.orderItems (order_Id, product_name, per_price, quantity, discount_name, subtotal, discount_subtotal, Items_description, fk_typeId, productcommit, comment)
VALUES
    (@order_Id, @product_name, @per_price, 1, null, @subtotal, @discount_subtotal, null, 2, null, null)
";
            using(var conn = new SqlConnection(_connStr))
            {
                conn.Execute(sql, new
                {
                    order_Id = orderItem.order_Id,
                    product_name = orderItem.product_name,
                    per_price = orderItem.per_price,
                    subtotal = orderItem.subtotal,
                    discount_subtotal = orderItem.discount_subtotal

                });
            }
        }


        public int UpdateReservationOrderInfo(ReservationToOrdersDTO order)
        {
            string sql = @"
INSERT INTO Orders (ordertime, fk_member_Id, total_quantity, logistics_company_Id, order_status_Id, pay_method_Id, pay_status_Id, coupon_name, coupon_discount, freight, cellphone, receipt, receiver, recipient_address, order_description, total_price, [close], close_time, fk_typeId, orderCode, biller, bill_address, bill_cellphone, agreement)
VALUES
    (@orderTime, @fk_member_Id, 1, null, 1, 1, 2, null, null, null, @cellphone, null, @receiver, @recipient_address, null, 0, null, @close_time, 3, @orderCode, null, null, null, 'true');
SELECT CAST(SCOPE_IDENTITY() AS INT);
";
            using (var conn = new SqlConnection(_connStr))
            {
                conn.Open();

                int insertedId = conn.Query<int>(sql, new
                {
                    orderTime = order.ordertime,
                    fk_member_Id = order.fk_member_Id,
                    cellphone = order.cellphone,
                    receiver = order.receiver,
                    recipient_address = order.recipient_address,
                    close_time = order.close_time,
                    orderCode = order.orderCode
                }).Single();

                return insertedId;
            }
        }

        public void UpdateReservationOrderItemInfo(ReservationToOrderItemDTO orderItem)
        {
            string sql = @"
INSERT INTO Flex.dbo.orderItems (order_Id, product_name, per_price, quantity, discount_name, subtotal, discount_subtotal, Items_description, fk_typeId, productcommit, comment)
VALUES
    (@order_Id,'預約服務', 0, 1, null, 0, 0, null, 3, null, null)
";
            using (var conn = new SqlConnection(_connStr))
            {
                conn.Execute(sql, new
                {
                    order_Id = orderItem.order_Id
                });
            }
        }
    }
}
