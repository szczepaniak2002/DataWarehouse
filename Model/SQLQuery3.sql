USE [RestaurantsDW]
GO

/****** Object:  Table [dbo].[PlaceCuisineDim]    Script Date: 14.05.2024 15:32:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PlaceCuisineDim](
	[PlaceCuisineDimID] [int] NOT NULL,
	[placeID] [int] NULL,
	[Cuisine] [varchar](50) NULL,
 CONSTRAINT [PK_PlaceCuisineDim] PRIMARY KEY CLUSTERED 
(
	[PlaceCuisineDimID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[PlaceCuisineDim]  WITH CHECK ADD  CONSTRAINT [FK_PlaceCuisineDim_PlaceDim] FOREIGN KEY([placeID])
REFERENCES [dbo].[PlaceDim] ([PlaceDimID])
GO

ALTER TABLE [dbo].[PlaceCuisineDim] CHECK CONSTRAINT [FK_PlaceCuisineDim_PlaceDim]
GO


