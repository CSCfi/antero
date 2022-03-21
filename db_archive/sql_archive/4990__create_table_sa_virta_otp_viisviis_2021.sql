USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_virta_otp_viisviis_2021](
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
 CONSTRAINT [PK__sa_virta_otp_viisviis_2021] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [sa].[sa_virta_otp_viisviis_2021] ADD  CONSTRAINT [DF__sa_virta_otp_viisviis_2021__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_virta_otp_viisviis_2021] ADD  CONSTRAINT [DF__sa_virta_otp_viisviis_2021__username]  DEFAULT (suser_name()) FOR [username]
GO


