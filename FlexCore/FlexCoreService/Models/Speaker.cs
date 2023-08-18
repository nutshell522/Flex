using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class Speaker
    {
        public Speaker()
        {
            Activities = new HashSet<Activity>();
            OneToOneReservations = new HashSet<OneToOneReservation>();
        }

        public int SpeakerId { get; set; }
        public string SpeakerName { get; set; } = null!;
        public string? SpeakerPhone { get; set; }
        public int FkSpeakerFieldId { get; set; }
        public string? SpeakerImg { get; set; }
        public int? FkSpeakerBranchId { get; set; }
        public string? SpeakerDescription { get; set; }
        public bool SpeakerVisible { get; set; }

        public virtual Branch? FkSpeakerBranch { get; set; }
        public virtual SpeakerField FkSpeakerField { get; set; } = null!;
        public virtual ICollection<Activity> Activities { get; set; }
        public virtual ICollection<OneToOneReservation> OneToOneReservations { get; set; }
    }
}
