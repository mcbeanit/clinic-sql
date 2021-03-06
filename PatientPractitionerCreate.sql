USE [mcbean.clinic]
GO
/****** Object:  Table [dbo].[PatientPractitioner]    Script Date: 10/20/2011 00:27:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PatientPractitioner](
	[PatientPractitionerId] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[PractitionerId] [int] NOT NULL,
	[Description] [varchar](100) NOT NULL,
 CONSTRAINT [PK_PatientPractitioner_1] PRIMARY KEY CLUSTERED 
(
	[PatientPractitionerId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF