namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ADMIN")]
    public partial class ADMIN
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ADMIN()
        {
            TK_AD = new HashSet<TK_AD>();
        }

        [StringLength(50)]
        public string TenAD { get; set; }

        [StringLength(50)]
        public string DC { get; set; }

        [Column(TypeName = "numeric")]
        public decimal? SDT { get; set; }

        [Column(TypeName = "numeric")]
        public decimal? STK { get; set; }

        public bool? GT { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NS { get; set; }

        [StringLength(100)]
        public string Email { get; set; }

        [StringLength(100)]
        public string URL_img { get; set; }

        [StringLength(100)]
        public string GhiChu { get; set; }

        [Key]
        [StringLength(10)]
        public string MaAD { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TK_AD> TK_AD { get; set; }
    }
}
