using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace DocFolders.Models
{
    [Table("Links")]
    public class Link
    {
        [MaxLength(256)]
        public string OuterId { get; set; }
        public Item Outer { get; set; }

        [MaxLength(256)]
        public string InnerId { get; set; }
        public Item Inner { get; set; }
    }
}
