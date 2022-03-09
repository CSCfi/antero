USE [ANTERO]
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_koski_oppivelvolliset]') AND type in (N'U'))

BEGIN

CREATE TABLE [dw].[f_koski_oppivelvolliset](
	[tilastovuosi] [int] NULL,
	[tilastokuukausi] [int] NULL,
	[ajankohta] [date] NULL,
	[oppija_oid] [varchar](50) NULL,
	[oppivelvollisen_toiminta] [int] NULL,
	[d_kytkin_kelpaa_oppivelvollisuuden_suorittamiseen] [int] NULL,
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
	[d_koulutusluokitus_id] [int] NULL,
	[koulutusmuoto] [varchar](100) NULL
) ON [PRIMARY]

END

GO

USE [ANTERO]