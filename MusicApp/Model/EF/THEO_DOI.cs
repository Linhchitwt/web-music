namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class THEO_DOI
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(10)]
        public string MaKH { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(10)]
        public string MaNS { get; set; }

        public DateTime? TG { get; set; }

        [StringLength(100)]
        public string GhiChu { get; set; }

        public virtual KHACH_HANG KHACH_HANG { get; set; }

        public virtual NGHE_SI NGHE_SI { get; set; }
    }
}
