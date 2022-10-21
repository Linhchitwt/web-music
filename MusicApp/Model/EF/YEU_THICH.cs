namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class YEU_THICH
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(10)]
        public string makh { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(10)]
        public string masp { get; set; }

        public DateTime? ThoiGian { get; set; }

        public bool? YeuThich { get; set; }

        public virtual KHACH_HANG KHACH_HANG { get; set; }

        public virtual SAN_PHAM SAN_PHAM { get; set; }
    }
}
