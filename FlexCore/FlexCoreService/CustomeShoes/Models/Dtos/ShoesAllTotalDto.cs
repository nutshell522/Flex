namespace FlexCoreService.CustomeShoes.Models.Dtos
{
    public class ShoesAllTotalDto
    {
        public string ShoesOrderId { get; set; }

        public int ShoesProductId { get; set; }

        public string? ShoesName { get; set; }

        public int SizeId { get; set; }

        public string? SizeName { get; set; }

        public int Qty { get; set; }

        public int ShoesUnitPrice { get; set; }

        public string? Remark { get; set; }

    }
}
