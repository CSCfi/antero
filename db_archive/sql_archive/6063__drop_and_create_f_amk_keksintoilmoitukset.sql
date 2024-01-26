USE [ANTERO]
GO

/****** Object:  Table [dw].[f_amk_keksintoilmoitukset]    Script Date: 30.3.2022 16:19:47 ******/
DROP TABLE [dw].[f_amk_keksintoilmoitukset]
GO

/****** Object:  Table [dw].[f_amk_keksintoilmoitukset]    Script Date: 30.3.2022 16:19:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_amk_keksintoilmoitukset](
	[d_amk_id] [int] NULL,
	[d_organisaatioluokitus_id] [int] NULL,
	[d_koulutusala_id] [int] NULL,
	[d_ohjauksenala_id] [int] NULL,
	[d_julkaisun_kansainvalisyys_id] [int] NULL,
	[d_tieteenala_id] [int] NULL,
	[vuosi] [int] NULL,
	[h21] [int] NULL,
	[h22] [int] NULL,
	[h23] [int] NULL,
	[h24] [int] NULL,
	[loadtime] [datetime] NULL,
	[source] [varchar](55) NULL,
	[username] [varchar](55) NULL
) ON [PRIMARY]

GO


USE [ANTERO]