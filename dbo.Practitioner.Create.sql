USE [mcbean.clinic]
GO
/****** Object:  Table [dbo].[Practitioner]    Script Date: 05/13/2011 13:09:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Practitioner]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Practitioner](
	[PractitionerId] [int] IDENTITY(1,1) NOT NULL,
	[PractitionerVendorId] [int] NULL,
	[Prefix] [int] NULL,
	[FirstName] [varchar](50) NOT NULL,
	[Initial] [varchar](50) NULL,
	[LastName] [varchar](50) NOT NULL,
	[Suffix] [int] NULL,
	[Address] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[Province] [varchar](50) NULL,
	[PostalCode] [varchar](12) NULL,
	[CountryCode] [int] NULL,
	[PracId] [varchar](50) NULL,
	[DefaultSpecialty] [varchar](50) NULL,
	[PractIdIssuer] [int] NULL,
	[SearchText] [varchar](500) NULL,
 CONSTRAINT [PK_Practitioner] PRIMARY KEY CLUSTERED 
(
	[PractitionerId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Practitioner', N'COLUMN',N'PractitionerVendorId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Supplied by external data vendor to uniquely identify the person.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Practitioner', @level2type=N'COLUMN',@level2name=N'PractitionerVendorId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Practitioner', N'COLUMN',N'Prefix'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to dbo.PersonPrefix' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Practitioner', @level2type=N'COLUMN',@level2name=N'Prefix'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Practitioner', N'COLUMN',N'Suffix'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to dbo.PersonPrefix' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Practitioner', @level2type=N'COLUMN',@level2name=N'Suffix'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Practitioner', N'COLUMN',N'CountryCode'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key into imaginary ISO coutnry code table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Practitioner', @level2type=N'COLUMN',@level2name=N'CountryCode'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Practitioner', N'COLUMN',N'PractIdIssuer'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to an imaginary table of Issuing authorities.  Assumed now to be AHS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Practitioner', @level2type=N'COLUMN',@level2name=N'PractIdIssuer'