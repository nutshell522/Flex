using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class Supplier
    {
        public int SupplierId { get; set; }
        public string SupplierCompanyName { get; set; } = null!;
        public bool? HasCertificate { get; set; }
        public string? SupplyMaterial { get; set; }
        public int? SupplierCompanyPhone { get; set; }
        public string? SupplierCompanyEmail { get; set; }
        public string? SupplierCompanyAddress { get; set; }
        public int? SupplierCompanyNumber { get; set; }
        public DateTime? SupplierStartDate { get; set; }
    }
}
