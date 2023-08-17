using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class MembershipLevel
    {
        public MembershipLevel()
        {
            Members = new HashSet<Member>();
            FkPrivileges = new HashSet<Privilege>();
        }

        public int LevelId { get; set; }
        public string LevelName { get; set; } = null!;
        public string MinSpending { get; set; } = null!;
        public int? Discount { get; set; }
        public string? Description { get; set; }

        public virtual ICollection<Member> Members { get; set; }

        public virtual ICollection<Privilege> FkPrivileges { get; set; }
    }
}
