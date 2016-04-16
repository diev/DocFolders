using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Data.Entity;

namespace DocFolders.Models
{
    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        // Add my DocFolders model
        public DbSet<LinkItem> LinkItems { get; set; }
        public DbSet<ItemLink> ItemLinks { get; set; }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);
            // Customize the ASP.NET Identity model and override the defaults if needed.
            // For example, you can rename the ASP.NET Identity table names and more.
            // Add your customizations after calling base.OnModelCreating(builder);
        }
    }
}
