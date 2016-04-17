using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace DocFolders.Models
{
    [Table("Items")]
    public class Item
    {
        [Key]
        public string Id { get; set; }

        [Required]
        [MaxLength(256)]
        public string Caption { get; set; }

        [MaxLength(256)]
        public string Source { get; set; }

        // http://stackoverflow.com/questions/29442493/how-to-create-a-many-to-many-relationship-with-latest-nightly-builds-of-ef7

        public List<Link> Outers { get; set; } = new List<Link>();
        public List<Link> Inners { get; set; } = new List<Link>();
    }
}
