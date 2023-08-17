﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace EFModels.Models
{
    public partial class Activity
    {
        public Activity()
        {
            ActivityImgs = new HashSet<ActivityImg>();
        }

        public int ActivityId { get; set; }
        public string ActivityName { get; set; }
        public int fk_ActivityCategoryId { get; set; }
        public DateTime ActivityDate { get; set; }
        public int fk_SpeakerId { get; set; }
        public string ActivityPlace { get; set; }
        public DateTime ActivityBookStartTime { get; set; }
        public DateTime ActivityBookEndTime { get; set; }
        public byte ActivityAge { get; set; }
        public int ActivitySalePrice { get; set; }
        public int ActivityOriginalPrice { get; set; }
        public string ActivityDescription { get; set; }
        public int fk_ActivityStatusId { get; set; }

        public virtual ActivityCategory fk_ActivityCategory { get; set; }
        public virtual ActivityStatus fk_ActivityStatus { get; set; }
        public virtual Speaker fk_Speaker { get; set; }
        public virtual ICollection<ActivityImg> ActivityImgs { get; set; }
    }
}