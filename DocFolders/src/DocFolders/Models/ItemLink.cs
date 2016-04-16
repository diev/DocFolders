using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace DocFolders.Models
{
    public class ItemLink
    {
        [Required]
        public string OuterId { get; set; }
        [Required]
        public string InnerId { get; set; }
    }
}
