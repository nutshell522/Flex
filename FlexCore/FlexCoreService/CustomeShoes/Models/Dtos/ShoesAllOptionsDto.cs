namespace FlexCoreService.CustomeShoes.Models.Dtos
{
    public class ShoesAllOptionsDto
    {
        public string ShoesOrderId { get; set; }

        public int OptionId { get; set; }
        public string? OptinName { get; set; }

        public int Shoesmaterial_Id { get; set; }

        public string? material_Name { get; set; }

        public int ShoesColorId { get; set; }

        public string? ColorName { get; set; }

    }
}
