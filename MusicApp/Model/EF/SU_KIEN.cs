namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class SU_KIEN
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SU_KIEN()
        {
            TRUY_CAP_SK = new HashSet<TRUY_CAP_SK>();
        }

        [StringLength(100)]
        public string TenSK { get; set; }

        public DateTime? TGBatDau { get; set; }

        [StringLength(100)]
        public string DiaDiem { get; set; }

        [StringLength(200)]
        public string URL_img { get; set; }

        [StringLength(200)]
        public string URL_link { get; set; }

        public DateTime? TGKetThuc { get; set; }

        [Key]
        [StringLength(10)]
        public string maSK { get; set; }

        public double? LuotTruyCap { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TRUY_CAP_SK> TRUY_CAP_SK { get; set; }
    }
}
