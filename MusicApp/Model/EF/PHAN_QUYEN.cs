namespace Model.EF
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
            TAI_KHOAN = new HashSet<TAI_KHOAN>();
            TK_AD = new HashSet<TK_AD>();
        }

        [Key]
        [StringLength(5)]
        public string MaPQ { get; set; }

        [StringLength(50)]
        public string TenQuyen { get; set; }

        [StringLength(100)]
        public string Ghichu { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TAI_KHOAN> TAI_KHOAN { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TK_AD> TK_AD { get; set; }
    }
}
