using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class Branch
    {
        public Branch()
        {
            OneToOneReservations = new HashSet<OneToOneReservation>();
            Speakers = new HashSet<Speaker>();
        }

        public int BranchId { get; set; }
        public string BranchName { get; set; } = null!;
        public string BranchAddress { get; set; } = null!;

        public virtual ICollection<OneToOneReservation> OneToOneReservations { get; set; }
        public virtual ICollection<Speaker> Speakers { get; set; }
    }
}
