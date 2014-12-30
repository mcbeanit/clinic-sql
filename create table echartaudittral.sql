USE [mcbean_clinic]
GO

/****** Object:  Table [dbo].[EChartAuditTrail]    Script Date: 09/26/2014 17:27:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[EChartAuditTrail](
	[ModifiedBy] [varchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Document_Number] [int] NOT NULL,
	[ModifiedById] [int] NULL,
	[CreatedById] [int] NULL,
	[DocumentId] [nchar](10) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


