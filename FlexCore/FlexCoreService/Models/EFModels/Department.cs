﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace FlexCoreService.Models.EFModels
{
    public partial class Department
    {
        public Department()
        {
            Staff = new HashSet<Staff>();
        }

        public int DepartmentId { get; set; }
        public string DepartmentName { get; set; }

        public virtual ICollection<Staff> Staff { get; set; }
    }
}