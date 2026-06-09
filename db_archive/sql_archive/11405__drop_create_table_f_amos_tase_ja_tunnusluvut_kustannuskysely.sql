USE [ANTERO]
GO

/****** Object:  Table [dw].[f_amos_tase_ja_tunnusluvut_kustannuskysely]    Script Date: 19.11.2025 12.05.47 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_amos_tase_ja_tunnusluvut_kustannuskysely]') AND type in (N'U'))
DROP TABLE [dw].[f_amos_tase_ja_tunnusluvut_kustannuskysely]
GO

/****** Object:  Table [dw].[f_amos_tase_ja_tunnusluvut_kustannuskysely]    Script Date: 19.11.2025 12.05.47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_amos_tase_ja_tunnusluvut_kustannuskysely](
	[vuosi] [float] NULL,
	[ytunnus] [varchar](100) NULL,
	[tili] [nvarchar](50) NULL,
	[sarake] [varchar](100) NULL,
	[omistajatyyppi_nimi] [varchar](100) NULL,
	[maara_euroa] [float] NULL
) ON [PRIMARY]