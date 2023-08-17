using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class Privilege
    {
        public Privilege()
        {
            FkLevels = new HashSet<MembershipLevel>();
        }

        public int PrivilegeId { get; set; }
        public string PrivilegeName { get; set; } = null!;
        public string? Description { get; set; }

        public virtual ICollection<MembershipLevel> FkLevels { get; set; }
    }
}
