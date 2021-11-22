USE [AnteroAPI]
GO


DROP TABLE IF EXISTS  [dw].[api_amk_talous]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[api_amk_talous](
	[Ammattikorkeakoulun tunnus] [varchar](5) NOT NULL,
	[Ammattikorkeakoulu] [varchar](100) NOT NULL,
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
	[arvo] [bigint] NULL
) ON [PRIMARY]
GO

USE [ANTERO]
