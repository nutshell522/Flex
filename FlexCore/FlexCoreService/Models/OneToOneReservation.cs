using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class OneToOneReservation
    {
        public int ReservationId { get; set; }
        public int FkBookerId { get; set; }
        public DateTime ReservationStartTime { get; set; }
        public DateTime ReservationEndTime { get; set; }
        public int FkBranchId { get; set; }
        public int FkReservationSpeakerId { get; set; }
        public int FkReservationStatusId { get; set; }
        public DateTime ReservationCreatedDate { get; set; }

        public virtual Member FkBooker { get; set; } = null!;
        public virtual Branch FkBranch { get; set; } = null!;
        public virtual Speaker FkReservationSpeaker { get; set; } = null!;
        public virtual ReservationStatus FkReservationStatus { get; set; } = null!;
    }
}
