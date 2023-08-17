using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class ReturnReson
    {
        public ReturnReson()
        {
            Returns = new HashSet<Return>();
        }

        public int Id { get; set; }
        public string? 退貨理由 { get; set; }

        public virtual ICollection<Return> Returns { get; set; }
    }
}
