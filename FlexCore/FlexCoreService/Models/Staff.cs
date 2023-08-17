using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class Staff
    {
        public int StaffId { get; set; }
        public string Name { get; set; } = null!;
        public byte? Age { get; set; }
        public bool? Gender { get; set; }
        public string? Mobile { get; set; }
        public string Email { get; set; } = null!;
        public DateTime? Birthday { get; set; }
        public string Account { get; set; } = null!;
        public string Password { get; set; } = null!;
        public DateTime? DueDate { get; set; }
        public int FkPermissionsId { get; set; }
        public int FkTitleId { get; set; }
        public int FkDepartmentId { get; set; }
        public string? ConfirmCode { get; set; }

        public virtual Department FkDepartment { get; set; } = null!;
        public virtual StaffPermission FkPermissions { get; set; } = null!;
        public virtual JobTitle FkTitle { get; set; } = null!;
    }
}
