USE [ANTERO]
GO

/****** Object:  Table [dw].[f_koski_oppivelvolliset]    Script Date: 15.4.2025 9.14.51 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_koski_oppivelvolliset]') AND type in (N'U'))
DROP TABLE [dw].[f_koski_oppivelvolliset]
GO

/****** Object:  Table [dw].[f_koski_oppivelvolliset]    Script Date: 15.4.2025 9.14.51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_koski_oppivelvolliset](
	[tilastovuosi] [int] NULL,
	[tilastokuukausi] [int] NULL,
	[ajankohta] [date] NULL,
	[master_oid] [varchar](50) NULL,
	[oppivelvollisen_toiminta] [int] NULL,
	[d_kytkin_kelpaa_oppivelvollisuuden_suorittamiseen_id] [int] NULL,
	[d_organisaatioluokitus_oppilaitos_id] [bigint] NULL,
	[d_organisaatioluokitus_koulutuksen_jarjestaja_id] [bigint] NULL,
	[d_organisaatioluokitus_perusopetuksen_oppilaitos_id] [bigint] NULL,
	[syntymavuosi] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_alueluokitus_id] [int] NULL,
	[d_kieli_id] [bigint] NULL,
	[d_kansalaisuus_id] [int] NULL,
	[d_ika_id] [bigint] NULL,
	[d_kytkin_suorittanut_perusopetuksen_oppimaaran_id] [int] NULL,
	[d_kalenteri_perusopetuksen_oppimaara_suoritettu_pvm_id] [int] NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[koulutusmuoto] [varchar](100) NULL,
	[suorituksen_tyyppi] [varchar](200) NULL,
	[d_erityisopetus_id] [int] NULL,
	[d_pidennetty_oppivelvollisuus_id] [int] NULL,
	[d_perusopetuksen_oppimaaran_yksilollistaminen_id] [int] NULL,
	[d_perusopetuksen_oppimaaran_yksilollistaminen_hv_id] [int] NULL,
	[d_erityisopetus_hv_id] [int] NULL,
	[ov_kuutioon] [int] NULL,
	[koulutusmuoto_hv] [varchar](100) NULL,
	[koulutusmoduuli_koodiarvo_hv] [varchar](50) NULL,
	[suorituksen_tyyppi_hv] [varchar](200) NULL,
	[oppivelvollisuuden_suorittamiseen_kelpaava_hv] [int] NULL,
	[ika_18_tarkasteluhetkella_hv] [int] NULL,
	[perusopetuksen_oppilaitos_oid_hv] [varchar](50) NULL,
	[kotikunta_hv] [varchar](50) NULL,
	[loadtime] [date] NULL,
	[username] [varchar](50) NULL,
	[source] [varchar](100) NULL
) ON [PRIMARY]
GO

USE [ANTERO]