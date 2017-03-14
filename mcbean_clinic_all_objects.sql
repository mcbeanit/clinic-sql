USE [master]
GO
/****** Object:  Database [mcbean_clinic]    Script Date: 03/14/2017 16:06:15 ******/
CREATE DATABASE [mcbean_clinic] ON  PRIMARY 
( NAME = N'mcbean.clinic', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\mcbean.clinic.mdf' , SIZE = 18240KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'mcbean.clinic_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\mcbean.clinic_1.ldf' , SIZE = 43264KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [mcbean_clinic] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mcbean_clinic].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mcbean_clinic] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [mcbean_clinic] SET ANSI_NULLS OFF
GO
ALTER DATABASE [mcbean_clinic] SET ANSI_PADDING OFF
GO
ALTER DATABASE [mcbean_clinic] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [mcbean_clinic] SET ARITHABORT OFF
GO
ALTER DATABASE [mcbean_clinic] SET AUTO_CLOSE ON
GO
ALTER DATABASE [mcbean_clinic] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [mcbean_clinic] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [mcbean_clinic] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [mcbean_clinic] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [mcbean_clinic] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [mcbean_clinic] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [mcbean_clinic] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [mcbean_clinic] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [mcbean_clinic] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [mcbean_clinic] SET  DISABLE_BROKER
GO
ALTER DATABASE [mcbean_clinic] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [mcbean_clinic] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [mcbean_clinic] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [mcbean_clinic] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [mcbean_clinic] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [mcbean_clinic] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [mcbean_clinic] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [mcbean_clinic] SET  READ_WRITE
GO
ALTER DATABASE [mcbean_clinic] SET RECOVERY SIMPLE
GO
ALTER DATABASE [mcbean_clinic] SET  MULTI_USER
GO
ALTER DATABASE [mcbean_clinic] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [mcbean_clinic] SET DB_CHAINING OFF
GO
USE [mcbean_clinic]
GO
/****** Object:  Schema [clinic]    Script Date: 03/14/2017 16:06:15 ******/
CREATE SCHEMA [clinic] AUTHORIZATION [dbo]
GO
/****** Object:  Table [dbo].[DiagnosticCodeGroup]    Script Date: 03/14/2017 16:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DiagnosticCodeGroup](
	[DiagnosticCodeGroupId] [int] IDENTITY(1,1) NOT NULL,
	[Version] [int] NULL,
	[Group] [int] NULL,
	[SubGroup] [int] NULL,
	[Description] [varchar](500) NULL,
 CONSTRAINT [PK_DiagnosticCodeGroup] PRIMARY KEY CLUSTERED 
(
	[DiagnosticCodeGroupId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DiagnosticCode]    Script Date: 03/14/2017 16:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DiagnosticCode](
	[DiagnosticCodeId] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[Version] [int] NOT NULL,
	[Group] [int] NULL,
	[Subgroup] [int] NULL,
 CONSTRAINT [PK_DiagnosticCode] PRIMARY KEY CLUSTERED 
(
	[DiagnosticCodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DataDefinitionTables]    Script Date: 03/14/2017 16:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DataDefinitionTables](
	[Table] [varchar](50) NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[Description] [varchar](100) NOT NULL,
 CONSTRAINT [PK_DataDefinitionTables] PRIMARY KEY CLUSTERED 
(
	[Table] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContactType]    Script Date: 03/14/2017 16:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContactType](
	[ContactTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[RowOrder] [int] NULL,
 CONSTRAINT [PK_ContactType] PRIMARY KEY CLUSTERED 
(
	[ContactTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 03/14/2017 16:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](100) NULL,
	[RowNumber] [int] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_CATEGORY] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AuditTrailCategory]    Script Date: 03/14/2017 16:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AuditTrailCategory](
	[AuditTrailCategoryId] [int] NOT NULL,
	[Description] [varchar](100) NOT NULL,
 CONSTRAINT [PK_AuditTrailCategory] PRIMARY KEY CLUSTERED 
(
	[AuditTrailCategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AuditTrail]    Script Date: 03/14/2017 16:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AuditTrail](
	[AuditTrailId] [int] IDENTITY(1,1) NOT NULL,
	[AuditTrailCategoryId] [int] NOT NULL,
	[UserAccountId] [int] NOT NULL,
	[EventDateTime] [datetime] NOT NULL,
	[DataId] [int] NULL,
	[Comment] [varchar](100) NULL,
 CONSTRAINT [PK_AuditTrail] PRIMARY KEY CLUSTERED 
(
	[AuditTrailId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 03/14/2017 16:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Appointment](
	[AppointmentId] [int] NOT NULL,
	[ProviderId] [int] NOT NULL,
	[VisitDateTime] [datetime] NOT NULL,
	[PatientId] [int] NOT NULL,
	[PatientName] [varchar](100) NOT NULL,
	[Reason] [varchar](100) NULL,
	[Note] [varchar](100) NULL,
	[IsNoteDone] [bit] NULL,
	[IsInsBilled] [bit] NULL,
	[FeeCodeId] [int] NULL,
	[DiagnosticCodeId] [int] NULL,
	[InsBilledAmount] [money] NULL,
	[PatientBilledAmount] [money] NULL,
	[ThirdPartyBilledAmount] [money] NULL,
 CONSTRAINT [PK_AUDITAPPOINTMENT] PRIMARY KEY CLUSTERED 
(
	[AppointmentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 03/14/2017 16:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gender](
	[GenderId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[Abbreviation] [varchar](10) NULL,
 CONSTRAINT [PK_GENDER] PRIMARY KEY CLUSTERED 
(
	[GenderId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DocumentViewer]    Script Date: 03/14/2017 16:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DocumentViewer](
	[DocumentViewerId] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](10) NOT NULL,
	[Description] [varchar](100) NULL,
 CONSTRAINT [PK_DocumentViewer] PRIMARY KEY CLUSTERED 
(
	[DocumentViewerId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_TYPE] UNIQUE NONCLUSTERED 
(
	[Type] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DocumentType]    Script Date: 03/14/2017 16:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DocumentType](
	[DocumentTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[Extension] [varchar](50) NULL,
 CONSTRAINT [PK_DocumentType] PRIMARY KEY CLUSTERED 
(
	[DocumentTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DocumentLocationRoot]    Script Date: 03/14/2017 16:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DocumentLocationRoot](
	[DocumentLocationRootId] [int] NOT NULL,
	[Path] [varchar](500) NULL,
	[FileCount] [int] NOT NULL,
	[FileSize] [int] NOT NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_DocumentLocationRoot] PRIMARY KEY CLUSTERED 
(
	[DocumentLocationRootId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DocumentInbox]    Script Date: 03/14/2017 16:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DocumentInbox](
	[DocumentInboxId] [int] IDENTITY(1,1) NOT NULL,
	[Filename] [varchar](100) NOT NULL,
	[DocumentTypeId] [int] NULL,
	[Notes] [varchar](200) NULL,
	[CreationDate] [datetime] NULL,
 CONSTRAINT [PK_DocumentInbox] PRIMARY KEY CLUSTERED 
(
	[DocumentInboxId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DocumentArchive]    Script Date: 03/14/2017 16:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DocumentArchive](
	[DocumentArchiveId] [int] IDENTITY(1,1) NOT NULL,
	[DocumentArchive] [varbinary](max) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[DocumentId] [int] NOT NULL,
 CONSTRAINT [PK_DocumentArchive] PRIMARY KEY CLUSTERED 
(
	[DocumentArchiveId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ShortCutCode]    Script Date: 03/14/2017 16:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ShortCutCode](
	[ShortCutCodeId] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[ReplaceText] [varchar](500) NOT NULL,
	[Group] [varchar](20) NULL,
 CONSTRAINT [PK_ShortCutCode] PRIMARY KEY CLUSTERED 
(
	[ShortCutCodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Provider]    Script Date: 03/14/2017 16:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Provider](
	[ProviderId] [int] NOT NULL,
	[ProviderIdentifier] [varchar](50) NULL,
	[DisplayName] [varchar](100) NULL,
	[RowNumber] [int] NULL,
	[Active] [bit] NULL,
	[VendorId] [int] NULL,
 CONSTRAINT [PK_PROVIDER] PRIMARY KEY CLUSTERED 
(
	[ProviderId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Practitioner]    Script Date: 03/14/2017 16:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
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
	[Phone] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
 CONSTRAINT [PK_Practitioner] PRIMARY KEY CLUSTERED 
(
	[PractitionerId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Supplied by external data vendor to uniquely identify the person.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Practitioner', @level2type=N'COLUMN',@level2name=N'PractitionerVendorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to dbo.PersonPrefix' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Practitioner', @level2type=N'COLUMN',@level2name=N'Prefix'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to dbo.PersonPrefix' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Practitioner', @level2type=N'COLUMN',@level2name=N'Suffix'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key into imaginary ISO coutnry code table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Practitioner', @level2type=N'COLUMN',@level2name=N'CountryCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key to an imaginary table of Issuing authorities.  Assumed now to be AHS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Practitioner', @level2type=N'COLUMN',@level2name=N'PractIdIssuer'
GO
/****** Object:  Table [dbo].[PersonPrefix]    Script Date: 03/14/2017 16:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PersonPrefix](
	[PersonPrefixId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PersonPrefix] PRIMARY KEY CLUSTERED 
(
	[PersonPrefixId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_PersonPrefix] UNIQUE NONCLUSTERED 
(
	[Description] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PersonContact]    Script Date: 03/14/2017 16:06:19 ******/
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
GO
/****** Object:  Table [dbo].[Person]    Script Date: 03/14/2017 16:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Person](
	[PersonId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[DisplayName] [varchar](150) NULL,
	[Sex] [int] NULL,
	[DOB] [datetime] NULL,
	[SoundexCode] [varchar](50) NULL,
 CONSTRAINT [PK_PERSON] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PatientPractitioner]    Script Date: 03/14/2017 16:06:19 ******/
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
	[LastActivity] [datetime] NULL,
 CONSTRAINT [PK_PatientPractitioner_1] PRIMARY KEY CLUSTERED 
(
	[PatientPractitionerId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PatientMetric]    Script Date: 03/14/2017 16:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientMetric](
	[PatientMetricId] [int] IDENTITY(1,1) NOT NULL,
	[MetricId] [int] NOT NULL,
	[Measurement] [float] NOT NULL,
	[DateOf] [datetime] NOT NULL,
	[DocumentId] [int] NOT NULL,
 CONSTRAINT [PK_PatientMetric] PRIMARY KEY CLUSTERED 
(
	[PatientMetricId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 03/14/2017 16:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Patient](
	[PatientId] [int] NOT NULL,
	[DisplayName] [varchar](60) NULL,
	[FirstName] [varchar](50) NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[DateOfBirth] [datetime] NULL,
	[Prefix] [int] NULL,
	[Suffix] [nchar](10) NULL,
	[Address] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[Province] [varchar](50) NULL,
	[PostalCode] [varchar](50) NULL,
	[CountryCode] [int] NULL,
	[Gender] [char](1) NULL,
	[PHN] [varchar](100) NULL,
	[PHNIssuer] [int] NULL,
	[ProviderId] [int] NULL,
	[ModifiedId] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[SoundexCode] [varchar](50) NULL,
	[CreatedId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[Note] [varchar](1000) NULL,
	[HomePhone] [varchar](100) NULL,
	[CelPhone] [varchar](100) NULL,
	[WorkPhone] [varchar](100) NULL,
	[GenderId] [int] NULL,
	[MaritalStatusId] [int] NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MetricGroupItem]    Script Date: 03/14/2017 16:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MetricGroupItem](
	[MetricGroupItemId] [int] IDENTITY(1,1) NOT NULL,
	[MetricId] [int] NOT NULL,
	[DisplayRow] [int] NULL,
 CONSTRAINT [PK_MetricGroupItem] PRIMARY KEY CLUSTERED 
(
	[MetricGroupItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MetricGroup]    Script Date: 03/14/2017 16:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MetricGroup](
	[MetricGroupId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](100) NULL,
	[DisplayRow] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Metric]    Script Date: 03/14/2017 16:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Metric](
	[MetricId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](200) NOT NULL,
	[UnitId] [int] NOT NULL,
	[Rounding] [int] NULL,
 CONSTRAINT [PK_Metric] PRIMARY KEY CLUSTERED 
(
	[MetricId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UnitOfMeasure]    Script Date: 03/14/2017 16:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UnitOfMeasure](
	[UnitofMeasureId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](200) NOT NULL,
	[Abbreviation] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[UnitofMeasureId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ToolMenuItem]    Script Date: 03/14/2017 16:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ToolMenuItem](
	[ToolMenuItemId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[Command] [varchar](500) NOT NULL,
	[ItemOrder] [smallint] NULL,
	[RequiredRole] [varchar](50) NULL,
 CONSTRAINT [PK_ToolMenuItem] PRIMARY KEY CLUSTERED 
(
	[ToolMenuItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TableValues]    Script Date: 03/14/2017 16:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableValues](
	[ID] [int] NOT NULL,
	[Table] [nvarchar](255) NOT NULL,
	[Value] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](255) NULL,
 CONSTRAINT [PK_TableValues] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLoginEventType]    Script Date: 03/14/2017 16:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserLoginEventType](
	[UserLoginEventTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[RowNumber] [int] NULL,
 CONSTRAINT [PK_USERLOGINEVENTTYPE] PRIMARY KEY CLUSTERED 
(
	[UserLoginEventTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserGroupProfile]    Script Date: 03/14/2017 16:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserGroupProfile](
	[UserGroupProfileId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_USERGROUPPROFILE] PRIMARY KEY CLUSTERED 
(
	[UserGroupProfileId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserAccountGroupProfile]    Script Date: 03/14/2017 16:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAccountGroupProfile](
	[UserAccountGroupProfileId] [int] IDENTITY(1,1) NOT NULL,
	[UserAccountId] [int] NOT NULL,
	[UserGroupProfileId] [int] NOT NULL,
 CONSTRAINT [PK_UserAccountGroupProfile] PRIMARY KEY CLUSTERED 
(
	[UserAccountGroupProfileId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAccount]    Script Date: 03/14/2017 16:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserAccount](
	[UserAccountId] [int] IDENTITY(1,1) NOT NULL,
	[LoginName] [varchar](500) NOT NULL,
	[DisplayName] [varchar](100) NULL,
	[IsActive] [bit] NULL,
	[ExpiryDate] [datetime] NULL,
	[SecurityLevel] [int] NULL,
	[Initials] [varchar](10) NULL,
	[EMail] [varchar](500) NULL,
 CONSTRAINT [PK_UserAccount] PRIMARY KEY CLUSTERED 
(
	[UserAccountId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ__LoginName] ON [dbo].[UserAccount] 
(
	[LoginName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ICD10Group]    Script Date: 03/14/2017 16:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ICD10Group]
AS
SELECT     DiagnosticCodeGroupId, Version, [Level], Sequence, Description
FROM         dbo.DiagnosticCodeGroup
WHERE     (Version = 10) AND ([Level] = 1)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[17] 2[22] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "DiagnosticCodeGroup"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 240
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ICD10Group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ICD10Group'
GO
/****** Object:  View [dbo].[ICD10Code]    Script Date: 03/14/2017 16:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ICD10Code]
AS
SELECT     DiagnosticCodeId, Code, Description, Version, [Group], Subgroup
FROM         dbo.DiagnosticCode
WHERE     (Version = 10)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "DiagnosticCode"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 203
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ICD10Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ICD10Code'
GO
/****** Object:  View [dbo].[ICD9SubGroup]    Script Date: 03/14/2017 16:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ICD9SubGroup]
AS
SELECT     DiagnosticCodeGroupId, Version, [Level], Sequence, Description
FROM         dbo.DiagnosticCodeGroup
WHERE     ([Level] = 2) AND (Version = 9)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "DiagnosticCodeGroup"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 3105
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ICD9SubGroup'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ICD9SubGroup'
GO
/****** Object:  Table [dbo].[Document]    Script Date: 03/14/2017 16:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Document](
	[DocumentId] [int] IDENTITY(1,1) NOT NULL,
	[LegacyDocumentId] [int] NULL,
	[PatientId] [int] NOT NULL,
	[ProviderId] [int] NOT NULL,
	[VisitDate] [datetime] NOT NULL,
	[EditDate] [datetime] NOT NULL,
	[Proofed] [bit] NULL,
	[Billed] [bit] NULL,
	[Notes] [varchar](5000) NOT NULL,
	[SecurityLevel] [int] NOT NULL,
	[CategoryId] [int] NULL,
	[ModuleId] [int] NOT NULL,
	[FromProviderId] [int] NULL,
 CONSTRAINT [PK_DOCUMENT] PRIMARY KEY CLUSTERED 
(
	[DocumentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[ICD9Group]    Script Date: 03/14/2017 16:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ICD9Group]
AS
SELECT     DiagnosticCodeGroupId, Version, [Level], Sequence, Description
FROM         dbo.DiagnosticCodeGroup
WHERE     ([Level] = 1) AND (Version = 9)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "DiagnosticCodeGroup"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ICD9Group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ICD9Group'
GO
/****** Object:  View [dbo].[ICD9Code]    Script Date: 03/14/2017 16:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ICD9Code]
AS
SELECT     DiagnosticCodeId, Code, Version, Description, [Group], Subgroup
FROM         dbo.DiagnosticCode
WHERE     (Version = 9)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "DiagnosticCode"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 203
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ICD9Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ICD9Code'
GO
/****** Object:  View [dbo].[ICD10SubGroup]    Script Date: 03/14/2017 16:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ICD10SubGroup]
AS
SELECT     DiagnosticCodeGroupId, Version, [Level], Sequence, Description
FROM         dbo.DiagnosticCodeGroup
WHERE     ([Level] = 2) AND (Version = 10)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "DiagnosticCodeGroup"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 240
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 5085
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ICD10SubGroup'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ICD10SubGroup'
GO
/****** Object:  View [dbo].[ICD10GroupSubGroup]    Script Date: 03/14/2017 16:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ICD10GroupSubGroup]
AS
SELECT     [group].DiagnosticCodeGroupId AS GroupID, [group].Version AS GroupVersion, [group].[Level] AS GroupLevel, [group].Sequence AS GroupSequence, 
                      [group].Description AS GroupDescription, SUBGROUP.DiagnosticCodeGroupId AS SubGroupId, SUBGROUP.Version AS SubGroupVersion, 
                      SUBGROUP.[Level] AS SubGroupLevel, SUBGROUP.Sequence AS SubGroupSequence, SUBGROUP.Description AS SubGroupDescription
FROM         dbo.ICD10Group AS [group] INNER JOIN
                      dbo.ICD10SubGroup AS SUBGROUP ON [group].Sequence = SUBGROUP.Sequence
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "group"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 298
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "SUBGROUP"
            Begin Extent = 
               Top = 4
               Left = 370
               Bottom = 121
               Right = 673
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 11
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2805
         Alias = 2880
         Table = 1905
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ICD10GroupSubGroup'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ICD10GroupSubGroup'
GO
/****** Object:  Table [dbo].[DocumentLocation]    Script Date: 03/14/2017 16:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DocumentLocation](
	[DocumentLocationId] [int] IDENTITY(1,1) NOT NULL,
	[DocumentLocationRootId] [int] NOT NULL,
	[Path] [varchar](500) NOT NULL,
	[DocumentId] [int] NOT NULL,
	[PageNumber] [int] NULL,
 CONSTRAINT [PK_DocumentLocation] PRIMARY KEY CLUSTERED 
(
	[DocumentLocationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DocumentKeyword]    Script Date: 03/14/2017 16:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DocumentKeyword](
	[DocumentKeywordId] [int] IDENTITY(1,1) NOT NULL,
	[Keyword] [varchar](50) NOT NULL,
	[DocumentId] [int] NOT NULL,
 CONSTRAINT [PK_DocumentKeyword] PRIMARY KEY CLUSTERED 
(
	[DocumentKeywordId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PatientDiagnosticCode]    Script Date: 03/14/2017 16:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientDiagnosticCode](
	[PatientDiagnosticCodeId] [int] IDENTITY(1,1) NOT NULL,
	[DiagnosticCodeId] [int] NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[PatientId] [int] NOT NULL,
	[DocumentId] [int] NULL,
 CONSTRAINT [PK_PatientDiagnosticCode] PRIMARY KEY CLUSTERED 
(
	[PatientDiagnosticCodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ICD9GroupSubGroup]    Script Date: 03/14/2017 16:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ICD9GroupSubGroup]
AS
SELECT     [group].DiagnosticCodeGroupId AS GroupID, [group].Version AS GroupVersion, [group].[Level] AS GroupLevel, [group].Sequence AS GroupSequence, 
                      [group].Description AS GroupDescription, SUBGROUP.DiagnosticCodeGroupId AS SubGroupId, SUBGROUP.Version AS SubGroupVersion, 
                      SUBGROUP.[Level] AS SubGroupLevel, SUBGROUP.Sequence AS SubGroupSequence, SUBGROUP.Description AS SubGroupDescription
FROM         dbo.ICD9Group AS [group] INNER JOIN
                      dbo.ICD9SubGroup AS SUBGROUP ON [group].Sequence = SUBGROUP.Sequence
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "group"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SUBGROUP"
            Begin Extent = 
               Top = 6
               Left = 270
               Bottom = 121
               Right = 464
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ICD9GroupSubGroup'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ICD9GroupSubGroup'
GO
/****** Object:  StoredProcedure [dbo].[UpdatePageNumberFieldFromNULL]    Script Date: 03/14/2017 16:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Robert McBean
-- Create date: April 2, 2016
-- Description:	One time update to PageNumber field in DocumentLocation
-- =============================================

CREATE PROCEDURE [dbo].[UpdatePageNumberFieldFromNULL]

AS
BEGIN
	--SET NOCOUNT ON;
	
	UPDATE DocumentLocation SET PageNumber = 1
	WHERE PageNumber IS NULL

END
GO
/****** Object:  StoredProcedure [dbo].[spInsertDocumentLocation]    Script Date: 03/14/2017 16:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		R.McBean
-- Create date: 1-Apr-2016
-- Description:	Insert to the DocumentLocationTable and increment the 
--              page number if not provided.
-- =============================================================================

CREATE PROCEDURE [dbo].[spInsertDocumentLocation]

	@DocumentId INT,
	@DocumentLocationRootId INT,
	@Path VARCHAR(1000),
	@PageNumber INT
	
AS

BEGIN

	SET NOCOUNT ON;
	--DECLARE @PageNumber AS INT
	
	--SET @PageNumber = (SELECT COUNT(*) FROM DocumentLocation WHERE DocumentId = @DocumentId);
	
	INSERT INTO DocumentLocation(DocumentLocationRootId, Path, DocumentId, PageNumber)
	VALUES
	(@DocumentLocationRootId,@Path,@DocumentId, @PageNumber);

END
GO
/****** Object:  StoredProcedure [dbo].[spCreateUpdatePatient]    Script Date: 03/14/2017 16:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		RMcBean
-- Create date: 1-Apr-2016
-- Description:	Insert to the DocumentLocationTable with various options
--              to maintain the page number
-- =============================================================================


CREATE PROCEDURE [dbo].[spCreateUpdatePatient]

	@DocumentId INT,
	@DocumentLocationRootId INT,
	@Path VARCHAR(1000)
	
AS



BEGIN

	SET NOCOUNT ON;
	DECLARE @PageNumber AS INT
	
	SET @PageNumber = (SELECT COUNT(*) FROM DocumentLocation WHERE DocumentId = @DocumentId);
	
	

END
GO
/****** Object:  Default [DF_DocumentArchive_CreationDate]    Script Date: 03/14/2017 16:06:19 ******/
ALTER TABLE [dbo].[DocumentArchive] ADD  CONSTRAINT [DF_DocumentArchive_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
/****** Object:  Default [DF__Document__Proofe__4277DAAA]    Script Date: 03/14/2017 16:06:21 ******/
ALTER TABLE [dbo].[Document] ADD  CONSTRAINT [DF__Document__Proofe__4277DAAA]  DEFAULT ((0)) FOR [Proofed]
GO
/****** Object:  Default [DF__Document__Billed__436BFEE3]    Script Date: 03/14/2017 16:06:21 ******/
ALTER TABLE [dbo].[Document] ADD  CONSTRAINT [DF__Document__Billed__436BFEE3]  DEFAULT ((0)) FOR [Billed]
GO
/****** Object:  Default [DF__Document__Securi__4460231C]    Script Date: 03/14/2017 16:06:21 ******/
ALTER TABLE [dbo].[Document] ADD  CONSTRAINT [DF__Document__Securi__4460231C]  DEFAULT ((0)) FOR [SecurityLevel]
GO
/****** Object:  ForeignKey [FK_Document_Category]    Script Date: 03/14/2017 16:06:21 ******/
ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [FK_Document_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [FK_Document_Category]
GO
/****** Object:  ForeignKey [FK_Document_Patient]    Script Date: 03/14/2017 16:06:21 ******/
ALTER TABLE [dbo].[Document]  WITH NOCHECK ADD  CONSTRAINT [FK_Document_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([PatientId])
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [FK_Document_Patient]
GO
/****** Object:  ForeignKey [FK_Document_Provider]    Script Date: 03/14/2017 16:06:21 ******/
ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [FK_Document_Provider] FOREIGN KEY([ProviderId])
REFERENCES [dbo].[Provider] ([ProviderId])
GO
ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [FK_Document_Provider]
GO
/****** Object:  ForeignKey [FK_DocumentLocation_Document]    Script Date: 03/14/2017 16:06:21 ******/
ALTER TABLE [dbo].[DocumentLocation]  WITH CHECK ADD  CONSTRAINT [FK_DocumentLocation_Document] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[Document] ([DocumentId])
GO
ALTER TABLE [dbo].[DocumentLocation] CHECK CONSTRAINT [FK_DocumentLocation_Document]
GO
/****** Object:  ForeignKey [FK_DocumentKeyword_Document]    Script Date: 03/14/2017 16:06:21 ******/
ALTER TABLE [dbo].[DocumentKeyword]  WITH CHECK ADD  CONSTRAINT [FK_DocumentKeyword_Document] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[Document] ([DocumentId])
GO
ALTER TABLE [dbo].[DocumentKeyword] CHECK CONSTRAINT [FK_DocumentKeyword_Document]
GO
/****** Object:  ForeignKey [FK_PatientDiagnosticCode_DiagnosticCode]    Script Date: 03/14/2017 16:06:21 ******/
ALTER TABLE [dbo].[PatientDiagnosticCode]  WITH CHECK ADD  CONSTRAINT [FK_PatientDiagnosticCode_DiagnosticCode] FOREIGN KEY([DiagnosticCodeId])
REFERENCES [dbo].[DiagnosticCode] ([DiagnosticCodeId])
GO
ALTER TABLE [dbo].[PatientDiagnosticCode] CHECK CONSTRAINT [FK_PatientDiagnosticCode_DiagnosticCode]
GO
/****** Object:  ForeignKey [FK_PatientDiagnosticCode_Document]    Script Date: 03/14/2017 16:06:21 ******/
ALTER TABLE [dbo].[PatientDiagnosticCode]  WITH CHECK ADD  CONSTRAINT [FK_PatientDiagnosticCode_Document] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[Document] ([DocumentId])
GO
ALTER TABLE [dbo].[PatientDiagnosticCode] CHECK CONSTRAINT [FK_PatientDiagnosticCode_Document]
GO
/****** Object:  ForeignKey [FK_PatientDiagnosticCode_Patient]    Script Date: 03/14/2017 16:06:21 ******/
ALTER TABLE [dbo].[PatientDiagnosticCode]  WITH NOCHECK ADD  CONSTRAINT [FK_PatientDiagnosticCode_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([PatientId])
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[PatientDiagnosticCode] CHECK CONSTRAINT [FK_PatientDiagnosticCode_Patient]
GO
