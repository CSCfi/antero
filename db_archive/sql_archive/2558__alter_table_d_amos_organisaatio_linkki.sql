USE [ANTERO]
GO
/****** Object:  Table [dw].[d_amos_spl_koski_suorite_organisaatio_linkki]    Script Date: 24.10.2019 15:00:24 ******/
DROP TABLE IF EXISTS [dw].[d_amos_spl_koski_suorite_organisaatio_linkki]
GO
/****** Object:  Table [dw].[d_amos_spl_koski_suorite_organisaatio_linkki]    Script Date: 24.10.2019 15:00:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_amos_spl_koski_suorite_organisaatio_linkki]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_amos_spl_koski_suorite_organisaatio_linkki](
	[ps_toimipiste_oid] [varchar](max) NULL,
	[oo_koulutustoimija_oid] [varchar](max) NULL,
	[fuusiota_edeltava_ytunnus] [varchar](9) NULL,
	[amos_spl_master_ytunnus] [varchar](10) NULL,
	[ol_organisaatio_koodi] [varchar](20) NULL,
	[ol_organisaatio_fi] [nvarchar](255) NULL,
	[kunta_koodi] [varchar](5) NULL,
	[kunta_fi] [nvarchar](200) NOT NULL,
	[maakunta_fi] [nvarchar](200) NULL,
	[ely_fi] [nvarchar](60) NULL,
	[avi_fi] [nvarchar](60) NULL,
	[rnk_tp] [bigint] NULL,
	[rnk_kt] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
