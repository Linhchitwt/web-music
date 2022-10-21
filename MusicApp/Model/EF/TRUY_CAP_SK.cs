namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class TRUY_CAP_SK
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(10)]
        public string makh { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(10)]
        public string maSK { get; set; }

        [Key]
        [Column(Order = 2)]
        public DateTime ThoiGian { get; set; }

        public virtual KHACH_HANG KHACH_HANG { get; set; }

        public virtual SU_KIEN SU_KIEN { get; set; }
    }
}
