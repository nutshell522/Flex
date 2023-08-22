namespace FlexCoreService.ActivityCtrl.Models.Dtos
{
    public class ActivityToOrdersDTO
    {
        public DateTime ordertime { get; set; }
        public int fk_member_Id { get; set; }
       
        public int pay_method_Id { get; set; }
        public string cellphone { get; set; }
        public string receiver { get; set; }
        public string recipient_address { get; set; }

        public DateTime? close_time { get; set; }

        public string orderCode { get; set; }
    }
}
