using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class ShoesPicture
    {
        public int ShoesPictureId { get; set; }
        public string? ShoesPictureUrl { get; set; }
        public int FkShoesPictureProductId { get; set; }

        public virtual CustomizedShoesPo FkShoesPictureProduct { get; set; } = null!;
    }
}
