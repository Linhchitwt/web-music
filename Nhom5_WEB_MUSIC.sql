USE [master]
GO
/****** Object:  Database [MUSIC]    Script Date: 10/19/2022 7:26:45 AM ******/
CREATE DATABASE [MUSIC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MUSIC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MUSIC.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MUSIC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MUSIC_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MUSIC] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MUSIC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MUSIC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MUSIC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MUSIC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MUSIC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MUSIC] SET ARITHABORT OFF 
GO
ALTER DATABASE [MUSIC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MUSIC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MUSIC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MUSIC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MUSIC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MUSIC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MUSIC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MUSIC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MUSIC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MUSIC] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MUSIC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MUSIC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MUSIC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MUSIC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MUSIC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MUSIC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MUSIC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MUSIC] SET RECOVERY FULL 
GO
ALTER DATABASE [MUSIC] SET  MULTI_USER 
GO
ALTER DATABASE [MUSIC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MUSIC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MUSIC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MUSIC] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MUSIC] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MUSIC] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MUSIC', N'ON'
GO
ALTER DATABASE [MUSIC] SET QUERY_STORE = OFF
GO
USE [MUSIC]
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDAD]    Script Date: 10/19/2022 7:26:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create FUNCTION [dbo].[AUTO_IDAD]()
RETURNS CHAR(10)
AS
BEGIN
	DECLARE @ID VARCHAR(10)
	IF (SELECT COUNT(MAAD) FROM admin) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MAad, 8)) FROM admin
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'AD0000000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 and @ID <99 THEN 'AD000000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 and @ID <999 THEN 'AD00000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 999 and @ID <9999 THEN 'AD0000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9999 and @ID <99999 THEN 'AD000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
				WHEN @ID >= 99999 and @ID <999999 THEN 'AD00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
				WHEN @ID >= 999999 THEN 'AD0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)

		END
	RETURN @ID
END
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDHD]    Script Date: 10/19/2022 7:26:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_IDHD]()
RETURNS CHAR(10)
AS
BEGIN
	DECLARE @ID VARCHAR(10)
	IF (SELECT COUNT(MAHD) FROM hop_dong) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MAhd, 8)) FROM Hop_dong
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'HD0000000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 and @ID <99 THEN 'HD000000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 and @ID <999 THEN 'HD00000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 999 and @ID <9999 THEN 'HD0000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9999 and @ID <99999 THEN 'HD000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
				WHEN @ID >= 99999 and @ID <999999 THEN 'HD00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
				WHEN @ID >= 999999 THEN 'HD0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)

		END
	RETURN @ID
END
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDKH]    Script Date: 10/19/2022 7:26:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[AUTO_IDKH]()
RETURNS CHAR(10)
AS
BEGIN
	DECLARE @ID VARCHAR(10)
	IF (SELECT COUNT(MAKH) FROM khach_hang) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MAKH, 8)) FROM khach_hang
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'KH0000000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 and @ID <99 THEN 'KH000000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 and @ID <999 THEN 'KH00000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 999 and @ID <9999 THEN 'KH0000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9999 and @ID <99999 THEN 'KH000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
				WHEN @ID >= 99999 and @ID <999999 THEN 'KH00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
				WHEN @ID >= 999999 THEN 'KH0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)

		END
	RETURN @ID
END
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDNHOM]    Script Date: 10/19/2022 7:26:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create FUNCTION [dbo].[AUTO_IDNHOM]()
RETURNS CHAR(10)
AS
BEGIN
	DECLARE @ID VARCHAR(10)
	IF (SELECT COUNT(MAnhom) FROM nhom) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MAnhom, 8)) FROM nhom
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'NH0000000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 and @ID <99 THEN 'NH000000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 and @ID <999 THEN 'NH00000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 999 and @ID <9999 THEN 'NH0000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9999 and @ID <99999 THEN 'NH000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
				WHEN @ID >= 99999 and @ID <999999 THEN 'NH00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
				WHEN @ID >= 999999 THEN 'NH0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)

		END
	RETURN @ID
END
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDNS]    Script Date: 10/19/2022 7:26:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_IDNS]()
RETURNS CHAR(10)
AS
BEGIN
	DECLARE @ID VARCHAR(10)
	IF (SELECT COUNT(MAns) FROM nghe_si) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MAns, 8)) FROM nghe_si
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'NS0000000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 and @ID <99 THEN 'NS000000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 and @ID <999 THEN 'NS00000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 999 and @ID <9999 THEN 'NS0000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9999 and @ID <99999 THEN 'NS000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
				WHEN @ID >= 99999 and @ID <999999 THEN 'NS00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
				WHEN @ID >= 999999 THEN 'NS0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)

		END
	RETURN @ID
END
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDNSX]    Script Date: 10/19/2022 7:26:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_IDNSX]()
RETURNS CHAR(10)
AS
BEGIN
	DECLARE @ID VARCHAR(10)
	IF (SELECT COUNT(MANSX) FROM NHA_SAN_XUAT) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MAnsx, 7)) FROM NHA_SAN_XUAT
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'NSX000000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 and @ID <99 THEN 'NSX00000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 and @ID <999 THEN 'NSX0000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 999 and @ID <9999 THEN 'NSX000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9999 and @ID <99999 THEN 'NSX00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
				WHEN @ID >= 99999 THEN 'NSX0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			

		END
	RETURN @ID
END
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDNV]    Script Date: 10/19/2022 7:26:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create FUNCTION [dbo].[AUTO_IDNV]()
RETURNS CHAR(10)
AS
BEGIN
	DECLARE @ID VARCHAR(10)
	IF (SELECT COUNT(MANV) FROM nhan_vien) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MANV, 8)) FROM nhan_vien
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'NV0000000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 and @ID <99 THEN 'NV000000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 and @ID <999 THEN 'NV00000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 999 and @ID <9999 THEN 'NV0000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9999 and @ID <99999 THEN 'NV000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
				WHEN @ID >= 99999 and @ID <999999 THEN 'NV00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
				WHEN @ID >= 999999 THEN 'NV0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)

		END
	RETURN @ID
END
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDSK]    Script Date: 10/19/2022 7:26:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_IDSK]()
RETURNS CHAR(10)
AS
BEGIN
	DECLARE @ID VARCHAR(10)
	IF (SELECT COUNT(MAsk) FROM SU_KIEN) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MAsk, 8)) FROM su_kien
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'SK0000000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 and @ID <99 THEN 'SK000000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 and @ID <999 THEN 'SK00000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 999 and @ID <9999 THEN 'SK0000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9999 and @ID <99999 THEN 'SK000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
				WHEN @ID >= 99999 and @ID <999999 THEN 'SK00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
				WHEN @ID >= 999999 THEN 'SK0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)

		END
	RETURN @ID
END
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDSP]    Script Date: 10/19/2022 7:26:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_IDSP]()
RETURNS CHAR(10)
AS
BEGIN
	DECLARE @ID VARCHAR(10)
	IF (SELECT COUNT(MASP) FROM san_pham) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MAsp, 8)) FROM san_pham
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'SP0000000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 and @ID <99 THEN 'SP000000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 and @ID <999 THEN 'SP00000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 999 and @ID <9999 THEN 'SP0000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9999 and @ID <99999 THEN 'SP000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
				WHEN @ID >= 99999 and @ID <999999 THEN 'SP00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
				WHEN @ID >= 999999 THEN 'SP0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)

		END
	RETURN @ID
END
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDTM]    Script Date: 10/19/2022 7:26:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_IDTM]()
RETURNS CHAR(10)
AS
BEGIN
	DECLARE @ID VARCHAR(10)
	IF (SELECT COUNT(MATM) FROM Tin_moi) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MAtm, 8)) FROM tin_moi
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'TM0000000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 and @ID <99 THEN 'TM000000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 and @ID <999 THEN 'TM00000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 999 and @ID <9999 THEN 'TM0000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9999 and @ID <99999 THEN 'TM000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
				WHEN @ID >= 99999 and @ID <999999 THEN 'TM00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
				WHEN @ID >= 999999 THEN 'TM0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)

		END
	RETURN @ID
END
GO
/****** Object:  Table [dbo].[ADMIN]    Script Date: 10/19/2022 7:26:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADMIN](
	[TenAD] [nvarchar](50) NULL,
	[DC] [nvarchar](50) NULL,
	[SDT] [numeric](10, 0) NULL,
	[STK] [numeric](13, 0) NULL,
	[GT] [bit] NULL,
	[NS] [date] NULL,
	[Email] [nvarchar](100) NULL,
	[URL_img] [nvarchar](100) NULL,
	[GhiChu] [nvarchar](100) NULL,
	[MaAD] [char](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaAD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALbum]    Script Date: 10/19/2022 7:26:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALbum](
	[TenAlbum] [nvarchar](50) NOT NULL,
	[MaSP] [char](10) NOT NULL,
	[MaKH] [char](10) NOT NULL,
	[GhiChu] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC,
	[MaKH] ASC,
	[TenAlbum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHACH_HANG]    Script Date: 10/19/2022 7:26:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACH_HANG](
	[TenKH] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [numeric](10, 0) NOT NULL,
	[STK] [numeric](13, 0) NULL,
	[NgaySinh] [date] NULL,
	[TrangThai] [bit] NULL,
	[GT] [bit] NULL,
	[CCCD] [numeric](12, 0) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](100) NULL,
	[makh] [char](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[makh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NGHE]    Script Date: 10/19/2022 7:26:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NGHE](
	[MaSP] [char](10) NOT NULL,
	[MaKH] [char](10) NOT NULL,
	[ThoiGian] [datetime] NOT NULL,
	[GHiChu] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC,
	[MaKH] ASC,
	[ThoiGian] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NGHE_SI]    Script Date: 10/19/2022 7:26:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NGHE_SI](
	[TenNS] [nvarchar](50) NOT NULL,
	[NgaySinh] [date] NULL,
	[QueQuan] [nvarchar](50) NULL,
	[NS_URL] [nvarchar](200) NULL,
	[GT] [bit] NULL,
	[GhiChu] [nvarchar](100) NULL,
	[TheoDoi] [numeric](15, 0) NULL,
	[NgheDanh] [nvarchar](50) NULL,
	[ThongTin] [nvarchar](100) NULL,
	[URL_img] [nvarchar](100) NULL,
	[mans] [char](10) NOT NULL,
	[MaNhom] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[mans] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHOM]    Script Date: 10/19/2022 7:26:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHOM](
	[TenNhom] [nvarchar](100) NULL,
	[NgayThanhLap] [date] NULL,
	[SoThanhVien] [int] NULL,
	[URL_img] [nvarchar](100) NULL,
	[URL_link] [nvarchar](100) NULL,
	[MaNHOM] [char](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNHOM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHAN_QUYEN]    Script Date: 10/19/2022 7:26:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHAN_QUYEN](
	[MaPQ] [char](5) NOT NULL,
	[TenQuyen] [nvarchar](50) NULL,
	[Ghichu] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SAN_PHAM]    Script Date: 10/19/2022 7:26:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAN_PHAM](
	[TenSP] [nvarchar](50) NOT NULL,
	[SangTac] [nvarchar](50) NULL,
	[MaNSX] [char](10) NULL,
	[SP_URL] [nvarchar](200) NULL,
	[Theloai] [nvarchar](50) NULL,
	[TrangThai] [bit] NULL,
	[LuotNghe] [float] NULL,
	[GhiChu] [nvarchar](100) NULL,
	[YeuThich] [numeric](15, 0) NULL,
	[KhongYeuThich] [numeric](15, 0) NULL,
	[TGPhatHanh] [datetime] NULL,
	[masp] [char](10) NOT NULL,
	[ThoiGian] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[masp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SU_KIEN]    Script Date: 10/19/2022 7:26:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SU_KIEN](
	[TenSK] [nvarchar](100) NULL,
	[TGBatDau] [datetime] NULL,
	[DiaDiem] [nvarchar](100) NULL,
	[URL_img] [nvarchar](200) NULL,
	[URL_link] [nvarchar](200) NULL,
	[TGKetThuc] [datetime] NULL,
	[maSK] [char](10) NOT NULL,
	[LuotTruyCap] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[maSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TAI_KHOAN]    Script Date: 10/19/2022 7:26:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAI_KHOAN](
	[UserName] [varchar](50) NOT NULL,
	[PassWord] [varchar](50) NOT NULL,
	[TrangThai] [bit] NULL,
	[MaKH] [char](10) NULL,
	[MaPQ] [char](5) NULL,
 CONSTRAINT [PK_TAI_KHOAN] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THEO_DOI]    Script Date: 10/19/2022 7:26:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THEO_DOI](
	[MaKH] [char](10) NOT NULL,
	[MaNS] [char](10) NOT NULL,
	[TG] [datetime] NULL,
	[GhiChu] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC,
	[MaNS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIN_MOI]    Script Date: 10/19/2022 7:26:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIN_MOI](
	[TenTM] [nvarchar](200) NULL,
	[ThoiGian] [datetime] NULL,
	[URL_img] [nvarchar](200) NULL,
	[URL_link] [nvarchar](200) NULL,
	[GhiChu] [nvarchar](100) NULL,
	[LuotTruyCap] [float] NULL,
	[MaTM] [char](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TK_AD]    Script Date: 10/19/2022 7:26:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TK_AD](
	[UserName] [varchar](50) NOT NULL,
	[PassWord] [varchar](50) NOT NULL,
	[TrangThai] [bit] NULL,
	[MaAD] [char](10) NULL,
	[MapQ] [char](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRINH_BAY]    Script Date: 10/19/2022 7:26:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRINH_BAY](
	[MaNS] [char](10) NOT NULL,
	[MaSP] [char](10) NOT NULL,
	[GhiChu] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNS] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRUY_CAP_SK]    Script Date: 10/19/2022 7:26:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRUY_CAP_SK](
	[makh] [char](10) NOT NULL,
	[maSK] [char](10) NOT NULL,
	[ThoiGian] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ThoiGian] ASC,
	[makh] ASC,
	[maSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRUY_CAP_TM]    Script Date: 10/19/2022 7:26:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRUY_CAP_TM](
	[makh] [char](10) NOT NULL,
	[maTM] [char](10) NOT NULL,
	[ThoiGian] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ThoiGian] ASC,
	[makh] ASC,
	[maTM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YEU_THICH]    Script Date: 10/19/2022 7:26:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YEU_THICH](
	[makh] [char](10) NOT NULL,
	[masp] [char](10) NOT NULL,
	[ThoiGian] [datetime] NULL,
	[YeuThich] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[makh] ASC,
	[masp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ADMIN] ([TenAD], [DC], [SDT], [STK], [GT], [NS], [Email], [URL_img], [GhiChu], [MaAD]) VALUES (N'Nguyễn Văn Hoàng Anh', N'Thanh Chương, Nghệ An', CAST(386494859 AS Numeric(10, 0)), CAST(2656525210 AS Numeric(13, 0)), 1, CAST(N'2001-04-20' AS Date), N'nguyenvanhoanganh20042001@gmail.com', NULL, NULL, N'AD00000001')
INSERT [dbo].[ADMIN] ([TenAD], [DC], [SDT], [STK], [GT], [NS], [Email], [URL_img], [GhiChu], [MaAD]) VALUES (N'Lê Phúc Hưng', N'Hoằng Hóa, Thanh Hóa', NULL, NULL, 1, CAST(N'2001-05-06' AS Date), NULL, NULL, NULL, N'AD00000002')
INSERT [dbo].[ADMIN] ([TenAD], [DC], [SDT], [STK], [GT], [NS], [Email], [URL_img], [GhiChu], [MaAD]) VALUES (N'Lê Thị Linh Chi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'AD00000003')
INSERT [dbo].[ADMIN] ([TenAD], [DC], [SDT], [STK], [GT], [NS], [Email], [URL_img], [GhiChu], [MaAD]) VALUES (N'Trịnh Thị Thanh', N'ThanhChuowng, Nghệ An', NULL, NULL, 0, CAST(N'2001-03-18' AS Date), NULL, NULL, NULL, N'AD00000004')
INSERT [dbo].[ADMIN] ([TenAD], [DC], [SDT], [STK], [GT], [NS], [Email], [URL_img], [GhiChu], [MaAD]) VALUES (N'Nguyễn Mạnh Hùng', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'AD00000005')
GO
INSERT [dbo].[ALbum] ([TenAlbum], [MaSP], [MaKH], [GhiChu]) VALUES (N'TIM', N'SP00000001', N'KH00000001', NULL)
INSERT [dbo].[ALbum] ([TenAlbum], [MaSP], [MaKH], [GhiChu]) VALUES (N'YEU', N'SP00000001', N'KH00000002', NULL)
INSERT [dbo].[ALbum] ([TenAlbum], [MaSP], [MaKH], [GhiChu]) VALUES (N'TIM', N'SP00000002', N'KH00000001', NULL)
INSERT [dbo].[ALbum] ([TenAlbum], [MaSP], [MaKH], [GhiChu]) VALUES (N'TIM', N'SP00000003', N'KH00000001', NULL)
INSERT [dbo].[ALbum] ([TenAlbum], [MaSP], [MaKH], [GhiChu]) VALUES (N'YEU', N'SP00000004', N'KH00000002', NULL)
GO
INSERT [dbo].[KHACH_HANG] ([TenKH], [DiaChi], [SDT], [STK], [NgaySinh], [TrangThai], [GT], [CCCD], [Email], [GhiChu], [makh]) VALUES (N'Nguyễn Văn Hoàng Anh', N'Thanh chương, Nghệ An', CAST(386494859 AS Numeric(10, 0)), CAST(65556655612 AS Numeric(13, 0)), CAST(N'2020-04-20' AS Date), 1, 1, CAST(65412387612 AS Numeric(12, 0)), N'nguyenvanhoanganh20042001@gmail.com', NULL, N'KH00000001')
INSERT [dbo].[KHACH_HANG] ([TenKH], [DiaChi], [SDT], [STK], [NgaySinh], [TrangThai], [GT], [CCCD], [Email], [GhiChu], [makh]) VALUES (N'Lê Thế Cường', N'Đô Lương, Nghệ An', CAST(336037903 AS Numeric(10, 0)), CAST(1656566555 AS Numeric(13, 0)), CAST(N'2001-02-07' AS Date), 1, 1, CAST(1546565551 AS Numeric(12, 0)), N'lethecuongx11@gmail.com', NULL, N'KH00000002')
INSERT [dbo].[KHACH_HANG] ([TenKH], [DiaChi], [SDT], [STK], [NgaySinh], [TrangThai], [GT], [CCCD], [Email], [GhiChu], [makh]) VALUES (N'Vũ Ngọc Khánh', N'Ngọc Hồi,Kon Tum', CAST(931644202 AS Numeric(10, 0)), CAST(560135900007 AS Numeric(13, 0)), CAST(N'2000-04-18' AS Date), 1, 1, CAST(233280738 AS Numeric(12, 0)), N'khanhvungoc72@gmail.com', NULL, N'KH00000003')
INSERT [dbo].[KHACH_HANG] ([TenKH], [DiaChi], [SDT], [STK], [NgaySinh], [TrangThai], [GT], [CCCD], [Email], [GhiChu], [makh]) VALUES (N'Tạ Khánh Duy', N'Phủ lý, Hà Nam', CAST(979807308 AS Numeric(10, 0)), NULL, CAST(N'2001-05-06' AS Date), 1, 1, CAST(35201003213 AS Numeric(12, 0)), N'duyfaker01@gmail.com', NULL, N'KH00000004')
INSERT [dbo].[KHACH_HANG] ([TenKH], [DiaChi], [SDT], [STK], [NgaySinh], [TrangThai], [GT], [CCCD], [Email], [GhiChu], [makh]) VALUES (N'Nguyễn Văn Công', N'Hoằng Hóa,Thanh Hóa', CAST(868454609 AS Numeric(10, 0)), NULL, CAST(N'2001-05-07' AS Date), 1, 0, CAST(1655445551 AS Numeric(12, 0)), NULL, NULL, N'KH00000005')
INSERT [dbo].[KHACH_HANG] ([TenKH], [DiaChi], [SDT], [STK], [NgaySinh], [TrangThai], [GT], [CCCD], [Email], [GhiChu], [makh]) VALUES (N'Đặng Tuấn Linh', N'Triệu Sơn,Thanh Hóa', CAST(26545456 AS Numeric(10, 0)), NULL, CAST(N'2001-06-07' AS Date), 1, 1, CAST(2645656545 AS Numeric(12, 0)), NULL, NULL, N'KH00000006')
INSERT [dbo].[KHACH_HANG] ([TenKH], [DiaChi], [SDT], [STK], [NgaySinh], [TrangThai], [GT], [CCCD], [Email], [GhiChu], [makh]) VALUES (N'Nguyễn Việt Đức ', N'Đồng Hới , Quảng Bình ', CAST(912345623 AS Numeric(10, 0)), CAST(414525142310 AS Numeric(13, 0)), CAST(N'2001-12-22' AS Date), 1, 1, CAST(38201012967 AS Numeric(12, 0)), N'vietduc2212@gmail.com', NULL, N'KH00000007')
INSERT [dbo].[KHACH_HANG] ([TenKH], [DiaChi], [SDT], [STK], [NgaySinh], [TrangThai], [GT], [CCCD], [Email], [GhiChu], [makh]) VALUES (N'Vũ Anh Đức', N'Pleiku , Gia Lai', CAST(91234567 AS Numeric(10, 0)), CAST(1234567890134 AS Numeric(13, 0)), CAST(N'2001-09-30' AS Date), 1, 1, CAST(31232131441 AS Numeric(12, 0)), N'anhduc3009@gmail.com', NULL, N'KH00000008')
INSERT [dbo].[KHACH_HANG] ([TenKH], [DiaChi], [SDT], [STK], [NgaySinh], [TrangThai], [GT], [CCCD], [Email], [GhiChu], [makh]) VALUES (N'Lê Phúc Hưng', N'Hoằng Hóa, Thanh Hóa ', CAST(822532286 AS Numeric(10, 0)), CAST(383456789345 AS Numeric(13, 0)), CAST(N'2001-08-28' AS Date), 1, 1, CAST(38201012988 AS Numeric(12, 0)), N'phuchungmtak55@gmail.com', NULL, N'KH00000009')
INSERT [dbo].[KHACH_HANG] ([TenKH], [DiaChi], [SDT], [STK], [NgaySinh], [TrangThai], [GT], [CCCD], [Email], [GhiChu], [makh]) VALUES (N'Hoàng Tuấn Anh', N'Bỉm Sơn, Thanh Hóa ', CAST(931393875 AS Numeric(10, 0)), CAST(987654321568 AS Numeric(13, 0)), CAST(N'2000-03-23' AS Date), 1, 1, CAST(38201013978 AS Numeric(12, 0)), N'tuananhhoang233@gmail.com', NULL, N'KH00000010')
INSERT [dbo].[KHACH_HANG] ([TenKH], [DiaChi], [SDT], [STK], [NgaySinh], [TrangThai], [GT], [CCCD], [Email], [GhiChu], [makh]) VALUES (N'Nguyễn Khắc Tuấn Anh', N'Phú Bình, Thái Nguyên', CAST(392899585 AS Numeric(10, 0)), CAST(156525515222 AS Numeric(13, 0)), CAST(N'2001-07-08' AS Date), 1, 1, CAST(91939709 AS Numeric(12, 0)), N'tuananhdz@gmail.com', NULL, N'KH00000011')
INSERT [dbo].[KHACH_HANG] ([TenKH], [DiaChi], [SDT], [STK], [NgaySinh], [TrangThai], [GT], [CCCD], [Email], [GhiChu], [makh]) VALUES (N'Đinh Xuân Hải', N'Kim Bảng, Hà Nam', CAST(68422111 AS Numeric(10, 0)), NULL, CAST(N'2001-05-06' AS Date), 1, 1, CAST(25656554 AS Numeric(12, 0)), NULL, NULL, N'KH00000012')
INSERT [dbo].[KHACH_HANG] ([TenKH], [DiaChi], [SDT], [STK], [NgaySinh], [TrangThai], [GT], [CCCD], [Email], [GhiChu], [makh]) VALUES (N'Trương Thị La', N'Lý Nhân, Hà Nam', CAST(51265165 AS Numeric(10, 0)), NULL, CAST(N'2001-02-03' AS Date), 1, 0, CAST(65165101021 AS Numeric(12, 0)), NULL, NULL, N'KH00000013')
INSERT [dbo].[KHACH_HANG] ([TenKH], [DiaChi], [SDT], [STK], [NgaySinh], [TrangThai], [GT], [CCCD], [Email], [GhiChu], [makh]) VALUES (N'Bàn Thị Trang', N'Mai Châu, Hòa Bình', CAST(651616551 AS Numeric(10, 0)), CAST(1652165215 AS Numeric(13, 0)), CAST(N'2001-03-04' AS Date), 1, 0, CAST(654195626 AS Numeric(12, 0)), NULL, NULL, N'KH00000014')
INSERT [dbo].[KHACH_HANG] ([TenKH], [DiaChi], [SDT], [STK], [NgaySinh], [TrangThai], [GT], [CCCD], [Email], [GhiChu], [makh]) VALUES (N'Phạm Quang Tugf', N'Vũ Thư, Thái Bình', CAST(61656545 AS Numeric(10, 0)), NULL, CAST(N'2001-03-02' AS Date), 1, 1, CAST(2168454868 AS Numeric(12, 0)), NULL, NULL, N'KH00000015')
INSERT [dbo].[KHACH_HANG] ([TenKH], [DiaChi], [SDT], [STK], [NgaySinh], [TrangThai], [GT], [CCCD], [Email], [GhiChu], [makh]) VALUES (N'Mai Ngọc Sơn', N'TP.Hạ Long, Quảng Ninh', CAST(61641654 AS Numeric(10, 0)), NULL, CAST(N'2001-02-03' AS Date), 1, 1, CAST(62165451 AS Numeric(12, 0)), NULL, NULL, N'KH00000016')
INSERT [dbo].[KHACH_HANG] ([TenKH], [DiaChi], [SDT], [STK], [NgaySinh], [TrangThai], [GT], [CCCD], [Email], [GhiChu], [makh]) VALUES (N'Nguyễn Phi Luân', N'TP.Đà Nẵng, Đà Nẵng', CAST(11651556 AS Numeric(10, 0)), NULL, CAST(N'2001-03-04' AS Date), 1, 1, CAST(215644988 AS Numeric(12, 0)), NULL, NULL, N'KH00000017')
INSERT [dbo].[KHACH_HANG] ([TenKH], [DiaChi], [SDT], [STK], [NgaySinh], [TrangThai], [GT], [CCCD], [Email], [GhiChu], [makh]) VALUES (N'Đồng Quốc Toản', N'Yên Thế, Bắc Giang', CAST(206516541 AS Numeric(10, 0)), NULL, CAST(N'2001-10-02' AS Date), 1, 1, CAST(651684568 AS Numeric(12, 0)), NULL, NULL, N'KH00000018')
INSERT [dbo].[KHACH_HANG] ([TenKH], [DiaChi], [SDT], [STK], [NgaySinh], [TrangThai], [GT], [CCCD], [Email], [GhiChu], [makh]) VALUES (N'Phạm Đình Khương Duy', N'Nam Đàn, Nghệ An', CAST(65165145 AS Numeric(10, 0)), NULL, CAST(N'2001-02-03' AS Date), 1, 1, CAST(564541568 AS Numeric(12, 0)), NULL, NULL, N'KH00000019')
INSERT [dbo].[KHACH_HANG] ([TenKH], [DiaChi], [SDT], [STK], [NgaySinh], [TrangThai], [GT], [CCCD], [Email], [GhiChu], [makh]) VALUES (N'Nguyễn Duy Trinh', N'Yên Thành, Nghệ An', CAST(45668549 AS Numeric(10, 0)), NULL, CAST(N'2001-05-07' AS Date), 1, 1, CAST(16546854 AS Numeric(12, 0)), NULL, NULL, N'KH00000020')
GO
INSERT [dbo].[NGHE] ([MaSP], [MaKH], [ThoiGian], [GHiChu]) VALUES (N'SP00000001', N'KH00000001', CAST(N'2022-10-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[NGHE] ([MaSP], [MaKH], [ThoiGian], [GHiChu]) VALUES (N'SP00000001', N'KH00000001', CAST(N'2022-10-13T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[NGHE] ([MaSP], [MaKH], [ThoiGian], [GHiChu]) VALUES (N'SP00000001', N'KH00000001', CAST(N'2022-10-14T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[NGHE] ([MaSP], [MaKH], [ThoiGian], [GHiChu]) VALUES (N'SP00000001', N'KH00000004', CAST(N'2022-10-13T21:25:37.710' AS DateTime), NULL)
INSERT [dbo].[NGHE] ([MaSP], [MaKH], [ThoiGian], [GHiChu]) VALUES (N'SP00000001', N'KH00000005', CAST(N'2022-10-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[NGHE] ([MaSP], [MaKH], [ThoiGian], [GHiChu]) VALUES (N'SP00000002', N'KH00000001', CAST(N'2022-10-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[NGHE] ([MaSP], [MaKH], [ThoiGian], [GHiChu]) VALUES (N'SP00000002', N'KH00000005', CAST(N'2022-10-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[NGHE] ([MaSP], [MaKH], [ThoiGian], [GHiChu]) VALUES (N'SP00000004', N'KH00000005', CAST(N'2022-10-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[NGHE] ([MaSP], [MaKH], [ThoiGian], [GHiChu]) VALUES (N'SP00000004', N'KH00000006', CAST(N'2022-10-12T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[NGHE_SI] ([TenNS], [NgaySinh], [QueQuan], [NS_URL], [GT], [GhiChu], [TheoDoi], [NgheDanh], [ThongTin], [URL_img], [mans], [MaNhom]) VALUES (N'Nguyễn Khoa Tóc Tiên', CAST(N'1989-05-13' AS Date), N'TP.HCM, Việt Nam', N'https://vi.wikipedia.org/wiki/T%C3%B3c_Ti%C3%AAn_(ca_s%C4%A9)', 0, NULL, NULL, N'Tóc Tiên', NULL, N'~\Assets\img\imgMain\tóc-tiên.jpg', N'NS00000001', NULL)
INSERT [dbo].[NGHE_SI] ([TenNS], [NgaySinh], [QueQuan], [NS_URL], [GT], [GhiChu], [TheoDoi], [NgheDanh], [ThongTin], [URL_img], [mans], [MaNhom]) VALUES (N'Charles Otto "Charlie" Puth Jr.[', CAST(N'1991-12-01' AS Date), N'Rumson, bang New Jersey, Mỹ', N'https://vi.wikipedia.org/wiki/Charlie_Puth', 1, NULL, CAST(2 AS Numeric(15, 0)), N'Charlie Puth
', NULL, N'~\Assets\img\ArtistY\charlie-01.png', N'NS00000002', NULL)
INSERT [dbo].[NGHE_SI] ([TenNS], [NgaySinh], [QueQuan], [NS_URL], [GT], [GhiChu], [TheoDoi], [NgheDanh], [ThongTin], [URL_img], [mans], [MaNhom]) VALUES (N'Nguyễn Thanh Tùng', CAST(N'1994-07-05' AS Date), N'Thái Bình, Việt Nam', N'https://vi.wikipedia.org/wiki/S%C6%A1n_T%C3%B9ng_M-TP', 1, NULL, NULL, N'Sơn Tùng M-TP
', NULL, N'~\Assets\img\ArtistY\Son_Tung_M-TP.png', N'NS00000003', NULL)
INSERT [dbo].[NGHE_SI] ([TenNS], [NgaySinh], [QueQuan], [NS_URL], [GT], [GhiChu], [TheoDoi], [NgheDanh], [ThongTin], [URL_img], [mans], [MaNhom]) VALUES (N'Lee Ji-eun', CAST(N'1993-05-16' AS Date), N'Hàn Quốc', N'https://vi.wikipedia.org/wiki/IU_(ca_s%C4%A9)', 0, NULL, CAST(2 AS Numeric(15, 0)), N'IU', NULL, N'~\Assets\img\ArtistY\iu.jpg', N'NS00000004', NULL)
INSERT [dbo].[NGHE_SI] ([TenNS], [NgaySinh], [QueQuan], [NS_URL], [GT], [GhiChu], [TheoDoi], [NgheDanh], [ThongTin], [URL_img], [mans], [MaNhom]) VALUES (N'Justin Drew Bieber', CAST(N'1994-03-01' AS Date), N'Canada', N'https://vi.wikipedia.org/wiki/Justin_Bieber', 1, NULL, NULL, N'Justin Bieber', NULL, N'~\Assets\img\ArtistY\Justin_Bieber.jpg', N'NS00000005', NULL)
INSERT [dbo].[NGHE_SI] ([TenNS], [NgaySinh], [QueQuan], [NS_URL], [GT], [GhiChu], [TheoDoi], [NgheDanh], [ThongTin], [URL_img], [mans], [MaNhom]) VALUES (N'Taylor Alison Swift', CAST(N'1989-12-13' AS Date), N'West Reading, Pennsylvania,Mỹ', N'https://vi.wikipedia.org/wiki/Taylor_Swift', 0, NULL, NULL, N'Taylor Swift
', NULL, N'~\Assets\img\ArtistY\taylor switf.png', N'NS00000006', NULL)
INSERT [dbo].[NGHE_SI] ([TenNS], [NgaySinh], [QueQuan], [NS_URL], [GT], [GhiChu], [TheoDoi], [NgheDanh], [ThongTin], [URL_img], [mans], [MaNhom]) VALUES (N'Robyn Rihanna Fenty', CAST(N'1988-02-20' AS Date), N' Saint James, Barbados ', N'https://vi.wikipedia.org/wiki/Rihanna', 0, NULL, NULL, N'Rihanna', NULL, N'~\Assets\img\ArtistY\Rihanna.png', N'NS00000007', NULL)
INSERT [dbo].[NGHE_SI] ([TenNS], [NgaySinh], [QueQuan], [NS_URL], [GT], [GhiChu], [TheoDoi], [NgheDanh], [ThongTin], [URL_img], [mans], [MaNhom]) VALUES (N'Nguyễn Phước Thịnh', CAST(N'1988-12-18' AS Date), N'TP.HCM, Việt Nam', N'https://vi.wikipedia.org/wiki/Noo_Ph%C6%B0%E1%BB%9Bc_Th%E1%BB%8Bnh', 0, NULL, NULL, N'Noo Phước Thịnh', NULL, N'~\Assets\img\ArtistY\noo.jpg', N'NS00000008', NULL)
INSERT [dbo].[NGHE_SI] ([TenNS], [NgaySinh], [QueQuan], [NS_URL], [GT], [GhiChu], [TheoDoi], [NgheDanh], [ThongTin], [URL_img], [mans], [MaNhom]) VALUES (N'Nguyễn Diệu HUyền', CAST(N'2003-03-28' AS Date), N'Hà Nội, Việt Nam', N'https://vi.wikipedia.org/wiki/Ph%C3%A1o_(rapper)', 0, NULL, NULL, N'Pháo', NULL, N'~\Assets\img\ArtistY\Pháo.png', N'NS00000009', NULL)
INSERT [dbo].[NGHE_SI] ([TenNS], [NgaySinh], [QueQuan], [NS_URL], [GT], [GhiChu], [TheoDoi], [NgheDanh], [ThongTin], [URL_img], [mans], [MaNhom]) VALUES (N'Nguyễn Việt Hoàng', CAST(N'2000-01-20' AS Date), N'Thái Bình, Việt Nam', N'https://nhanvatshowbiz.com/mono', 1, NULL, NULL, N'MONO', NULL, N'~\Assets\img\ArtistY\mono.jpg', N'NS00000010', NULL)
INSERT [dbo].[NGHE_SI] ([TenNS], [NgaySinh], [QueQuan], [NS_URL], [GT], [GhiChu], [TheoDoi], [NgheDanh], [ThongTin], [URL_img], [mans], [MaNhom]) VALUES (N'Tăng Vũ Minh Phúc', CAST(N'1993-05-22' AS Date), N'TP.HCM, Việt Nam', N'https://trixie.com.vn/tang-phuc-la-ai-tieu-su-cua-ca-si-tang-phuc-A23598460.html', 1, NULL, NULL, N'Tăng Phúc', NULL, N'~\Assets\img\ArtistY\TăngPhuc.jpg', N'NS00000011', NULL)
INSERT [dbo].[NGHE_SI] ([TenNS], [NgaySinh], [QueQuan], [NS_URL], [GT], [GhiChu], [TheoDoi], [NgheDanh], [ThongTin], [URL_img], [mans], [MaNhom]) VALUES (N'Lê Ánh Nhật', CAST(N'1991-07-05' AS Date), N'TP.HCM, Việt Nam', N'https://vi.wikipedia.org/wiki/Miu_L%C3%AA', 0, NULL, NULL, N'Miu Lê', NULL, N'~\Assets\img\ArtistY\Miule.JPG', N'NS00000012', NULL)
INSERT [dbo].[NGHE_SI] ([TenNS], [NgaySinh], [QueQuan], [NS_URL], [GT], [GhiChu], [TheoDoi], [NgheDanh], [ThongTin], [URL_img], [mans], [MaNhom]) VALUES (N'Nguyễn Phúc Thạch', CAST(N'1998-02-20' AS Date), N'Đà Nẵng, Việt Nam', N'https://vi.wikipedia.org/wiki/Only_C', 1, NULL, NULL, N'Only C', NULL, N'~\Assets\img\ArtistY\onlyC.jpg', N'NS00000013', NULL)
INSERT [dbo].[NGHE_SI] ([TenNS], [NgaySinh], [QueQuan], [NS_URL], [GT], [GhiChu], [TheoDoi], [NgheDanh], [ThongTin], [URL_img], [mans], [MaNhom]) VALUES (N'Phạm Hoàng Khoa', CAST(N'1989-04-12' AS Date), N'Hà Nam,Việt Nam', N'https://vi.wikipedia.org/wiki/Karik', 1, NULL, NULL, N'Karik', NULL, N'~\Assets\img\ArtistY\Karik.jpg', N'NS00000014', NULL)
INSERT [dbo].[NGHE_SI] ([TenNS], [NgaySinh], [QueQuan], [NS_URL], [GT], [GhiChu], [TheoDoi], [NgheDanh], [ThongTin], [URL_img], [mans], [MaNhom]) VALUES (N'Hoàng Thùy Linh', CAST(N'1998-08-11' AS Date), N'Hà Nội, Việt Nam', N'https://vi.wikipedia.org/wiki/Ho%C3%A0ng_Th%C3%B9y_Linh', 0, NULL, NULL, N'Hoàng Thùy Linh', NULL, N'~\Assets\img\ArtistY\HoangThuyLinh.jpg', N'NS00000015', NULL)
INSERT [dbo].[NGHE_SI] ([TenNS], [NgaySinh], [QueQuan], [NS_URL], [GT], [GhiChu], [TheoDoi], [NgheDanh], [ThongTin], [URL_img], [mans], [MaNhom]) VALUES (N'Phạm Thị Hương Tràm', CAST(N'1995-05-15' AS Date), N'Nghệ An, Việt Nam', N'https://vi.wikipedia.org/wiki/H%C6%B0%C6%A1ng_Tr%C3%A0m', 0, NULL, NULL, N'Hương Tràm', NULL, N'~\Assets\img\ArtistY\HuongTram.jpg', N'NS00000016', NULL)
INSERT [dbo].[NGHE_SI] ([TenNS], [NgaySinh], [QueQuan], [NS_URL], [GT], [GhiChu], [TheoDoi], [NgheDanh], [ThongTin], [URL_img], [mans], [MaNhom]) VALUES (N'Nguyễn Thị Hòa', CAST(N'1995-05-07' AS Date), N'Bắc Ninh, Việt Nam', N'https://vi.wikipedia.org/wiki/H%C3%B2a_Minzy', 0, NULL, NULL, N'Hòa Minzy', NULL, N'~\Assets\img\ArtistY\Hòa_Minzy_.jpg', N'NS00000017', NULL)
INSERT [dbo].[NGHE_SI] ([TenNS], [NgaySinh], [QueQuan], [NS_URL], [GT], [GhiChu], [TheoDoi], [NgheDanh], [ThongTin], [URL_img], [mans], [MaNhom]) VALUES (N'Lê Trung Thành', CAST(N'1997-10-13' AS Date), N'Hà nội, Việt Nam', N'https://vi.wikipedia.org/wiki/Erik_(ca_s%C4%A9_Vi%E1%BB%87t_Nam)', 1, NULL, NULL, N'Erik', NULL, N'~\Assets\img\ArtistY\Erik.jpg', N'NS00000018', NULL)
INSERT [dbo].[NGHE_SI] ([TenNS], [NgaySinh], [QueQuan], [NS_URL], [GT], [GhiChu], [TheoDoi], [NgheDanh], [ThongTin], [URL_img], [mans], [MaNhom]) VALUES (N'Nguyễn Đức Phúc', CAST(N'1996-10-15' AS Date), N'Hà Nội, Việt Nam', N'https://vi.wikipedia.org/wiki/%C4%90%E1%BB%A9c_Ph%C3%BAc', 1, NULL, NULL, N'Đức Phúc', NULL, N'~\Assets\img\ArtistY\Duc_Phuc.png', N'NS00000019', NULL)
INSERT [dbo].[NGHE_SI] ([TenNS], [NgaySinh], [QueQuan], [NS_URL], [GT], [GhiChu], [TheoDoi], [NgheDanh], [ThongTin], [URL_img], [mans], [MaNhom]) VALUES (N'Nguyễn Minh Hằng', CAST(N'1988-12-07' AS Date), N'Hà Nội, Nghệ An', N'https://vi.wikipedia.org/wiki/Min_(ca_s%C4%A9_Vi%E1%BB%87t_Nam)', 0, NULL, NULL, N'MIN', NULL, N'~\Assets\img\ArtistY\MIN.png', N'NS00000020', NULL)
INSERT [dbo].[NGHE_SI] ([TenNS], [NgaySinh], [QueQuan], [NS_URL], [GT], [GhiChu], [TheoDoi], [NgheDanh], [ThongTin], [URL_img], [mans], [MaNhom]) VALUES (N'Lalisa Manobal', CAST(N'1997-03-27' AS Date), N'Thái Lan', N'https://vi.wikipedia.org/wiki/Lisa_(rapper)', 0, NULL, NULL, N'Lisa', NULL, N'~\Assets\img\ArtistY\Blackpink_Lisa).jpg', N'NS00000021', N'NH00000001')
INSERT [dbo].[NGHE_SI] ([TenNS], [NgaySinh], [QueQuan], [NS_URL], [GT], [GhiChu], [TheoDoi], [NgheDanh], [ThongTin], [URL_img], [mans], [MaNhom]) VALUES (N'Kim Ji-soo', CAST(N'1995-01-03' AS Date), N'Hàn quốc', N'https://www.yan.vn/tieu-su-thanh-vien-nhom-nhac-blackpink-jisoo-jennie-rose-va-lisa-183364.html', 0, NULL, NULL, N'JISOO', NULL, N'~\Assets\img\ArtistY\jisoo.png', N'NS00000022', N'NH00000001')
INSERT [dbo].[NGHE_SI] ([TenNS], [NgaySinh], [QueQuan], [NS_URL], [GT], [GhiChu], [TheoDoi], [NgheDanh], [ThongTin], [URL_img], [mans], [MaNhom]) VALUES (N'Kim Jennie', CAST(N'1996-01-16' AS Date), N'Hàn Quốc', N'https://www.yan.vn/tieu-su-thanh-vien-nhom-nhac-blackpink-jisoo-jennie-rose-va-lisa-183364.html', 0, NULL, NULL, N'JENNIE', NULL, N'~\Assets\img\ArtistY\jennie.png', N'NS00000023', N'NH00000001')
INSERT [dbo].[NGHE_SI] ([TenNS], [NgaySinh], [QueQuan], [NS_URL], [GT], [GhiChu], [TheoDoi], [NgheDanh], [ThongTin], [URL_img], [mans], [MaNhom]) VALUES (N'Park Chae-young ', CAST(N'1997-02-11' AS Date), N'New Zealand', N'https://www.yan.vn/tieu-su-thanh-vien-nhom-nhac-blackpink-jisoo-jennie-rose-va-lisa-183364.html', 0, NULL, NULL, N'ROSÉ', NULL, N'~\Assets\img\ArtistY\rose.png', N'NS00000024', N'NH00000001')
INSERT [dbo].[NGHE_SI] ([TenNS], [NgaySinh], [QueQuan], [NS_URL], [GT], [GhiChu], [TheoDoi], [NgheDanh], [ThongTin], [URL_img], [mans], [MaNhom]) VALUES (N'Nguyễn Hoài Bảo Anh', CAST(N'1992-09-03' AS Date), N'TP.HCM, Việt Nam', N'https://vi.wikipedia.org/wiki/B%E1%BA%A3o_Anh_(ca_s%C4%A9)', 0, NULL, NULL, N'Bảo Anh', NULL, N'~\Assets\img\ArtistY\Bao_Anh_(2018).png', N'NS00000025', NULL)
INSERT [dbo].[NGHE_SI] ([TenNS], [NgaySinh], [QueQuan], [NS_URL], [GT], [GhiChu], [TheoDoi], [NgheDanh], [ThongTin], [URL_img], [mans], [MaNhom]) VALUES (N'Võ Hồ Thành Vi', CAST(N'1994-06-13' AS Date), N'Việt Nam', N'https://rapviet.fandom.com/vi/wiki/T%C3%A1o', 1, NULL, NULL, N'Táo', NULL, N'~\Assets\img\ArtistY\Táo.jpg', N'NS00000026', NULL)
INSERT [dbo].[NGHE_SI] ([TenNS], [NgaySinh], [QueQuan], [NS_URL], [GT], [GhiChu], [TheoDoi], [NgheDanh], [ThongTin], [URL_img], [mans], [MaNhom]) VALUES (N'Trần Minh Hiếu', CAST(N'1999-08-29' AS Date), N'TP.HCM, Việt Nam', N'https://nhanvatshowbiz.com/hieuthuhai-hieu-thu-hai', 1, NULL, NULL, N'Hiếu Thứ Hai', NULL, N'~\Assets\img\ArtistY\hieuthuhai.jpg', N'NS00000027', NULL)
INSERT [dbo].[NGHE_SI] ([TenNS], [NgaySinh], [QueQuan], [NS_URL], [GT], [GhiChu], [TheoDoi], [NgheDanh], [ThongTin], [URL_img], [mans], [MaNhom]) VALUES (N'Hoàng Thái Vũ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'NS00000028', NULL)
GO
INSERT [dbo].[NHOM] ([TenNhom], [NgayThanhLap], [SoThanhVien], [URL_img], [URL_link], [MaNHOM]) VALUES (N'BLACKPINK', CAST(N'2016-08-08' AS Date), NULL, NULL, NULL, N'NH00000001')
INSERT [dbo].[NHOM] ([TenNhom], [NgayThanhLap], [SoThanhVien], [URL_img], [URL_link], [MaNHOM]) VALUES (N'BTS', CAST(N'2010-05-06' AS Date), NULL, NULL, N'https://vi.wikipedia.org/wiki/BTS', N'NH00000002')
INSERT [dbo].[NHOM] ([TenNhom], [NgayThanhLap], [SoThanhVien], [URL_img], [URL_link], [MaNHOM]) VALUES (N'Exo', CAST(N'2012-03-08' AS Date), NULL, NULL, N'https://vi.wikipedia.org/wiki/EXO_(nh%C3%B3m_nh%E1%BA%A1c)', N'NH00000003')
INSERT [dbo].[NHOM] ([TenNhom], [NgayThanhLap], [SoThanhVien], [URL_img], [URL_link], [MaNHOM]) VALUES (N'Big Bang', CAST(N'2008-06-07' AS Date), 5, NULL, N'https://vi.wikipedia.org/wiki/Big_Bang_(nh%C3%B3m_nh%E1%BA%A1c)', N'NH00000004')
INSERT [dbo].[NHOM] ([TenNhom], [NgayThanhLap], [SoThanhVien], [URL_img], [URL_link], [MaNHOM]) VALUES (N'Girls'' Generation', CAST(N'2007-08-05' AS Date), 8, NULL, NULL, N'NH00000005')
GO
INSERT [dbo].[PHAN_QUYEN] ([MaPQ], [TenQuyen], [Ghichu]) VALUES (N'PQ001', N'ADMIN', NULL)
INSERT [dbo].[PHAN_QUYEN] ([MaPQ], [TenQuyen], [Ghichu]) VALUES (N'PQ002', N'KHACHHANG', NULL)
INSERT [dbo].[PHAN_QUYEN] ([MaPQ], [TenQuyen], [Ghichu]) VALUES (N'PQ003', N'NHANVIEN', NULL)
GO
INSERT [dbo].[SAN_PHAM] ([TenSP], [SangTac], [MaNSX], [SP_URL], [Theloai], [TrangThai], [LuotNghe], [GhiChu], [YeuThich], [KhongYeuThich], [TGPhatHanh], [masp], [ThoiGian]) VALUES (N'Vũ Điệu Cồng Chiêng', N'Lưu Thiên Hương ', NULL, N'~\Assets\mp3\assests_mp3_vdcc.mp3', N'Nhạc trẻ', 1, 5, NULL, NULL, NULL, CAST(N'2015-05-03T00:00:00.000' AS DateTime), N'SP00000001', NULL)
INSERT [dbo].[SAN_PHAM] ([TenSP], [SangTac], [MaNSX], [SP_URL], [Theloai], [TrangThai], [LuotNghe], [GhiChu], [YeuThich], [KhongYeuThich], [TGPhatHanh], [masp], [ThoiGian]) VALUES (N'Tình nhân ơi', N'Châu Đăng Khoa', NULL, N'~\Assets\mp3\TinhNhanOiRemix-TangPhuc-6223774.mp3', N'Nhạc trẻ', 1, 2, NULL, NULL, NULL, NULL, N'SP00000002', NULL)
INSERT [dbo].[SAN_PHAM] ([TenSP], [SangTac], [MaNSX], [SP_URL], [Theloai], [TrangThai], [LuotNghe], [GhiChu], [YeuThich], [KhongYeuThich], [TGPhatHanh], [masp], [ThoiGian]) VALUES (N'Em là', N'MONO', NULL, N'~\Assets\mp3\EmLa-MONOOnionn-7736094.mp3', N'Nhạc trẻ', 1, NULL, NULL, NULL, NULL, NULL, N'SP00000003', NULL)
INSERT [dbo].[SAN_PHAM] ([TenSP], [SangTac], [MaNSX], [SP_URL], [Theloai], [TrangThai], [LuotNghe], [GhiChu], [YeuThich], [KhongYeuThich], [TGPhatHanh], [masp], [ThoiGian]) VALUES (N'Sợ Quá Cơ', N'Pháo', NULL, N'~\Assets\mp3\SoQuaCoNsmallRemix-Phao-6466251.mp3', N'Nhạc trẻ', 1, 2, NULL, NULL, NULL, NULL, N'SP00000004', NULL)
INSERT [dbo].[SAN_PHAM] ([TenSP], [SangTac], [MaNSX], [SP_URL], [Theloai], [TrangThai], [LuotNghe], [GhiChu], [YeuThich], [KhongYeuThich], [TGPhatHanh], [masp], [ThoiGian]) VALUES (N'Có ai thương em như anh', NULL, NULL, N'~\Assets\mp3\assests_mp3_catena.mp3', N'Nhạc trẻ', 1, NULL, NULL, NULL, NULL, NULL, N'SP00000005', NULL)
INSERT [dbo].[SAN_PHAM] ([TenSP], [SangTac], [MaNSX], [SP_URL], [Theloai], [TrangThai], [LuotNghe], [GhiChu], [YeuThich], [KhongYeuThich], [TGPhatHanh], [masp], [ThoiGian]) VALUES (N'Waiting For You', N'MONO', NULL, N'~\Assets\mp3\Waiting For You.mp3', N'Nhạc trẻ', 1, NULL, NULL, NULL, NULL, NULL, N'SP00000006', NULL)
INSERT [dbo].[SAN_PHAM] ([TenSP], [SangTac], [MaNSX], [SP_URL], [Theloai], [TrangThai], [LuotNghe], [GhiChu], [YeuThich], [KhongYeuThich], [TGPhatHanh], [masp], [ThoiGian]) VALUES (N'Lạc Trôi', N'Sơn Tùng MTP', N'NSX0000001', NULL, N'Nhạc Việt Nam, Nhạc pop, rock...,
', 1, NULL, NULL, NULL, NULL, CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'SP00000007', NULL)
INSERT [dbo].[SAN_PHAM] ([TenSP], [SangTac], [MaNSX], [SP_URL], [Theloai], [TrangThai], [LuotNghe], [GhiChu], [YeuThich], [KhongYeuThich], [TGPhatHanh], [masp], [ThoiGian]) VALUES (N'Truth', N'Sơn Tùng MTP', N'NSX0000001', N'~\Assets\mp3\Truth - Son Tung M-TP.mp3.crdownload', N' Rap, hiphop', 1, NULL, NULL, NULL, NULL, NULL, N'SP00000008', NULL)
INSERT [dbo].[SAN_PHAM] ([TenSP], [SangTac], [MaNSX], [SP_URL], [Theloai], [TrangThai], [LuotNghe], [GhiChu], [YeuThich], [KhongYeuThich], [TGPhatHanh], [masp], [ThoiGian]) VALUES (N'Deatta Koro No Youni', NULL, NULL, N'~\Assets\mp3\Deatta Koro No Youni Micro Tools Known A.mp3', N'Nhạc Nhật, Nhạc pop, rock...,', 1, NULL, NULL, NULL, NULL, NULL, N'SP00000009', NULL)
INSERT [dbo].[SAN_PHAM] ([TenSP], [SangTac], [MaNSX], [SP_URL], [Theloai], [TrangThai], [LuotNghe], [GhiChu], [YeuThich], [KhongYeuThich], [TGPhatHanh], [masp], [ThoiGian]) VALUES (N'Tóc Mây', NULL, NULL, NULL, N'Nhạc Việt Nam, Nhạc pop, rock...,', 1, NULL, NULL, NULL, NULL, NULL, N'SP00000010', NULL)
INSERT [dbo].[SAN_PHAM] ([TenSP], [SangTac], [MaNSX], [SP_URL], [Theloai], [TrangThai], [LuotNghe], [GhiChu], [YeuThich], [KhongYeuThich], [TGPhatHanh], [masp], [ThoiGian]) VALUES (N'Anh Nhớ Ra', NULL, NULL, N'~\Assets\mp3\AnhNhoRa-VuTRANG-7847967.mp3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SP00000011', NULL)
INSERT [dbo].[SAN_PHAM] ([TenSP], [SangTac], [MaNSX], [SP_URL], [Theloai], [TrangThai], [LuotNghe], [GhiChu], [YeuThich], [KhongYeuThich], [TGPhatHanh], [masp], [ThoiGian]) VALUES (N'Bên Trên Tầng lầu', NULL, NULL, N'~\Assets\mp3\BenTrenTangLau-TangDuyTan-7412012.mp3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SP00000012', NULL)
INSERT [dbo].[SAN_PHAM] ([TenSP], [SangTac], [MaNSX], [SP_URL], [Theloai], [TrangThai], [LuotNghe], [GhiChu], [YeuThich], [KhongYeuThich], [TGPhatHanh], [masp], [ThoiGian]) VALUES (N'Chưa Quên Người Yêu Cũ', NULL, NULL, N'~\Assets\mp3\ChuaQuenNguoiYeuCu-HaNhi-7662060.mp3', NULL, 1, NULL, NULL, NULL, NULL, NULL, N'SP00000013', NULL)
INSERT [dbo].[SAN_PHAM] ([TenSP], [SangTac], [MaNSX], [SP_URL], [Theloai], [TrangThai], [LuotNghe], [GhiChu], [YeuThich], [KhongYeuThich], [TGPhatHanh], [masp], [ThoiGian]) VALUES (N'Đế Vương', NULL, NULL, N'~\Assets\mp3\DeVuong-DinhDungACV-7121634.mp3', NULL, 1, NULL, NULL, NULL, NULL, NULL, N'SP00000014', NULL)
INSERT [dbo].[SAN_PHAM] ([TenSP], [SangTac], [MaNSX], [SP_URL], [Theloai], [TrangThai], [LuotNghe], [GhiChu], [YeuThich], [KhongYeuThich], [TGPhatHanh], [masp], [ThoiGian]) VALUES (N'Hai Mươi Hai', NULL, NULL, N'~\Assets\mp3\HaiMuoiHai22-HuaKimTuyenAMEE-7231237.mp3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SP00000015', NULL)
INSERT [dbo].[SAN_PHAM] ([TenSP], [SangTac], [MaNSX], [SP_URL], [Theloai], [TrangThai], [LuotNghe], [GhiChu], [YeuThich], [KhongYeuThich], [TGPhatHanh], [masp], [ThoiGian]) VALUES (N'Lời Tạm Biệt Chưa Nói', NULL, NULL, N'~\Assets\mp3\LoiTamBietChuaNoi-GREYDDoanTheLanOrange-7613756.mp3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SP00000016', NULL)
INSERT [dbo].[SAN_PHAM] ([TenSP], [SangTac], [MaNSX], [SP_URL], [Theloai], [TrangThai], [LuotNghe], [GhiChu], [YeuThich], [KhongYeuThich], [TGPhatHanh], [masp], [ThoiGian]) VALUES (N'Một Ngàn Nỗi Đau', NULL, NULL, N'~\Assets\mp3\MotNganNoiDau-VanMaiHuongHuaKimTuyen-7561897.mp3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SP00000017', NULL)
INSERT [dbo].[SAN_PHAM] ([TenSP], [SangTac], [MaNSX], [SP_URL], [Theloai], [TrangThai], [LuotNghe], [GhiChu], [YeuThich], [KhongYeuThich], [TGPhatHanh], [masp], [ThoiGian]) VALUES (N'Quá Khứ Đôi, Hiện Tại Đơn', NULL, NULL, N'~\Assets\mp3\QuaKhuDoiHienTaiDon-DucPhuc-7972765.mp3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SP00000018', NULL)
INSERT [dbo].[SAN_PHAM] ([TenSP], [SangTac], [MaNSX], [SP_URL], [Theloai], [TrangThai], [LuotNghe], [GhiChu], [YeuThich], [KhongYeuThich], [TGPhatHanh], [masp], [ThoiGian]) VALUES (N'Từng Là Của Nhau', NULL, NULL, N'~\Assets\mp3\TungLaCuaNhau-BaoAnhTao-7818322.mp3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SP00000019', NULL)
INSERT [dbo].[SAN_PHAM] ([TenSP], [SangTac], [MaNSX], [SP_URL], [Theloai], [TrangThai], [LuotNghe], [GhiChu], [YeuThich], [KhongYeuThich], [TGPhatHanh], [masp], [ThoiGian]) VALUES (N'Vệ Tinh', NULL, NULL, N'~\Assets\mp3\VeTinh-HIEUTHUHAIHoangTonKewtiie-7730914.mp3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SP00000020', NULL)
INSERT [dbo].[SAN_PHAM] ([TenSP], [SangTac], [MaNSX], [SP_URL], [Theloai], [TrangThai], [LuotNghe], [GhiChu], [YeuThich], [KhongYeuThich], [TGPhatHanh], [masp], [ThoiGian]) VALUES (N'Vì Anh Đâu Có Biết', NULL, NULL, N'~\Assets\mp3\ViAnhDauCoBiet-MadihuVu-7666644.mp3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SP00000021', NULL)
INSERT [dbo].[SAN_PHAM] ([TenSP], [SangTac], [MaNSX], [SP_URL], [Theloai], [TrangThai], [LuotNghe], [GhiChu], [YeuThich], [KhongYeuThich], [TGPhatHanh], [masp], [ThoiGian]) VALUES (N'Vì Mẹ Anh Bắt Chia Tay', NULL, NULL, N'~\Assets\mp3\ViMeAnhBatChiaTay-MiuLe-7503053 (1).mp3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SP00000022', NULL)
INSERT [dbo].[SAN_PHAM] ([TenSP], [SangTac], [MaNSX], [SP_URL], [Theloai], [TrangThai], [LuotNghe], [GhiChu], [YeuThich], [KhongYeuThich], [TGPhatHanh], [masp], [ThoiGian]) VALUES (N'Em Đã Có Người Mới', NULL, NULL, N'~\Assets\mp3\assests_mp3_edcnm.mp3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SP00000023', NULL)
INSERT [dbo].[SAN_PHAM] ([TenSP], [SangTac], [MaNSX], [SP_URL], [Theloai], [TrangThai], [LuotNghe], [GhiChu], [YeuThich], [KhongYeuThich], [TGPhatHanh], [masp], [ThoiGian]) VALUES (N'Ngày Tận Thế', NULL, NULL, N'~\Assets\mp3\assests_mp3_ntt.mp3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SP00000024', NULL)
GO
INSERT [dbo].[SU_KIEN] ([TenSK], [TGBatDau], [DiaDiem], [URL_img], [URL_link], [TGKetThuc], [maSK], [LuotTruyCap]) VALUES (N'Above The World 2022 - Music Festival', CAST(N'2022-04-13T00:00:00.000' AS DateTime), N'Phú Quốc, Kiên Giang ,Việt Nam', N'~\Assets\img\event\saostar-39k3u1fdm4mebz57.webp', N'https://www.saostar.vn/am-nhac/trong-cho-gi-o-su-kien-am-nhac-edm-above-the-world-2022-202204131536116297.html', NULL, N'SK00000001', NULL)
INSERT [dbo].[SU_KIEN] ([TenSK], [TGBatDau], [DiaDiem], [URL_img], [URL_link], [TGKetThuc], [maSK], [LuotTruyCap]) VALUES (N'EDM Pinbus Ravolution Music Festival 2022', CAST(N'2022-05-15T00:00:00.000' AS DateTime), N'TP.HCM, Việt Nam', N'~\Assets\img\event\bai-dan-triedit-sapodocx-1651059255170.webp', N'https://dantri.com.vn/giai-tri/5-dj-hang-dau-the-gioi-se-trinh-dien-tai-le-hoi-edm-pinbus-ravolution-music-festival-2022-20220427183641523.htm', NULL, N'SK00000002', NULL)
INSERT [dbo].[SU_KIEN] ([TenSK], [TGBatDau], [DiaDiem], [URL_img], [URL_link], [TGKetThuc], [maSK], [LuotTruyCap]) VALUES (N'The Fountain Festival', CAST(N'2022-09-01T00:00:00.000' AS DateTime), N'TP.HCM, Việt Nam', N'~\Assets\img\event\Hinh 1(1).png', N'https://tapchitoaan.vn/chuoi-su-kien-hoanh-trang-%E2%80%9Cle-hoi-nhac-nuoc-lon-nhat-dong-nam-a%E2%80%9D-sap-%E2%80%9Cdo-bo%E2%80%9D-tphcm-vao-thang-97037.html', CAST(N'2022-09-24T00:00:00.000' AS DateTime), N'SK00000003', NULL)
GO
INSERT [dbo].[THEO_DOI] ([MaKH], [MaNS], [TG], [GhiChu]) VALUES (N'KH00000002', N'NS00000004', CAST(N'2022-10-13T21:43:09.017' AS DateTime), NULL)
INSERT [dbo].[THEO_DOI] ([MaKH], [MaNS], [TG], [GhiChu]) VALUES (N'KH00000003', N'NS00000002', CAST(N'2022-10-13T21:41:07.300' AS DateTime), NULL)
INSERT [dbo].[THEO_DOI] ([MaKH], [MaNS], [TG], [GhiChu]) VALUES (N'KH00000004', N'NS00000002', CAST(N'2022-10-13T21:43:20.760' AS DateTime), NULL)
INSERT [dbo].[THEO_DOI] ([MaKH], [MaNS], [TG], [GhiChu]) VALUES (N'KH00000004', N'NS00000004', CAST(N'2022-10-13T21:42:50.870' AS DateTime), NULL)
GO
INSERT [dbo].[TIN_MOI] ([TenTM], [ThoiGian], [URL_img], [URL_link], [GhiChu], [LuotTruyCap], [MaTM]) VALUES (N'Chi Pu xin lỗi khán giả, hủy ra album', CAST(N'2022-10-13T00:00:00.000' AS DateTime), N'~\Assets\img\newss\CHIPU.jpg', N'https://vnexpress.net/chi-pu-xin-loi-khan-gia-huy-ra-album-4522821.html', NULL, 1, N'TM00000001')
INSERT [dbo].[TIN_MOI] ([TenTM], [ThoiGian], [URL_img], [URL_link], [GhiChu], [LuotTruyCap], [MaTM]) VALUES (N'Blake Shelton rời The Voice Mỹ', CAST(N'2022-10-12T00:00:00.000' AS DateTime), N'~\Assets\img\newss\2.png', N'https://vnexpress.net/blake-shelton-roi-the-voice-my-4522316.html', NULL, 1, N'TM00000002')
INSERT [dbo].[TIN_MOI] ([TenTM], [ThoiGian], [URL_img], [URL_link], [GhiChu], [LuotTruyCap], [MaTM]) VALUES (N'Sơn Tùng M-TP kỷ niệm 10 năm ca hát
', CAST(N'2022-10-11T00:00:00.000' AS DateTime), N'~\Assets\img\newss\3.jpg', N'https://vnexpress.net/son-tung-m-tp-ky-niem-10-nam-ca-hat-4521056.html
', NULL, 1, N'TM00000003')
INSERT [dbo].[TIN_MOI] ([TenTM], [ThoiGian], [URL_img], [URL_link], [GhiChu], [LuotTruyCap], [MaTM]) VALUES (N'Hồ Ngọc Hà tái hiện loạt hit trong tour ''Love songs''
', CAST(N'2022-10-08T00:00:00.000' AS DateTime), N'~\Assets\img\newss\4.jpg', N'https://vnexpress.net/ho-ngoc-ha-tai-hien-loat-hit-trong-tour-love-songs-4520468.html
', NULL, NULL, N'TM00000004')
INSERT [dbo].[TIN_MOI] ([TenTM], [ThoiGian], [URL_img], [URL_link], [GhiChu], [LuotTruyCap], [MaTM]) VALUES (N'Ca sĩ Hàn Quốc bị bắt vì lái xe khi say rượu
', CAST(N'2022-10-12T00:00:00.000' AS DateTime), N'~\Assets\img\newss\5.webp', N'https://zingnews.vn/ca-si-han-quoc-bi-bat-vi-lai-xe-khi-say-ruou-post1364301.html
', NULL, NULL, N'TM00000005')
INSERT [dbo].[TIN_MOI] ([TenTM], [ThoiGian], [URL_img], [URL_link], [GhiChu], [LuotTruyCap], [MaTM]) VALUES (N'Orange hát ca khúc ''Chân ái'' sau 2 năm nhưng chưa xin phép
', CAST(N'2022-10-13T00:00:00.000' AS DateTime), N'~\Assets\img\newss\6.webp', N'https://zingnews.vn/orange-hat-ca-khuc-chan-ai-sau-2-nam-nhung-chua-xin-phep-post1363668.html
', NULL, 1, N'TM00000006')
INSERT [dbo].[TIN_MOI] ([TenTM], [ThoiGian], [URL_img], [URL_link], [GhiChu], [LuotTruyCap], [MaTM]) VALUES (N'Sau 10 năm chán im lặng, lại gọi antifan là lũ trẻ ranh, Sơn Tùng đã sai càng sai?
', CAST(N'2022-10-12T00:00:00.000' AS DateTime), N'~\Assets\img\newss\7.webp', N'https://kenh14.vn/sau-10-nam-chan-im-lang-lai-goi-antifan-la-lu-tre-ranh-son-tung-da-sai-cang-sai-20221013130657227.chn
', NULL, NULL, N'TM00000007')
INSERT [dbo].[TIN_MOI] ([TenTM], [ThoiGian], [URL_img], [URL_link], [GhiChu], [LuotTruyCap], [MaTM]) VALUES (N'Cùng đi diễn nhưng MONO gây bão hơn Sơn Tùng, tương lai có thể vượt qua anh trai?
', CAST(N'2022-10-13T00:00:00.000' AS DateTime), N'~\Assets\img\newss\8.webp', N'https://kenh14.vn/cung-di-dien-nhung-mono-gay-bao-hon-son-tung-tuong-lai-co-the-vuot-qua-anh-trai-20221012141417918.chn
', NULL, 1, N'TM00000008')
INSERT [dbo].[TIN_MOI] ([TenTM], [ThoiGian], [URL_img], [URL_link], [GhiChu], [LuotTruyCap], [MaTM]) VALUES (N'Chi Pu tung MV khép lại dự án âm nhạc năm 2022: "Nghiêm túc ghi nhận những nhận xét trong thời gian qua"
', CAST(N'2022-10-12T00:00:00.000' AS DateTime), N'~\Assets\img\newss\9.webp', N'https://kenh14.vn/chi-pu-tung-mv-khep-lai-du-an-am-nhac-nam-2022-nghiem-tuc-ghi-nhan-nhung-nhan-xet-trong-thoi-gian-qua-20221013092045447.chn
', NULL, NULL, N'TM00000009')
INSERT [dbo].[TIN_MOI] ([TenTM], [ThoiGian], [URL_img], [URL_link], [GhiChu], [LuotTruyCap], [MaTM]) VALUES (N'Sau vụ mất trộm 3 tỉ đồng, Hồ Ngọc Hà hủy show tại Mỹ
', CAST(N'2022-10-13T00:00:00.000' AS DateTime), N'~\Assets\img\newss\10.webp', N'https://kenh14.vn/sau-vu-mat-trom-3-ti-dong-ho-ngoc-ha-huy-show-tai-my-20221012081546131.chn
', NULL, NULL, N'TM00000010')
GO
INSERT [dbo].[TK_AD] ([UserName], [PassWord], [TrangThai], [MaAD], [MapQ]) VALUES (N'anh', N'123456', 1, N'AD00000001', N'PQ001')
INSERT [dbo].[TK_AD] ([UserName], [PassWord], [TrangThai], [MaAD], [MapQ]) VALUES (N'chi', N'123456', 1, N'AD00000003', N'PQ001')
INSERT [dbo].[TK_AD] ([UserName], [PassWord], [TrangThai], [MaAD], [MapQ]) VALUES (N'hung', N'123456', 1, N'AD00000002', N'PQ001')
INSERT [dbo].[TK_AD] ([UserName], [PassWord], [TrangThai], [MaAD], [MapQ]) VALUES (N'manhhung', N'123456', 1, N'AD00000005', N'PQ001')
INSERT [dbo].[TK_AD] ([UserName], [PassWord], [TrangThai], [MaAD], [MapQ]) VALUES (N'thanh', N'123456', 1, N'AD00000004', N'PQ001')
GO
INSERT [dbo].[TRINH_BAY] ([MaNS], [MaSP], [GhiChu]) VALUES (N'NS00000001', N'SP00000001', NULL)
INSERT [dbo].[TRINH_BAY] ([MaNS], [MaSP], [GhiChu]) VALUES (N'NS00000001', N'SP00000005', NULL)
INSERT [dbo].[TRINH_BAY] ([MaNS], [MaSP], [GhiChu]) VALUES (N'NS00000001', N'SP00000010', NULL)
INSERT [dbo].[TRINH_BAY] ([MaNS], [MaSP], [GhiChu]) VALUES (N'NS00000001', N'SP00000023', NULL)
INSERT [dbo].[TRINH_BAY] ([MaNS], [MaSP], [GhiChu]) VALUES (N'NS00000001', N'SP00000024', NULL)
INSERT [dbo].[TRINH_BAY] ([MaNS], [MaSP], [GhiChu]) VALUES (N'NS00000003', N'SP00000007', NULL)
INSERT [dbo].[TRINH_BAY] ([MaNS], [MaSP], [GhiChu]) VALUES (N'NS00000003', N'SP00000008', NULL)
INSERT [dbo].[TRINH_BAY] ([MaNS], [MaSP], [GhiChu]) VALUES (N'NS00000010', N'SP00000003', NULL)
INSERT [dbo].[TRINH_BAY] ([MaNS], [MaSP], [GhiChu]) VALUES (N'NS00000010', N'SP00000006', NULL)
INSERT [dbo].[TRINH_BAY] ([MaNS], [MaSP], [GhiChu]) VALUES (N'NS00000019', N'SP00000018', NULL)
INSERT [dbo].[TRINH_BAY] ([MaNS], [MaSP], [GhiChu]) VALUES (N'NS00000025', N'SP00000019', NULL)
INSERT [dbo].[TRINH_BAY] ([MaNS], [MaSP], [GhiChu]) VALUES (N'NS00000026', N'SP00000019', NULL)
INSERT [dbo].[TRINH_BAY] ([MaNS], [MaSP], [GhiChu]) VALUES (N'NS00000027', N'SP00000020', NULL)
GO
INSERT [dbo].[TRUY_CAP_TM] ([makh], [maTM], [ThoiGian]) VALUES (N'KH00000001', N'TM00000001', CAST(N'2022-10-13T22:54:05.813' AS DateTime))
INSERT [dbo].[TRUY_CAP_TM] ([makh], [maTM], [ThoiGian]) VALUES (N'KH00000002', N'TM00000002', CAST(N'2022-10-13T22:54:19.603' AS DateTime))
INSERT [dbo].[TRUY_CAP_TM] ([makh], [maTM], [ThoiGian]) VALUES (N'KH00000001', N'TM00000003', CAST(N'2022-10-13T22:54:38.823' AS DateTime))
INSERT [dbo].[TRUY_CAP_TM] ([makh], [maTM], [ThoiGian]) VALUES (N'KH00000004', N'TM00000006', CAST(N'2022-10-13T22:54:51.210' AS DateTime))
INSERT [dbo].[TRUY_CAP_TM] ([makh], [maTM], [ThoiGian]) VALUES (N'KH00000007', N'TM00000008', CAST(N'2022-10-13T22:55:00.650' AS DateTime))
GO
INSERT [dbo].[YEU_THICH] ([makh], [masp], [ThoiGian], [YeuThich]) VALUES (N'KH00000001', N'SP00000001', NULL, 1)
INSERT [dbo].[YEU_THICH] ([makh], [masp], [ThoiGian], [YeuThich]) VALUES (N'KH00000001', N'SP00000002', NULL, 1)
INSERT [dbo].[YEU_THICH] ([makh], [masp], [ThoiGian], [YeuThich]) VALUES (N'KH00000001', N'SP00000003', NULL, 0)
INSERT [dbo].[YEU_THICH] ([makh], [masp], [ThoiGian], [YeuThich]) VALUES (N'KH00000001', N'SP00000006', NULL, 1)
INSERT [dbo].[YEU_THICH] ([makh], [masp], [ThoiGian], [YeuThich]) VALUES (N'KH00000002', N'SP00000004', NULL, 1)
INSERT [dbo].[YEU_THICH] ([makh], [masp], [ThoiGian], [YeuThich]) VALUES (N'KH00000002', N'SP00000007', NULL, 0)
INSERT [dbo].[YEU_THICH] ([makh], [masp], [ThoiGian], [YeuThich]) VALUES (N'KH00000002', N'SP00000008', NULL, 1)
GO
ALTER TABLE [dbo].[ADMIN] ADD  CONSTRAINT [MAAD]  DEFAULT ([dbo].[AUTO_IDAD]()) FOR [MaAD]
GO
ALTER TABLE [dbo].[KHACH_HANG] ADD  CONSTRAINT [makh]  DEFAULT ([DBO].[AUTO_IDkh]()) FOR [makh]
GO
ALTER TABLE [dbo].[NGHE_SI] ADD  CONSTRAINT [mans]  DEFAULT ([DBO].[AUTO_IDns]()) FOR [mans]
GO
ALTER TABLE [dbo].[NHOM] ADD  CONSTRAINT [manhom]  DEFAULT ([dbo].[AUTO_IDNHOM]()) FOR [MaNHOM]
GO
ALTER TABLE [dbo].[SAN_PHAM] ADD  CONSTRAINT [masp]  DEFAULT ([DBO].[AUTO_IDsp]()) FOR [masp]
GO
ALTER TABLE [dbo].[SU_KIEN] ADD  CONSTRAINT [maSK]  DEFAULT ([DBO].[AUTO_IDSK]()) FOR [maSK]
GO
ALTER TABLE [dbo].[TIN_MOI] ADD  CONSTRAINT [matm]  DEFAULT ([DBO].[AUTO_IDtm]()) FOR [MaTM]
GO
ALTER TABLE [dbo].[ALbum]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACH_HANG] ([makh])
GO
ALTER TABLE [dbo].[ALbum]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SAN_PHAM] ([masp])
GO
ALTER TABLE [dbo].[NGHE]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACH_HANG] ([makh])
GO
ALTER TABLE [dbo].[NGHE]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SAN_PHAM] ([masp])
GO
ALTER TABLE [dbo].[NGHE_SI]  WITH CHECK ADD FOREIGN KEY([MaNhom])
REFERENCES [dbo].[NHOM] ([MaNHOM])
GO
ALTER TABLE [dbo].[TAI_KHOAN]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACH_HANG] ([makh])
GO
ALTER TABLE [dbo].[TAI_KHOAN]  WITH CHECK ADD FOREIGN KEY([MaPQ])
REFERENCES [dbo].[PHAN_QUYEN] ([MaPQ])
GO
ALTER TABLE [dbo].[THEO_DOI]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACH_HANG] ([makh])
GO
ALTER TABLE [dbo].[THEO_DOI]  WITH CHECK ADD FOREIGN KEY([MaNS])
REFERENCES [dbo].[NGHE_SI] ([mans])
GO
ALTER TABLE [dbo].[TK_AD]  WITH CHECK ADD FOREIGN KEY([MaAD])
REFERENCES [dbo].[ADMIN] ([MaAD])
GO
ALTER TABLE [dbo].[TK_AD]  WITH CHECK ADD FOREIGN KEY([MapQ])
REFERENCES [dbo].[PHAN_QUYEN] ([MaPQ])
GO
ALTER TABLE [dbo].[TRINH_BAY]  WITH CHECK ADD FOREIGN KEY([MaNS])
REFERENCES [dbo].[NGHE_SI] ([mans])
GO
ALTER TABLE [dbo].[TRINH_BAY]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SAN_PHAM] ([masp])
GO
ALTER TABLE [dbo].[TRUY_CAP_SK]  WITH CHECK ADD FOREIGN KEY([makh])
REFERENCES [dbo].[KHACH_HANG] ([makh])
GO
ALTER TABLE [dbo].[TRUY_CAP_SK]  WITH CHECK ADD FOREIGN KEY([maSK])
REFERENCES [dbo].[SU_KIEN] ([maSK])
GO
ALTER TABLE [dbo].[TRUY_CAP_TM]  WITH CHECK ADD FOREIGN KEY([makh])
REFERENCES [dbo].[KHACH_HANG] ([makh])
GO
ALTER TABLE [dbo].[TRUY_CAP_TM]  WITH CHECK ADD FOREIGN KEY([maTM])
REFERENCES [dbo].[TIN_MOI] ([MaTM])
GO
ALTER TABLE [dbo].[YEU_THICH]  WITH CHECK ADD FOREIGN KEY([makh])
REFERENCES [dbo].[KHACH_HANG] ([makh])
GO
ALTER TABLE [dbo].[YEU_THICH]  WITH CHECK ADD FOREIGN KEY([masp])
REFERENCES [dbo].[SAN_PHAM] ([masp])
GO
/****** Object:  StoredProcedure [dbo].[SP]    Script Date: 10/19/2022 7:26:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc  [dbo].[SP](@stt int,@TenSP nvarchar(50),@nghedanh nvarchar(50),@SP_URL nvarchar(200),@thoigian time,@luotnghe float)
AS
begin
select @stt=ROW_NUMBER() OVER (ORDER BY sp.masp),@tensp=tensp,@nghedanh=nghedanh,@sp_url=SP_URL,@thoigian=thoigian,@luotnghe=luotnghe from san_pham sp join trinh_bay tb on sp.masp=tb.masp join nghe_si ns 
on ns.mans=tb.mans
return
end
GO
USE [master]
GO
ALTER DATABASE [MUSIC] SET  READ_WRITE 
GO
