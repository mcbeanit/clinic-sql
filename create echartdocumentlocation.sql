USE [mcbean_clinic]
GO

/****** Object:  Table [dbo].[EChartDocumentLocation]    Script Date: 09/17/2014 16:08:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[EChartDocumentLocation](
	[Document_Number] [int] NOT NULL,
	[Document_Image] [varchar](50) NOT NULL,
	[Document_Location] [varchar](50) NOT NULL,
	[Viewer] [varchar](50) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


