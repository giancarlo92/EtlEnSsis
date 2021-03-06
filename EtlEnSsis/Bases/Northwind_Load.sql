USE [master]
GO
/****** Object:  Database [Northwind_Load]    Script Date: 12/08/2018 4:09:28 a. m. ******/
CREATE DATABASE [Northwind_Load]
GO
ALTER DATABASE [Northwind_Load] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Northwind_Load] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Northwind_Load] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Northwind_Load] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Northwind_Load] SET ARITHABORT OFF 
GO
ALTER DATABASE [Northwind_Load] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Northwind_Load] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Northwind_Load] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Northwind_Load] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Northwind_Load] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Northwind_Load] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Northwind_Load] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Northwind_Load] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Northwind_Load] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Northwind_Load] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Northwind_Load] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Northwind_Load] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Northwind_Load] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Northwind_Load] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Northwind_Load] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Northwind_Load] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Northwind_Load] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Northwind_Load] SET RECOVERY FULL 
GO
ALTER DATABASE [Northwind_Load] SET  MULTI_USER 
GO
ALTER DATABASE [Northwind_Load] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Northwind_Load] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Northwind_Load] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Northwind_Load] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Northwind_Load] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Northwind_Load', N'ON'
GO
USE [Northwind_Load]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12/08/2018 4:09:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] NULL,
	[CategoryName] [nvarchar](15) NULL,
	[Description] [ntext] NULL,
	[Picture] [image] NULL,
	[EtlLoad] [datetime] NULL,
	[EtlExecution] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 12/08/2018 4:09:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [nvarchar](5) NULL,
	[CompanyName] [nvarchar](40) NULL,
	[ContactName] [nvarchar](30) NULL,
	[ContactTitle] [nvarchar](30) NULL,
	[Address] [nvarchar](60) NULL,
	[City] [nvarchar](15) NULL,
	[Region] [nvarchar](15) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Country] [nvarchar](15) NULL,
	[Phone] [nvarchar](24) NULL,
	[Fax] [nvarchar](24) NULL,
	[EtlLoad] [datetime] NULL,
	[EtlExecution] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 12/08/2018 4:09:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[FirstName] [nvarchar](10) NOT NULL,
	[Title] [nvarchar](30) NULL,
	[TitleOfCourtesy] [nvarchar](25) NULL,
	[BirthDate] [datetime] NULL,
	[HireDate] [datetime] NULL,
	[Address] [nvarchar](60) NULL,
	[City] [nvarchar](15) NULL,
	[Region] [nvarchar](15) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Country] [nvarchar](15) NULL,
	[HomePhone] [nvarchar](24) NULL,
	[Extension] [nvarchar](4) NULL,
	[Photo] [image] NULL,
	[Notes] [ntext] NULL,
	[ReportsTo] [int] NULL,
	[PhotoPath] [nvarchar](255) NULL,
	[EtlLoad] [datetime] NULL,
	[EtlExecution] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order Details]    Script Date: 12/08/2018 4:09:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order Details](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[Quantity] [smallint] NOT NULL,
	[Discount] [real] NOT NULL,
	[EtlLoad] [datetime] NULL,
	[EtlExecution] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/08/2018 4:09:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] NOT NULL,
	[CustomerID] [nchar](5) NULL,
	[EmployeeID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[RequiredDate] [datetime] NULL,
	[ShippedDate] [datetime] NULL,
	[ShipVia] [int] NULL,
	[Freight] [money] NULL,
	[ShipName] [nvarchar](40) NULL,
	[ShipAddress] [nvarchar](60) NULL,
	[ShipCity] [nvarchar](15) NULL,
	[ShipRegion] [nvarchar](15) NULL,
	[ShipPostalCode] [nvarchar](10) NULL,
	[ShipCountry] [nvarchar](15) NULL,
	[EtlLoad] [datetime] NULL,
	[EtlExecution] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/08/2018 4:09:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] NULL,
	[ProductName] [nvarchar](40) NULL,
	[SupplierID] [int] NULL,
	[CategoryID] [int] NULL,
	[QuantityPerUnit] [nvarchar](20) NULL,
	[UnitPrice] [money] NULL,
	[UnitsInStock] [smallint] NULL,
	[UnitsOnOrder] [smallint] NULL,
	[ReorderLevel] [smallint] NULL,
	[Discontinued] [bit] NULL,
	[EtlLoad] [datetime] NULL,
	[EtlExecution] [int] NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Northwind_Load] SET  READ_WRITE 
GO
