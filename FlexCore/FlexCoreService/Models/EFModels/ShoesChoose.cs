﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace FlexCoreService.Models.EFModels
{
    public partial class ShoesChoose
    {
        public ShoesChoose()
        {
            ShoesGroups = new HashSet<ShoesGroup>();
        }

        public int OptionId { get; set; }
        public string OptinName { get; set; }

        public virtual ICollection<ShoesGroup> ShoesGroups { get; set; }
    }
}