USE [master]
GO
/****** Object:  Database [Northwind_Stage]    Script Date: 15/07/2018 10:10:12 ******/
CREATE DATABASE [Northwind_Stage]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Northwind_Stage', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Northwind_Stage.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Northwind_Stage_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Northwind_Stage_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Northwind_Stage].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Northwind_Stage] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Northwind_Stage] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Northwind_Stage] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Northwind_Stage] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Northwind_Stage] SET ARITHABORT OFF 
GO
ALTER DATABASE [Northwind_Stage] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Northwind_Stage] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Northwind_Stage] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Northwind_Stage] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Northwind_Stage] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Northwind_Stage] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Northwind_Stage] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Northwind_Stage] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Northwind_Stage] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Northwind_Stage] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Northwind_Stage] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Northwind_Stage] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Northwind_Stage] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Northwind_Stage] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Northwind_Stage] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Northwind_Stage] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Northwind_Stage] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Northwind_Stage] SET RECOVERY FULL 
GO
ALTER DATABASE [Northwind_Stage] SET  MULTI_USER 
GO
ALTER DATABASE [Northwind_Stage] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Northwind_Stage] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Northwind_Stage] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Northwind_Stage] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Northwind_Stage] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Northwind_Stage', N'ON'
GO
USE [Northwind_Stage]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Northwind_Stage]
GO
/****** Object:  Table [dbo].[Stage_Dim_CategoriaProducto]    Script Date: 15/07/2018 10:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stage_Dim_CategoriaProducto](
	[Categoria_Codigo] [int] NOT NULL,
	[Categoria_Nombre] [varchar](15) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stage_Dim_Cliente]    Script Date: 15/07/2018 10:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stage_Dim_Cliente](
	[Cliente_Codigo] [char](5) NOT NULL,
	[Cliente_Nombre] [varchar](40) NOT NULL,
	[Cliente_Compania] [varchar](30) NULL,
	[Cliente_Direccion] [varchar](60) NULL,
	[Cliente_Ciudad] [varchar](15) NULL,
	[Cliente_Region] [varchar](25) NULL,
	[Cliente_Pais] [varchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stage_Dim_Empleado]    Script Date: 15/07/2018 10:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stage_Dim_Empleado](
	[Empleado_Codigo] [int] NOT NULL,
	[Empleado_NombreCompleto] [varchar](70) NOT NULL,
	[Empleado_Direccion] [varchar](120) NULL,
	[Empleado_Ciudad] [varchar](15) NULL,
	[Empleado_Region] [varchar](15) NULL,
	[Empleado_Pais] [varchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stage_Dim_Producto]    Script Date: 15/07/2018 10:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stage_Dim_Producto](
	[Producto_Codigo] [int] NOT NULL,
	[Producto_Nombre] [varchar](80) NOT NULL,
	[Producto_PUnitario] [decimal](15, 2) NULL,
	[Producto_Categoria_SKey] [int] NOT NULL,
	[ProveedorNombre] [varchar](40) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stg_CategoriaProducto]    Script Date: 15/07/2018 10:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stg_CategoriaProducto](
	[Categoria_Codigo] [int] NOT NULL,
	[Categoria_Nombre] [varchar](15) NOT NULL,
	[ETLExecution] [int] NULL,
	[ETLLoad] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stg_Cliente]    Script Date: 15/07/2018 10:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stg_Cliente](
	[Cliente_Codigo] [char](5) NOT NULL,
	[Cliente_Nombre] [varchar](40) NOT NULL,
	[Cliente_Compania] [varchar](40) NULL,
	[Cliente_Direccion] [varchar](60) NULL,
	[Cliente_Ciudad] [varchar](15) NULL,
	[Cliente_Region] [varchar](15) NULL,
	[Cliente_Pais] [varchar](15) NULL,
	[Cliente_Postal] [varchar](10) NULL,
	[ETLExecution] [int] NULL,
	[ETLLoad] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stg_Empleado]    Script Date: 15/07/2018 10:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stg_Empleado](
	[Empleado_Codigo] [int] NOT NULL,
	[Empleado_Apellido] [varchar](40) NULL,
	[Empleado_Nombre] [varchar](20) NULL,
	[Empleado_NombreCompleto] [varchar](70) NULL,
	[Empleado_Direccion] [varchar](120) NULL,
	[Empleado_Ciudad] [varchar](15) NULL,
	[Empleado_Region] [varchar](15) NULL,
	[Empleado_Pais] [varchar](15) NULL,
	[Empleado_Postal] [varchar](10) NULL,
	[ETLLoad] [datetime] NULL,
	[ETLExecution] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stg_Producto]    Script Date: 15/07/2018 10:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stg_Producto](
	[Producto_Codigo] [int] NOT NULL,
	[Producto_Nombre] [varchar](50) NULL,
	[Producto_PUnitario] [decimal](15, 2) NULL,
	[CategoriaProducto_Codigo] [int] NULL,
	[ProveedorNombre] [varchar](40) NULL,
	[ETLExecution] [int] NULL,
	[ETLLoad] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stg_Tiempo]    Script Date: 15/07/2018 10:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stg_Tiempo](
	[Tiempo_Skey] [int] IDENTITY(1,1) NOT NULL,
	[Tiempo_FechaActual] [datetime] NOT NULL,
	[Tiempo_Anio] [int] NOT NULL,
	[Tiempo_Trimestre] [int] NOT NULL,
	[Tiempo_Mes] [int] NOT NULL,
	[Tiempo_Semana] [int] NOT NULL,
	[Tiempo_DiaDeAnio] [int] NOT NULL,
	[Tiempo_DiaDeMes] [int] NOT NULL,
	[Tiempo_DiaDeSemana] [int] NOT NULL,
	[Tiempo_EsFinSemana] [int] NULL,
	[Tiempo_EsFeriado] [int] NULL,
	[Tiempo_Comentarios] [varchar](20) NULL,
	[Tiempo_SemanaCalendario] [int] NOT NULL,
	[Tiempo_SemanasDelAñoLaborales] [int] NOT NULL,
	[Tiempo_AñoBisiesto] [tinyint] NOT NULL,
	[Tiempo_Descripcion_DiaDeSemana] [varchar](10) NULL,
	[Tiempo_Descripcion_Mes] [varchar](10) NULL,
	[Tiempo_Descripcion_Trimestre] [varchar](15) NULL,
	[Tiempo_Descripcion_Semestre] [varchar](15) NULL,
 CONSTRAINT [IX_StgTiempo] UNIQUE CLUSTERED 
(
	[Tiempo_FechaActual] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stg_Ventas]    Script Date: 15/07/2018 10:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stg_Ventas](
	[Cliente_Codigo] [char](5) NOT NULL,
	[Empleado_Codigo] [int] NULL,
	[Producto_Codigo] [int] NULL,
	[Ventas_OrderDate] [datetime] NULL,
	[Ventas_NOrden] [int] NULL,
	[Ventas_Monto] [decimal](15, 2) NULL,
	[Ventas_Unidades] [int] NULL,
	[Ventas_PUnitario] [decimal](15, 2) NULL,
	[Ventas_Descuento] [decimal](15, 2) NULL,
	[ETLExecution] [int] NULL,
	[ETLLoad] [datetime] NULL,
 CONSTRAINT [IX_StgVenta] UNIQUE CLUSTERED 
(
	[Cliente_Codigo] ASC,
	[Empleado_Codigo] ASC,
	[Producto_Codigo] ASC,
	[Ventas_OrderDate] ASC,
	[Ventas_NOrden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [Northwind_Stage] SET  READ_WRITE 
GO
