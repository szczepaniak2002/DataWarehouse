USE [RestaurantsDW]
GO

/****** Object:  Table [dbo].[PlacePaymentDim]    Script Date: 14.05.2024 15:32:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PlacePaymentDim](
	[PlacePaymentDimID] [int] NOT NULL,
	[placeID] [int] NULL,
	[payment] [varchar](50) NULL,
 CONSTRAINT [PK_PlacePaymentDim] PRIMARY KEY CLUSTERED 
(
	[PlacePaymentDimID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[PlacePaymentDim]  WITH CHECK ADD  CONSTRAINT [FK_PlacePaymentDim_PlaceDim] FOREIGN KEY([placeID])
REFERENCES [dbo].[PlaceDim] ([PlaceDimID])
GO

ALTER TABLE [dbo].[PlacePaymentDim] CHECK CONSTRAINT [FK_PlacePaymentDim_PlaceDim]
GO


