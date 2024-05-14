USE [RestaurantsDW]
GO

/****** Object:  Table [dbo].[ReviewsFact]    Script Date: 14.05.2024 15:32:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ReviewsFact](
	[ReviewsFactID] [int] NOT NULL,
	[UserDimID] [int] NOT NULL,
	[PlaceDimID] [int] NOT NULL,
	[rating] [int] NULL,
	[food_rating] [int] NULL,
	[service_rating] [int] NULL,
	[dateDimID] [int] NOT NULL,
 CONSTRAINT [PK_ReviewsFact] PRIMARY KEY CLUSTERED 
(
	[ReviewsFactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ReviewsFact]  WITH CHECK ADD  CONSTRAINT [FK_ReviewsFact_dateDim] FOREIGN KEY([dateDimID])
REFERENCES [dbo].[dateDim] ([dateDimID])
GO

ALTER TABLE [dbo].[ReviewsFact] CHECK CONSTRAINT [FK_ReviewsFact_dateDim]
GO

ALTER TABLE [dbo].[ReviewsFact]  WITH CHECK ADD  CONSTRAINT [FK_ReviewsFact_PlaceDim] FOREIGN KEY([PlaceDimID])
REFERENCES [dbo].[PlaceDim] ([PlaceDimID])
GO

ALTER TABLE [dbo].[ReviewsFact] CHECK CONSTRAINT [FK_ReviewsFact_PlaceDim]
GO

ALTER TABLE [dbo].[ReviewsFact]  WITH CHECK ADD  CONSTRAINT [FK_ReviewsFact_UserDim] FOREIGN KEY([UserDimID])
REFERENCES [dbo].[UserDim] ([UserDimID])
GO

ALTER TABLE [dbo].[ReviewsFact] CHECK CONSTRAINT [FK_ReviewsFact_UserDim]
GO


