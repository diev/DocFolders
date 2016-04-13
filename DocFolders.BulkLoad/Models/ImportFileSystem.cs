using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DocFolders.BulkLoad.Models
{
    public class FolderItem : Folder
    {
        public FolderItem(DirectoryInfo i)
        {
            Id = Guid.NewGuid(); //TODO sequential guid
            Caption = i.Name;
            Source = i.FullName;
        }
    }

    public class DocItem : Doc
    {
        public DocItem(FileInfo i)
        {
            Id = Guid.NewGuid(); //TODO sequential guid
            Caption = i.Name;
            Source = i.FullName;

            Title = Caption;
            DateLoaded = DateTime.Now;
        }
    }

    public class FolderItemsTable : List<FolderItem>
    {
        public FolderItemsTable(DirectoryInfo dir)
        {
            foreach (DirectoryInfo di in dir.GetDirectories())
            {
                Add(new FolderItem(di));
            }
        }
    }

    public class DocItemsTable : List<DocItem>
    {
        public DocItemsTable(DirectoryInfo dir)
        {
            foreach (FileInfo fi in dir.GetFiles())
            {
                Add(new DocItem(fi));
            }
        }
    }
}