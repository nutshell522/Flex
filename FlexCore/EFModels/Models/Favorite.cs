﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace EFModels.Models
{
    public partial class Favorite
    {
        public int Id { get; set; }
        public string fk_productId { get; set; }
        public int fk_memberId { get; set; }

        public virtual Member fk_member { get; set; }
        public virtual Product fk_product { get; set; }
    }
}