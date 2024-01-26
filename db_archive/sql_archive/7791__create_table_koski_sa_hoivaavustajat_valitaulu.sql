USE [Koski_SA]
GO

/****** Object:  Table [dbo].[hoivaavustajat_valitaulu]    Script Date: 8.3.2023 10:40:12 ******/
DROP TABLE IF EXISTS [dbo].[hoivaavustajat_valitaulu]
GO

/****** Object:  Table [dbo].[hoivaavustajat_valitaulu]    Script Date: 8.3.2023 10:40:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[hoivaavustajat_valitaulu](
	[vuosi] [int] NOT NULL,
	[kuukausi] [int] NOT NULL,
	[oppija_oid] [varchar](50) NOT NULL,
	[sukupuoli] [varchar](50) NULL,
	[ika] [int] NULL,
	[aidinkieli] [varchar](50) NULL,
	[kansalaisuus] [varchar](3) NULL,
	[kotikunta] [varchar](50) NULL,
	[patevyys] [int] NOT NULL,
	[patevyys_kumulatiivinen] [int] NOT NULL,
	[patevyyden_saavuttamisvuosi] [int] NOT NULL,
	[patevyyden_saavuttamiskuukausi] [int] NOT NULL,
	[patevyyden_opiskeluoikeus_voimassa] [int] NOT NULL,
	[tutkinto] [int] NOT NULL,
	[tutkinto_kumulatiivinen] [int] NOT NULL,
	[tutkinnon_suorittamisvuosi] [int] NULL,
	[tutkinnon_suorittamiskuukausi] [int] NULL,
	koulutustoimija_oid_oo_pat [varchar](50) NULL,
	koulutustoimija_oid_tt_pat [varchar](50) NULL,
	oppilaitos_oid_tt_pat [varchar](50) NULL,
	toimipiste_oid_tt_pat [varchar](50) NULL,
	koulutustoimija_oid_oo_tutk [varchar](50) NULL,
	koulutustoimija_oid_tt_tutk [varchar](50) NULL,
	oppilaitos_oid_tt_tutk [varchar](50) NULL,
	toimipiste_oid_tt_tutk [varchar](50) NULL
) ON [PRIMARY]

GO
