namespace Web_Music.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ADMIN")]
    public partial class ADMIN
    {
        [StringLength(50)]
        public string TenAD { get; set; }

        [StringLength(50)]
        public string UserName { get; set; }

        [StringLength(50)]
        public string Pass { get; set; }

        public bool? TrangThai { get; set; }

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

        [StringLength(5)]
        public string MaPQ { get; set; }

        [Key]
        [StringLength(10)]
        public string MaAD { get; set; }

        public virtual PHAN_QUYEN PHAN_QUYEN { get; set; }
    }
}
