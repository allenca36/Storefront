/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.5026)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[UserDetails] DROP CONSTRAINT IF EXISTS [FK_UserDetails_AspNetUsers]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductType]') AND type in (N'U'))
ALTER TABLE [dbo].[ProductType] DROP CONSTRAINT IF EXISTS [FK_ProductType_SubType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [FK_Products_Status]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [FK_Products_ProductType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
ALTER TABLE [dbo].[Employees] DROP CONSTRAINT IF EXISTS [FK_Employees_Roles]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
ALTER TABLE [dbo].[Employees] DROP CONSTRAINT IF EXISTS [FK_Employees_Employees]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
ALTER TABLE [dbo].[Employees] DROP CONSTRAINT IF EXISTS [FK_Employees_Departments]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  Index [UserNameIndex]    Script Date: 12/10/2021 3:04:44 PM ******/
DROP INDEX IF EXISTS [UserNameIndex] ON [dbo].[AspNetUsers]
GO
/****** Object:  Index [IX_UserId]    Script Date: 12/10/2021 3:04:44 PM ******/
DROP INDEX IF EXISTS [IX_UserId] ON [dbo].[AspNetUserRoles]
GO
/****** Object:  Index [IX_RoleId]    Script Date: 12/10/2021 3:04:44 PM ******/
DROP INDEX IF EXISTS [IX_RoleId] ON [dbo].[AspNetUserRoles]
GO
/****** Object:  Index [IX_UserId]    Script Date: 12/10/2021 3:04:44 PM ******/
DROP INDEX IF EXISTS [IX_UserId] ON [dbo].[AspNetUserLogins]
GO
/****** Object:  Index [IX_UserId]    Script Date: 12/10/2021 3:04:44 PM ******/
DROP INDEX IF EXISTS [IX_UserId] ON [dbo].[AspNetUserClaims]
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 12/10/2021 3:04:44 PM ******/
DROP INDEX IF EXISTS [RoleNameIndex] ON [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 12/10/2021 3:04:44 PM ******/
DROP TABLE IF EXISTS [dbo].[UserDetails]
GO
/****** Object:  Table [dbo].[SubType]    Script Date: 12/10/2021 3:04:44 PM ******/
DROP TABLE IF EXISTS [dbo].[SubType]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 12/10/2021 3:04:44 PM ******/
DROP TABLE IF EXISTS [dbo].[Status]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12/10/2021 3:04:44 PM ******/
DROP TABLE IF EXISTS [dbo].[Roles]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 12/10/2021 3:04:44 PM ******/
DROP TABLE IF EXISTS [dbo].[ProductType]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/10/2021 3:04:44 PM ******/
DROP TABLE IF EXISTS [dbo].[Products]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 12/10/2021 3:04:44 PM ******/
DROP TABLE IF EXISTS [dbo].[Employees]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 12/10/2021 3:04:44 PM ******/
DROP TABLE IF EXISTS [dbo].[Departments]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/10/2021 3:04:44 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/10/2021 3:04:44 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/10/2021 3:04:44 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/10/2021 3:04:44 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/10/2021 3:04:44 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 12/10/2021 3:04:44 PM ******/
DROP TABLE IF EXISTS [dbo].[__MigrationHistory]
GO
/****** Object:  Database [StoreFront]    Script Date: 12/10/2021 3:04:44 PM ******/
DROP DATABASE IF EXISTS [StoreFront]
GO
/****** Object:  Database [StoreFront]    Script Date: 12/10/2021 3:04:44 PM ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'StoreFront')
BEGIN
CREATE DATABASE [StoreFront]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StoreFront', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\StoreFront.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StoreFront_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\StoreFront_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
END
GO
ALTER DATABASE [StoreFront] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StoreFront].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StoreFront] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StoreFront] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StoreFront] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StoreFront] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StoreFront] SET ARITHABORT OFF 
GO
ALTER DATABASE [StoreFront] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StoreFront] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StoreFront] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StoreFront] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StoreFront] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StoreFront] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StoreFront] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StoreFront] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StoreFront] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StoreFront] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StoreFront] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StoreFront] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StoreFront] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StoreFront] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StoreFront] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StoreFront] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StoreFront] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StoreFront] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StoreFront] SET  MULTI_USER 
GO
ALTER DATABASE [StoreFront] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StoreFront] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StoreFront] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StoreFront] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StoreFront] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StoreFront] SET QUERY_STORE = OFF
GO
USE [StoreFront]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 12/10/2021 3:04:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/10/2021 3:04:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/10/2021 3:04:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/10/2021 3:04:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/10/2021 3:04:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/10/2021 3:04:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 12/10/2021 3:04:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Departments]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Departments](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 12/10/2021 3:04:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Role] [int] NULL,
	[Salary] [money] NULL,
	[DateHired] [date] NULL,
	[DirectReportID] [int] NULL,
	[DepartmentID] [int] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/10/2021 3:04:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[ProductType] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[UnitsSold] [int] NULL,
	[StatusID] [int] NOT NULL,
	[ProductImage] [varchar](100) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 12/10/2021 3:04:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductType](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[ProductTypeName] [nvarchar](50) NOT NULL,
	[SubTypeID] [int] NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12/10/2021 3:04:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Roles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Status]    Script Date: 12/10/2021 3:04:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Status]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Status](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SubType]    Script Date: 12/10/2021 3:04:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SubType](
	[SubTypeID] [int] IDENTITY(1,1) NOT NULL,
	[SubTypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SubType] PRIMARY KEY CLUSTERED 
(
	[SubTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 12/10/2021 3:04:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserDetails](
	[UserID] [nvarchar](128) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[FavoriteColor] [varchar](7) NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202111022039032_InitialCreate', N'StoreFront.UI.MVC.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EE336107D2FD07F10F4D416592B97EE621BD85B649DA40DBAB9609D2CFAB6A025DA1156A2B412952628FA657DE827F5173A94A81B2FBAD88AED14058A581C9E190E67C8E170B8FFFEFDCFF8E747DF331E7014BB01999807A37DD3C0C40E1C972C27664217AFDE9A3FBFFBF69BF199E33F1A9F72BA2346073D493C31EF290D8F2D2BB6EFB18FE291EFDA5110070B3AB203DF424E601DEEEFFF641D1C5818204CC0328CF1C78450D7C7E90FF8390D888D439A20EF3270B017F3EFD0324B518D2BE4E33844369E98331A44F83C0A081DDD5D8C2E3F4D47591FD338F15C04F2CCB0B7300D4448401105698FEF623CA3D061390BE103F26E9F420C740BE4C5988FE2B824EF3AA0FD433620ABEC9843D9494C03BF27E0C111D79025765F49CF66A141D0E119E89A3EB151A77A9C98170E4E3F7D0C3C5080C8F078EA458C78625E162C4EE2F00AD351DE7194419E4700F747107D195511F78CCEFDF60A8B3A1CEDB3FFF68C69E2D124C21382131A216FCFB849E69E6BFF869F6E832F984C8E0EE68BA3B7AFDF20E7E8CD8FF8E87575A43056A0AB7D804F375110E20864C38B62FCA661D5FB5962C7A25BA54FA615B025700ED3B8448F1F3059D27B709BC3B7A671EE3E6227FFC28DEB8EB8E04BD0894609FCBC4A3C0FCD3D5CB45B8D3CD9FF1BB81EBE7E3308D72BF4E02ED3A917F883E344E0571FB197B6C6F76E98B9576DBE3F7332F0499FFDAEDB57D6FA79162491CD061368496E51B4C4B42EDDD82A8DB7934933A8E1CD3A47DD7DD36692CAE6AD2465035AC51372169BF6865CDEE7E5DBD9E24EC210262F352DA6912683D36D59230163CF90284B333AE86A460486F77F5E15CF7CE47A032C8B1DB8405CB270231F17A37C1F801122D25BE61B14C7B02A38BFA2F8BE4174F87300D167D84E2230D619457EF8ECDC6EEE0382AF127FCE7C6073BC069B9ADB3F82736483DF9D11D66B6DBC0F81FD2548E819714E11C577D4CE01D9CF5BD7EF0E30883827B68DE3F81C8C193BD300C2EE1CF082D0A3C3DE706C99DA765832F590EBABE3126141FD9C9396B1899A428A4F3464AA18A549D40FC1D225DD44CD49F5A26614ADA272B2BEA232B06E92724ABDA02941AB9C19D560515F3A43C3877D29ECEEC77DEB6DDEBAB5A0A2C63432F905131CC132E6DC204A7144CA19E8B26E6C235848A78F317DF6BD29E5F40979C9D0AC56F286741118DE1B52D8DDF786544CF8FCE03A2C2AE97018CA8901BE13BDFA9CD5EE7382649B7687DA3037CD7C336B80CE5D4EE238B0DDD40B1469309EC4A8CB0F319CD19ED1C846236645606060E82EDBF2E00B8CCD148DEA9A9C620F536C9CD8599A708A621B39B21A61404E0FC1F21D552158991DA90BF783C4132C1D47AC136287A0183CD52554760B97D86E88BC562D093D3B6E616CEC050FB1E51487983086AD9AE8C25C9D0C6102147C844969D3D0D8AA585CB3216AA256DD9CB785B0E5BC4B398A8DD8644BECACB14B1EBF3D8B61366B6C03C6D9AC922E0268137BDB30507E56E96A00E2C165D70C543831690C9487541B31D0BAC6B660A07595BC3803CD8EA85DE75F38AFEE9A79D60FCA9BDFD61BD5B505DBACE963C74C338B3DA10F851E3892CDF374CE1AF123551CCE404E7E3E8B79A82B9A08039F615A4FD994F1AE320EB59A4144236A022C0DAD05945F094A409243F5102ECFE5354AC7A3881EB079DEAD1196AFFD026CC50664ECEAD56885507F812A1A67A7D34731B2C21A2423EF7458A8E0280C425CBCEA03EFA0145D5E56564C9758B84F345C19189F8C0605B544AE1A25E583195C4BB969B66B491590F509C9D6D292103E69B4940F66702D711B6D57922228E81116ACA5A2FA163E90B3E5998E62B729DAC6565637C53F8C2D4D81D5F81285A14B9695822BFEC59865D556D357B3FE05487E8661D9B1A20EA990B6E04483082DB1D00AAC41D273378AE929A2688E589E67EAF81299726FD52CFF39CBEAF6294F62BE0FE4D4EC6F7EB3AABBC8AFEDB87248C291CE619C3E8B6B521C8515A8BB1BAC0C0E792852E4EFA78197F8441F66E97B67B778D5FED91719616C09F24B6194A43329D8AD4F40A7E9915D63D0A92A6299D5A74B0FA1537A1E8956D5AE8B4EF52879B2AA8AA24B606D6DFA7441CD0A5326468DFD67AC15E1797C8C97AA5401F8A79E18956A0709ACD2D61DB55E9052C5ACB7744714AA4EAA9042530F29ABB5253521AB0D2BE16934AAA6E8CE41AE26A9A2CBADDD91157525556845F30AD80A99C5B6EEA88AD2932AB0A2B93B765987222EA53BBC8B69CF326B6E63D9A177BD7D4C83F13CEBE230DB60E56EBF0A54F9DC138BDFDE4B60FCFB4EDA94F6E4B7A64D65198FF56C4A83A15F856A77E3F545A8F1425F8F59BBF0AE2DF44D17FE7ABC7E96FBACF6211DFF4492827B710C148E7B637EF46A7F74239DC53212D3C8D50856F51453EC8F18C168F6D59B7A2E664B7A4E708988BBC031CD8A3CCCC3FD8343E1C5CEEEBC9EB1E2D8F1144757DD139AFA9C6DA05E8B3CA0C8BE47915C3DB1C60B9312544A4C5F10073F4ECC3FD35EC7698E83FD957EDE332EE23BE27E4DA0E1364AB0F1975C0D3A4CC57D87371E85A07FBD88C713DD557EF1FBE7ACEB9E711D813B1D1BFB82A25799FEFA938A5ED2645DD79066E587162FD7DB6A2F1794A882B7ACFE5061EED2411E29E4527EE7A3C7EFFB8AA67C88B016A2E2B1C1507883A850F79860152CED4302077ED2F42141BFC1AA1F16AC229AF651814BFA83894F0ABA2F4379CF2DEE438A63D32696A454CFAD25D96BD5676E7B6F922AB7D77274B93ABB07DCA015D8EB85282FACB279B0AD5351B83C18F636EDFED9AB9577A540B90CDAB75B97BCC952E4862BA6FF5505F20ED4CC296A80B65F67BC695BD3E58177BC58B35F35F18E191BDFE6B75F33BC6963D3258877DCD87A5506EF98AD6D6BFFDCB2A575DE42B75EE72B972C69EE735459E4B63ADE2CE50EC7FF790046904594D9F34B75E15853D16B0BC39244CF545FB12632961C47E22B5134B3ED3756BEE1370E96D334B3D5D47936F1E6EB7F236F4ED3CC5B533DB98D0A6465FDA2AA2ABC651D6B2AA87A4915C7B591B414B8B7C5AC8D97F32FA9C07810A5D4BC4773BBFC72EA890751C990AED3A37E58BE2886BDB3F26F38C2FE1DBBCB1282FD8B8E04DBB55DB3A0B9208B20DFBC05897212214373892972604B3D89A8BB4036856696804EDF8FA7493D760D32C7CE05B94E6898501832F6E75E2DE1C5828026FE6991745DE6F175C87EC5430C01C47459E2FE9ABC4F5CCF29E43E57E48434102CBAE0E95E369794A57D974F05D255403A0271F51541D12DF6430FC0E26B32430F7815D9C0FC3EE025B29FCA0CA00EA47D22EA6A1F9FBA6819213FE618657FF80936ECF88FEFFE031800276BCA540000, N'6.2.0-61023')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'037f4825-4207-4908-9418-3cafffa0f152', N'Admin')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'219b1af1-f847-4713-9c79-c3a032b544ce', N'037f4825-4207-4908-9418-3cafffa0f152')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3b524184-23fd-40a7-8fb0-e2a5da2a3a74', N'037f4825-4207-4908-9418-3cafffa0f152')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'62a89a8c-c21e-41bb-b860-7e2aeea93519', N'037f4825-4207-4908-9418-3cafffa0f152')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'00c6a81e-cc85-4ae0-9b45-d1253fd0ffcc', N'userL@test.com', 0, N'AA+Q1KslJNo4E8qAmvTGB16gbIgJpGtrFLqbvom4dcdfGk2a9qc6cP1lz5gWimPYfg==', N'0386e67f-b7c5-4a9b-b2a4-576f5f308f2f', NULL, 0, 0, NULL, 1, 0, N'userL@test.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'219b1af1-f847-4713-9c79-c3a032b544ce', N'admin@website.com', 0, N'AO8ZD/VD3njPd+d7LAw72eZO7LYrNgjgU/4LegwUhYXjxyt82BqKUTJDTN2gEA07kQ==', N'b369f3bf-be97-43c2-a691-84d07f1c834b', NULL, 0, 0, NULL, 1, 0, N'admin@website.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'3b524184-23fd-40a7-8fb0-e2a5da2a3a74', N'allenca1846@gmail.com', 0, N'AFae+010ID6CSLbFq18q7aHmgQxx3DiXyHe0CTwLMyVCkdrl+wBVg1GQb8EloSiAgw==', N'7b56f819-10dd-423c-b1c3-6e82997b03bc', NULL, 0, 0, NULL, 1, 0, N'allenca1846@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'409c83ce-327f-4602-870e-166a43b039f6', N'user@email.com', 0, N'AHJ0fucc/gj2EESQ4hAKiNYYJu5Daa5+h7ZD6CI1mFcx7Ls+5eEXSDFlm6kwcyKjAw==', N'669649b5-150d-4af3-9f19-fd4cdd82c4e0', NULL, 0, 0, NULL, 1, 0, N'user@email.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'62a89a8c-c21e-41bb-b860-7e2aeea93519', N'instructor@centriq.com', 0, N'AI0Hi0AieTJUblfl8v4rMf51C/6k/0NXPoTdhBaKh4syAB7yqAxK0oAWDnyZ0kgOCg==', N'0e32df4a-6258-4576-b48e-accdba9d30d3', NULL, 0, 0, NULL, 1, 0, N'instructor@centriq.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b472d5ab-252a-4ac4-b5bf-d093673dc88d', N'allen.chris.a@gmail.com', 0, N'AGHVi6BFc3ITUS3K2xcx1CsYNcYJoxWDzoPyaIDWjG4TJySkK3mdH9fYOi3ryHi94w==', N'0d915294-4296-4a05-b9e7-4c5137534a8e', NULL, 0, 0, NULL, 1, 0, N'allen.chris.a@gmail.com')
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (1, N'Corporate')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (2, N'HR')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (3, N'IT')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (4, N'Sales')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (5, N'Maint')
SET IDENTITY_INSERT [dbo].[Departments] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Role], [Salary], [DateHired], [DirectReportID], [DepartmentID]) VALUES (6, N'Jake', N'SMITH', 1, 15.0000, CAST(N'1912-02-14' AS Date), 6, 1)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Role], [Salary], [DateHired], [DirectReportID], [DepartmentID]) VALUES (7, N'John', N'Smith', 2, 12.0000, CAST(N'1912-02-14' AS Date), 6, 1)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Role], [Salary], [DateHired], [DirectReportID], [DepartmentID]) VALUES (8, N'Mary', N'Smith', 3, 20.0000, CAST(N'1912-02-14' AS Date), 7, 1)
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [Price], [UnitsSold], [StatusID], [ProductImage]) VALUES (1, N'D&D Player''s Handbook', 1, 20.0000, 1, 1, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [Price], [UnitsSold], [StatusID], [ProductImage]) VALUES (2, N'Blue Dice', 5, 10.0000, 15, 2, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [Price], [UnitsSold], [StatusID], [ProductImage]) VALUES (4, N'Skeleton', 4, 8.0000, NULL, 4, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductType], [Price], [UnitsSold], [StatusID], [ProductImage]) VALUES (5, N'Dice Roller', 2, 15.9900, 2, 1, NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([TypeID], [ProductTypeName], [SubTypeID]) VALUES (1, N'RPG Book', 2)
INSERT [dbo].[ProductType] ([TypeID], [ProductTypeName], [SubTypeID]) VALUES (2, N'Supplement', 3)
INSERT [dbo].[ProductType] ([TypeID], [ProductTypeName], [SubTypeID]) VALUES (4, N'Miniatures', 4)
INSERT [dbo].[ProductType] ([TypeID], [ProductTypeName], [SubTypeID]) VALUES (5, N'Dice', NULL)
SET IDENTITY_INSERT [dbo].[ProductType] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (1, N'Manager')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (2, N'Asst Manager')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (3, N'Associate')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (1, N'In Stock')
INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (2, N'Out of Stock')
INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (3, N'On BackOrder')
INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (4, N'Discontinued')
SET IDENTITY_INSERT [dbo].[Status] OFF
SET IDENTITY_INSERT [dbo].[SubType] ON 

INSERT [dbo].[SubType] ([SubTypeID], [SubTypeName]) VALUES (1, N'Dungeon and Dragons')
INSERT [dbo].[SubType] ([SubTypeID], [SubTypeName]) VALUES (2, N'Pathfinder')
INSERT [dbo].[SubType] ([SubTypeID], [SubTypeName]) VALUES (3, N'Terrain')
INSERT [dbo].[SubType] ([SubTypeID], [SubTypeName]) VALUES (4, N'Painted')
SET IDENTITY_INSERT [dbo].[SubType] OFF
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName], [FavoriteColor]) VALUES (N'00c6a81e-cc85-4ae0-9b45-d1253fd0ffcc', N'User', N'UserL', N'#9a2828')
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName], [FavoriteColor]) VALUES (N'219b1af1-f847-4713-9c79-c3a032b544ce', N'admin', N'User', N'#00FF00')
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName], [FavoriteColor]) VALUES (N'3b524184-23fd-40a7-8fb0-e2a5da2a3a74', N'Chris', N'Allen', N'#00FF00')
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName], [FavoriteColor]) VALUES (N'62a89a8c-c21e-41bb-b860-7e2aeea93519', N'Centriq', N'Instructor', N'#000000')
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName], [FavoriteColor]) VALUES (N'b472d5ab-252a-4ac4-b5bf-d093673dc88d', N'Chris', N'Allen', N'#2a40b2')
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 12/10/2021 3:04:45 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND name = N'RoleNameIndex')
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 12/10/2021 3:04:45 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND name = N'IX_UserId')
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 12/10/2021 3:04:45 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND name = N'IX_UserId')
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 12/10/2021 3:04:45 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND name = N'IX_RoleId')
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 12/10/2021 3:04:45 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND name = N'IX_UserId')
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 12/10/2021 3:04:45 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND name = N'UserNameIndex')
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employees_Departments]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employees_Departments]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Departments]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employees_Employees]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Employees] FOREIGN KEY([DirectReportID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employees_Employees]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Employees]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employees_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Roles] FOREIGN KEY([Role])
REFERENCES [dbo].[Roles] ([RoleID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employees_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Roles]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_ProductType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductType] FOREIGN KEY([ProductType])
REFERENCES [dbo].[ProductType] ([TypeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_ProductType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_Status]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([StatusID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_Status]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Status]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductType_SubType]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductType]'))
ALTER TABLE [dbo].[ProductType]  WITH CHECK ADD  CONSTRAINT [FK_ProductType_SubType] FOREIGN KEY([SubTypeID])
REFERENCES [dbo].[SubType] ([SubTypeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductType_SubType]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductType]'))
ALTER TABLE [dbo].[ProductType] CHECK CONSTRAINT [FK_ProductType_SubType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetails_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_UserDetails_AspNetUsers]
GO
ALTER DATABASE [StoreFront] SET  READ_WRITE 
GO
