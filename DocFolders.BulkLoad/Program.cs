using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DocFolders.BulkLoad
{
    class Program
    {
        static void Main(string[] args)
        {
            using (var ctx = new Models.DocFoldersDbModelContainer())
            {
                Models.Folder fld = new Models.Folder();
                fld.Caption = "Root";
                ctx.Folders.Add(fld);
                ctx.SaveChanges();
            }
        }
    }
}
