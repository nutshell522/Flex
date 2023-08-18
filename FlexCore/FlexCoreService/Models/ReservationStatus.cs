using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class ReservationStatus
    {
        public ReservationStatus()
        {
            OneToOneReservations = new HashSet<OneToOneReservation>();
        }

        public int ReservationId { get; set; }
        public string ReservationStatusDescription { get; set; } = null!;

        public virtual ICollection<OneToOneReservation> OneToOneReservations { get; set; }
    }
}
