USE [RestaurantsDW]
GO

/****** Object:  Table [dbo].[HousesPlaceDim]    Script Date: 14.05.2024 15:32:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[HousesPlaceDim](
	[PlaceHousesDimID] [int] NOT NULL,
	[typeOfHouse] [varchar](50) NULL,
	[placeID] [int] NULL,
	[price] [money] NULL,
 CONSTRAINT [PK_HousesPlaceDim] PRIMARY KEY CLUSTERED 
(
	[PlaceHousesDimID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[HousesPlaceDim]  WITH CHECK ADD  CONSTRAINT [FK_HousesPlaceDim_PlaceDim] FOREIGN KEY([placeID])
REFERENCES [dbo].[PlaceDim] ([PlaceDimID])
GO

ALTER TABLE [dbo].[HousesPlaceDim] CHECK CONSTRAINT [FK_HousesPlaceDim_PlaceDim]
GO


