﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace EFModels.Models
{
    public partial class ShoesGroup
    {
        public int ShoesGroupId { get; set; }
        public int fk_ShoesMainId { get; set; }
        public int fk_OptionId { get; set; }
        public int fk_MaterialId { get; set; }
        public int fk_ShoesColorId { get; set; }
        public int fk_CustomerOrderId { get; set; }

        public virtual ShoesOrder fk_CustomerOrder { get; set; }
        public virtual Customized_material fk_Material { get; set; }
        public virtual ShoesChoose fk_Option { get; set; }
        public virtual ShoesColorCategory fk_ShoesColor { get; set; }
        public virtual CustomizedShoesPo fk_ShoesMain { get; set; }
    }
}