USE [ANTERO]
GO

/****** Object:  Table [dw].[f_koski_lukio_opiskelijat_kuukausittain]    Script Date: 19.4.2023 16:14:39 ******/
DROP TABLE [dw].[f_koski_lukio_opiskelijat_kuukausittain]
GO

/****** Object:  Table [dw].[f_koski_lukio_opiskelijat_kuukausittain]    Script Date: 19.4.2023 16:14:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_koski_lukio_opiskelijat_kuukausittain](
	[opiskeluoikeus_oid] [varchar](150) NULL,
	[oppija_oid] [varchar](150) NULL,
	[vuosi] [int] NULL,
	[kuukausi] [int] NULL,
	[lukukausi] [varchar](14) NULL,
	[lukuvuosi] [varchar](25) NULL,
	[aloitusvuosi] [int] NULL,
	[aloituskuukausi] [int] NULL,
	[aloitusajankohta] [varchar](33) NULL,
	[aloitus_kuukauden_aikana_1_0] [int] NOT NULL,
	[koulutustoimija_oid] [varchar](200) NULL,
	[toimipiste_oid] [varchar](200) NULL,
	[oppilaitos_oid] [varchar](200) NULL,
	[suorituskieli_koodiarvo] [nvarchar](255) NULL,
	[koulutusmuoto] [varchar](100) NULL,
	[tavoitetutkinto] [nvarchar](200) NULL,
	[koulutus] [nvarchar](200) NULL,
	[majoitus] [int] NULL,
	[sisaoppilaitosmainen_majoitus] [int] NULL,
	[ika] [int] NULL,
	[oppimaara] [varchar](38) NOT NULL,
	[aidinkieli] [varchar](50) NULL,
	[kansalaisuus] [varchar](3) NULL,
	[syntymaaika] [date] NULL,
	[Sukupuoli] [varchar](50) NULL,
	[d_alueluokitus_kotikunta_id] [int] NULL,
	[jarj_tavoitetutkinto] [int] NOT NULL,
	[jarj_koulutus] [int] NOT NULL,
	[uusi_opiskelija] [int] NOT NULL,
	[yhdistelmatutkinto] [varchar](27) NOT NULL,
	[jarj_yhdistelmatutkinto] [int] NOT NULL,
	[eronnut] [int] NOT NULL,
	[jatkaa_kj] [int] NULL,
	[jatkaa_oppilaitos] [int] NULL,
	[jatkaa_tutkintotyyppi] [int] NULL,
	[jatkaa_ammatillinen] [int] NULL,
	[jatkaa_yleissivistava] [int] NULL,
	[jatkaa_valmentava] [int] NULL,
	[jatkaa_lukio_valmentava] [int] NULL,
	[jatkaa_amm_valmentava] [int] NULL,
	[jatkaa_muu_ammatillinen] [int] NULL,
	[jatkaa_amm_tutkintokoulutus] [int] NULL,
	[jatkaa_oppimaara] [int] NULL,
	[vaihto_oppimaara] [int] NULL,
	[jatkaa_aikuistenops] [int] NULL,
	[jatkaa_nuortenops] [int] NULL,
	[jatkaa_lukioaine] [int] NULL,
	[jatkaa_lukio_ulkomainen] [int] NULL,
	[d_keskeyttaminen_vaiheittainen_id] [bigint] NULL,
	[kotikunta_manner_suomessa] [int] NOT NULL,
	[oppivelvollinen] [int] NOT NULL
) ON [PRIMARY] --TEXTIMAGE_ON [PRIMARY]

GO


