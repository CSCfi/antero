USE [ANTERO]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot_uusi]') AND type in (N'U'))
DROP TABLE [sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot_uusi]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot_uusi](
	[rahoituskausi] [varchar](31) NOT NULL,
	[suorituskausi] [varchar](31) NOT NULL,
	[ytunnus] [varchar](10) NULL,
	[tutk_pohjakoul] [int] NULL,
	[tutk_ei_pohjakoul] [int] NULL,
	[tutk_yhteensa] [int] NULL,
	[pk_osuus] [decimal](15, 14) NULL,
	[ei_pk_osuus] [decimal](15, 14) NULL,
	[pk_osuus_kaikki] [decimal](15, 14) NULL,
	[ei_pk_osuus_kaikki] [decimal](15, 14) NULL,
	[source] [varchar](59) NOT NULL
) ON [PRIMARY]
GO
