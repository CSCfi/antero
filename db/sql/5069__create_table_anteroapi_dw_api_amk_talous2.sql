USE [AnteroAPI]
GO


DROP TABLE IF EXISTS  [dw].[api_amk_talous2]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[api_amk_talous2](
		[defaultorder] [bigint] NOT NULL,
		[Ammattikorkeakoulun tunnus] [varchar](5) NULL,
		[Ammattikorkeakoulu] [varchar](100) NULL,
		[Konserni] [varchar](5) NULL,
		[Tilikausi] [int] NULL,
		[Ohjauksenala] [varchar](100) NULL,
		[Yrkeshögskolas beteckning] [varchar](5) NULL,
		[Yrkeshögskola] [varchar](100) NULL,
		[Finansår] [int] NULL,
		[Utbildningsområde] [varchar](100) NULL,
		[Identifier of the university of applied science] [varchar](5) NULL,
		[University of applied science] [varchar](100) NULL,
		[Financial year] [int] NULL,
		[Field of education] [varchar](100) NULL,
		[Ohjauksenalakoodi] [varchar](3) NULL,
		[Ohjauksenala koodilla] [varchar](104) NULL,
		[tili_taso0_fi] [varchar](100) NULL,
		[tili_taso1_fi] [varchar](100) NULL,
		[tili_taso2_fi] [varchar](100) NULL,
		[tili_taso3_fi] [varchar](100) NULL,
		[tili_taso4_fi] [varchar](100) NULL,
		[tili_taso5_fi] [nvarchar](100) NULL,
		[tili_taso0_sv] [varchar](100) NULL,
		[tili_taso1_sv] [varchar](100) NULL,
		[tili_taso2_sv] [varchar](100) NULL,
		[tili_taso3_sv] [varchar](100) NULL,
		[tili_taso4_sv] [varchar](100) NULL,
		[tili_taso5_sv] [nvarchar](100) NULL,
		[tili_taso0_en] [varchar](100) NULL,
		[tili_taso1_en] [varchar](100) NULL,
		[tili_taso2_en] [varchar](100) NULL,
		[tili_taso3_en] [varchar](100) NULL,
		[tili_taso4_en] [varchar](100) NULL,
		[tili_taso5_en] [nvarchar](100) NULL,
		[toiminto_nimi_fi] [nvarchar](100) NULL,
		[erittely_nimi_fi] [nvarchar](100) NULL,
		[arvo] [bigint] NULL,
		[tili_koodi] [varchar](50) NULL,
	PRIMARY KEY CLUSTERED
	(
		[defaultorder] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

USE [ANTERO]
