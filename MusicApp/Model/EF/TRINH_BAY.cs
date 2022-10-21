namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class TRINH_BAY
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(10)]
        public string MaNS { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(10)]
        public string MaSP { get; set; }

        [StringLength(100)]
        public string GhiChu { get; set; }

        public virtual NGHE_SI NGHE_SI { get; set; }

        public virtual SAN_PHAM SAN_PHAM { get; set; }
    }
}
