﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace FlexCoreService.Models.EFModels
{
    public partial class Customized_material
    {
        public Customized_material()
        {
            CustomizedOrderCustomized_EdgeProtectionNavigations = new HashSet<CustomizedOrder>();
            CustomizedOrderCustomized_EyeletNavigations = new HashSet<CustomizedOrder>();
            CustomizedOrderCustomized_RearNavigations = new HashSet<CustomizedOrder>();
            CustomizedOrderCustomized_ToeNavigations = new HashSet<CustomizedOrder>();
            CustomizedOrderCustomized_TongueNavigations = new HashSet<CustomizedOrder>();
            ShoesGroups = new HashSet<ShoesGroup>();
        }

        public int Shoesmaterial_Id { get; set; }
        public string material_Name { get; set; }

        public virtual ICollection<CustomizedOrder> CustomizedOrderCustomized_EdgeProtectionNavigations { get; set; }
        public virtual ICollection<CustomizedOrder> CustomizedOrderCustomized_EyeletNavigations { get; set; }
        public virtual ICollection<CustomizedOrder> CustomizedOrderCustomized_RearNavigations { get; set; }
        public virtual ICollection<CustomizedOrder> CustomizedOrderCustomized_ToeNavigations { get; set; }
        public virtual ICollection<CustomizedOrder> CustomizedOrderCustomized_TongueNavigations { get; set; }
        public virtual ICollection<ShoesGroup> ShoesGroups { get; set; }
    }
}