using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace Web_Music.Models
{
    public partial class MyDBConect : DbContext
    {
        public MyDBConect()
            : base("name=MyDBConect1")
        {
        }

        public virtual DbSet<ADMIN> ADMINs { get; set; }
        public virtual DbSet<ALbum> ALbums { get; set; }
        public virtual DbSet<KHACH_HANG> KHACH_HANG { get; set; }
        public virtual DbSet<NGHE> NGHEs { get; set; }
        public virtual DbSet<NGHE_SI> NGHE_SIs { get; set; }
        public virtual DbSet<NHOM> NHOMs { get; set; }
        public virtual DbSet<PHAN_QUYEN> PHAN_QUYEN { get; set; }
        public virtual DbSet<SAN_PHAM> SAN_PHAMs { get; set; }
        public virtual DbSet<SU_KIEN> SU_KIENs { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<THEO_DOI> THEO_DOI { get; set; }
        public virtual DbSet<TIN_MOI> TIN_MOIs { get; set; }
        public virtual DbSet<TRINH_BAY> TRINH_BAY { get; set; }
        public virtual DbSet<TRUY_CAP_SK> TRUY_CAP_SK { get; set; }
        public virtual DbSet<TRUY_CAP_TM> TRUY_CAP_TM { get; set; }
        public virtual DbSet<YEU_THICH> YEU_THICH { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ADMIN>()
                .Property(e => e.UserName)
                .IsUnicode(false);

            modelBuilder.Entity<ADMIN>()
                .Property(e => e.Pass)
                .IsUnicode(false);

            modelBuilder.Entity<ADMIN>()
                .Property(e => e.SDT)
                .HasPrecision(10, 0);

            modelBuilder.Entity<ADMIN>()
                .Property(e => e.STK)
                .HasPrecision(13, 0);

            modelBuilder.Entity<ADMIN>()
                .Property(e => e.MaPQ)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<ADMIN>()
                .Property(e => e.MaAD)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<ALbum>()
                .Property(e => e.MaSP)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<ALbum>()
                .Property(e => e.MaKH)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<KHACH_HANG>()
                .Property(e => e.UserName)
                .IsUnicode(false);

            modelBuilder.Entity<KHACH_HANG>()
                .Property(e => e.Pass)
                .IsUnicode(false);

            modelBuilder.Entity<KHACH_HANG>()
                .Property(e => e.SDT)
                .HasPrecision(10, 0);

           
            modelBuilder.Entity<KHACH_HANG>()
                .Property(e => e.CCCD)
                .HasPrecision(12, 0);

            modelBuilder.Entity<KHACH_HANG>()
                .Property(e => e.MaPQ)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<KHACH_HANG>()
                .Property(e => e.MaKH)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<KHACH_HANG>()
                .HasMany(e => e.ALbums)
                .WithRequired(e => e.KHACH_HANG)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<KHACH_HANG>()
                .HasMany(e => e.NGHEs)
                .WithRequired(e => e.KHACH_HANG)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<KHACH_HANG>()
                .HasMany(e => e.THEO_DOI)
                .WithRequired(e => e.KHACH_HANG)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<KHACH_HANG>()
                .HasMany(e => e.TRUY_CAP_SK)
                .WithRequired(e => e.KHACH_HANG)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<KHACH_HANG>()
                .HasMany(e => e.TRUY_CAP_TM)
                .WithRequired(e => e.KHACH_HANG)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<KHACH_HANG>()
                .HasMany(e => e.YEU_THICH)
                .WithRequired(e => e.KHACH_HANG)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<NGHE>()
                .Property(e => e.MaSP)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<NGHE>()
                .Property(e => e.MaKH)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<NGHE_SI>()
                .Property(e => e.TheoDoi)
                .HasPrecision(15, 0);

            modelBuilder.Entity<NGHE_SI>()
                .Property(e => e.mans)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<NGHE_SI>()
                .Property(e => e.MaNhom)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<NGHE_SI>()
                .HasMany(e => e.TRINH_BAY)
                .WithRequired(e => e.NGHE_SI)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<NHOM>()
                .Property(e => e.MaNHOM)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<PHAN_QUYEN>()
                .Property(e => e.MaPQ)
                .IsFixedLength()
                .IsUnicode(false);

           

            modelBuilder.Entity<SAN_PHAM>()
                .Property(e => e.YeuThich)
                .HasPrecision(15, 0);

            modelBuilder.Entity<SAN_PHAM>()
                .Property(e => e.KhongYeuThich)
                .HasPrecision(15, 0);

            modelBuilder.Entity<SAN_PHAM>()
                .Property(e => e.MaSP)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<SAN_PHAM>()
                .HasMany(e => e.ALbums)
                .WithRequired(e => e.SAN_PHAM)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<SAN_PHAM>()
                .HasMany(e => e.NGHEs)
                .WithRequired(e => e.SAN_PHAM)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<SAN_PHAM>()
                .HasMany(e => e.TRINH_BAY)
                .WithRequired(e => e.SAN_PHAM)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<SAN_PHAM>()
                .HasMany(e => e.YEU_THICH)
                .WithRequired(e => e.SAN_PHAM)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<SU_KIEN>()
                .Property(e => e.MaSK)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<SU_KIEN>()
                .HasMany(e => e.TRUY_CAP_SK)
                .WithRequired(e => e.SU_KIEN)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<THEO_DOI>()
                .Property(e => e.MaKH)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<THEO_DOI>()
                .Property(e => e.MaNS)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<TIN_MOI>()
                .Property(e => e.MaTM)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<TIN_MOI>()
                .HasMany(e => e.TRUY_CAP_TM)
                .WithRequired(e => e.TIN_MOI)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TRINH_BAY>()
                .Property(e => e.MaNS)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<TRINH_BAY>()
                .Property(e => e.MaSP)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<TRUY_CAP_SK>()
                .Property(e => e.makh)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<TRUY_CAP_SK>()
                .Property(e => e.maSK)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<TRUY_CAP_TM>()
                .Property(e => e.makh)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<TRUY_CAP_TM>()
                .Property(e => e.maTM)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<YEU_THICH>()
                .Property(e => e.makh)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<YEU_THICH>()
                .Property(e => e.masp)
                .IsFixedLength()
                .IsUnicode(false);
        }
    }
}
