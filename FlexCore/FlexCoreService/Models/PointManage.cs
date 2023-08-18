using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class PointManage
    {
        public int PointManageId { get; set; }
        public bool GetOrDeduct { get; set; }
        public int Amount { get; set; }
        public int FkTypeId { get; set; }
        public int? TypeProductId { get; set; }
        public DateTime? PointExpirationDate { get; set; }

        public virtual Type FkType { get; set; } = null!;
    }
}
