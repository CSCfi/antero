USE [ANTERO]
GO

ALTER TABLE [sa].[sa_virta_otp_viisviis_2025] DROP CONSTRAINT [DF__sa_virta_otp_viisviis_2025__username]
GO

ALTER TABLE [sa].[sa_virta_otp_viisviis_2025] DROP CONSTRAINT [DF__sa_virta_otp_viisviis_2025__loadtime]
GO

/****** Object:  Table [sa].[sa_virta_otp_viisviis_2025]    Script Date: 31.10.2025 12.21.51 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_virta_otp_viisviis_2025]') AND type in (N'U'))
DROP TABLE [sa].[sa_virta_otp_viisviis_2025]
GO

/****** Object:  Table [sa].[sa_virta_otp_viisviis_2025]    Script Date: 31.10.2025 12.21.51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_virta_otp_viisviis_2025](
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
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__sa_virta_otp_viisviis_2025] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [sa].[sa_virta_otp_viisviis_2025] ADD  CONSTRAINT [DF__sa_virta_otp_viisviis_2025__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_virta_otp_viisviis_2025] ADD  CONSTRAINT [DF__sa_virta_otp_viisviis_2025__username]  DEFAULT (suser_name()) FOR [username]
GO


