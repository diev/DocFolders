﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DocFolders.BulkLoad.Models
{
    using System;
    using System.Configuration;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;

    public partial class DocFoldersDbModelContainer : DbContext
    {
        public DocFoldersDbModelContainer()
            : base("name=DocFoldersDbModelContainer")
        {
            
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Folder> Folders { get; set; }
        public virtual DbSet<Doc> Docs { get; set; }
        public virtual DbSet<Comment> Comments { get; set; }
    }
}
