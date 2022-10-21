namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class TIN_MOI
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TIN_MOI()
        {
            TRUY_CAP_TM = new HashSet<TRUY_CAP_TM>();
        }

        [StringLength(200)]
        public string TenTM { get; set; }

        public DateTime? ThoiGian { get; set; }

        [StringLength(200)]
        public string URL_img { get; set; }

        [StringLength(200)]
        public string URL_link { get; set; }

        [StringLength(100)]
        public string GhiChu { get; set; }

        public double? LuotTruyCap { get; set; }

        [Key]
        [StringLength(10)]
        public string MaTM { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TRUY_CAP_TM> TRUY_CAP_TM { get; set; }
    }
}
