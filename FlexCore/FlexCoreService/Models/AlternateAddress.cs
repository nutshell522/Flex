using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class AlternateAddress
    {
        public int AddressId { get; set; }
        public string? AlternateAddress1 { get; set; }
        public string? AlternateAddress2 { get; set; }
        public int? FkMemberId { get; set; }

        public virtual Member? FkMember { get; set; }
    }
}
