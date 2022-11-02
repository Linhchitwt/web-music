namespace Web_Music.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NHOM")]
    public partial class NHOM
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public NHOM()
        {
            NGHE_SI = new HashSet<NGHE_SI>();
        }

        [StringLength(100)]
        public string TenNhom { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgayThanhLap { get; set; }

        public int? SoThanhVien { get; set; }

        [StringLength(100)]
        public string URL_img { get; set; }

        [StringLength(100)]
        public string URL_link { get; set; }

        [Key]
        [StringLength(10)]
        public string MaNHOM { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<NGHE_SI> NGHE_SI { get; set; }
    }
}
