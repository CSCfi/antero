USE [AnteroAPI]
GO

/****** Object:  Table [api].[amk_talous2]    Script Date: 31.1.2023 11:20:17 ******/
DROP TABLE [api].[amk_talous2]
GO

/****** Object:  Table [api].[amk_talous2]    Script Date: 31.1.2023 11:20:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [api].[amk_talous2](
	[defaultorder] [bigint] NOT NULL,
	[Ammattikorkeakoulun tunnus] [varchar](5) NOT NULL,
	[Ammattikorkeakoulu] [varchar](100) NOT NULL,
	[Konserni] [varchar](5) NOT NULL,
	[Tilikausi] [int] NOT NULL,
	[Ohjauksenala] [varchar](100) NOT NULL,
	[Yrkeshögskolas beteckning] [varchar](5) NOT NULL,
	[Yrkeshögskola] [varchar](100) NOT NULL,
	[Finansår] [int] NOT NULL,
	[Utbildningsområde] [varchar](100) NOT NULL,
	[Identifier of the university of applied science] [varchar](5) NOT NULL,
	[University of applied science] [varchar](100) NOT NULL,
	[Financial year] [int] NOT NULL,
	[Field of education] [varchar](100) NOT NULL,
	[Ohjauksenalakoodi] [varchar](3) NOT NULL,
	[Ohjauksenala koodilla] [varchar](104) NOT NULL,
	[tili_taso0_fi] [varchar](100) NOT NULL,
	[tili_taso1_fi] [varchar](100) NOT NULL,
	[tili_taso2_fi] [varchar](100) NOT NULL,
	[tili_taso3_fi] [varchar](100) NOT NULL,
	[tili_taso4_fi] [varchar](100) NOT NULL,
	[tili_taso5_fi] [nvarchar](100) NOT NULL,
	[tili_taso0_sv] [varchar](100) NOT NULL,
	[tili_taso1_sv] [varchar](100) NOT NULL,
	[tili_taso2_sv] [varchar](100) NOT NULL,
	[tili_taso3_sv] [varchar](100) NOT NULL,
	[tili_taso4_sv] [varchar](100) NOT NULL,
	[tili_taso5_sv] [nvarchar](100) NOT NULL,
	[tili_taso0_en] [varchar](100) NOT NULL,
	[tili_taso1_en] [varchar](100) NOT NULL,
	[tili_taso2_en] [varchar](100) NOT NULL,
	[tili_taso3_en] [varchar](100) NOT NULL,
	[tili_taso4_en] [varchar](100) NOT NULL,
	[tili_taso5_en] [nvarchar](100) NOT NULL,
	[toiminto_nimi_fi] [nvarchar](100) NOT NULL,
	[erittely_nimi_fi] [nvarchar](100) NOT NULL,
	[arvo] [bigint] NULL,
	[tili_koodi] [varchar](50) NOT NULL,
	[tietojoukko_paivitetty_pvm] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [ANTERO]