using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class JobTitle
    {
        public JobTitle()
        {
            Staff = new HashSet<Staff>();
        }

        public int TitleId { get; set; }
        public string? TitleName { get; set; }
        public int? FkStaffPermissions { get; set; }

        public virtual ICollection<Staff> Staff { get; set; }
    }
}
