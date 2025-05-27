USE [ANTERO]
GO

/****** Object:  Table [dw].[f_amos_kustannuskysely_yhdistelma]    Script Date: 26.2.2025 10.42.40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_amos_kustannuskysely_yhdistelma]') AND type in (N'U'))
DROP TABLE [dw].[f_amos_kustannuskysely_yhdistelma]
GO

/****** Object:  Table [dw].[f_amos_kustannuskysely_yhdistelma]    Script Date: 26.2.2025 10.42.40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_amos_kustannuskysely_yhdistelma](
	[vuosi] [float] NULL,
	[d_organisaatioluokitus_id] [bigint] NULL,
	[d_amos_tili_id] [int] NULL,
	[omistajatyyppi_nimi] [varchar](100) NULL,
	[maara_euroa] [float] NULL,
	[ovyht] [float] NULL
) ON [PRIMARY]