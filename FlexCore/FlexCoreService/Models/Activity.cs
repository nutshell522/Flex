using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class Activity
    {
        public Activity()
        {
            ActivityImgs = new HashSet<ActivityImg>();
        }

        public int ActivityId { get; set; }
        public string ActivityName { get; set; } = null!;
        public int FkActivityCategoryId { get; set; }
        public DateTime ActivityDate { get; set; }
        public int FkSpeakerId { get; set; }
        public string ActivityPlace { get; set; } = null!;
        public DateTime ActivityBookStartTime { get; set; }
        public DateTime ActivityBookEndTime { get; set; }
        public byte ActivityAge { get; set; }
        public int ActivitySalePrice { get; set; }
        public int ActivityOriginalPrice { get; set; }
        public string? ActivityDescription { get; set; }
        public int FkActivityStatusId { get; set; }

        public virtual ActivityCategory FkActivityCategory { get; set; } = null!;
        public virtual ActivityStatus FkActivityStatus { get; set; } = null!;
        public virtual Speaker FkSpeaker { get; set; } = null!;
        public virtual ICollection<ActivityImg> ActivityImgs { get; set; }
    }
}
