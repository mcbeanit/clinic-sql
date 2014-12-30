USE [master]
GO
/****** Object:  Database [mcbean_clinic]    Script Date: 11/21/2014 00:02:15 ******/
CREATE DATABASE [mcbean_clinic] ON  PRIMARY 
( NAME = N'mcbean.clinic', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\mcbean_clinic.mdf' , SIZE = 66368KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'mcbean.clinic_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\mcbean_clinic_1.ldf' , SIZE = 69760KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Schema [clinic]    Script Date: 11/21/2014 00:02:15 ******/
CREATE SCHEMA [clinic] AUTHORIZATION [dbo]
GO
/****** Object:  Table [dbo].[PatientMetric]    Script Date: 11/21/2014 00:02:22 ******/
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
/****** Object:  Table [dbo].[UserLoginEventType]    Script Date: 11/21/2014 00:02:22 ******/
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
/****** Object:  Table [dbo].[UserGroupProfile]    Script Date: 11/21/2014 00:02:22 ******/
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
/****** Object:  Table [dbo].[UserAccountGroupProfile]    Script Date: 11/21/2014 00:02:22 ******/
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
/****** Object:  Table [dbo].[UserAccount]    Script Date: 11/21/2014 00:02:22 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_UserAccount] UNIQUE NONCLUSTERED 
(
	[LoginName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UnitOfMeasure]    Script Date: 11/21/2014 00:02:22 ******/
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
/****** Object:  Table [dbo].[ToolMenuItem]    Script Date: 11/21/2014 00:02:22 ******/
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
/****** Object:  Table [dbo].[PATIENT_DEMOGRAPHICS]    Script Date: 11/21/2014 00:02:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PATIENT_DEMOGRAPHICS](
	[PatientID] [varchar](50) NULL,
	[Dat_Index_Number] [varchar](50) NULL,
	[Patient_Name] [varchar](50) NULL,
	[ProvinceCode] [varchar](50) NULL,
	[Personal_Health_Number] [varchar](50) NULL,
	[Chart_Number] [varchar](50) NULL,
	[MTDocNum] [varchar](50) NULL,
	[MT_Doctor_ULI] [varchar](50) NULL,
	[RefDocULI] [varchar](50) NULL,
	[SelectCode] [varchar](50) NULL,
	[Date_of_Birth] [varchar](50) NULL,
	[Sex] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Province] [varchar](50) NULL,
	[Postal_Code] [varchar](50) NULL,
	[Phone_Home] [varchar](50) NULL,
	[Phone_Work] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Balance] [varchar](50) NULL,
	[BenefitsUsed] [varchar](50) NULL,
	[BabyStatus] [varchar](50) NULL,
	[ExtraInfo] [varchar](50) NULL,
	[LabelFlag] [varchar](50) NULL,
	[LastRefDate] [varchar](50) NULL,
	[Marital] [varchar](50) NULL,
	[LastChange] [varchar](50) NULL,
	[LastChangeUser] [varchar](50) NULL,
	[NextOfKin] [varchar](50) NULL,
	[Life_Style] [varchar](50) NULL,
	[Family_History] [varchar](50) NULL,
	[Allergies] [varchar](50) NULL,
	[Medication] [varchar](50) NULL,
	[Tobacco] [varchar](50) NULL,
	[Reproductive] [varchar](50) NULL,
	[Vaccination] [varchar](50) NULL,
	[HealthRisks] [varchar](50) NULL,
	[Operations] [varchar](50) NULL,
	[BloodType] [varchar](50) NULL,
	[Note] [varchar](5000) NULL,
	[PastMedicalHistory] [varchar](50) NULL,
	[Gravida] [varchar](50) NULL,
	[Parity] [varchar](50) NULL,
	[Abortions] [varchar](50) NULL,
	[RubellaImmune] [varchar](50) NULL,
	[RubellaDate] [varchar](50) NULL,
	[Pneumovax] [varchar](50) NULL,
	[PneumovaxDate] [varchar](50) NULL,
	[Hemophilus] [varchar](50) NULL,
	[HemophilusDate] [varchar](50) NULL,
	[Rabies] [varchar](50) NULL,
	[RabiesDate] [varchar](50) NULL,
	[Measles] [varchar](50) NULL,
	[MeaslesDate] [varchar](50) NULL,
	[Mumps] [varchar](50) NULL,
	[MumpsDate] [varchar](50) NULL,
	[Polio] [varchar](50) NULL,
	[PolioDate] [varchar](50) NULL,
	[Tetanus] [varchar](50) NULL,
	[TetanusDate] [varchar](50) NULL,
	[Pertussis] [varchar](50) NULL,
	[PertussisDate] [varchar](50) NULL,
	[Diptheria] [varchar](50) NULL,
	[DiptheriaDate] [varchar](50) NULL,
	[Meningococcal] [varchar](50) NULL,
	[MeningococcalDate] [varchar](50) NULL,
	[YellowFever] [varchar](50) NULL,
	[YellowFeverDate] [varchar](50) NULL,
	[JapaneseB] [varchar](50) NULL,
	[JapaneseBDate] [varchar](50) NULL,
	[Influenza] [varchar](50) NULL,
	[InfluenzaDate] [varchar](50) NULL,
	[HepA] [varchar](50) NULL,
	[HepADate] [varchar](50) NULL,
	[HepANum] [varchar](50) NULL,
	[HepB] [varchar](50) NULL,
	[HepBDate] [varchar](50) NULL,
	[HepBNum] [varchar](50) NULL,
	[RemindForFluVaccine] [varchar](50) NULL,
	[NewFromReplica] [varchar](50) NULL,
	[PATIENT_DEMOGRAPHICS_Text_01] [varchar](50) NULL,
	[PATIENT_DEMOGRAPHICS_Text_02] [varchar](50) NULL,
	[PATIENT_DEMOGRAPHICS_Text_03] [varchar](50) NULL,
	[PATIENT_DEMOGRAPHICS_Integer_01] [varchar](50) NULL,
	[PATIENT_DEMOGRAPHICS_Integer_02] [varchar](50) NULL,
	[PATIENT_DEMOGRAPHICS_Integer_03] [varchar](50) NULL,
	[PATIENT_DEMOGRAPHICS_Boolean_01] [varchar](50) NULL,
	[PATIENT_DEMOGRAPHICS_Boolean_02] [varchar](50) NULL,
	[PATIENT_DEMOGRAPHICS_Date_01] [varchar](50) NULL,
	[PATIENT_DEMOGRAPHICS_Memo_01] [varchar](50) NULL,
	[TimeStamp] [varchar](50) NULL,
	[User] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[RosterStrDate] [varchar](50) NULL,
	[RosterEndDate] [varchar](50) NULL,
	[RefDocIndex] [varchar](50) NULL,
	[Revision] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreationDate] [varchar](50) NULL,
	[ModifiedDate] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ConfidentialityType] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 11/21/2014 00:02:22 ******/
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
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MetricGroupItem]    Script Date: 11/21/2014 00:02:22 ******/
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
/****** Object:  Table [dbo].[MetricGroup]    Script Date: 11/21/2014 00:02:22 ******/
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
/****** Object:  Table [dbo].[Metric]    Script Date: 11/21/2014 00:02:22 ******/
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
/****** Object:  Table [dbo].[LU_SHORTCUTCODES]    Script Date: 11/21/2014 00:02:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_SHORTCUTCODES](
	[ShortcutCode] [nvarchar](3) NULL,
	[ReplacementText] [nvarchar](max) NULL,
	[ShortcutType] [nvarchar](50) NULL,
	[LU_SHORTCUTCODES_Text_01] [nvarchar](50) NULL,
	[LU_SHORTCUTCODES_Text_02] [nvarchar](50) NULL,
	[LU_SHORTCUTCODES_Text_03] [nvarchar](50) NULL,
	[LU_SHORTCUTCODES_Integer_01] [int] NULL,
	[LU_SHORTCUTCODES_Integer_02] [int] NULL,
	[LU_SHORTCUTCODES_Integer_03] [int] NULL,
	[LU_SHORTCUTCODES_Boolean_01] [bit] NOT NULL,
	[LU_SHORTCUTCODES_Boolean_02] [bit] NOT NULL,
	[LU_SHORTCUTCODES_Date_01] [datetime] NULL,
	[LU_SHORTCUTCODES_Memo_01] [nvarchar](max) NULL,
	[TimeStamp] [datetime] NULL,
	[User] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LU_REFERRING_DOCTORS]    Script Date: 11/21/2014 00:02:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_REFERRING_DOCTORS](
	[ReferringDoctorID] [uniqueidentifier] NULL,
	[MTIndexNum] [int] NULL,
	[ULI] [nvarchar](15) NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Province] [nvarchar](50) NULL,
	[Postal] [nvarchar](50) NULL,
	[Phone1] [nvarchar](50) NULL,
	[Phone2] [nvarchar](50) NULL,
	[Speciality] [nvarchar](50) NULL,
	[Salutation] [nvarchar](50) NULL,
	[MedTechClient] [bit] NOT NULL,
	[LU_REFERRING_DOCTORS_Text_01] [nvarchar](50) NULL,
	[LU_REFERRING_DOCTORS_Text_02] [nvarchar](50) NULL,
	[LU_REFERRING_DOCTORS_Text_03] [nvarchar](50) NULL,
	[LU_REFERRING_DOCTORS_Integer_01] [int] NULL,
	[LU_REFERRING_DOCTORS_Integer_02] [int] NULL,
	[LU_REFERRING_DOCTORS_Integer_03] [int] NULL,
	[LU_REFERRING_DOCTORS_Boolean_01] [bit] NOT NULL,
	[LU_REFERRING_DOCTORS_Boolean_02] [bit] NOT NULL,
	[LU_REFERRING_DOCTORS_Date_01] [datetime] NULL,
	[LU_REFERRING_DOCTORS_Memo_01] [nvarchar](max) NULL,
	[TimeStamp] [datetime] NULL,
	[User] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LU_DOCTORS]    Script Date: 11/21/2014 00:02:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_DOCTORS](
	[DoctorID] [uniqueidentifier] NULL,
	[MT_Doctor_ULI] [nvarchar](15) NULL,
	[MT_Doctor_Number] [smallint] NULL,
	[MT_Doctor_Name] [nvarchar](50) NULL,
	[Doctor Address] [nvarchar](50) NULL,
	[Doctor City] [nvarchar](50) NULL,
	[Doctor Province] [nvarchar](50) NULL,
	[Doctor Postal] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Fax] [nvarchar](50) NULL,
	[CanBillHealthCare] [bit] NOT NULL,
	[AppointmentDoctor] [bit] NOT NULL,
	[OverviewPosition] [int] NULL,
	[DefaultForeColor] [int] NULL,
	[DefaultBackColor] [int] NULL,
	[DefaultFlashColor] [int] NULL,
	[DefaultCaption] [nvarchar](50) NULL,
	[DefaultCaptionFontName] [nvarchar](50) NULL,
	[DefaultCaptionFontSize] [real] NULL,
	[DefaultCaptionFontBold] [bit] NOT NULL,
	[DefaultCaptionFontItalic] [bit] NOT NULL,
	[DefaultRowHeight] [real] NULL,
	[AppointmentStartTime] [smallint] NULL,
	[AppointmentEndTime] [smallint] NULL,
	[AppointmentInterval] [smallint] NULL,
	[Template1] [nvarchar](255) NULL,
	[Template2] [nvarchar](50) NULL,
	[Template3] [nvarchar](50) NULL,
	[LU_DOCTORS_Integer01] [int] NULL,
	[LU_DOCTORS_Integer02] [int] NULL,
	[LU_DOCTORS_Text_02] [nvarchar](50) NULL,
	[LU_DOCTORS_Text_03] [nvarchar](50) NULL,
	[LU_DOCTORS_Boolean_01] [bit] NOT NULL,
	[LU_DOCTORS_Boolean_02] [bit] NOT NULL,
	[LU_DOCTORS_Memo_01] [nvarchar](max) NULL,
	[TimeStamp] [datetime] NULL,
	[User] [nvarchar](50) NULL,
	[LU_Doctors_Text_01] [nvarchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShortCutCode]    Script Date: 11/21/2014 00:02:22 ******/
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
/****** Object:  Table [dbo].[Provider]    Script Date: 11/21/2014 00:02:22 ******/
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
/****** Object:  Table [dbo].[Practitioner]    Script Date: 11/21/2014 00:02:22 ******/
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
/****** Object:  Table [dbo].[PersonPrefix]    Script Date: 11/21/2014 00:02:22 ******/
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
/****** Object:  Table [dbo].[PersonContact]    Script Date: 11/21/2014 00:02:22 ******/
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
/****** Object:  Table [dbo].[Person]    Script Date: 11/21/2014 00:02:22 ******/
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
/****** Object:  Table [dbo].[Gender]    Script Date: 11/21/2014 00:02:22 ******/
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
/****** Object:  Table [dbo].[EditForm]    Script Date: 11/21/2014 00:02:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EditForm](
	[EditFormId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[SQLQuery] [varchar](5000) NOT NULL,
	[DefaultPermissions] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EditForm] PRIMARY KEY CLUSTERED 
(
	[EditFormId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EChartDocumentLocation]    Script Date: 11/21/2014 00:02:22 ******/
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
	[Viewer] [varchar](50) NOT NULL,
	[DocumentId] [int] NULL,
	[DocumentLocationRootId] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EChartAuditTrail]    Script Date: 11/21/2014 00:02:22 ******/
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
/****** Object:  Table [dbo].[DocumentViewer]    Script Date: 11/21/2014 00:02:22 ******/
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
/****** Object:  Table [dbo].[DocumentType]    Script Date: 11/21/2014 00:02:22 ******/
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
/****** Object:  Table [dbo].[DocumentLocationRoot]    Script Date: 11/21/2014 00:02:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DocumentLocationRoot](
	[DocumentLocationRootId] [int] IDENTITY(1,1) NOT NULL,
	[Path] [varchar](500) NULL,
	[FileCount] [int] NULL,
	[FileSize] [int] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_DocumentLocationRoot] PRIMARY KEY CLUSTERED 
(
	[DocumentLocationRootId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DocumentInbox]    Script Date: 11/21/2014 00:02:22 ******/
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
/****** Object:  Table [dbo].[DocumentArchive]    Script Date: 11/21/2014 00:02:22 ******/
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
/****** Object:  Table [dbo].[DOCUMENT_DESCRIPTION]    Script Date: 11/21/2014 00:02:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DOCUMENT_DESCRIPTION](
	[Document_Number] [int] NOT NULL,
	[Date_of_Document] [datetime] NOT NULL,
	[Date_of_Index] [datetime] NOT NULL,
	[PatientID] [uniqueidentifier] NULL,
	[Dat_Index_Number] [int] NOT NULL,
	[MT_Doctor_Number] [smallint] NOT NULL,
	[Addressee] [nvarchar](200) NULL,
	[Category] [nvarchar](50) NOT NULL,
	[Viewer] [nvarchar](3) NULL,
	[Viewer Description] [nvarchar](50) NOT NULL,
	[Proofed] [bit] NOT NULL,
	[Billed] [bit] NOT NULL,
	[Read] [bit] NOT NULL,
	[Keywords] [bit] NOT NULL,
	[Document_Image] [nvarchar](50) NULL,
	[Document_Location] [nvarchar](255) NULL,
	[Security_Level] [smallint] NOT NULL,
	[Patient_Notes] [nvarchar](max) NULL,
	[Notes Subjective] [nvarchar](max) NULL,
	[Notes Objective] [nvarchar](max) NULL,
	[Notes Assessment] [nvarchar](max) NULL,
	[Notes Plan] [nvarchar](max) NULL,
	[FeeCode] [nvarchar](10) NULL,
	[DiagCode] [nvarchar](10) NULL,
	[Deleted] [bit] NOT NULL,
	[Abnormal] [bit] NOT NULL,
	[Source] [nvarchar](50) NULL,
	[Revision] [int] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiagnosticCodeGroup]    Script Date: 11/21/2014 00:02:22 ******/
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
/****** Object:  Table [dbo].[DiagnosticCode]    Script Date: 11/21/2014 00:02:22 ******/
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
/****** Object:  Table [dbo].[ContactType]    Script Date: 11/21/2014 00:02:22 ******/
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
/****** Object:  Table [dbo].[CD_IMAGES]    Script Date: 11/21/2014 00:02:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CD_IMAGES](
	[ImageID] [uniqueidentifier] NULL,
	[Name] [nvarchar](50) NULL,
	[NumFiles] [int] NULL,
	[TotalSize] [int] NULL,
	[Path] [nvarchar](255) NOT NULL,
	[ActiveImage] [bit] NOT NULL,
	[TimeStamp] [datetime] NULL,
	[User] [nvarchar](50) NULL,
	[Archived] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/21/2014 00:02:22 ******/
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
/****** Object:  Table [dbo].[AuditTrailCategory]    Script Date: 11/21/2014 00:02:22 ******/
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
/****** Object:  Table [dbo].[AuditTrail]    Script Date: 11/21/2014 00:02:22 ******/
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
/****** Object:  Table [dbo].[Appointment]    Script Date: 11/21/2014 00:02:22 ******/
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
/****** Object:  Table [dbo].[Document]    Script Date: 11/21/2014 00:02:22 ******/
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
	[Notes] [varchar](5000) NULL,
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
/****** Object:  View [dbo].[ICD9Group]    Script Date: 11/21/2014 00:02:27 ******/
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
/****** Object:  View [dbo].[ICD9Code]    Script Date: 11/21/2014 00:02:27 ******/
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
/****** Object:  View [dbo].[ICD10SubGroup]    Script Date: 11/21/2014 00:02:27 ******/
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
/****** Object:  Table [dbo].[PatientPractitioner]    Script Date: 11/21/2014 00:02:27 ******/
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
GO
CREATE UNIQUE NONCLUSTERED INDEX [UniqueRelationship] ON [dbo].[PatientPractitioner] 
(
	[PatientId] ASC,
	[PractitionerId] ASC,
	[Description] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ICD9SubGroup]    Script Date: 11/21/2014 00:02:27 ******/
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
/****** Object:  StoredProcedure [dbo].[spCreateUser]    Script Date: 11/21/2014 00:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:			Robert McBean
-- Create date:		January 15, 2014
-- Description:		Add a new user account
-- =============================================

CREATE PROCEDURE [dbo].[spCreateUser]

	@LoginName varchar(100),
	@DisplayName varchar(100),
	@IsActive bit, 
	@ExpiryDate datetime,
	@SecurityLevel int,
	@Initials varchar(10),
	@EMail varchar(500)

AS
	SET NOCOUNT ON;

	BEGIN
	
	declare @UserID int
	declare @UserAccountId int

	BEGIN TRY
	
		BEGIN TRANSACTION
		
		set @UserID = (SELECT UserAccountId FROM UserAccount Account WHERE LoginName = SYSTEM_USER)
		set @UserAccountId = (SELECT useraccountid from UserAccount Where loginname = 'mcbean')
		
		IF NOT EXISTS (SELECT useraccountid from UserAccount Where loginname = @LoginName)
		BEGIN

			INSERT INTO UserAccount (LoginName, DisplayName, IsActive, ExpiryDate, SecurityLevel, Initials, EMail)
				SELECT @LoginName, @DisplayName, @IsActive, @ExpiryDate, @SecurityLevel, @Initials, @EMail 
		
			INSERT INTO dbo.AuditTrail (AuditTrailCategoryId, UserAccountId, EventDateTime,DataId, Comment)
   				SELECT 5, @UserID, GETDATE(), SCOPE_IDENTITY() , 'add user'
   		END
		
		COMMIT

	END TRY
	
	BEGIN CATCH
		SELECT  ERROR_MESSAGE() AS ErrorMessage,ERROR_LINE() AS ErrorLine, ERROR_NUMBER() AS ErrorNumber
		ROLLBACK
	END CATCH

	END
GO
/****** Object:  StoredProcedure [dbo].[spCreateUpdatePatient]    Script Date: 11/21/2014 00:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		RMcBean
-- Create date: 17-Oct-2014
-- Description:	Update a patient record, Update the referring doctor id.
--              Update the local doctor.
-- =============================================
CREATE PROCEDURE [dbo].[spCreateUpdatePatient] 
	
	@PatientId INT,
	@DisplayName varchar(100),
	@FirstName varchar(50),
	@MiddleName varchar(50),
	@LastName varchar(50),
	@DateOfBirth datetime,
	@DateOfDeath datetime,
	@Address VARCHAR(100),
	@City VARCHAR(50),
	@Province VARCHAR(50),
	@PostalCode VARCHAR(50),
	@Gender char(1),
	@PHN VARCHAR(100),
	@HomePhone VARCHAR(100),
	@CelPhone VARCHAR(100),
	@WorkPhone VARCHAR(100),
	@RefProviderId int,
	@LocalDoctorId int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @UserID int
	
	
	SET @UserID = (SELECT UserAccountId FROM UserAccount Account WHERE LoginName = SYSTEM_USER)

	IF NOT EXISTS (SELECT PatientId FROM Patient WHERE PatientId = @PatientId)
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION
				INSERT INTO Patient 
					(PatientId,DisplayName,FirstName,MiddleName,LastName,DateOfBirth,[Address],City,
					 PostalCode, Province, Gender, PHN, HomePhone, CelPhone, WorkPhone, ModifiedDate ) 
				VALUES 
					(@PatientId,@DisplayName,@FirstName, @MiddleName, @LastName, @DateOfBirth, @Address, @City, 
					 @PostalCode, @Province, @Gender, @PHN, @HomePhone, @CelPhone, @WorkPhone, GetDate())
			COMMIT
		END TRY
		
		BEGIN CATCH
			ROLLBACK
			SELECT  ERROR_MESSAGE() AS ErrorMessage,ERROR_LINE() AS ErrorLine, ERROR_NUMBER() AS ErrorNumber
		END CATCH
		
	END
	ELSE
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION
			UPDATE Patient SET DisplayName = @DisplayName, FirstName = @FirstName, MiddleName = @MiddleName, 
			                   LastName = @LastName, DateOfBirth = @DateOfBirth,[Address] = @Address, 
			                   City = @City, Province = @Province, PostalCode = @PostalCode, Gender = @Gender, 
			                   PHN = @PHN, HomePhone = @HomePhone, CelPhone = @CelPhone, WorkPhone = @WorkPhone, 
			                   ModifiedDate = GetDate()
				WHERE PatientId =@PatientId
			COMMIT
		END TRY
		
		BEGIN CATCH
			ROLLBACK
			SELECT  ERROR_MESSAGE() AS ErrorMessage,ERROR_LINE() AS ErrorLine, ERROR_NUMBER() AS ErrorNumber
		END CATCH

	END
 
END
GO
/****** Object:  View [dbo].[ICD10Group]    Script Date: 11/21/2014 00:02:33 ******/
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
/****** Object:  View [dbo].[ICD10Code]    Script Date: 11/21/2014 00:02:33 ******/
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
/****** Object:  Table [dbo].[PatientDiagnosticCode]    Script Date: 11/21/2014 00:02:33 ******/
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
/****** Object:  View [dbo].[ICD9GroupSubGroup]    Script Date: 11/21/2014 00:02:33 ******/
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
/****** Object:  View [dbo].[ICD10GroupSubGroup]    Script Date: 11/21/2014 00:02:33 ******/
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
/****** Object:  Table [dbo].[DocumentLocation]    Script Date: 11/21/2014 00:02:33 ******/
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
 CONSTRAINT [PK_DocumentLocation] PRIMARY KEY CLUSTERED 
(
	[DocumentLocationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DocumentKeyword]    Script Date: 11/21/2014 00:02:33 ******/
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
/****** Object:  Default [DF_DocumentArchive_CreationDate]    Script Date: 11/21/2014 00:02:22 ******/
ALTER TABLE [dbo].[DocumentArchive] ADD  CONSTRAINT [DF_DocumentArchive_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
/****** Object:  Default [DF__Document__Proofe__4277DAAA]    Script Date: 11/21/2014 00:02:22 ******/
ALTER TABLE [dbo].[Document] ADD  CONSTRAINT [DF__Document__Proofe__4277DAAA]  DEFAULT ((0)) FOR [Proofed]
GO
/****** Object:  Default [DF__Document__Billed__436BFEE3]    Script Date: 11/21/2014 00:02:22 ******/
ALTER TABLE [dbo].[Document] ADD  CONSTRAINT [DF__Document__Billed__436BFEE3]  DEFAULT ((0)) FOR [Billed]
GO
/****** Object:  Default [DF__Document__Securi__4460231C]    Script Date: 11/21/2014 00:02:22 ******/
ALTER TABLE [dbo].[Document] ADD  CONSTRAINT [DF__Document__Securi__4460231C]  DEFAULT ((0)) FOR [SecurityLevel]
GO
/****** Object:  ForeignKey [FK_Appointment_Provider]    Script Date: 11/21/2014 00:02:22 ******/
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Provider] FOREIGN KEY([ProviderId])
REFERENCES [dbo].[Provider] ([ProviderId])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Provider]
GO
/****** Object:  ForeignKey [FK_Document_Category]    Script Date: 11/21/2014 00:02:22 ******/
ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [FK_Document_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [FK_Document_Category]
GO
/****** Object:  ForeignKey [FK_Document_Patient]    Script Date: 11/21/2014 00:02:22 ******/
ALTER TABLE [dbo].[Document]  WITH NOCHECK ADD  CONSTRAINT [FK_Document_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([PatientId])
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [FK_Document_Patient]
GO
/****** Object:  ForeignKey [FK_Document_Provider]    Script Date: 11/21/2014 00:02:22 ******/
ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [FK_Document_Provider] FOREIGN KEY([ProviderId])
REFERENCES [dbo].[Provider] ([ProviderId])
GO
ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [FK_Document_Provider]
GO
/****** Object:  ForeignKey [FK_PatientPractitioner_PatientPractitioner]    Script Date: 11/21/2014 00:02:27 ******/
ALTER TABLE [dbo].[PatientPractitioner]  WITH CHECK ADD  CONSTRAINT [FK_PatientPractitioner_PatientPractitioner] FOREIGN KEY([PractitionerId])
REFERENCES [dbo].[Practitioner] ([PractitionerId])
GO
ALTER TABLE [dbo].[PatientPractitioner] CHECK CONSTRAINT [FK_PatientPractitioner_PatientPractitioner]
GO
/****** Object:  ForeignKey [FK_PatientPractitioner_Practitioner]    Script Date: 11/21/2014 00:02:27 ******/
ALTER TABLE [dbo].[PatientPractitioner]  WITH CHECK ADD  CONSTRAINT [FK_PatientPractitioner_Practitioner] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([PatientId])
GO
ALTER TABLE [dbo].[PatientPractitioner] CHECK CONSTRAINT [FK_PatientPractitioner_Practitioner]
GO
/****** Object:  ForeignKey [FK_PatientDiagnosticCode_DiagnosticCode]    Script Date: 11/21/2014 00:02:33 ******/
ALTER TABLE [dbo].[PatientDiagnosticCode]  WITH CHECK ADD  CONSTRAINT [FK_PatientDiagnosticCode_DiagnosticCode] FOREIGN KEY([DiagnosticCodeId])
REFERENCES [dbo].[DiagnosticCode] ([DiagnosticCodeId])
GO
ALTER TABLE [dbo].[PatientDiagnosticCode] CHECK CONSTRAINT [FK_PatientDiagnosticCode_DiagnosticCode]
GO
/****** Object:  ForeignKey [FK_PatientDiagnosticCode_Document]    Script Date: 11/21/2014 00:02:33 ******/
ALTER TABLE [dbo].[PatientDiagnosticCode]  WITH CHECK ADD  CONSTRAINT [FK_PatientDiagnosticCode_Document] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[Document] ([DocumentId])
GO
ALTER TABLE [dbo].[PatientDiagnosticCode] CHECK CONSTRAINT [FK_PatientDiagnosticCode_Document]
GO
/****** Object:  ForeignKey [FK_PatientDiagnosticCode_Patient]    Script Date: 11/21/2014 00:02:33 ******/
ALTER TABLE [dbo].[PatientDiagnosticCode]  WITH NOCHECK ADD  CONSTRAINT [FK_PatientDiagnosticCode_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([PatientId])
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[PatientDiagnosticCode] CHECK CONSTRAINT [FK_PatientDiagnosticCode_Patient]
GO
/****** Object:  ForeignKey [FK_DocumentLocation_Document]    Script Date: 11/21/2014 00:02:33 ******/
ALTER TABLE [dbo].[DocumentLocation]  WITH CHECK ADD  CONSTRAINT [FK_DocumentLocation_Document] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[Document] ([DocumentId])
GO
ALTER TABLE [dbo].[DocumentLocation] CHECK CONSTRAINT [FK_DocumentLocation_Document]
GO
/****** Object:  ForeignKey [FK_DocumentKeyword_Document]    Script Date: 11/21/2014 00:02:33 ******/
ALTER TABLE [dbo].[DocumentKeyword]  WITH CHECK ADD  CONSTRAINT [FK_DocumentKeyword_Document] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[Document] ([DocumentId])
GO
ALTER TABLE [dbo].[DocumentKeyword] CHECK CONSTRAINT [FK_DocumentKeyword_Document]
GO
