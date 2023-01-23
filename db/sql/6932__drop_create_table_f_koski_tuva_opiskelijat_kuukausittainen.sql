USE [ANTERO]
GO

/****** Object:  Table [dw].[f_koski_tuva_opiskelijat_kuukausittainen]    Script Date: 23.1.2023 15:13:03 ******/
DROP TABLE [dw].[f_koski_tuva_opiskelijat_kuukausittainen]
GO

/****** Object:  Table [dw].[f_koski_tuva_opiskelijat_kuukausittainen]    Script Date: 23.1.2023 15:13:03 ******/
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
	[oppija_oid] [varchar](150) NULL,
	[opiskeluoikeus_oid] [varchar](150) NULL,
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
	[tila_20_9] [int] NOT NULL
) ON [PRIMARY]

GO


USE [ANTERO]