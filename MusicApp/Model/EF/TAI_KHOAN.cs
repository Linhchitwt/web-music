namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class TAI_KHOAN
    {
        [Key]
        [StringLength(50)]
        public string UserName { get; set; }

        [Required]
        [StringLength(50)]
        public string PassWord { get; set; }

        public bool? TrangThai { get; set; }

        [StringLength(10)]
        public string MaKH { get; set; }

        [StringLength(5)]
        public string MaPQ { get; set; }

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }

        public virtual KHACH_HANG KHACH_HANG { get; set; }

        public virtual PHAN_QUYEN PHAN_QUYEN { get; set; }
    }
}
