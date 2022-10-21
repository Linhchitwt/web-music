namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class KHACH_HANG
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public KHACH_HANG()
        {
            ALbums = new HashSet<ALbum>();
            NGHEs = new HashSet<NGHE>();
            TAI_KHOAN = new HashSet<TAI_KHOAN>();
            THEO_DOI = new HashSet<THEO_DOI>();
            TRUY_CAP_SK = new HashSet<TRUY_CAP_SK>();
            TRUY_CAP_TM = new HashSet<TRUY_CAP_TM>();
            YEU_THICH = new HashSet<YEU_THICH>();
        }

        [Required]
        [StringLength(50)]
        public string TenKH { get; set; }

        [StringLength(50)]
        public string DiaChi { get; set; }

        [Column(TypeName = "numeric")]
        public decimal SDT { get; set; }

        [Column(TypeName = "numeric")]
        public decimal? STK { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgaySinh { get; set; }

        public bool? TrangThai { get; set; }

        public bool? GT { get; set; }

        [Column(TypeName = "numeric")]
        public decimal CCCD { get; set; }

        [StringLength(50)]
        public string Email { get; set; }

        [StringLength(100)]
        public string GhiChu { get; set; }

        [Key]
        [StringLength(10)]
        public string makh { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ALbum> ALbums { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<NGHE> NGHEs { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TAI_KHOAN> TAI_KHOAN { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<THEO_DOI> THEO_DOI { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TRUY_CAP_SK> TRUY_CAP_SK { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TRUY_CAP_TM> TRUY_CAP_TM { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<YEU_THICH> YEU_THICH { get; set; }
    }
}
