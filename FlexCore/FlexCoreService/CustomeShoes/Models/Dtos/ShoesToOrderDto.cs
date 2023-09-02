using EFModels.Models;

namespace FlexCoreService.CustomeShoes.Models.Dtos
{
    public class ShoesToOrderDto
    {
        public int fk_member_Id { get; set; }

        public DateTime ordertime { get; set; }

        public int total_quantity { get; set; }

        public int pay_method_Id { get; set; }

        public int order_status_Id { get; set; }

        public int pay_status_Id { get; set; }
        public int freight { get; set; }

        public string cellphone { get; set;}

        public string receiver { get; set;}

        public string recipient_address { get; set;}

        public string order_description { get; set;}

		public string orderCode { get; set; }

		public int fk_typeId { get; set; }

        public int total_price { get; set; }
        public int order_Id { get; set; }
        public string product_name { get; set; }
        public int? per_price { get; set; }
        public int? quantity { get; set; }
        public string? Items_description { get; set; }
        public string? discount_name { get; set; }

        public int? subtotal { get;set; }

        public int? discount_subtotal { get; set; }



    }
}
