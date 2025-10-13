USE [ANTERO]
GO

/****** Object:  Table [dw].[f_koski_tuva_opiskelijat_kuukausittainen]    Script Date: 13.10.2025 13.02.48 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_koski_tuva_opiskelijat_kuukausittainen]') AND type in (N'U'))
DROP TABLE [dw].[f_koski_tuva_opiskelijat_kuukausittainen]
GO

/****** Object:  Table [dw].[f_koski_tuva_opiskelijat_kuukausittainen]    Script Date: 13.10.2025 13.02.48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_koski_tuva_opiskelijat_kuukausittainen](
	[tilastovuosi] [int] NULL,
	[d_kalenteri_id] [bigint] NULL,
	[d_kalenteri_oo_id] [bigint] NULL,
	[d_ika_id] [bigint] NULL,
	[d_kansalaisuus_id] [int] NULL,
	[d_aidinkieli_id] [bigint] NULL,
	[d_sukupuoli_id] [int] NULL,
	[master_oid] [varchar](150) NULL,
	[opiskeluoikeus_oid] [varchar](150) NULL,
	[d_koski_koulutusmuoto_muut_opiskeluoikeudet_id] [int] NULL,
	[koulutusmuoto] [varchar](100) NULL,
	[tuva_jarjestamislupa] [varchar](100) NULL,
	[erityisopetus] [int] NOT NULL,
	[d_kytkin_majoitus_id] [int] NULL,
	[d_suorituskieli_id] [bigint] NULL,
	[d_koulutuksen_jarjestaja_id] [bigint] NULL,
	[d_oppilaitos_id] [bigint] NULL,
	[d_toimipiste_id] [bigint] NULL,
	[d_alueluokitus_id] [int] NULL,
	[oo_alkamisajankohta] [varchar](33) NULL,
	[oo_alkanut_kuussa_1_0] [int] NULL,
	[tila_20_9] [int] NOT NULL,
	[oppivelvollinen] [int] NOT NULL,
	[pv_kk] [int] NULL
) ON [PRIMARY]
GO


