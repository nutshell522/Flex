using FlexCoreService.CustomeShoes.Models.Dtos;

namespace FlexCoreService.CustomeShoes.Models.VMs
{
    public class ShoesDetailVM
    {
        public int ShoesProductId { get; set; }

        public string ShoesName { get; set; }

        public string ShoesDescription { get; set; }

        public string ShoesOrigin { get; set; }

        public int fk_ShoesCategoryId { get; set; }

        public int fk_ShoesColorId { get; set; }

        public string ShoesCategoryName { get; set; }

        public string ColorName { get; set; }

        public string ColorCode { get; set; }
        public int ShoesUnitPrice { get; set; }

        public string ShoesImgs { get; set; }

    }
}
