using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace DocFolders.Models
{
    public class LinkItem
    {
        [Key]
        public string Id { get; set; }
        [MaxLength(256)]
        public string Caption { get; set; }
        [MaxLength(256)]
        public string Source { get; set; }

        public virtual ICollection<LinkItem> Outers { get; set; } = new List<LinkItem>();
        public virtual ICollection<LinkItem> Inners { get; set; } = new List<LinkItem>();
    }
}
