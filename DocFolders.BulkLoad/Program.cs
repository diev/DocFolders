using DocFolders.BulkLoad.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.Entity;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DocFolders.BulkLoad
{
    class Program
    {
        public readonly static string userDocuments = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments);
        public readonly static string connectionString = ConfigurationManager.ConnectionStrings["DocFoldersDbModelContainer"].ConnectionString;

        static void Main(string[] args)
        {
            //TODO rename to DocFoldersDbContext

            //TODO recreate database if not exists

            //using (DocFoldersDbModelContainer ctx = new DocFoldersDbModelContainer())
            //{
            //    Folder fld = new Folder();
            //    fld.Caption = "Root";
            //    ctx.Folders.Add(fld);
            //    ctx.SaveChanges();
            //}

            FolderSearch(new DirectoryInfo(userDocuments));
        }

        static void FolderSearch(DirectoryInfo dir)
        {
            Console.WriteLine(dir.FullName);

            FolderItemsTable FoldersList = new FolderItemsTable(dir);
            DocItemsTable DocsList = new DocItemsTable(dir);

            BulkLoad(FoldersList.AsDataTable(), "dbo.Folders");
            BulkLoad(DocsList.AsDataTable(), "dbo.Docs");

            foreach (DirectoryInfo di in dir.GetDirectories())
            {
                FolderSearch(di);
            }
        }

        static void BulkLoad(DataTable table, string tableName)
        {
            using (var connection = new SqlConnection(connectionString)) //TODO connectionString
            {
                //TODO recreate database if not exists

                connection.Open();
                SqlTransaction transaction = connection.BeginTransaction(tableName);
                using (var bulkCopy = new SqlBulkCopy(connection, SqlBulkCopyOptions.Default, transaction))
                {
                    bulkCopy.BatchSize = 100;
                    bulkCopy.DestinationTableName = tableName;
                    try
                    {
                        bulkCopy.WriteToServer(table);

                        // Attempt to commit the transaction.
                        transaction.Commit();
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine("Commit Exception Type: {0}", ex.GetType());
                        Console.WriteLine("  Message: {0}", ex.Message);

                        // Attempt to roll back the transaction.
                        try
                        {
                            transaction.Rollback();
                        }
                        catch (Exception ex2)
                        {
                            // This catch block will handle any errors that may have occurred
                            // on the server that would cause the rollback to fail, such as
                            // a closed connection.
                            Console.WriteLine("Rollback Exception Type: {0}", ex2.GetType());
                            Console.WriteLine("  Message: {0}", ex2.Message);
                        }
                    }
                }
                connection.Close();
            }
        }
    }

    public static class IEnumerableExtensions
    {
        public static DataTable AsDataTable<T>(this IEnumerable<T> data)
        {
            PropertyDescriptorCollection properties = TypeDescriptor.GetProperties(typeof(T));
            var table = new DataTable();
            foreach (PropertyDescriptor prop in properties)
                table.Columns.Add(prop.Name, Nullable.GetUnderlyingType(prop.PropertyType) ?? prop.PropertyType);
            foreach (T item in data)
            {
                DataRow row = table.NewRow();
                foreach (PropertyDescriptor prop in properties)
                    row[prop.Name] = prop.GetValue(item) ?? DBNull.Value;
                table.Rows.Add(row);
            }
            return table;
        }
    }
}