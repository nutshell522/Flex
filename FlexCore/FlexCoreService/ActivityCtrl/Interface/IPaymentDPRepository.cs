using FlexCoreService.ActivityCtrl.Models.Dtos;

namespace FlexCoreService.ActivityCtrl.Interface
{
    public interface IPaymentDPRepository
    {
        void UpdatePayInfo(AddPayInfoDTO info);

        public OrderDetailDTO GetTradeDesc(string tradeNo);
    }
}
