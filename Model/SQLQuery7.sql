USE [RestaurantsDW]
GO

/****** Object:  Table [dbo].[UserCuisineDim]    Script Date: 14.05.2024 15:33:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UserCuisineDim](
	[UserCuisineID] [int] NOT NULL,
	[userID] [int] NULL,
	[Cuisine] [varchar](50) NULL,
 CONSTRAINT [PK_UserCuisineDim] PRIMARY KEY CLUSTERED 
(
	[UserCuisineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[UserCuisineDim]  WITH CHECK ADD  CONSTRAINT [FK_UserCuisineDim_UserDim] FOREIGN KEY([userID])
REFERENCES [dbo].[UserDim] ([UserDimID])
GO

ALTER TABLE [dbo].[UserCuisineDim] CHECK CONSTRAINT [FK_UserCuisineDim_UserDim]
GO


