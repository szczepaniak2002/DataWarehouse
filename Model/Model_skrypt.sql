USE [master]
GO
/****** Object:  Database [RestaurantsDW]    Script Date: 02.06.2024 16:51:06 ******/
CREATE DATABASE [RestaurantsDW]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RestaurantsDW', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\RestaurantsDW.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RestaurantsDW_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\RestaurantsDW_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [RestaurantsDW] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RestaurantsDW].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RestaurantsDW] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RestaurantsDW] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RestaurantsDW] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RestaurantsDW] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RestaurantsDW] SET ARITHABORT OFF 
GO
ALTER DATABASE [RestaurantsDW] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RestaurantsDW] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RestaurantsDW] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RestaurantsDW] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RestaurantsDW] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RestaurantsDW] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RestaurantsDW] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RestaurantsDW] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RestaurantsDW] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RestaurantsDW] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RestaurantsDW] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RestaurantsDW] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RestaurantsDW] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RestaurantsDW] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RestaurantsDW] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RestaurantsDW] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RestaurantsDW] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RestaurantsDW] SET RECOVERY FULL 
GO
ALTER DATABASE [RestaurantsDW] SET  MULTI_USER 
GO
ALTER DATABASE [RestaurantsDW] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RestaurantsDW] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RestaurantsDW] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RestaurantsDW] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RestaurantsDW] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RestaurantsDW] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'RestaurantsDW', N'ON'
GO
ALTER DATABASE [RestaurantsDW] SET QUERY_STORE = ON
GO
ALTER DATABASE [RestaurantsDW] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [RestaurantsDW]
GO
/****** Object:  Table [dbo].[DateDim]    Script Date: 02.06.2024 16:51:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DateDim](
	[DateDimID] [int] NOT NULL,
	[DayNumber] [tinyint] NOT NULL,
	[MonthNumber] [tinyint] NOT NULL,
	[WeekDayName] [varchar](25) NOT NULL,
	[MonthName] [varchar](25) NOT NULL,
	[Year] [int] NOT NULL,
	[IsHoliday] [bit] NOT NULL,
	[HolidayName] [varchar](50) NULL,
	[Date] [date] NOT NULL,
	[QuarterNumber] [tinyint] NOT NULL,
	[QuarterName] [varchar](25) NOT NULL,
	[IsWeekend] [bit] NOT NULL,
	[FirstDayOfMonthDate] [date] NOT NULL,
	[LastDayOfMonthDate] [date] NOT NULL,
	[FirstDayOfQuarterDate] [date] NOT NULL,
	[LastDayOfQuarterDate] [date] NOT NULL,
	[FirstDateOfYearDate] [date] NOT NULL,
	[LastDayOfYearDate] [date] NOT NULL,
 CONSTRAINT [PK_dateDim] PRIMARY KEY CLUSTERED 
(
	[DateDimID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocationDim]    Script Date: 02.06.2024 16:51:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocationDim](
	[LocationDimID] [int] NOT NULL,
	[Longitude] [decimal](9, 6) NOT NULL,
	[Latitude] [decimal](8, 6) NOT NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Address] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LocationDim] PRIMARY KEY CLUSTERED 
(
	[LocationDimID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropertiesSaleFact]    Script Date: 02.06.2024 16:51:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertiesSaleFact](
	[PropertiesSaleFactID] [int] NOT NULL,
	[TypeOfHouse] [varchar](50) NOT NULL,
	[Price] [money] NOT NULL,
	[LocationDimID] [int] NOT NULL,
	[DateOfSaleID] [int] NOT NULL,
 CONSTRAINT [PK_PropertiesDim] PRIMARY KEY CLUSTERED 
(
	[PropertiesSaleFactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RestaurantDim]    Script Date: 02.06.2024 16:51:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RestaurantDim](
	[RestaurantDimID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Parking] [varchar](50) NOT NULL,
	[UsesCash] [bit] NOT NULL,
	[UsesBankDebitsCard] [bit] NOT NULL,
	[UsesAmericanExpress] [bit] NOT NULL,
	[UsesVisa] [bit] NOT NULL,
	[UsesMasterCard] [bit] NOT NULL,
	[LocationDimID] [int] NOT NULL,
 CONSTRAINT [PK_RestaurantsDim] PRIMARY KEY CLUSTERED 
(
	[RestaurantDimID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReviewFact]    Script Date: 02.06.2024 16:51:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReviewFact](
	[ReviewFactID] [int] NOT NULL,
	[ReviewingUserID] [int] NOT NULL,
	[ReviewedRestaurantID] [int] NOT NULL,
	[Rating] [tinyint] NOT NULL,
	[FoodRating] [tinyint] NOT NULL,
	[ServiceRating] [tinyint] NOT NULL,
	[DateOfReviewID] [int] NOT NULL,
 CONSTRAINT [PK_ReviewsFact] PRIMARY KEY CLUSTERED 
(
	[ReviewFactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDim]    Script Date: 02.06.2024 16:51:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDim](
	[UserDimID] [int] NOT NULL,
	[Smoker] [bit] NOT NULL,
	[DrinkLevel] [varchar](50) NOT NULL,
	[DressPreference] [varchar](50) NOT NULL,
	[Ambience] [varchar](50) NOT NULL,
	[Transport] [varchar](50) NOT NULL,
	[MartialStatus] [varchar](50) NOT NULL,
	[UsesCash] [bit] NOT NULL,
	[UsesBankDebitCards] [bit] NOT NULL,
	[UsesAmericanExpress] [bit] NOT NULL,
	[UsesVisa] [bit] NOT NULL,
	[UsesMasterCard] [bit] NOT NULL,
	[LocationDimID] [int] NOT NULL,
 CONSTRAINT [PK_UserDim] PRIMARY KEY CLUSTERED 
(
	[UserDimID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PropertiesSaleFact]  WITH CHECK ADD  CONSTRAINT [FK_PropertiesSaleFact_DateDim] FOREIGN KEY([DateOfSaleID])
REFERENCES [dbo].[DateDim] ([DateDimID])
GO
ALTER TABLE [dbo].[PropertiesSaleFact] CHECK CONSTRAINT [FK_PropertiesSaleFact_DateDim]
GO
ALTER TABLE [dbo].[PropertiesSaleFact]  WITH CHECK ADD  CONSTRAINT [FK_PropertiesSaleFact_LocationDim] FOREIGN KEY([LocationDimID])
REFERENCES [dbo].[LocationDim] ([LocationDimID])
GO
ALTER TABLE [dbo].[PropertiesSaleFact] CHECK CONSTRAINT [FK_PropertiesSaleFact_LocationDim]
GO
ALTER TABLE [dbo].[RestaurantDim]  WITH CHECK ADD  CONSTRAINT [FK_RestaurantDim_LocationDim] FOREIGN KEY([LocationDimID])
REFERENCES [dbo].[LocationDim] ([LocationDimID])
GO
ALTER TABLE [dbo].[RestaurantDim] CHECK CONSTRAINT [FK_RestaurantDim_LocationDim]
GO
ALTER TABLE [dbo].[ReviewFact]  WITH CHECK ADD  CONSTRAINT [FK_ReviewFact_DateDim] FOREIGN KEY([DateOfReviewID])
REFERENCES [dbo].[DateDim] ([DateDimID])
GO
ALTER TABLE [dbo].[ReviewFact] CHECK CONSTRAINT [FK_ReviewFact_DateDim]
GO
ALTER TABLE [dbo].[ReviewFact]  WITH CHECK ADD  CONSTRAINT [FK_ReviewFact_RestaurantDim] FOREIGN KEY([ReviewedRestaurantID])
REFERENCES [dbo].[RestaurantDim] ([RestaurantDimID])
GO
ALTER TABLE [dbo].[ReviewFact] CHECK CONSTRAINT [FK_ReviewFact_RestaurantDim]
GO
ALTER TABLE [dbo].[ReviewFact]  WITH CHECK ADD  CONSTRAINT [FK_ReviewFact_UserDim] FOREIGN KEY([ReviewingUserID])
REFERENCES [dbo].[UserDim] ([UserDimID])
GO
ALTER TABLE [dbo].[ReviewFact] CHECK CONSTRAINT [FK_ReviewFact_UserDim]
GO
ALTER TABLE [dbo].[UserDim]  WITH CHECK ADD  CONSTRAINT [FK_UserDim_LocationDim] FOREIGN KEY([LocationDimID])
REFERENCES [dbo].[LocationDim] ([LocationDimID])
GO
ALTER TABLE [dbo].[UserDim] CHECK CONSTRAINT [FK_UserDim_LocationDim]
GO
USE [master]
GO
ALTER DATABASE [RestaurantsDW] SET  READ_WRITE 
GO
