namespace Web_Music.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class SAN_PHAM
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SAN_PHAM()
        {
            ALbums = new HashSet<ALbum>();
            NGHEs = new HashSet<NGHE>();
            TRINH_BAY = new HashSet<TRINH_BAY>();
            YEU_THICH = new HashSet<YEU_THICH>();
        }

        [Required]
        [StringLength(50)]
        public string TenSP { get; set; }

        [StringLength(50)]
        public string SangTac { get; set; }

       

        [StringLength(200)]
        public string SP_URL { get; set; }

        [StringLength(50)]
        public string Theloai { get; set; }

        public bool? TrangThai { get; set; }

        public double? LuotNghe { get; set; }

        [StringLength(100)]
        public string GhiChu { get; set; }

        [Column(TypeName = "numeric")]
        public decimal? YeuThich { get; set; }

        [Column(TypeName = "numeric")]
        public decimal? KhongYeuThich { get; set; }

        public DateTime? TGPhatHanh { get; set; }

        [Key]
        [StringLength(10)]
        public string MaSP { get; set; }

        public TimeSpan? ThoiGian { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ALbum> ALbums { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<NGHE> NGHEs { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TRINH_BAY> TRINH_BAY { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<YEU_THICH> YEU_THICH { get; set; }
    }
}
