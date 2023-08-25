using FlexCoreService.ActivityCtrl.Models.Dtos;

namespace FlexCoreService.ActivityCtrl.Interface
{
    public interface IPaymentDPRepository
    {
        void UpdatePayInfo(AddPayInfoDTO info);

        public OrderDetailDTO GetTradeDesc(string tradeNo);

        int UpdateOrderInfo(ActivityToOrdersDTO order);
        void UpdateOrderItemInfo(ActivityToOrderItemDTO orderItem);
        int UpdateReservationOrderInfo(ReservationToOrdersDTO order);
        void UpdateReservationOrderItemInfo(ReservationToOrderItemDTO orderItem);
    }
}
