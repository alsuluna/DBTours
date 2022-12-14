USE [master]
GO
/****** Object:  Database [Gafarova_Tours]    Script Date: 21.09.2022 18:09:26 ******/
CREATE DATABASE [Gafarova_Tours]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Gafarova_Tours', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Gafarova_Tours.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Gafarova_Tours_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Gafarova_Tours_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Gafarova_Tours].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Gafarova_Tours] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Gafarova_Tours] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Gafarova_Tours] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Gafarova_Tours] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Gafarova_Tours] SET ARITHABORT OFF 
GO
ALTER DATABASE [Gafarova_Tours] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Gafarova_Tours] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Gafarova_Tours] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Gafarova_Tours] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Gafarova_Tours] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Gafarova_Tours] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Gafarova_Tours] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Gafarova_Tours] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Gafarova_Tours] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Gafarova_Tours] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Gafarova_Tours] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Gafarova_Tours] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Gafarova_Tours] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Gafarova_Tours] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Gafarova_Tours] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Gafarova_Tours] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Gafarova_Tours] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Gafarova_Tours] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Gafarova_Tours] SET  MULTI_USER 
GO
ALTER DATABASE [Gafarova_Tours] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Gafarova_Tours] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Gafarova_Tours] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Gafarova_Tours] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Gafarova_Tours] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Gafarova_Tours]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 21.09.2022 18:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[code] [nchar](2) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 21.09.2022 18:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[id] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[countOfStars] [int] NOT NULL,
	[countyCode] [nchar](2) NOT NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelComment]    Script Date: 21.09.2022 18:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelComment](
	[id] [int] NOT NULL,
	[hotelId] [int] NOT NULL,
	[text] [nvarchar](max) NOT NULL,
	[author] [nvarchar](100) NOT NULL,
	[creationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_HotelComment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelImage]    Script Date: 21.09.2022 18:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelImage](
	[id] [int] NOT NULL,
	[hostelId] [int] NOT NULL,
	[imageSource] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_HotelImage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelOfTour]    Script Date: 21.09.2022 18:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelOfTour](
	[hotelID] [int] NOT NULL,
	[tourID] [int] NOT NULL,
 CONSTRAINT [PK_HotelOfTour] PRIMARY KEY CLUSTERED 
(
	[hotelID] ASC,
	[tourID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 21.09.2022 18:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour](
	[id] [int] NOT NULL,
	[ticketCount] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](max) NULL,
	[imagePreview] [varbinary](max) NULL,
	[price] [money] NOT NULL,
	[isActual] [int] NOT NULL,
 CONSTRAINT [PK_Tour] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 21.09.2022 18:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[id] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfTour]    Script Date: 21.09.2022 18:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfTour](
	[tourID] [int] NOT NULL,
	[typeID] [int] NOT NULL,
 CONSTRAINT [PK_TypeOfTour] PRIMARY KEY CLUSTERED 
(
	[tourID] ASC,
	[typeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Country] ([code], [name]) VALUES (N'AB', N'Абхазия')
INSERT [dbo].[Country] ([code], [name]) VALUES (N'AI', N'Англия')
INSERT [dbo].[Country] ([code], [name]) VALUES (N'BG', N'Болгария')
INSERT [dbo].[Country] ([code], [name]) VALUES (N'DE', N'Германия')
INSERT [dbo].[Country] ([code], [name]) VALUES (N'EG', N'Египет')
INSERT [dbo].[Country] ([code], [name]) VALUES (N'GE', N'Грузия')
INSERT [dbo].[Country] ([code], [name]) VALUES (N'IL', N'Израиль')
INSERT [dbo].[Country] ([code], [name]) VALUES (N'RU', N'Россия')
GO
INSERT [dbo].[Type] ([id], [name], [description]) VALUES (1, N'Тип 1', NULL)
INSERT [dbo].[Type] ([id], [name], [description]) VALUES (2, N'Тип 2', NULL)
INSERT [dbo].[Type] ([id], [name], [description]) VALUES (3, N'Тип 3', NULL)
INSERT [dbo].[Type] ([id], [name], [description]) VALUES (4, N'Тип 4', NULL)
INSERT [dbo].[Type] ([id], [name], [description]) VALUES (5, N'Тип 5', NULL)
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Country] FOREIGN KEY([countyCode])
REFERENCES [dbo].[Country] ([code])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_Country]
GO
ALTER TABLE [dbo].[HotelComment]  WITH CHECK ADD  CONSTRAINT [FK_HotelComment_Hotel] FOREIGN KEY([hotelId])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[HotelComment] CHECK CONSTRAINT [FK_HotelComment_Hotel]
GO
ALTER TABLE [dbo].[HotelImage]  WITH CHECK ADD  CONSTRAINT [FK_HotelImage_Hotel] FOREIGN KEY([hostelId])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[HotelImage] CHECK CONSTRAINT [FK_HotelImage_Hotel]
GO
ALTER TABLE [dbo].[HotelOfTour]  WITH CHECK ADD  CONSTRAINT [FK_HotelOfTour_Hotel] FOREIGN KEY([hotelID])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[HotelOfTour] CHECK CONSTRAINT [FK_HotelOfTour_Hotel]
GO
ALTER TABLE [dbo].[HotelOfTour]  WITH CHECK ADD  CONSTRAINT [FK_HotelOfTour_Tour] FOREIGN KEY([tourID])
REFERENCES [dbo].[Tour] ([id])
GO
ALTER TABLE [dbo].[HotelOfTour] CHECK CONSTRAINT [FK_HotelOfTour_Tour]
GO
ALTER TABLE [dbo].[TypeOfTour]  WITH CHECK ADD  CONSTRAINT [FK_TypeOfTour_Tour] FOREIGN KEY([tourID])
REFERENCES [dbo].[Tour] ([id])
GO
ALTER TABLE [dbo].[TypeOfTour] CHECK CONSTRAINT [FK_TypeOfTour_Tour]
GO
ALTER TABLE [dbo].[TypeOfTour]  WITH CHECK ADD  CONSTRAINT [FK_TypeOfTour_Type] FOREIGN KEY([typeID])
REFERENCES [dbo].[Type] ([id])
GO
ALTER TABLE [dbo].[TypeOfTour] CHECK CONSTRAINT [FK_TypeOfTour_Type]
GO
USE [master]
GO
ALTER DATABASE [Gafarova_Tours] SET  READ_WRITE 
GO
