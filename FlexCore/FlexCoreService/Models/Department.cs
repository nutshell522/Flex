using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class Department
    {
        public Department()
        {
            Staff = new HashSet<Staff>();
        }

        public int DepartmentId { get; set; }
        public string? DepartmentName { get; set; }

        public virtual ICollection<Staff> Staff { get; set; }
    }
}
