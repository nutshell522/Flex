﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace EFModels.Models
{
    public partial class ReservationReview
    {
        public int id { get; set; }
        public int fk_speakerId { get; set; }
        public int fk_memberId { get; set; }
        public string content { get; set; }
        public DateTime creationTime { get; set; }
        public int? rating { get; set; }

        public virtual Member fk_member { get; set; }
        public virtual Speaker fk_speaker { get; set; }
    }
}