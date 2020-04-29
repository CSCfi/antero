USE [ANTERO]
GO
/****** Object:  Table [dw].[f_amos_kustannuskysely_jarjestajakohtainen]    Script Date: 26.4.2020 13:19:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_amos_kustannuskysely_jarjestajakohtainen]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_amos_kustannuskysely_jarjestajakohtainen](
	[vuosi] [float] NULL,
	[d_organisaatioluokitus_id] [bigint] NULL,
	[d_amos_tili_id] [int] NULL,
	[omistajatyyppi_nimi] [varchar](100) NULL,
	[maara_euroa] [float] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[f_amos_kustannuskysely_seurantaryhmat]    Script Date: 26.4.2020 13:19:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_amos_kustannuskysely_seurantaryhmat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_amos_kustannuskysely_seurantaryhmat](
	[vuosi] [float] NULL,
	[d_organisaatioluokitus_id] [bigint] NULL,
	[d_amos_seurantaryhma_id] [int] NULL,
	[d_kytkin_oppisopimuskoulutus_id] [int] NULL,
	[d_kytkin_vankilaopetus_id] [int] NULL,
	[d_ammatillisen_tutkinnon_kustannusryhma_id] [int] NULL,
	[d_koulutusluokitus_tutkintotyypin_ryhma_id] [int] NULL,
	[d_koulutusluokitus_koulutusala_taso1_id] [int] NULL,
	[omistajatyyppi] [varchar](100) NULL,
	[euroa] [float] NULL
) ON [PRIMARY]
END