USE [master]
GO
/****** Object:  Database [WebMusic]    Script Date: 11/1/2022 9:51:21 PM ******/
CREATE DATABASE [WebMusic]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebMusic', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\WebMusic.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WebMusic_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\WebMusic_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WebMusic] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebMusic].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebMusic] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebMusic] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebMusic] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebMusic] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebMusic] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebMusic] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebMusic] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebMusic] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebMusic] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebMusic] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebMusic] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebMusic] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebMusic] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebMusic] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebMusic] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WebMusic] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebMusic] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebMusic] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebMusic] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebMusic] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebMusic] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebMusic] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebMusic] SET RECOVERY FULL 
GO
ALTER DATABASE [WebMusic] SET  MULTI_USER 
GO
ALTER DATABASE [WebMusic] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebMusic] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebMusic] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebMusic] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WebMusic] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WebMusic] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'WebMusic', N'ON'
GO
ALTER DATABASE [WebMusic] SET QUERY_STORE = OFF
GO
USE [WebMusic]
GO
/****** Object:  Table [dbo].[ADMIN]    Script Date: 11/1/2022 9:51:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADMIN](
	[TenAD] [nvarchar](50) NULL,
	[UserName] [varchar](50) NULL,
	[Pass] [varchar](50) NULL,
	[TrangThai] [bit] NULL,
	[DC] [nvarchar](50) NULL,
	[SDT] [numeric](10, 0) NULL,
	[STK] [numeric](13, 0) NULL,
	[GT] [bit] NULL,
	[NS] [date] NULL,
	[Email] [nvarchar](100) NULL,
	[URL_img] [nvarchar](100) NULL,
	[GhiChu] [nvarchar](100) NULL,
	[MaPQ] [char](5) NULL,
	[MaAD] [char](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaAD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALbum]    Script Date: 11/1/2022 9:51:21 PM ******/
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
/****** Object:  Table [dbo].[KHACH_HANG]    Script Date: 11/1/2022 9:51:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACH_HANG](
	[TenKH] [nvarchar](50) NOT NULL,
	[URL_img] [nvarchar](100) NULL,
	[UserName] [varchar](50) NULL,
	[Pass] [varchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [numeric](10, 0) NOT NULL,
	[NgaySinh] [date] NULL,
	[TrangThai] [bit] NULL,
	[GT] [bit] NULL,
	[CCCD] [numeric](12, 0) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](100) NULL,
	[MaPQ] [char](5) NULL,
	[MaKH] [char](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NGHE]    Script Date: 11/1/2022 9:51:21 PM ******/
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
/****** Object:  Table [dbo].[NGHE_SI]    Script Date: 11/1/2022 9:51:21 PM ******/
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
	[URL_img] [nvarchar](100) NULL,
	[mans] [char](10) NOT NULL,
	[MaNhom] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[mans] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHOM]    Script Date: 11/1/2022 9:51:21 PM ******/
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
/****** Object:  Table [dbo].[PHAN_QUYEN]    Script Date: 11/1/2022 9:51:21 PM ******/
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
/****** Object:  Table [dbo].[SAN_PHAM]    Script Date: 11/1/2022 9:51:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAN_PHAM](
	[TenSP] [nvarchar](50) NOT NULL,
	[SangTac] [nvarchar](50) NULL,
	[SP_URL] [nvarchar](200) NULL,
	[Theloai] [nvarchar](50) NULL,
	[TrangThai] [bit] NULL,
	[LuotNghe] [float] NULL,
	[GhiChu] [nvarchar](100) NULL,
	[YeuThich] [numeric](15, 0) NULL,
	[KhongYeuThich] [numeric](15, 0) NULL,
	[TGPhatHanh] [datetime] NULL,
	[MaSP] [char](10) NOT NULL,
	[ThoiGian] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THEO_DOI]    Script Date: 11/1/2022 9:51:21 PM ******/
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
/****** Object:  Table [dbo].[TIN_MOI]    Script Date: 11/1/2022 9:51:21 PM ******/
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
/****** Object:  Table [dbo].[TRINH_BAY]    Script Date: 11/1/2022 9:51:21 PM ******/
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
/****** Object:  Table [dbo].[TRUY_CAP_TM]    Script Date: 11/1/2022 9:51:21 PM ******/
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
	[makh] ASC,
	[maTM] ASC,
	[ThoiGian] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YEU_THICH]    Script Date: 11/1/2022 9:51:21 PM ******/
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
INSERT [dbo].[KHACH_HANG] ([TenKH], [URL_img], [UserName], [Pass], [DiaChi], [SDT], [NgaySinh], [TrangThai], [GT], [CCCD], [Email], [GhiChu], [MaPQ], [MaKH]) VALUES (N'Nguyễn Văn Hoàng Anh', NULL, N'anh', N'123456', N'Thanh Chương, Nghệ An', CAST(386494859 AS Numeric(10, 0)), CAST(N'2001-04-20' AS Date), 1, 1, CAST(546505250000 AS Numeric(12, 0)), N'nguyenvanhoanganh20042001@gmail.com', NULL, N'PQ002', N'KH00000001')
GO
INSERT [dbo].[NGHE_SI] ([TenNS], [NgaySinh], [QueQuan], [NS_URL], [GT], [GhiChu], [TheoDoi], [NgheDanh], [URL_img], [mans], [MaNhom]) VALUES (N'Robyn Rihanna Fenty', CAST(N'1988-02-20' AS Date), N'Saint James, Barbados', N'https://vi.wikipedia.org/wiki/Rihanna'',', 0, NULL, NULL, N'Rihanna', N'Rihanna.png', N'NS00000001', NULL)
INSERT [dbo].[NGHE_SI] ([TenNS], [NgaySinh], [QueQuan], [NS_URL], [GT], [GhiChu], [TheoDoi], [NgheDanh], [URL_img], [mans], [MaNhom]) VALUES (N'Nguyễn Khoa Tóc Tiên', NULL, NULL, NULL, NULL, NULL, NULL, N'Tóc Tiên', NULL, N'NS00000002', NULL)
INSERT [dbo].[NGHE_SI] ([TenNS], [NgaySinh], [QueQuan], [NS_URL], [GT], [GhiChu], [TheoDoi], [NgheDanh], [URL_img], [mans], [MaNhom]) VALUES (N'Charles Otto "Charlie" Puth Jr.[', CAST(N'1991-01-12' AS Date), N'Rumson, bang New Jersey, Mỹ', N'https://vi.wikipedia.org/wiki/Charlie_Puth', NULL, NULL, NULL, N'Charlie Puth', N'System.Web.HttpPostedFileWrapper', N'NS00000004', NULL)
INSERT [dbo].[NGHE_SI] ([TenNS], [NgaySinh], [QueQuan], [NS_URL], [GT], [GhiChu], [TheoDoi], [NgheDanh], [URL_img], [mans], [MaNhom]) VALUES (N'Nguyễn Thanh Tùng', NULL, N'Thái Bình, Việt Nam', N'https://vi.wikipedia.org/wiki/S%C6%A1n_T%C3%B9ng_M-TP', NULL, NULL, NULL, N'Sơn Tùng MTP', N'System.Web.HttpPostedFileWrapper', N'NS00000005', NULL)
INSERT [dbo].[NGHE_SI] ([TenNS], [NgaySinh], [QueQuan], [NS_URL], [GT], [GhiChu], [TheoDoi], [NgheDanh], [URL_img], [mans], [MaNhom]) VALUES (N'3ewfd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'~/Assets/img/album/Adele_21.jpg', N'NS00000006', N'NH00000001')
GO
INSERT [dbo].[NHOM] ([TenNhom], [NgayThanhLap], [SoThanhVien], [URL_img], [URL_link], [MaNHOM]) VALUES (N'BlackPink', NULL, NULL, NULL, NULL, N'NH00000001')
GO
INSERT [dbo].[PHAN_QUYEN] ([MaPQ], [TenQuyen], [Ghichu]) VALUES (N'PQ001', N'Admin', NULL)
INSERT [dbo].[PHAN_QUYEN] ([MaPQ], [TenQuyen], [Ghichu]) VALUES (N'PQ002', N'KhachHang', NULL)
GO
INSERT [dbo].[SAN_PHAM] ([TenSP], [SangTac], [SP_URL], [Theloai], [TrangThai], [LuotNghe], [GhiChu], [YeuThich], [KhongYeuThich], [TGPhatHanh], [MaSP], [ThoiGian]) VALUES (N'Vũ Điệu Cồng Chiêng', N'Lưu Thiên Hương', N'assests_mp3_vdcc.mp3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SP00000001', CAST(N'00:03:24' AS Time))
INSERT [dbo].[SAN_PHAM] ([TenSP], [SangTac], [SP_URL], [Theloai], [TrangThai], [LuotNghe], [GhiChu], [YeuThich], [KhongYeuThich], [TGPhatHanh], [MaSP], [ThoiGian]) VALUES (N'Ngày Tận Thế', N'Châu Đăng Khoa', N'assests_mp3_ntt.mp3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SP00000002', CAST(N'00:03:52' AS Time))
INSERT [dbo].[SAN_PHAM] ([TenSP], [SangTac], [SP_URL], [Theloai], [TrangThai], [LuotNghe], [GhiChu], [YeuThich], [KhongYeuThich], [TGPhatHanh], [MaSP], [ThoiGian]) VALUES (N'Có ai thương em như anh', NULL, N'assests_mp3_catena.mp3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SP00000003', CAST(N'00:03:51' AS Time))
INSERT [dbo].[SAN_PHAM] ([TenSP], [SangTac], [SP_URL], [Theloai], [TrangThai], [LuotNghe], [GhiChu], [YeuThich], [KhongYeuThich], [TGPhatHanh], [MaSP], [ThoiGian]) VALUES (N'Em Đã Có Người Mới', NULL, N'assests_mp3_edcnm.mp3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SP00000004', CAST(N'00:03:20' AS Time))
GO
INSERT [dbo].[TRINH_BAY] ([MaNS], [MaSP], [GhiChu]) VALUES (N'NS00000002', N'SP00000001', NULL)
INSERT [dbo].[TRINH_BAY] ([MaNS], [MaSP], [GhiChu]) VALUES (N'NS00000002', N'SP00000002', NULL)
INSERT [dbo].[TRINH_BAY] ([MaNS], [MaSP], [GhiChu]) VALUES (N'NS00000002', N'SP00000003', NULL)
INSERT [dbo].[TRINH_BAY] ([MaNS], [MaSP], [GhiChu]) VALUES (N'NS00000002', N'SP00000004', NULL)
GO
ALTER TABLE [dbo].[ADMIN]  WITH CHECK ADD FOREIGN KEY([MaPQ])
REFERENCES [dbo].[PHAN_QUYEN] ([MaPQ])
GO
ALTER TABLE [dbo].[ALbum]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACH_HANG] ([MaKH])
GO
ALTER TABLE [dbo].[ALbum]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SAN_PHAM] ([MaSP])
GO
ALTER TABLE [dbo].[KHACH_HANG]  WITH CHECK ADD FOREIGN KEY([MaPQ])
REFERENCES [dbo].[PHAN_QUYEN] ([MaPQ])
GO
ALTER TABLE [dbo].[NGHE]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACH_HANG] ([MaKH])
GO
ALTER TABLE [dbo].[NGHE]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SAN_PHAM] ([MaSP])
GO
ALTER TABLE [dbo].[NGHE_SI]  WITH CHECK ADD FOREIGN KEY([MaNhom])
REFERENCES [dbo].[NHOM] ([MaNHOM])
GO
ALTER TABLE [dbo].[THEO_DOI]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACH_HANG] ([MaKH])
GO
ALTER TABLE [dbo].[TRINH_BAY]  WITH CHECK ADD FOREIGN KEY([MaNS])
REFERENCES [dbo].[NGHE_SI] ([mans])
GO
ALTER TABLE [dbo].[TRINH_BAY]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SAN_PHAM] ([MaSP])
GO
ALTER TABLE [dbo].[TRUY_CAP_TM]  WITH CHECK ADD FOREIGN KEY([makh])
REFERENCES [dbo].[KHACH_HANG] ([MaKH])
GO
ALTER TABLE [dbo].[TRUY_CAP_TM]  WITH CHECK ADD FOREIGN KEY([maTM])
REFERENCES [dbo].[TIN_MOI] ([MaTM])
GO
ALTER TABLE [dbo].[YEU_THICH]  WITH CHECK ADD FOREIGN KEY([makh])
REFERENCES [dbo].[KHACH_HANG] ([MaKH])
GO
ALTER TABLE [dbo].[YEU_THICH]  WITH CHECK ADD FOREIGN KEY([masp])
REFERENCES [dbo].[SAN_PHAM] ([MaSP])
GO
USE [master]
GO
ALTER DATABASE [WebMusic] SET  READ_WRITE 
GO
