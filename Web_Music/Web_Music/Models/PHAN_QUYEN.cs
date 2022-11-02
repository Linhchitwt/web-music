namespace Web_Music.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class PHAN_QUYEN
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PHAN_QUYEN()
        {
            ADMINs = new HashSet<ADMIN>();
            KHACH_HANG = new HashSet<KHACH_HANG>();
        }

        [Key]
        [StringLength(5)]
        public string MaPQ { get; set; }

        [StringLength(50)]
        public string TenQuyen { get; set; }

        [StringLength(100)]
        public string Ghichu { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ADMIN> ADMINs { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<KHACH_HANG> KHACH_HANG { get; set; }
    }
}
