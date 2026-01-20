USE [ANTERO]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot_uusi]') AND type in (N'U'))
DROP TABLE [sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot_uusi]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot_uusi](
	[suorituskausi] [varchar](31) NOT NULL,
	[ytunnus] [varchar](10) NOT NULL,
	[tutktyyppi] [varchar](5) NOT NULL,
	[tutk_pohjakoul] [decimal](38, 10) NULL,
	[tutk_ei_pohjakoul] [decimal](38, 10) NULL,
	[tutk_yhteensa] [decimal](38, 10) NULL,
	[pk_osuus] [decimal](30, 20) NULL,
	[ei_pk_osuus] [decimal](30, 20) NULL,
	[tutk_pohjakoul_kaikki] [decimal](38, 10) NULL,
	[tutk_ei_pohjakoul_kaikki] [decimal](38, 10) NULL,
	[tutk_yhteensa_kaikki] [decimal](38, 10) NULL,
	[pk_osuus_kaikki] [decimal](30, 20) NULL,
	[ei_pk_osuus_kaikki] [decimal](30, 20) NULL,
	[source] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
