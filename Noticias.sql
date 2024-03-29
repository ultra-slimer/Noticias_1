USE [master]
GO
/****** Object:  Database [Noticias]    Script Date: 24/9/2019 09:04:59 ******/
CREATE DATABASE [Noticias]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Noticias', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Noticias.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Noticias_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Noticias_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Noticias] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Noticias].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Noticias] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Noticias] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Noticias] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Noticias] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Noticias] SET ARITHABORT OFF 
GO
ALTER DATABASE [Noticias] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Noticias] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Noticias] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Noticias] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Noticias] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Noticias] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Noticias] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Noticias] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Noticias] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Noticias] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Noticias] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Noticias] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Noticias] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Noticias] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Noticias] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Noticias] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Noticias] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Noticias] SET RECOVERY FULL 
GO
ALTER DATABASE [Noticias] SET  MULTI_USER 
GO
ALTER DATABASE [Noticias] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Noticias] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Noticias] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Noticias] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Noticias] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Noticias', N'ON'
GO
ALTER DATABASE [Noticias] SET QUERY_STORE = OFF
GO
USE [Noticias]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
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
USE [Noticias]
GO
/****** Object:  User [alumno]    Script Date: 24/9/2019 09:04:59 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Noticias]    Script Date: 24/9/2019 09:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Noticias](
	[IdNoticias] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoNoticias] [int] NOT NULL,
	[Titulo] [varchar](max) NOT NULL,
	[Imagen] [image] NULL,
	[Descripcion] [varchar](max) NOT NULL,
	[Destacado] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoNoticias]    Script Date: 24/9/2019 09:05:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoNoticias](
	[IdNoticia] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Noticias] ON 

INSERT [dbo].[Noticias] ([IdNoticias], [IdTipoNoticias], [Titulo], [Imagen], [Descripcion], [Destacado]) VALUES (1, 4, N'La Pelicula Spider-Man un nuevo universo gana cuatro premios a La Mejor Pelicula Animada', NULL, N'La pelicula ganó las cuatro nominaciones que tuvo durante el año 2019', 1)
INSERT [dbo].[Noticias] ([IdNoticias], [IdTipoNoticias], [Titulo], [Imagen], [Descripcion], [Destacado]) VALUES (2, 1, N'Borderlands 3 se estrena con severos problemas de rendimiento', NULL, N'Uno de los juegos mas esperado se lanza con problemas graves de funcionamiento y desmpeño', 1)
INSERT [dbo].[Noticias] ([IdNoticias], [IdTipoNoticias], [Titulo], [Imagen], [Descripcion], [Destacado]) VALUES (3, 3, N'Joven representante de la juventud del mundo ante la ONU critica la inaccion de los estados participantes', NULL, N'Esto luego de muchas controversias rondando la situacion del cambio climatico', 0)
INSERT [dbo].[Noticias] ([IdNoticias], [IdTipoNoticias], [Titulo], [Imagen], [Descripcion], [Destacado]) VALUES (4, 5, N'Cantante de Green Day anuncia nuevo album con la salida de una nueva cancion', NULL, N'Luego del album Revolution Radio, Green Day sale con un album que tiene como tematica F*ck it all', 0)
SET IDENTITY_INSERT [dbo].[Noticias] OFF
SET IDENTITY_INSERT [dbo].[TipoNoticias] ON 

INSERT [dbo].[TipoNoticias] ([IdNoticia], [Nombre]) VALUES (1, N'Video-Juegos')
INSERT [dbo].[TipoNoticias] ([IdNoticia], [Nombre]) VALUES (2, N'Deportes')
INSERT [dbo].[TipoNoticias] ([IdNoticia], [Nombre]) VALUES (3, N'Mundo')
INSERT [dbo].[TipoNoticias] ([IdNoticia], [Nombre]) VALUES (4, N'Cine')
INSERT [dbo].[TipoNoticias] ([IdNoticia], [Nombre]) VALUES (5, N'Musica')
SET IDENTITY_INSERT [dbo].[TipoNoticias] OFF
USE [master]
GO
ALTER DATABASE [Noticias] SET  READ_WRITE 
GO
