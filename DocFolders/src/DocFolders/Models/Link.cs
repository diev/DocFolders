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
        [Required]
        [Column(Order = 1)]
        [ForeignKey("OuterId")]
        public string OuterId { get; set; }
        public Item Outer { get; set; }

        [Key]
        [Required]
        [Column(Order = 2)]
        [ForeignKey("InnerId")]
        public string InnerId { get; set; }
        public Item Inner { get; set; }
    }
}
