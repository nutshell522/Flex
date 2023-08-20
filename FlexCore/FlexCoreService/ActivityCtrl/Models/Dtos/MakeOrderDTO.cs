namespace FlexCoreService.ActivityCtrl.Models.Dtos
{
    public class MakeOrderDTO
    {
        public int MemberID { get; set; }
        public string MerchantTradeNo { get; set; }
        public string MerchantID { get; set; }
        public int TotalAmount { get; set; }
        public string MerchantTradeDate { get; set; }
        public string PaymentType { get; set; }
        public string CheckMacValue { get; set; }
        public string ItemName { get; set; }
        public string TradeDesc { get; set; }
        public int ActivityId { get; set; }

    }
}
