USE [ANTERO]
GO

/****** Object:  Table [dw].[f_oiva_luvat_epo]    Script Date: 28.8.2024 13:10:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_oiva_luvat_epo]') AND type in (N'U'))
DROP TABLE [dw].[f_oiva_luvat_epo]
GO

/****** Object:  Table [dw].[f_oiva_luvat_epo]    Script Date: 28.8.2024 13:10:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_oiva_luvat_epo](
	[d_kalenteri_tarkastelupaiva] [bigint] NULL,
	[d_kalenteri_luvan_alku_id] [bigint] NULL,
	[d_kalenteri_luvan_loppu_id] [bigint] NULL,
	[d_organisaatioluokitus_jarjestaja_id] [bigint] NULL,
	[d_organisaatioluokitus_oppilaitos_id] [bigint] NULL,
	[organisaatio_koodi] [varchar](20) NULL,
	[d_alueluokitus_opetus_id] [int] NULL,
	[d_kieli_id] [bigint] NULL,
	[d_opetustehtava_id] [int] NULL,
	[d_erityinen_koulutustehtava_id] [int] NULL,
	[d_opetuksen_jarjestamismuoto_id] [int] NULL,
	[muutkoulutuksenjarjestamiseenliittyvatehdot] [nvarchar](200) NULL,
	[opiskelijamaara] [int] NULL
) ON [PRIMARY]
GO
