using System;
using System.Collections.Generic;

namespace FlexCoreService.Models
{
    public partial class SpeakerField
    {
        public SpeakerField()
        {
            Speakers = new HashSet<Speaker>();
        }

        public int FieldId { get; set; }
        public string FieldName { get; set; } = null!;

        public virtual ICollection<Speaker> Speakers { get; set; }
    }
}
