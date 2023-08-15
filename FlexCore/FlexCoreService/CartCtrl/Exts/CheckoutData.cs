namespace FlexCoreService.CartCtrl.Exts
{
    public class CheckoutData
    {
        // 寄送資訊
        public ContactInfo ContactInfo { get; set; }

        // 帳單
        public BillingAddress BillingAddress { get; set; }

        // 付款
        public PaymentInfo? PaymentInfo { get; set; }
    }

    public class ContactInfo
    {
        public string ContactName { get; set; }
        public string PostalCode { get; set; }
        public string Address { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
    }

    public class BillingAddress
    {
        public string Name { get; set; }
        public string PostalCode { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
    }

    public class PaymentInfo
    {
        public int CouponId { get; set; }
        public string PaymentMethod { get; set; }
        public string CardName { get; set; }
        public string CardNumber { get; set; }
        public string Expiration { get; set; }
        public string CVV { get; set; }
        public bool ConfirmTerms { get; set; }
    }
}
