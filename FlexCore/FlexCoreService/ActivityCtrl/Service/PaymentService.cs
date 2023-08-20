using EFModels.Models;
using FlexCoreService.ActivityCtrl.Interface;
using FlexCoreService.ActivityCtrl.Models.Dtos;

namespace FlexCoreService.ActivityCtrl.Infra.Service
{
    public class PaymentService
    {
        private IPaymentDPRepository _repo;
        private AppDbContext _db;

        public PaymentService(IPaymentDPRepository repo, AppDbContext context)
        {
            _repo = repo;
            _db = context;
        }

        public void UpdatePayInfo(AddPayInfoDTO info)
        {
            info.RtnMsg = "已付款";
            _repo.UpdatePayInfo(info);

        }
    }
}
