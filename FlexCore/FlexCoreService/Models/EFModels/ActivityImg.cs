﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace FlexCoreService.Models.EFModels
{
    public partial class ActivityImg
    {
        public int Id { get; set; }
        public int fk_ActivityId { get; set; }
        public string ImgPath { get; set; }

        public virtual Activity fk_Activity { get; set; }
    }
}