namespace FlexCoreService.ActivityCtrl.Models.Dtos
{
    public class AddPayInfoDTO
    {
        //public string MerchantID { get; set; }
        public string MerchantTradeNo { get; set; } //交易編號
        public int RtnCode { get; set; } //
        public string RtnMsg { get; set; }
        public string TradeNo { get; set; }
        //public int TradeAmt { get; set; }
        public string PaymentDate { get; set; } //付款時間
       
        public string PaymentType { get; set; } //特店選擇的付款方式

        public int TradeAmt { get; set; } //交易金額
		public string? CustomField1 { get; set; } //客製化欄位
		public string? CustomField2 { get; set; } //客製化欄位
		public string? CustomField3 { get; set; } //客製化欄位
		public string? CustomField4 { get; set; } //客製化欄位

	}
}
