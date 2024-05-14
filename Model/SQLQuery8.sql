USE [RestaurantsDW]
GO

/****** Object:  Table [dbo].[UserDim]    Script Date: 14.05.2024 15:33:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UserDim](
	[UserDimID] [int] NOT NULL,
	[latitude] [decimal](8, 6) NULL,
	[longitude] [decimal](9, 6) NULL,
	[smoker] [bit] NULL,
	[drink_level] [varchar](50) NULL,
	[dress_preference] [varchar](50) NULL,
	[ambience] [varchar](50) NULL,
	[transport] [varchar](50) NULL,
	[martial_status] [varchar](50) NULL,
 CONSTRAINT [PK_UserDim] PRIMARY KEY CLUSTERED 
(
	[UserDimID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[UserDim]  WITH CHECK ADD  CONSTRAINT [FK_UserDim_UserPaymentDim] FOREIGN KEY([UserDimID])
REFERENCES [dbo].[UserPaymentDim] ([UserPaymentDimID])
GO

ALTER TABLE [dbo].[UserDim] CHECK CONSTRAINT [FK_UserDim_UserPaymentDim]
GO


