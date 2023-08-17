using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class StaffPermission
    {
        public StaffPermission()
        {
            Staff = new HashSet<Staff>();
        }

        public int PermissionsId { get; set; }
        public string? LevelName { get; set; }

        public virtual ICollection<Staff> Staff { get; set; }
    }
}
