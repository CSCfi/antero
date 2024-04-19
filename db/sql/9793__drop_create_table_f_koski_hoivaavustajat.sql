USE [ANTERO]
GO

/****** Object:  Table [dw].[f_koski_hoivaavustajat]    Script Date: 19.4.2024 17:04:48 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_koski_hoivaavustajat]') AND type in (N'U'))
DROP TABLE [dw].[f_koski_hoivaavustajat]
GO

/****** Object:  Table [dw].[f_koski_hoivaavustajat]    Script Date: 19.4.2024 17:04:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_koski_hoivaavustajat](
	[tilastovuosi] [int] NOT NULL,
	[tilastokuukausi] [int] NOT NULL,
	[oppija_oid] [varchar](50) NOT NULL,
	[patevyys] [int] NOT NULL,
	[patevyys_kumulatiivinen] [int] NOT NULL,
	[patevyyden_opiskeluoikeus_voimassa] [int] NOT NULL,
	[tutkinto] [int] NOT NULL,
	[tutkinto_kumulatiivinen] [int] NOT NULL,
	[d_kalenteri_id] [bigint] NULL,
	[d_kalenteri_patevyys_id] [bigint] NULL,
	[d_kalenteri_tutkinto_id] [bigint] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_ika_id] [bigint] NULL,
	[d_kieli_aidinkieli_id] [bigint] NULL,
	[d_maatjavaltiot2_kansalaisuus_id] [int] NULL,
	[d_alueluokitus_kotikunta_id] [int] NULL,
	[d_opintojen_rahoitus_id_oo_pat] [int] NULL,
	[d_amos_spl_jarjestaja_linkki_id_oo_pat] [int] NULL,
	[d_organisaatioluokitus_oppilaitos_id_oo_pat] [bigint] NULL,
	[d_organisaatioluokitus_koulutustoimija_id_tt_pat] [bigint] NULL,
	[d_organisaatioluokitus_oppilaitos_id_tt_pat] [bigint] NULL,
	[d_organisaatioluokitus_toimipiste_id_tt_pat] [bigint] NULL,
	[d_alueluokitus_koulutustoimija_id_oo_pat] [int] NULL,
	[d_alueluokitus_oppilaitos_id_oo_pat] [int] NULL,
	[d_alueluokitus_koulutustoimija_id_tt_pat] [int] NULL,
	[d_alueluokitus_oppilaitos_id_tt_pat] [int] NULL,
	[d_alueluokitus_toimipiste_id_tt_pat] [int] NULL,
	[d_amos_spl_jarjestaja_linkki_id_oo_tutk] [int] NULL,
	[d_organisaatioluokitus_oppilaitos_id_oo_tutk] [bigint] NULL,
	[d_organisaatioluokitus_koulutustoimija_id_tt_tutk] [bigint] NULL,
	[d_organisaatioluokitus_oppilaitos_id_tt_tutk] [bigint] NULL,
	[d_organisaatioluokitus_toimipiste_id_tt_tutk] [bigint] NULL,
	[d_alueluokitus_koulutustoimija_id_oo_tutk] [int] NULL,
	[d_alueluokitus_oppilaitos_id_oo_tutk] [int] NULL,
	[d_alueluokitus_koulutustoimija_id_tt_tutk] [int] NULL,
	[d_alueluokitus_oppilaitos_id_tt_tutk] [int] NULL,
	[d_alueluokitus_toimipiste_id_tt_tutk] [int] NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [nvarchar](128) NULL
) ON [PRIMARY]
GO
