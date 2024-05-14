USE [RestaurantsDW]
GO

/****** Object:  Table [dbo].[UserPaymentDim]    Script Date: 14.05.2024 15:33:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UserPaymentDim](
	[UserPaymentDimID] [int] NOT NULL,
	[userID] [int] NULL,
	[Payment] [varchar](50) NULL,
 CONSTRAINT [PK_UserPaymentDim] PRIMARY KEY CLUSTERED 
(
	[UserPaymentDimID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


