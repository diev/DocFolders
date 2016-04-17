using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.IO;
using DocFolders.Models;

namespace DocFolders.Services
{
    public class ImportFolder
    {
        public string Root { get; set; }
        private ApplicationDbContext db;

        public ImportFolder(ApplicationDbContext context, string dir)
        {
            db = context;
            DirectoryInfo di = new DirectoryInfo(dir);
            Root = di.FullName;
            FolderScan(di, $"<{Root}>");
        }

        private void FolderScan(DirectoryInfo di, string parentId)
        {
            foreach (FileInfo f in di.GetFiles())
            {
                var itemF = new Item()
                {
                    //TODO Id = Guid.NewGuid(); // make sequential
                    Id = f.FullName.Substring(Root.Length),
                    Caption = f.Name,
                    Source = f.FullName
                };
                db.Items.Add(itemF);
                db.SaveChanges();

                var linkF = new Link()
                {
                    OuterId = parentId,
                    InnerId = itemF.Id
                };
                db.Links.Add(linkF);
                db.SaveChanges();
            }

            foreach (DirectoryInfo d in di.GetDirectories())
            {
                var itemD = new Item()
                {
                    //TODO Id = Guid.NewGuid(); // make sequential
                    Id = di.FullName, //.Substring(Root.Length),
                    Caption = di.Name,
                    Source = di.FullName
                };
                db.Items.Add(itemD);
                db.SaveChanges();

                var linkD = new Link()
                {
                    OuterId = parentId,
                    InnerId = itemD.Id
                };
                db.Links.Add(linkD);
                db.SaveChanges();

                FolderScan(d, itemD.Id);
            }
        }
    }
}