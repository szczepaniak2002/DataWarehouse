USE [RestaurantsDW]
GO

/****** Object:  Table [dbo].[PlaceDim]    Script Date: 14.05.2024 15:32:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PlaceDim](
	[PlaceDimID] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](50) NULL,
	[address] [varchar](50) NULL,
	[parking] [varchar](50) NULL,
 CONSTRAINT [PK_PlaceDim] PRIMARY KEY CLUSTERED 
(
	[PlaceDimID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


