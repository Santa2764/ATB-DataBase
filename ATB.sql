USE [master]
GO
/****** Object:  Database [ATB]    Script Date: 18.07.2023 17:55:29 ******/
CREATE DATABASE [ATB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Product', FILENAME = N'E:\Приложения\SQL Server\ШАГ\Product.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Product_log', FILENAME = N'E:\Приложения\SQL Server\ШАГ\Product_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ATB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ATB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ATB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ATB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ATB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ATB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ATB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ATB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ATB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ATB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ATB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ATB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ATB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ATB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ATB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ATB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ATB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ATB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ATB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ATB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ATB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ATB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ATB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ATB] SET RECOVERY FULL 
GO
ALTER DATABASE [ATB] SET  MULTI_USER 
GO
ALTER DATABASE [ATB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ATB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ATB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ATB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ATB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ATB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ATB', N'ON'
GO
ALTER DATABASE [ATB] SET QUERY_STORE = ON
GO
ALTER DATABASE [ATB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ATB]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 18.07.2023 17:55:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[id] [int] NOT NULL,
	[street] [nvarchar](50) NULL,
	[id_city] [int] NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 18.07.2023 17:55:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 18.07.2023 17:55:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_region] [int] NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 18.07.2023 17:55:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery]    Script Date: 18.07.2023 17:55:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery](
	[id] [int] NOT NULL,
	[id_product] [int] NULL,
	[id_suppier] [int] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[date_of_delivery] [date] NULL,
 CONSTRAINT [PK_Delivery] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Markup]    Script Date: 18.07.2023 17:55:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Markup](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[percent] [float] NULL,
 CONSTRAINT [PK_Markup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Measurement]    Script Date: 18.07.2023 17:55:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Measurement](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Measurement] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producer]    Script Date: 18.07.2023 17:55:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producer](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_address] [int] NULL,
 CONSTRAINT [PK_Producer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 18.07.2023 17:55:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_category] [int] NULL,
	[price] [float] NULL,
	[discount] [float] NULL,
	[quantity] [int] NULL,
	[id_measurement] [int] NULL,
	[id_producer] [int] NULL,
	[id_markup] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 18.07.2023 17:55:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_country] [int] NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 18.07.2023 17:55:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[id] [int] NOT NULL,
	[id_product] [int] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[date_of_sale] [date] NULL,
 CONSTRAINT [PK_Sale] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 18.07.2023 17:55:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_address] [int] NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_City] FOREIGN KEY([id_city])
REFERENCES [dbo].[City] ([id])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_City]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Region] FOREIGN KEY([id_region])
REFERENCES [dbo].[Region] ([id])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_Region]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_Product] FOREIGN KEY([id_product])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_Product]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_Supplier] FOREIGN KEY([id_suppier])
REFERENCES [dbo].[Supplier] ([id])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_Supplier]
GO
ALTER TABLE [dbo].[Producer]  WITH CHECK ADD  CONSTRAINT [FK_Producer_Address] FOREIGN KEY([id_address])
REFERENCES [dbo].[Address] ([id])
GO
ALTER TABLE [dbo].[Producer] CHECK CONSTRAINT [FK_Producer_Address]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([id_category])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Markup] FOREIGN KEY([id_markup])
REFERENCES [dbo].[Markup] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Markup]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Measurement] FOREIGN KEY([id_measurement])
REFERENCES [dbo].[Measurement] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Measurement]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Producer] FOREIGN KEY([id_producer])
REFERENCES [dbo].[Producer] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Producer]
GO
ALTER TABLE [dbo].[Region]  WITH CHECK ADD  CONSTRAINT [FK_Region_Country] FOREIGN KEY([id_country])
REFERENCES [dbo].[Country] ([id])
GO
ALTER TABLE [dbo].[Region] CHECK CONSTRAINT [FK_Region_Country]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Product] FOREIGN KEY([id_product])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_Product]
GO
ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_Address] FOREIGN KEY([id_address])
REFERENCES [dbo].[Address] ([id])
GO
ALTER TABLE [dbo].[Supplier] CHECK CONSTRAINT [FK_Supplier_Address]
GO
USE [master]
GO
ALTER DATABASE [ATB] SET  READ_WRITE 
GO
