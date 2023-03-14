USE [ANTERO]
GO

/****** Object:  Table [dw].[f_koski_oppivelvolliset]    Script Date: 14.3.2023 20:06:48 ******/
DROP TABLE [dw].[f_koski_oppivelvolliset]
GO

/****** Object:  Table [dw].[f_koski_oppivelvolliset]    Script Date: 14.3.2023 20:06:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_koski_oppivelvolliset](
	[tilastovuosi] [int] NULL,
	[tilastokuukausi] [int] NULL,
	[ajankohta] [date] NULL,
	[oppija_oid] [varchar](50) NULL,
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
	[ov_kuutioon] [int] NULL,
	[koulutusmuoto_hv] [varchar](100) NULL,
	[koulutusmoduuli_koodiarvo_hv] [varchar](50) NULL,
	[suorituksen_tyyppi_hv] [varchar](200) NULL,
	[oppivelvollisuuden_suorittamiseen_kelpaava_hv] [int] NULL,
	[ika_18_tarkasteluhetkella_hv] [int] NULL,
	[perusopetuksen_oppilaitos_oid_hv] [varchar](50) NULL
) ON [PRIMARY]

GO


