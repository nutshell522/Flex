namespace FlexCoreService.ActivityCtrl.Models.Dtos
{
    public class ActivityToOrderItemDTO
    {
        public int order_Id { get; set; }
        public string product_name { get; set; }
        public int? per_price { get; set; }
        public int? subtotal { get; set; }
        public int? discount_subtotal { get; set; }
    }
}
