USE [AnteroAPI]
GO


DROP TABLE IF EXISTS  [api].[alayksikkokoodisto]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE [api].[alayksikkokoodisto](
	[defaultorder] [bigint] NOT NULL,
	[tilastovuosi] [int] NULL,
	[organisaatio_koodi] [nvarchar](10) NULL,
	[organisaatio_nimi_fi] [nvarchar](300) NULL,
	[organisaatio_nimi_sv] [nvarchar](300) NULL,
	[organisaatio_nimi_en] [nvarchar](300) NULL,
	[paayksikko_koodi] [nvarchar](100) NULL,
	[alayksikko_koodi] [nvarchar](100) NULL,
	[alayksikko_nimi_fi] [nvarchar](500) NULL,
	[alayksikko_nimi_sv] [nvarchar](500) NULL,
	[alayksikko_nimi_en] [nvarchar](500) NULL,
	[oppilaitostyyppi_koodi] [varchar](5) NULL,
	[oppilaitostyyppi_fi] [nvarchar](300) NULL,
	[oppilaitostyyppi_sv] [nvarchar](300) NULL,
	[oppilaitostyyppi_en] [nvarchar](300) NULL,
	[organisaatio_nykyinen_koodi] [varchar](30) NULL,
	[organisaatio_vanha_nimi_fi] [nvarchar](300) NULL,
	[organisaatio_vanha_nimi_sv] [nvarchar](300) NULL,
	[organisaatio_vanha_nimi_en] [nvarchar](300) NULL,
	[organisaation_alkupvm] [nvarchar](30) NULL,
	[organisaation_loppupvm] [nvarchar](30) NULL,
	[latauspvm] [datetime] NULL,
PRIMARY KEY CLUSTERED
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [ANTERO]
