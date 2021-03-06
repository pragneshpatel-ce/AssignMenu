USE [master]
GO
/****** Object:  Database [dbDemoSoft_j]    Script Date: 3/28/2018 5:15:49 PM ******/
CREATE DATABASE [dbDemoSoft_j]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbDemoSoft_j', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\dbDemoSoft_j.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'dbDemoSoft_j_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\dbDemoSoft_j_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [dbDemoSoft_j] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbDemoSoft_j].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbDemoSoft_j] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbDemoSoft_j] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbDemoSoft_j] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbDemoSoft_j] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbDemoSoft_j] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbDemoSoft_j] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbDemoSoft_j] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbDemoSoft_j] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbDemoSoft_j] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbDemoSoft_j] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbDemoSoft_j] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbDemoSoft_j] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbDemoSoft_j] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbDemoSoft_j] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbDemoSoft_j] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbDemoSoft_j] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbDemoSoft_j] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbDemoSoft_j] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbDemoSoft_j] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbDemoSoft_j] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbDemoSoft_j] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbDemoSoft_j] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbDemoSoft_j] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbDemoSoft_j] SET  MULTI_USER 
GO
ALTER DATABASE [dbDemoSoft_j] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbDemoSoft_j] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbDemoSoft_j] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbDemoSoft_j] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [dbDemoSoft_j] SET DELAYED_DURABILITY = DISABLED 
GO
USE [dbDemoSoft_j]
GO
/****** Object:  Table [dbo].[MapTable]    Script Date: 3/28/2018 5:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MapTable](
	[MapId] [int] IDENTITY(1,1) NOT NULL,
	[loginid] [int] NULL,
	[HTMLID] [int] NULL,
	[ParentId] [int] NULL,
	[IsActive] [bit] NULL CONSTRAINT [DF_MapTable_IsActive]  DEFAULT ((0)),
 CONSTRAINT [PK_MapTable] PRIMARY KEY CLUSTERED 
(
	[MapId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbBillTypeMaster]    Script Date: 3/28/2018 5:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbBillTypeMaster](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[BillTypeName] [varchar](200) NULL,
	[TaxLocation] [int] NULL,
	[TaxWay] [int] NULL,
	[TaxClassId] [bigint] NULL,
	[SalePurHeadType] [int] NULL,
	[TaxTypeId] [int] NULL,
	[BillHeading] [varchar](200) NULL,
	[BillDesc] [varchar](200) NULL,
	[TaxStatus] [int] NULL,
	[isPublished] [int] NULL,
 CONSTRAINT [PK_tbBillTypeMaster] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbemHead]    Script Date: 3/28/2018 5:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbemHead](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[InnerHtml] [varchar](200) NULL,
	[Url] [varchar](100) NULL,
	[ParentId] [int] NULL,
	[LoginID] [int] NULL,
	[isPublish] [int] NULL,
 CONSTRAINT [PK_tbemHead] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbemp]    Script Date: 3/28/2018 5:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbemp](
	[empid] [bigint] IDENTITY(1,1) NOT NULL,
	[empnam] [varchar](200) NULL,
	[empage] [datetime] NULL,
	[empsex] [varchar](10) NULL,
	[empdesc] [varchar](500) NULL,
	[empcode] [varchar](100) NULL,
	[empadd] [varchar](500) NULL,
	[empmbl] [varchar](50) NULL,
	[empphn] [varchar](50) NULL,
	[isPublish] [int] NULL,
	[isCrtId] [int] NULL,
	[isCrtDate] [datetime] NULL,
	[isUpdId] [int] NULL,
	[isUpdDate] [datetime] NULL,
 CONSTRAINT [PK_tbemp] PRIMARY KEY CLUSTERED 
(
	[empid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbSeriesMst]    Script Date: 3/28/2018 5:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbSeriesMst](
	[sid] [bigint] IDENTITY(1,1) NOT NULL,
	[SName] [varchar](100) NULL,
	[SStartNo] [bigint] NULL,
	[SeriesBillType] [int] NULL,
	[IsPublish] [int] NULL,
	[isPrefix] [varchar](100) NULL,
	[isPostfix] [varchar](100) NULL,
	[isSetDefault] [int] NULL,
	[PrinterBillNameId] [bigint] NULL,
 CONSTRAINT [PK_tbSeriesMst] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbStoreMst]    Script Date: 3/28/2018 5:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbStoreMst](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[StoreName] [varchar](100) NULL,
	[SetDef] [int] NULL,
	[AccAssociat] [numeric](18, 0) NULL,
	[isPublish] [int] NULL,
 CONSTRAINT [PK_tbStoreMst] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbusr]    Script Date: 3/28/2018 5:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbusr](
	[usrid] [int] IDENTITY(1,1) NOT NULL,
	[usrempid] [bigint] NULL,
	[usrnam] [varchar](100) NULL,
	[usrpass] [varchar](100) NULL,
	[usrdesc] [varchar](500) NULL,
	[isPublished] [int] NULL,
	[StoreId] [int] NULL,
	[IsCrtId] [int] NULL,
	[IsCrtDate] [datetime] NULL,
	[IsUpdId] [int] NULL,
	[IsUpdDate] [datetime] NULL,
 CONSTRAINT [PK_tbusr] PRIMARY KEY CLUSTERED 
(
	[usrid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[MapTable] ON 

INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (1417, 35, 7, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (4659, 34, 7, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (4660, 34, 20, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (4974, 15, 13, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (4975, 15, 14, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (4976, 15, 107, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (4977, 15, 110, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (4978, 15, 111, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (4979, 15, 114, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (4980, 15, 115, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (4981, 15, 116, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (4982, 15, 134, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (4983, 15, 15, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (4984, 15, 16, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (4985, 15, 17, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (4986, 15, 25, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (4987, 15, 26, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (4988, 15, 28, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (4989, 15, 40, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (4990, 15, 46, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (4991, 15, 67, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (4992, 15, 90, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (4993, 15, 126, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (4994, 15, 136, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (4995, 15, 137, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (4996, 15, 7, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (4997, 15, 8, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (4998, 15, 9, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (4999, 15, 10, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5000, 15, 11, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5001, 15, 29, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5002, 15, 31, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5003, 15, 68, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5004, 15, 20, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5005, 15, 21, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5006, 15, 22, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5007, 15, 23, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5008, 15, 24, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5009, 15, 30, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5010, 15, 32, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5011, 15, 69, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5012, 15, 98, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5013, 15, 12, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5014, 15, 33, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5015, 15, 34, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5016, 15, 35, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5017, 15, 36, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5018, 15, 37, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5019, 15, 38, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5020, 15, 39, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5021, 15, 41, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5022, 15, 42, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5023, 15, 43, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5024, 15, 44, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5025, 15, 45, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5026, 15, 84, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5027, 15, 85, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5028, 15, 89, NULL, 1)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5357, 40, 1, 0, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5358, 40, 2, 0, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5359, 40, 3, 0, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5360, 40, 4, 0, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5361, 40, 7, 3, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5362, 40, 8, 3, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5363, 40, 9, 3, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5364, 40, 10, 3, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5365, 40, 11, 3, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5366, 40, 12, 19, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5367, 40, 13, 1, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5368, 40, 14, 13, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5369, 40, 15, 1, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5370, 40, 16, 1, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5371, 40, 17, 1, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5372, 40, 18, 2, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5373, 40, 19, 0, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5374, 40, 20, 4, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5375, 40, 21, 4, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5376, 40, 22, 4, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5377, 40, 23, 4, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5378, 40, 24, 4, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5379, 40, 25, 1, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5380, 40, 26, 1, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5381, 40, 27, 2, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5382, 40, 28, 1, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5383, 40, 29, 3, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5384, 40, 30, 4, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5385, 40, 31, 3, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5386, 40, 32, 4, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5387, 40, 33, 19, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5388, 40, 34, 19, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5389, 40, 35, 19, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5390, 40, 36, 19, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5391, 40, 37, 19, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5392, 40, 38, 19, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5393, 40, 39, 19, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5394, 40, 40, 1, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5395, 40, 41, 19, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5396, 40, 42, 41, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5397, 40, 43, 41, 0)
GO
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5398, 40, 44, 41, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5399, 40, 45, 41, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5400, 40, 46, 1, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5401, 40, 67, 1, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5402, 40, 68, 3, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5403, 40, 69, 4, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5404, 40, 70, 2, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5405, 40, 83, 19, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5406, 40, 84, 19, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5407, 40, 85, 19, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5408, 40, 86, 19, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5409, 40, 89, 19, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5410, 40, 90, 1, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5411, 40, 91, 19, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5412, 40, 92, 1, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5413, 40, 93, 1, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5414, 40, 94, 93, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5415, 40, 95, 93, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5416, 40, 96, 93, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5417, 40, 97, 93, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5418, 40, 98, 4, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5419, 40, 99, 13, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5420, 40, 102, 106, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5421, 40, 104, 106, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5422, 40, 105, 106, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5423, 40, 106, 1, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5424, 40, 107, 13, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5425, 40, 108, 13, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5426, 40, 109, 2, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5427, 40, 110, 13, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5428, 40, 111, 13, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5429, 40, 112, 13, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5430, 40, 113, 13, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5431, 40, 114, 13, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5432, 40, 115, 13, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5433, 40, 116, 13, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5434, 40, 117, 13, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5435, 40, 118, 13, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5436, 40, 119, 13, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5437, 40, 120, 13, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5438, 40, 121, 13, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5439, 40, 122, 13, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5440, 40, 123, 13, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5441, 40, 125, 19, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5442, 40, 126, 1, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5443, 40, 127, 125, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5444, 40, 128, 1, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5445, 40, 129, 125, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5446, 40, 130, 1, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5447, 40, 131, 125, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5448, 40, 133, 19, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5449, 40, 134, 13, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5450, 40, 136, 1, 0)
INSERT [dbo].[MapTable] ([MapId], [loginid], [HTMLID], [ParentId], [IsActive]) VALUES (5451, 40, 137, 1, 0)
SET IDENTITY_INSERT [dbo].[MapTable] OFF
SET IDENTITY_INSERT [dbo].[tbBillTypeMaster] ON 

INSERT [dbo].[tbBillTypeMaster] ([id], [BillTypeName], [TaxLocation], [TaxWay], [TaxClassId], [SalePurHeadType], [TaxTypeId], [BillHeading], [BillDesc], [TaxStatus], [isPublished]) VALUES (22, N'SAleTax Inclusive Tax Free', 1, 1, 21, 2, 1, N'Bill Head', N'Bill Desc', 8, 0)
INSERT [dbo].[tbBillTypeMaster] ([id], [BillTypeName], [TaxLocation], [TaxWay], [TaxClassId], [SalePurHeadType], [TaxTypeId], [BillHeading], [BillDesc], [TaxStatus], [isPublished]) VALUES (24, N'Tax Inclusive Free(Pur)', 2, 1, 22, 1, 1, N'Bill head', N'Bill  Desc Pur', 2, 0)
INSERT [dbo].[tbBillTypeMaster] ([id], [BillTypeName], [TaxLocation], [TaxWay], [TaxClassId], [SalePurHeadType], [TaxTypeId], [BillHeading], [BillDesc], [TaxStatus], [isPublished]) VALUES (27, N'SaleMulti Tax/Ret', 3, 1, 22, 2, 1, N'Bill Head Multi', N'Bill Desc Multi', 13, 1)
INSERT [dbo].[tbBillTypeMaster] ([id], [BillTypeName], [TaxLocation], [TaxWay], [TaxClassId], [SalePurHeadType], [TaxTypeId], [BillHeading], [BillDesc], [TaxStatus], [isPublished]) VALUES (28, N'MultiTax (Pur)', 3, 1, 21, 1, 1, N'Pur Head2', N'Pur Desc2', 5, 1)
SET IDENTITY_INSERT [dbo].[tbBillTypeMaster] OFF
SET IDENTITY_INSERT [dbo].[tbemHead] ON 

INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (1, N'Masters', NULL, NULL, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (2, N'MasterEdit', NULL, NULL, 1, 0)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (3, N'Transactions', NULL, NULL, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (4, N'TransactionEdit', NULL, NULL, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (7, N'Sale', N'sale/AddNew', 3, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (8, N'Purchase', N'ArtStockIn.aspx', 3, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (9, N'Journal', N'Journal/AddNew', 3, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (10, N'Accout Receipt', N'AccCashReceipt.aspx', 3, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (11, N'Accout Payment', N'AccCashPayment.aspx', 3, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (12, N'Sale Report', N'WebPages/SaleDatWise.aspx', 19, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (13, N'Product Master', N'', 1, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (14, N'Catageories Master', N'Categories/Index', 13, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (15, N'AccountMaster', N'PartyMst', 1, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (16, N'EmployeMaster', N'Employee', 1, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (17, N'Application Security', N'AppSecurity', 1, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (18, N'AccountEdit', N'AccountEdit.aspx', 2, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (19, N'Reports', NULL, NULL, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (20, N'SaleEdit', N'sale/edit', 4, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (21, N'PurchaseEdit', N'PurchaseEdit.aspx', 4, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (22, N'JournalEdit', N'Journal/index', 4, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (23, N'AccountPaymentEdit', N'AccPayEdit.aspx', 4, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (24, N'AccoutReceiptEdit', N'AccRecEdit.aspx', 4, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (25, N'SaleBillType', N'SBillType', 1, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (26, N'PurchaseBillType', N'PBillType', 1, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (27, N'TaxClassEdit', N'TaxClassEdit.aspx', 2, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (28, N'TaxClassMaster', N'TaxClass', 1, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (29, N'Purchase Return', N'ArtStockInRet.aspx', 3, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (30, N'PurchaseReturnEdit', N'PurchaseRetEdit.aspx', 4, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (31, N'SaleReturn', N'ArtStockOutRet.aspx', 3, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (32, N'SaleReturnEdit', N'SaleEditRet.aspx', 4, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (33, N'Account  Report', N'AccLedgerDatWise.aspx', 19, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (34, N'Purchase Report', N'PurDatWise.aspx', 19, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (35, N'Sale Return Report', N'SaleRetDatWise.aspx', 19, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (36, N'Purchase Return Report', N'PurRetDatWise.aspx', 19, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (37, N'Journal Report', N'JouDatWise.aspx', 19, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (38, N'Acc Receipt Report', N'AccRecDatWise.aspx', 19, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (39, N'Acc Payment Report', N'AccPayDatWise.aspx', 19, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (40, N'Accout Group', N'AccGrpMaster.aspx', 1, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (41, N'Inventry Reports', NULL, 19, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (42, N'Total Stock Report', N'GroupWiseDetail.aspx', 41, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (43, N'Cat. Wise Stock Reports', N'CatWiseDetail.aspx', 41, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (44, N'Item Wise Stock Report', N'ItemWiseDetail.aspx', 41, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (45, N'Diagonises  Stock Report', N'QtyWiseDetail.aspx', 41, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (46, N'Anexure', N'Anexure.aspx', 1, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (67, N'Series Master', N'Series', 1, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (68, N'Account Bank', N'AccBank.aspx', 3, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (69, N'Account Bank Edit', N'AccBankEdit.aspx', 4, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (70, N'ItemEdit', N'ItemEdit.aspx', 2, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (83, N'Sale Report GroupWise', N'GrpSaleDatWise.aspx', 19, 1, 0)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (84, N'Sale Report Itemwise', N'SaleItemDatWise.aspx', 19, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (85, N'Pur Report ItemWise', N'PurItemDatWise.aspx', 19, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (86, N'Profit Reports', N'NetProfitsDateWise.aspx', 19, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (89, N'Sale Detail DateWise', N'SaleDetDatWise.aspx', 19, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (90, N'Bill Discount Master', N'BillDisMaster.aspx', 1, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (91, N'Sale StaffWIse', N'SaleEmpDatWise.aspx', 19, 1, 0)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (92, N'CatMasterExtra', N'CatItemDisSet.aspx', 1, 1, 0)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (93, N'Hospital', NULL, 1, 1, 0)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (94, N'Opd TurnNo', N'OpdTurnNo.aspx', 93, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (95, N'Opd Series No', N'OpdCounter.aspx', 93, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (96, N'OpdSeriesNo DoctorWise', N'OpdDoctorReg.aspx', 93, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (97, N'Opd Fees Type', N'OpdAmount.aspx', 93, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (98, N'Hospital Opd', N'OpdEdit.aspx', 4, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (99, N'Sub Categories', N'SubCatageories.aspx', 13, 1, 0)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (102, N'Time Slab Master', N'TimeSlabMaster.aspx', 106, 1, 0)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (104, N'TimeSlab Citywise', N'TimeCityWise.aspx', 106, 1, 0)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (105, N'TimeSlab AreaWise', N'TimeAreaWise.aspx', 106, 1, 0)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (106, N'TimeSlab', NULL, 1, 1, 0)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (107, N'ItemMaster', N'Items', 13, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (108, N'Sub Items ', N'SubItem.aspx', 13, 1, 0)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (109, N'Sub Items Edit', N'SubItemEdit.aspx', 2, 1, 0)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (110, N'City Master', N'City', 13, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (111, N'Area Master', N'AreaMaster', 13, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (112, N'Measure Master', N'MeasureMst.aspx', 13, 1, 0)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (113, N'Items City Wise', N'ItemCityWise.aspx', 13, 1, 0)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (114, N'Country Master', N'Country', 13, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (115, N'State Master', N'State', 13, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (116, N'District Master', N'DistrictMaster.aspx', 13, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (117, N'Splash Banner', N'SplashBanner.aspx', 13, 1, 0)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (118, N'Slider Banner', N'SliderBanner.aspx', 13, 1, 0)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (119, N'Popup Banner', N'PopupBanner.aspx', 13, 1, 0)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (120, N'Quick Links Head', N'QuickLinkHead.aspx', 13, 1, 0)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (121, N'Quick Links Sub', N'QuickLinkSub.aspx', 13, 1, 0)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (122, N'Coupon Masterdd', N'CouponCode.aspx', 13, 1, 0)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (123, N'Sub Category Banner', N'SubCatBanner.aspx', 13, 1, 0)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (125, N'App Orders', N'', 19, 1, 0)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (126, N'Bill Sundry', N'BillAddition.aspx', 1, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (127, N'AppOrder TimeSlabWise', N'AppOrderDetail.aspx', 125, 1, 0)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (128, N'Others Bill Master', N'AppBillMaster.aspx', 1, 1, 0)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (129, N'Order TimeSlab Area Wise', N'19', 125, 1, 0)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (130, N'App Notification', N'AppNotification.aspx', 1, 1, 0)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (131, N'AllAppOrderDetail', N'AllAppOrderDetail.aspx', 125, 1, 0)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (133, N'Client Register Details', N'ClientDetailCityWise.aspx', 19, 1, 0)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (134, N'ItemPrices', N'ItemPrices', 13, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (136, N'Unit Master', N'Unit', 1, 1, 1)
INSERT [dbo].[tbemHead] ([ID], [InnerHtml], [Url], [ParentId], [LoginID], [isPublish]) VALUES (137, N'Unit Convertion', N'UnitConversion', 1, 1, 1)
SET IDENTITY_INSERT [dbo].[tbemHead] OFF
SET IDENTITY_INSERT [dbo].[tbemp] ON 

INSERT [dbo].[tbemp] ([empid], [empnam], [empage], [empsex], [empdesc], [empcode], [empadd], [empmbl], [empphn], [isPublish], [isCrtId], [isCrtDate], [isUpdId], [isUpdDate]) VALUES (3, N'Adminstrator', NULL, N'M', N'dfd', N'c10525', N'sdfd', N'9814609269', N'018269-96633', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbemp] ([empid], [empnam], [empage], [empsex], [empdesc], [empcode], [empadd], [empmbl], [empphn], [isPublish], [isCrtId], [isCrtDate], [isUpdId], [isUpdDate]) VALUES (13, N'Sunil', NULL, N'M', N'df', N'546', N'jdfj', N'jdf', N'dfj', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbemp] ([empid], [empnam], [empage], [empsex], [empdesc], [empcode], [empadd], [empmbl], [empphn], [isPublish], [isCrtId], [isCrtDate], [isUpdId], [isUpdDate]) VALUES (14, N'Maninder', CAST(N'2016-12-15 00:00:00.000' AS DateTime), N'F', N'998', N'MA', N'908', N'898', N'89', 1, 3, CAST(N'2016-12-16 14:02:30.227' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[tbemp] OFF
SET IDENTITY_INSERT [dbo].[tbSeriesMst] ON 

INSERT [dbo].[tbSeriesMst] ([sid], [SName], [SStartNo], [SeriesBillType], [IsPublish], [isPrefix], [isPostfix], [isSetDefault], [PrinterBillNameId]) VALUES (1, N'Estimate', 1, 2, 1, N'Sal', N'India', 0, NULL)
INSERT [dbo].[tbSeriesMst] ([sid], [SName], [SStartNo], [SeriesBillType], [IsPublish], [isPrefix], [isPostfix], [isSetDefault], [PrinterBillNameId]) VALUES (4, N'Purchase', 1, 1, 1, N'P-', N'-E', NULL, NULL)
INSERT [dbo].[tbSeriesMst] ([sid], [SName], [SStartNo], [SeriesBillType], [IsPublish], [isPrefix], [isPostfix], [isSetDefault], [PrinterBillNameId]) VALUES (5, N'PurRet', 1, 3, 1, N'Pret-', N'-E(Pret)', NULL, NULL)
INSERT [dbo].[tbSeriesMst] ([sid], [SName], [SStartNo], [SeriesBillType], [IsPublish], [isPrefix], [isPostfix], [isSetDefault], [PrinterBillNameId]) VALUES (18, N'SaleReturn', 1, 4, 1, N'SRetS', N'END', NULL, NULL)
INSERT [dbo].[tbSeriesMst] ([sid], [SName], [SStartNo], [SeriesBillType], [IsPublish], [isPrefix], [isPostfix], [isSetDefault], [PrinterBillNameId]) VALUES (19, N'Journal', 1, 5, 1, N'Jou', N'Post', NULL, NULL)
INSERT [dbo].[tbSeriesMst] ([sid], [SName], [SStartNo], [SeriesBillType], [IsPublish], [isPrefix], [isPostfix], [isSetDefault], [PrinterBillNameId]) VALUES (20, N'Acc.Receipt', 1, 6, 1, N'SRec', N'RecE', NULL, NULL)
INSERT [dbo].[tbSeriesMst] ([sid], [SName], [SStartNo], [SeriesBillType], [IsPublish], [isPrefix], [isPostfix], [isSetDefault], [PrinterBillNameId]) VALUES (21, N'Acc.Payment', 1, 7, 1, N'SP', N'EP', NULL, NULL)
INSERT [dbo].[tbSeriesMst] ([sid], [SName], [SStartNo], [SeriesBillType], [IsPublish], [isPrefix], [isPostfix], [isSetDefault], [PrinterBillNameId]) VALUES (23, N'bankSeries', 1, 8, 1, N'BK-', N'-India', NULL, NULL)
INSERT [dbo].[tbSeriesMst] ([sid], [SName], [SStartNo], [SeriesBillType], [IsPublish], [isPrefix], [isPostfix], [isSetDefault], [PrinterBillNameId]) VALUES (24, N'Banknew', 1, 8, 1, N'TTT', N'', NULL, NULL)
INSERT [dbo].[tbSeriesMst] ([sid], [SName], [SStartNo], [SeriesBillType], [IsPublish], [isPrefix], [isPostfix], [isSetDefault], [PrinterBillNameId]) VALUES (25, N'Journal-2', 1, 5, 1, N'J', N'VocJ', NULL, NULL)
INSERT [dbo].[tbSeriesMst] ([sid], [SName], [SStartNo], [SeriesBillType], [IsPublish], [isPrefix], [isPostfix], [isSetDefault], [PrinterBillNameId]) VALUES (26, N'NewAccReceipt', 111, 6, 1, N'SRec', N'RecE', NULL, NULL)
INSERT [dbo].[tbSeriesMst] ([sid], [SName], [SStartNo], [SeriesBillType], [IsPublish], [isPrefix], [isPostfix], [isSetDefault], [PrinterBillNameId]) VALUES (27, N'AccPayment_New', 100, 7, 1, N'Acc', N'Pay', NULL, NULL)
INSERT [dbo].[tbSeriesMst] ([sid], [SName], [SStartNo], [SeriesBillType], [IsPublish], [isPrefix], [isPostfix], [isSetDefault], [PrinterBillNameId]) VALUES (28, N'SaleSpecial', 100, 2, 1, N'S', N'Spl', 0, NULL)
INSERT [dbo].[tbSeriesMst] ([sid], [SName], [SStartNo], [SeriesBillType], [IsPublish], [isPrefix], [isPostfix], [isSetDefault], [PrinterBillNameId]) VALUES (29, N'New Purchase', 200, 1, 1, N'PP', N'EEE', NULL, NULL)
INSERT [dbo].[tbSeriesMst] ([sid], [SName], [SStartNo], [SeriesBillType], [IsPublish], [isPrefix], [isPostfix], [isSetDefault], [PrinterBillNameId]) VALUES (30, N'Sale Return New', 100, 4, 1, N'SR', N'E', NULL, NULL)
INSERT [dbo].[tbSeriesMst] ([sid], [SName], [SStartNo], [SeriesBillType], [IsPublish], [isPrefix], [isPostfix], [isSetDefault], [PrinterBillNameId]) VALUES (31, N'P.Return-New', 200, 3, 1, N'PR-', N'-END', NULL, NULL)
INSERT [dbo].[tbSeriesMst] ([sid], [SName], [SStartNo], [SeriesBillType], [IsPublish], [isPrefix], [isPostfix], [isSetDefault], [PrinterBillNameId]) VALUES (33, N'Regd 2', 100, 10, 1, N'2016', N'End', 1, NULL)
INSERT [dbo].[tbSeriesMst] ([sid], [SName], [SStartNo], [SeriesBillType], [IsPublish], [isPrefix], [isPostfix], [isSetDefault], [PrinterBillNameId]) VALUES (34, N'AppBillNo', 1, 11, 1, N'Bill-', N'', 1, NULL)
INSERT [dbo].[tbSeriesMst] ([sid], [SName], [SStartNo], [SeriesBillType], [IsPublish], [isPrefix], [isPostfix], [isSetDefault], [PrinterBillNameId]) VALUES (35, N'AppOnlinePaymentOrderNo', 1, 12, 1, N'OPay', N'App', 1, NULL)
INSERT [dbo].[tbSeriesMst] ([sid], [SName], [SStartNo], [SeriesBillType], [IsPublish], [isPrefix], [isPostfix], [isSetDefault], [PrinterBillNameId]) VALUES (36, N'For Sale', 1, 2, 1, N'A', N'S', 1, 82445)
SET IDENTITY_INSERT [dbo].[tbSeriesMst] OFF
SET IDENTITY_INSERT [dbo].[tbStoreMst] ON 

INSERT [dbo].[tbStoreMst] ([id], [StoreName], [SetDef], [AccAssociat], [isPublish]) VALUES (CAST(1 AS Numeric(18, 0)), N'Main', 1, NULL, 1)
INSERT [dbo].[tbStoreMst] ([id], [StoreName], [SetDef], [AccAssociat], [isPublish]) VALUES (CAST(2 AS Numeric(18, 0)), N'Charu', 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[tbStoreMst] OFF
SET IDENTITY_INSERT [dbo].[tbusr] ON 

INSERT [dbo].[tbusr] ([usrid], [usrempid], [usrnam], [usrpass], [usrdesc], [isPublished], [StoreId], [IsCrtId], [IsCrtDate], [IsUpdId], [IsUpdDate]) VALUES (15, 3, N'a', N'a', N'', 1, NULL, NULL, NULL, 3, CAST(N'2016-12-15 23:19:49.690' AS DateTime))
INSERT [dbo].[tbusr] ([usrid], [usrempid], [usrnam], [usrpass], [usrdesc], [isPublished], [StoreId], [IsCrtId], [IsCrtDate], [IsUpdId], [IsUpdDate]) VALUES (34, 13, N's', N'a', N'', 1, NULL, NULL, NULL, 3, CAST(N'2016-12-15 22:33:04.567' AS DateTime))
INSERT [dbo].[tbusr] ([usrid], [usrempid], [usrnam], [usrpass], [usrdesc], [isPublished], [StoreId], [IsCrtId], [IsCrtDate], [IsUpdId], [IsUpdDate]) VALUES (35, 14, N'sa', N'sa', N'', 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbusr] ([usrid], [usrempid], [usrnam], [usrpass], [usrdesc], [isPublished], [StoreId], [IsCrtId], [IsCrtDate], [IsUpdId], [IsUpdDate]) VALUES (40, 3, N'Maninder', N'121212', N'', 1, NULL, 3, CAST(N'2017-01-15 17:11:11.987' AS DateTime), 3, CAST(N'2017-01-15 17:17:33.683' AS DateTime))
INSERT [dbo].[tbusr] ([usrid], [usrempid], [usrnam], [usrpass], [usrdesc], [isPublished], [StoreId], [IsCrtId], [IsCrtDate], [IsUpdId], [IsUpdDate]) VALUES (41, 3, N'JAsmine1', N'121212', N'', 1, NULL, 3, CAST(N'2017-01-15 17:11:46.803' AS DateTime), 3, CAST(N'2017-01-15 17:17:07.067' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbusr] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_tbusr]    Script Date: 3/28/2018 5:15:49 PM ******/
ALTER TABLE [dbo].[tbusr] ADD  CONSTRAINT [IX_tbusr] UNIQUE NONCLUSTERED 
(
	[usrnam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MapTable]  WITH CHECK ADD  CONSTRAINT [FK_MapTable_tbemHead] FOREIGN KEY([HTMLID])
REFERENCES [dbo].[tbemHead] ([ID])
GO
ALTER TABLE [dbo].[MapTable] CHECK CONSTRAINT [FK_MapTable_tbemHead]
GO
ALTER TABLE [dbo].[MapTable]  WITH CHECK ADD  CONSTRAINT [FK_MapTable_tbusr] FOREIGN KEY([loginid])
REFERENCES [dbo].[tbusr] ([usrid])
GO
ALTER TABLE [dbo].[MapTable] CHECK CONSTRAINT [FK_MapTable_tbusr]
GO
/****** Object:  StoredProcedure [dbo].[DspEmployeeMaster]    Script Date: 3/28/2018 5:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DspEmployeeMaster]

	    @Pageno  int  ,
		@PageSize int,
	    @sortOrder  int ,
		@searchString varchar(200) ,
		@TotalCount int =0 output

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
 Declare @Startno as int=0

		if(@Pageno <=1)
		Begin

		Set @Startno =0
		Set @Pageno = @Pageno *@PageSize

		END
		ELSE
		Begin
		
		Set @Pageno = @Pageno *@PageSize
		Set @Startno = @Pageno-@PageSize+1

		END

		Select * from (

select ROW_NUMBER()  OVER (ORDER BY empid) AS Rowno,* from (
select *
        
from tbemp --  and  ItemName  like'%'+@searchString+'%'  or ( isnull(@searchString,'0') ='0'  OR itembarcode = @searchString)
) k  where   empnam  like'%'+@searchString+'%' 
 
)t  where Rowno >=@Startno and Rowno <=@Pageno order by

  case when   @sortOrder =0
    then empid end desc, 

    case when @sortOrder =1
    then empnam end   ,
	case when @sortOrder =2
    then empnam end desc ,


   case when @sortOrder =5
    then isPublish end   ,
	case when @sortOrder =6
    then isPublish end desc 


	



	Select  @TotalCount = Count(*) from tbemp where

	 empnam  like'%'+@searchString+'%'  
END


GO
/****** Object:  StoredProcedure [dbo].[DspUserDetailEdit]    Script Date: 3/28/2018 5:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DspUserDetailEdit]

	    @Pageno  int  ,
		@PageSize int,
	    @sortOrder  int ,
		@searchString varchar(200) ,
		@TotalCount int =0 output

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
 Declare @Startno as int=0

		if(@Pageno <=1)
		Begin

		Set @Startno =0
		Set @Pageno = @Pageno *@PageSize

		END
		ELSE
		Begin
		
		Set @Pageno = @Pageno *@PageSize
		Set @Startno = @Pageno-@PageSize+1

		END

		Select * from (

select ROW_NUMBER()  OVER (ORDER BY usrid) AS Rowno,* from (
select *,(select empnam from tbemp where empid= usrempid)EmpName,
isnull( (Select isnull(StoreName,'')  from tbStoreMst   where tbStoreMst.id =StoreId),'') StoreName
        
from tbusr --  and  ItemName  like'%'+@searchString+'%'  or ( isnull(@searchString,'0') ='0'  OR itembarcode = @searchString)
) k  where   EmpName  like'%'+@searchString+'%' 
 
)t  where Rowno >=@Startno and Rowno <=@Pageno order by

  case when   @sortOrder =0
    then usrid end desc, 

    case when @sortOrder =1
    then EmpName end   ,
	case when @sortOrder =2
    then EmpName end desc ,

	  case when @sortOrder =5
    then isPublished end   ,
	case when @sortOrder =6
    then isPublished end desc 


  

	

  
END


GO
/****** Object:  StoredProcedure [dbo].[GetLoadPerMstLoginIdWise]    Script Date: 3/28/2018 5:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[GetLoadPerMstLoginIdWise]
  @UsrID int
AS
BEGIN

	;with cte as (
       select
           ID,InnerHtml,Url,ParentId,LoginID,isPublish
               
       from  tbemHead where  ID in(select  HTMLID from  MapTable where loginid =@UsrID)
       union all
       select
              t.ID,t.InnerHtml,t.Url,t.ParentId,t.LoginID,t.isPublish
               
       from tbemHead t
       inner join cte
               on cte.ParentId =  t.ID
)
select distinct * from cte  where isPublish=1 order by Id  

END



GO
/****** Object:  StoredProcedure [dbo].[RemainingMeni]    Script Date: 3/28/2018 5:15:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RemainingMeni]
	-- Add the parameters for the stored procedure here
	@Uid int
AS
BEGIN
	Select m.Id,m.InnerHtml,m.url,m.ParentId,m.LoginID,m.isPublish from tbemHead m where m.ID NOT IN(Select mt.HTMLID from MapTable mt where mt.loginid =@Uid)

END

GO
USE [master]
GO
ALTER DATABASE [dbDemoSoft_j] SET  READ_WRITE 
GO
