using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class ActivityStatus
    {
        public ActivityStatus()
        {
            Activities = new HashSet<Activity>();
        }

        public int ActivityStatusId { get; set; }
        public string? ActivityStatusDescription { get; set; }

        public virtual ICollection<Activity> Activities { get; set; }
    }
}
