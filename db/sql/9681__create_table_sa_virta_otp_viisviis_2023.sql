USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_virta_otp_viisviis_2023]    Script Date: 5.3.2024 9:17:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_virta_otp_viisviis_2023]') AND type in (N'U'))
DROP TABLE [sa].[sa_virta_otp_viisviis_2023]
GO

/****** Object:  Table [sa].[sa_virta_otp_viisviis_2023]    Script Date: 5.3.2024 9:17:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_virta_otp_viisviis_2023](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[edellinenSyysolo] [smallint] NULL,
	[hetu] [varchar](11) NULL,
	[ika] [smallint] NULL,
	[kevat] [int] NULL,
	[loAloituspvm] [bigint] NULL,
	[olok] [smallint] NULL,
	[olos] [smallint] NULL,
	[ooAloituspvm] [bigint] NULL,
	[opSummaKunOtePankista] [int] NULL,
	[opiskelijaavain] [varchar](100) NULL,
	[opiskeluoikeusavain] [varchar](100) NULL,
	[opiskeluoikeusid] [int] NULL,
	[oppilaitos] [varchar](20) NULL,
	[oppilaitostunnus] [varchar](10) NULL,
	[pankkiKumuEnnen55] [int] NULL,
	[pankkiSaldo55] [int] NULL,
	[regDatum] [bigint] NULL,
	[sukupuoli] [smallint] NULL,
	[summa] [int] NULL,
	[suorittanut27] [smallint] NULL,
	[suorittanut55ilmanPankkia] [smallint] NULL,
	[suorittanut55pankinAvulla] [smallint] NULL,
	[syys] [int] NULL,
	[tkoodi] [varchar](6) NULL,
	[uusiOpisk] [smallint] NULL,
	[uusiOpiskKevat] [smallint] NULL,
	[uuttaPankkiin] [int] NULL,
	[vuosi] [int] NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL
) ON [PRIMARY]
GO

INSERT INTO [sa].[sa_virta_otp_viisviis_2023]
SELECT
	[edellinenSyysolo]
    ,[hetu]
    ,[ika]
    ,[kevat]
    ,[loAloituspvm]
    ,[olok]
    ,[olos]
    ,[ooAloituspvm]
    ,[opSummaKunOtePankista]
    ,[opiskelijaavain]
    ,[opiskeluoikeusavain]
    ,[opiskeluoikeusid]
    ,[oppilaitos]
    ,[oppilaitostunnus]
    ,[pankkiKumuEnnen55]
    ,[pankkiSaldo55]
    ,[regDatum]
    ,[sukupuoli]
    ,[summa]
    ,[suorittanut27]
    ,[suorittanut55ilmanPankkia]
    ,[suorittanut55pankinAvulla]
    ,[syys]
    ,[tkoodi]
    ,[uusiOpisk]
    ,[uusiOpiskKevat]
    ,[uuttaPankkiin]
    ,[vuosi]
    ,[loadtime]
    ,[source]
    ,[username]
FROM [ANTERO].[sa].[sa_virta_otp_viisviis]

USE [ANTERO]