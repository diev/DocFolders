//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DocFolders.BulkLoad.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Comment
    {
        public System.Guid Id { get; set; }
        public Nullable<System.DateTime> DateCreated { get; set; }
        public string UserCreated { get; set; }
        public string Content { get; set; }
        public System.Guid DocId { get; set; }
        public System.Guid FolderId { get; set; }
    
        public virtual Doc Doc { get; set; }
        public virtual Folder Folder { get; set; }
    }
}
