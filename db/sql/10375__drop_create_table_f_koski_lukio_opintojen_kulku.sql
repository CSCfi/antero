USE [ANTERO]
GO

/****** Object:  Table [dw].[f_koski_lukio_opintojen_kulku]    Script Date: 13.11.2024 19:28:44 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_koski_lukio_opintojen_kulku]') AND type in (N'U'))
DROP TABLE [dw].[f_koski_lukio_opintojen_kulku]
GO

/****** Object:  Table [dw].[f_koski_lukio_opintojen_kulku]    Script Date: 13.11.2024 19:28:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_koski_lukio_opintojen_kulku](
	[oppija_oid] [varchar](150) NULL,
	[opiskeluoikeus_oid] [varchar](150) NULL,
	[lopputulema] [varchar](15) NULL,
	[d_opintojen_kulku_kohortit_id] [bigint] NULL,
	[d_opintojen_kulku_priorisoitu_tilanne_id] [bigint] NULL,
	[d_opintojen_kulku_tarkastelujakso_id] [bigint] NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_ika_id] [bigint] NULL,
	[d_ika_aloittaessa_id] [bigint] NULL,
	[d_ika_paattyessa_id] [bigint] NULL,
	[d_kieli_aidinkieli_id] [bigint] NULL,
	[d_maatjavaltiot2_kansalaisuus_id] [int] NULL,
	[d_organisaatioluokitus_jarj_id] [bigint] NULL,
	[d_organisaatioluokitus_oppilaitos_id] [bigint] NULL,
	[d_organisaatioluokitus_toimipiste_id] [bigint] NULL,
	[d_kieli_suorituskieli_id] [bigint] NULL,
	[d_lukio_oppimaara_man_id] [bigint] NULL,
	[d_alueluokitus_jarjestaja_id] [int] NULL,
	[d_alueluokitus_oppilaitos_id] [int] NULL,
	[perusopetuksen_suoritusvuosi] [int] NULL,
	[d_opintojen_kulku_keskiarvot_keskiarvo_kategoria_id] [bigint] NULL,
	[d_opintojen_kulku_keskiarvot_lukuaine_kategoria_id] [bigint] NULL,
	[d_opintojen_kulku_keskiarvot_keskiarvo_kvintiili_id] [bigint] NULL,
	[d_opintojen_kulku_keskiarvot_lukuaine_kvintiili_id] [bigint] NULL,
	[d_opintojen_kulku_vaihdokset_jarjestaja_id] [bigint] NULL,
	[d_opintojen_kulku_vaihdokset_oppilaitos_id] [bigint] NULL,
	[loadtime] [datetime] NOT NULL
) ON [PRIMARY]
GO


