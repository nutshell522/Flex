using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class ActivityImg
    {
        public int Id { get; set; }
        public int FkActivityId { get; set; }
        public string ImgPath { get; set; } = null!;

        public virtual Activity FkActivity { get; set; } = null!;
    }
}
