using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class BlackList
    {
        public BlackList()
        {
            Members = new HashSet<Member>();
        }

        public int BlackListId { get; set; }
        public string Behavior { get; set; } = null!;
        public DateTime? CreatedAt { get; set; }

        public virtual ICollection<Member> Members { get; set; }
    }
}
