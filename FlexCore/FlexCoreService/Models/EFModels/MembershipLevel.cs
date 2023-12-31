﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace FlexCoreService.Models.EFModels
{
    public partial class MembershipLevel
    {
        public MembershipLevel()
        {
            Members = new HashSet<Member>();
            fk_Privileges = new HashSet<Privilege>();
        }

        public int LevelId { get; set; }
        public string LevelName { get; set; }
        public string MinSpending { get; set; }
        public int? Discount { get; set; }
        public string Description { get; set; }

        public virtual ICollection<Member> Members { get; set; }

        public virtual ICollection<Privilege> fk_Privileges { get; set; }
    }
}