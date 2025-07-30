USE [Koski_SA]
GO

/****** Object:  Table [dbo].[hoivaavustajat_valitaulu]    Script Date: 29.7.2025 17.56.15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[hoivaavustajat_valitaulu]') AND type in (N'U'))
DROP TABLE [dbo].[hoivaavustajat_valitaulu]
GO

/****** Object:  Table [dbo].[hoivaavustajat_valitaulu]    Script Date: 29.7.2025 17.56.15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[hoivaavustajat_valitaulu](
	[vuosi] [int] NOT NULL,
	[kuukausi] [int] NOT NULL,
	[alkamisvuosi_oo_pat] [int] NOT NULL,
	[alkamiskuukausi_oo_pat] [int] NOT NULL,
	[tutkinnon_perusteiden_voimaantulo] [varchar](50) NOT NULL,
	[master_oid] [varchar](50) NOT NULL,
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
	[koulutustoimija_oid_oo_pat] [varchar](50) NULL,
	[oppilaitos_oid_oo_pat] [varchar](50) NULL,
	[koulutustoimija_oid_tt_pat] [varchar](50) NULL,
	[oppilaitos_oid_tt_pat] [varchar](50) NULL,
	[toimipiste_oid_tt_pat] [varchar](50) NULL,
	[koulutustoimija_oid_oo_tutk] [varchar](50) NULL,
	[oppilaitos_oid_oo_tutk] [varchar](50) NULL,
	[koulutustoimija_oid_tt_tutk] [varchar](50) NULL,
	[oppilaitos_oid_tt_tutk] [varchar](50) NULL,
	[toimipiste_oid_tt_tutk] [varchar](50) NULL,
	[opintojen_rahoitus_oo_pat] [varchar](50) NULL
) ON [PRIMARY]
GO


