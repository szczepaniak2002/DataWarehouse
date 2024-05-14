USE [RestaurantsDW]
GO

/****** Object:  Table [dbo].[dateDim]    Script Date: 14.05.2024 15:31:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[dateDim](
	[dateDimID] [int] NOT NULL,
	[Month] [varchar](50) NULL,
	[Year] [varchar](50) NULL,
	[isHoliday] [varchar](50) NULL,
	[date] [date] NULL,
 CONSTRAINT [PK_dateDim] PRIMARY KEY CLUSTERED 
(
	[dateDimID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


