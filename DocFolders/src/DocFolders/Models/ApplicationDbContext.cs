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
        public DbSet<Item> Items { get; set; }
        public DbSet<Link> Links { get; set; }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);
            // Customize the ASP.NET Identity model and override the defaults if needed.
            // For example, you can rename the ASP.NET Identity table names and more.
            // Add your customizations after calling base.OnModelCreating(builder);

            // http://docs.efproject.net/en/latest/modeling/relationships.html#many-to-many

            builder.Entity<Link>()
                .HasKey(t => new { t.OuterId, t.InnerId });

            builder.Entity<Link>()
                .HasOne(pt => pt.Outer)
                .WithMany(p => p.Inners)
                .HasForeignKey(pt => pt.OuterId)
                .OnDelete(Microsoft.Data.Entity.Metadata.DeleteBehavior.Restrict);

            builder.Entity<Link>()
                .HasOne(pt => pt.Inner)
                .WithMany(t => t.Outers)
                .HasForeignKey(pt => pt.InnerId)
                .OnDelete(Microsoft.Data.Entity.Metadata.DeleteBehavior.Restrict);

            //TODO Database manually in EF7
            // cmd
            // cd %USERPROFILE%
            // dnvm list
            // dnvm install 1.0.0-rc1-update1
            // cd \Repos\...\src\project
            // dnx ef migrations add FirstMigration
            // (dnx ef migrations remove)
            // dnx ef database update
        }
    }
}
