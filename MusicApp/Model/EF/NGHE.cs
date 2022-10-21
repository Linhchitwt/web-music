namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NGHE")]
    public partial class NGHE
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(10)]
        public string MaSP { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(10)]
        public string MaKH { get; set; }

        [Key]
        [Column(Order = 2)]
        public DateTime ThoiGian { get; set; }

        [StringLength(100)]
        public string GHiChu { get; set; }

        public virtual KHACH_HANG KHACH_HANG { get; set; }

        public virtual SAN_PHAM SAN_PHAM { get; set; }
    }
}
