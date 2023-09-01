using FlexCoreService.CustomeShoes.Models.Dtos;

namespace FlexCoreService.CustomeShoes.Models.VMs
{
    public class ShoesOrderToOrderVM
    {
        public int fk_member_Id { get; set; }

        public DateTime ordertime { get; set; }

        public int total_quantity { get; set; }

        public int pay_method_Id { get; set; }

        public int freight { get; set; }

        public string cellphone { get; set; }

        public string receiver { get; set; }

        public string recipient_address { get; set; }

        public int total_price { get; set; }

        public IEnumerable<ShoesItemToOrderDto> ShoesItems { get; set; }

        public ShoesOrderToOrderVM()
        {
            ShoesItems = new List<ShoesItemToOrderDto>();
        }
    }
}
