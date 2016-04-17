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
        [Key]
        [Column(Order = 1)]
        [MaxLength(256)]
        public string OuterId { get; set; }
        public Item Outer { get; set; }

        [Key]
        [Column(Order = 2)]
        [MaxLength(256)]
        public string InnerId { get; set; }
        public Item Inner { get; set; }
    }
}
