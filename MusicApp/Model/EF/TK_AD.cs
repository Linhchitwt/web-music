namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class TK_AD
    {
        [Key]
        [StringLength(50)]
        public string UserName { get; set; }

        [Required]
        [StringLength(50)]
        public string PassWord { get; set; }

        public bool? TrangThai { get; set; }

        [StringLength(10)]
        public string MaAD { get; set; }

        [StringLength(5)]
        public string MapQ { get; set; }

        public virtual ADMIN ADMIN { get; set; }

        public virtual PHAN_QUYEN PHAN_QUYEN { get; set; }
    }
}
