using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class ActivityCategory
    {
        public ActivityCategory()
        {
            Activities = new HashSet<Activity>();
        }

        public int ActivityCategoryId { get; set; }
        public string ActivityCategoryName { get; set; } = null!;

        public virtual ICollection<Activity> Activities { get; set; }
    }
}
