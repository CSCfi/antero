USE [AnteroAPI]
GO

/****** Object:  Table [api].[harjoittelukoulut]    Script Date: 31.1.2023 11:24:23 ******/
DROP TABLE [api].[harjoittelukoulut]
GO

/****** Object:  Table [api].[harjoittelukoulut]    Script Date: 31.1.2023 11:24:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [api].[harjoittelukoulut](
	[defaultorder] [bigint] NOT NULL,
	[tilastovuosi] [int] NULL,
	[yliopisto] [varchar](100) NULL,
	[henkilöstöryhmä] [varchar](55) NULL,
	[koulutusala] [varchar](55) NULL,
	[ohjauksen_ala] [varchar](100) NULL,
	[harjoittelukoulun_oppilaat_esiopetus] [int] NULL,
	[harjoittelukoulun_oppilaat_perusopetuksen_vuodet_1_6] [int] NULL,
	[harjoittelukoulun_oppilaat_perusopetuksen_vuodet_7_9] [int] NULL,
	[harjoittelukoulun_oppilaat_lukio] [int] NULL,
	[harjoittelukoulun_oppilaat_yhteensa] [int] NULL,
	[harjoittelukoulun_opettajankoulutustehtavien_kokonaisviikkotunnit] [int] NULL,
	[harjoittelukoulun_kokonaistuntimaara] [int] NULL,
	[opintopisteet_lastentarha] [int] NULL,
	[opintopisteet_luokanopettaja] [int] NULL,
	[opintopisteet_aineenopettaja] [int] NULL,
	[opintopisteet_erityisopettaja] [int] NULL,
	[opintopisteet_opinto_ohjaaja] [int] NULL,
	[opintopisteet_aikuiskoulutus] [int] NULL,
	[opintopisteet_muut] [int] NULL,
	[henkilotyovuosi] [decimal](10, 4) NULL,
	[koodit_yliopisto] [varchar](5) NULL,
	[koodit_koulutusala] [int] NULL,
	[koodit_ohjauksen_ala] [int] NULL,
	[koodit_henkilöstöryhmä] [int] NULL,
	[tietojoukko_paivitetty_pvm] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [ANTERO]