USE [master]
GO
/****** Object:  Database [Northwind_Mart]    Script Date: 15/07/2018 10:08:03 ******/
CREATE DATABASE [Northwind_Mart]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Northwind_Mart', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Northwind_Mart.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Northwind_Mart_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Northwind_Mart_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Northwind_Mart].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Northwind_Mart] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Northwind_Mart] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Northwind_Mart] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Northwind_Mart] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Northwind_Mart] SET ARITHABORT OFF 
GO
ALTER DATABASE [Northwind_Mart] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Northwind_Mart] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Northwind_Mart] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Northwind_Mart] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Northwind_Mart] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Northwind_Mart] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Northwind_Mart] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Northwind_Mart] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Northwind_Mart] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Northwind_Mart] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Northwind_Mart] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Northwind_Mart] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Northwind_Mart] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Northwind_Mart] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Northwind_Mart] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Northwind_Mart] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Northwind_Mart] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Northwind_Mart] SET RECOVERY FULL 
GO
ALTER DATABASE [Northwind_Mart] SET  MULTI_USER 
GO
ALTER DATABASE [Northwind_Mart] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Northwind_Mart] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Northwind_Mart] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Northwind_Mart] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Northwind_Mart] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Northwind_Mart', N'ON'
GO
USE [Northwind_Mart]
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
USE [Northwind_Mart]
GO
/****** Object:  Table [dbo].[Dim_Categoria]    Script Date: 15/07/2018 10:08:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Categoria](
	[Categoria_SKey] [int] IDENTITY(1,1) NOT NULL,
	[Categoria_Codigo] [int] NOT NULL,
	[Categoria_Nombre] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Dim_Categoria] PRIMARY KEY CLUSTERED 
(
	[Categoria_SKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dim_Cliente]    Script Date: 15/07/2018 10:08:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Cliente](
	[Cliente_SKey] [int] IDENTITY(1,1) NOT NULL,
	[Cliente_Codigo] [char](5) NOT NULL,
	[Cliente_Nombre] [varchar](40) NOT NULL,
	[Cliente_Compania] [varchar](30) NULL,
	[Cliente_Direccion] [varchar](60) NULL,
	[Cliente_Ciudad] [varchar](15) NULL,
	[Cliente_Region] [varchar](25) NULL,
	[Cliente_Pais] [varchar](15) NULL,
 CONSTRAINT [PK_Dim_Cliente] PRIMARY KEY CLUSTERED 
(
	[Cliente_SKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dim_Empleado]    Script Date: 15/07/2018 10:08:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Empleado](
	[Empleado_SKey] [int] IDENTITY(1,1) NOT NULL,
	[Empleado_Codigo] [int] NOT NULL,
	[Empleado_NombreCompleto] [varchar](70) NOT NULL,
	[Empleado_Direccion] [varchar](120) NULL,
	[Empleado_Ciudad] [varchar](15) NULL,
	[Empleado_Region] [varchar](15) NULL,
	[Empleado_Pais] [varchar](15) NULL,
 CONSTRAINT [PK_Dim_Empleado] PRIMARY KEY CLUSTERED 
(
	[Empleado_SKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dim_Producto]    Script Date: 15/07/2018 10:08:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Producto](
	[Producto_SKey] [int] IDENTITY(1,1) NOT NULL,
	[Producto_Codigo] [int] NOT NULL,
	[Producto_Nombre] [varchar](80) NOT NULL,
	[Producto_PUnitario] [decimal](15, 2) NULL,
	[Producto_Categoria_SKey] [int] NOT NULL,
	[ProveedorNombre] [varchar](40) NOT NULL,
 CONSTRAINT [PK_Dim_Producto] PRIMARY KEY CLUSTERED 
(
	[Producto_SKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dim_Tiempo]    Script Date: 15/07/2018 10:08:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Tiempo](
	[Tiempo_Skey] [int] NOT NULL,
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
	[Tiempo_SemanaCalendario] [int] NOT NULL,
	[Tiempo_SemanasDelAñoLaborales] [int] NOT NULL,
	[Tiempo_AñoBisiesto] [tinyint] NOT NULL,
	[Tiempo_Descripcion_DiaDeSemana] [varchar](10) NULL,
	[Tiempo_Descripcion_Mes] [varchar](10) NULL,
	[Tiempo_Descripcion_Trimestre] [varchar](20) NULL,
	[Tiempo_Descripcion_Semestre] [varchar](20) NULL,
 CONSTRAINT [PK_Dim_Tiempo] PRIMARY KEY CLUSTERED 
(
	[Tiempo_Skey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Fact_Ventas]    Script Date: 15/07/2018 10:08:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Ventas](
	[Cliente_SKey] [int] NOT NULL,
	[Empleado_SKey] [int] NOT NULL,
	[Producto_SKey] [int] NOT NULL,
	[Tiempo_Skey] [int] NOT NULL,
	[Ventas_NOrden] [int] NOT NULL,
	[Ventas_Monto] [decimal](15, 2) NOT NULL,
	[Ventas_Unidades] [int] NOT NULL,
	[Ventas_PUnitario] [decimal](15, 2) NOT NULL,
	[Ventas_Descuento] [decimal](15, 2) NOT NULL,
 CONSTRAINT [PK_Fact_Ventas] PRIMARY KEY CLUSTERED 
(
	[Cliente_SKey] ASC,
	[Empleado_SKey] ASC,
	[Producto_SKey] ASC,
	[Tiempo_Skey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stage_Dim_Empleado]    Script Date: 15/07/2018 10:08:03 ******/
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
ALTER TABLE [dbo].[Dim_Producto]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Producto_Dim_Categoria] FOREIGN KEY([Producto_Categoria_SKey])
REFERENCES [dbo].[Dim_Categoria] ([Categoria_SKey])
GO
ALTER TABLE [dbo].[Dim_Producto] CHECK CONSTRAINT [FK_Dim_Producto_Dim_Categoria]
GO
ALTER TABLE [dbo].[Fact_Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Ventas_Dim_Cliente] FOREIGN KEY([Cliente_SKey])
REFERENCES [dbo].[Dim_Cliente] ([Cliente_SKey])
GO
ALTER TABLE [dbo].[Fact_Ventas] CHECK CONSTRAINT [FK_Fact_Ventas_Dim_Cliente]
GO
ALTER TABLE [dbo].[Fact_Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Ventas_Dim_Empleado] FOREIGN KEY([Empleado_SKey])
REFERENCES [dbo].[Dim_Empleado] ([Empleado_SKey])
GO
ALTER TABLE [dbo].[Fact_Ventas] CHECK CONSTRAINT [FK_Fact_Ventas_Dim_Empleado]
GO
ALTER TABLE [dbo].[Fact_Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Ventas_Dim_Producto] FOREIGN KEY([Producto_SKey])
REFERENCES [dbo].[Dim_Producto] ([Producto_SKey])
GO
ALTER TABLE [dbo].[Fact_Ventas] CHECK CONSTRAINT [FK_Fact_Ventas_Dim_Producto]
GO
ALTER TABLE [dbo].[Fact_Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Ventas_Dim_Tiempo] FOREIGN KEY([Tiempo_Skey])
REFERENCES [dbo].[Dim_Tiempo] ([Tiempo_Skey])
GO
ALTER TABLE [dbo].[Fact_Ventas] CHECK CONSTRAINT [FK_Fact_Ventas_Dim_Tiempo]
GO
USE [master]
GO
ALTER DATABASE [Northwind_Mart] SET  READ_WRITE 
GO
