USE [mcbean.clinic]
GO
/****** Object:  Table [dbo].[PersonContact]    Script Date: 10/19/2011 00:27:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PersonContact](
	[PersonContactId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[ContactTypeId] [int] NULL,
	[Details] [varchar](50) NULL,
	[Comments] [varchar](100) NULL,
 CONSTRAINT [PK_PersonContact] PRIMARY KEY CLUSTERED 
(
	[PersonContactId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF