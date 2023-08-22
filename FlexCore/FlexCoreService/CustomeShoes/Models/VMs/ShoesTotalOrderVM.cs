using FlexCoreService.CustomeShoes.Models.Dtos;

namespace FlexCoreService.CustomeShoes.Models.VMs
{
    public class ShoesTotalOrderVM
    {
        public string? ShoesOrderId { get; set; }

        public int ShoesProductId { get; set; }

        public string? ShoesName { get; set; }

        public int SizeId { get; set; }

        public string? SizeName { get; set; }

        public int Qty { get; set; }

        public int ShoesUnitPrice { get; set; }

        public string? Remark { get; set; }

        public IEnumerable<ShoesAllOptionsDto> ShoesAllOptions { get; set; }

        public ShoesTotalOrderVM()
        {
            ShoesAllOptions = new List<ShoesAllOptionsDto>();
        }
    }
}
