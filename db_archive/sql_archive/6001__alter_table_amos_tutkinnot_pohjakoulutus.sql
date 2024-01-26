USE [ANTERO]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot]') AND type in (N'U'))
ALTER TABLE [sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot] DROP CONSTRAINT IF EXISTS [DF_sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot_username]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot]') AND type in (N'U'))
ALTER TABLE [sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot] DROP CONSTRAINT IF EXISTS [DF_sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot_loadtime]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki]') AND type in (N'U'))
ALTER TABLE [sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki] DROP CONSTRAINT IF EXISTS [DF_sa_amos_tutkinnot_pohjakoulutus_kaikki_username]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki]') AND type in (N'U'))
ALTER TABLE [sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki] DROP CONSTRAINT IF EXISTS [DF_sa_amos_tutkinnot_pohjakoulutus_kaikki_loadtime]
GO
/****** Object:  Table [sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot]    Script Date: 6.3.2022 19:47:02 ******/
DROP TABLE IF EXISTS [sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot]
GO
/****** Object:  Table [sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki]    Script Date: 6.3.2022 19:47:02 ******/
DROP TABLE IF EXISTS [sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki]
GO
/****** Object:  Table [sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki]    Script Date: 6.3.2022 19:47:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki](
	[vuosi] [int] NULL,
	[ytunnus] [varchar](20) NULL,
	[koulutuksen_jarjestaja] [varchar](100) NULL,
	[ei_pohjakoul_pt_kr1] [int] NULL,
	[ei_pohjakoul_pt_kr2] [int] NULL,
	[ei_pohjakoul_pt_kr3] [int] NULL,
	[ei_pohjakoul_pt_kr4] [int] NULL,
	[ei_pohjakoul_pt_kr5] [int] NULL,
	[ei_pohjakoul_at_eat_kr1] [int] NULL,
	[ei_pohjakoul_at_eat_kr2] [int] NULL,
	[ei_pohjakoul_at_eat_kr3] [int] NULL,
	[ei_pohjakoul_at_eat_kr4] [int] NULL,
	[ei_pohjakoul_at_eat_kr5] [int] NULL,
	[pohjakoul_pt_kr1] [int] NULL,
	[pohjakoul_pt_kr2] [int] NULL,
	[pohjakoul_pt_kr3] [int] NULL,
	[pohjakoul_pt_kr4] [int] NULL,
	[pohjakoul_pt_kr5] [int] NULL,
	[pohjakoul_at_eat_kr1] [int] NULL,
	[pohjakoul_at_eat_kr2] [int] NULL,
	[pohjakoul_at_eat_kr3] [int] NULL,
	[pohjakoul_at_eat_kr4] [int] NULL,
	[pohjakoul_at_eat_kr5] [int] NULL,
	[source] [varchar](100) NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](50) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot]    Script Date: 6.3.2022 19:47:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot](
	[vuosi] [int] NOT NULL,
	[ytunnus] [varchar](20) NOT NULL,
	[koulutuksen_jarjestaja] [varchar](100) NULL,
	[tutktyyppi] [varchar](5) NOT NULL,
	[kr] [int] NOT NULL,
	[tutk_pohjakoul] [int] NOT NULL,
	[tutk_ei_pohjakoul] [int] NOT NULL,
	[osuus_pohjakoul] [decimal](38, 15) NULL,
	[osuus_ei_pohjakoul] [decimal](38, 15) NULL,
	[sum_tutk_pohjakoul] [int] NOT NULL,
	[sum_tutk_ei_pohjakoul] [int] NOT NULL,
	[osuus_pohjakoul_koko] [decimal](38, 15) NOT NULL,
	[osuus_ei_pohjakoul_koko] [decimal](38, 15) NOT NULL,
	[source] [varchar](100) NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](50) NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[DF_sa_amos_tutkinnot_pohjakoulutus_kaikki_loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki] ADD  CONSTRAINT [DF_sa_amos_tutkinnot_pohjakoulutus_kaikki_loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[DF_sa_amos_tutkinnot_pohjakoulutus_kaikki_username]') AND type = 'D')
BEGIN
ALTER TABLE [sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki] ADD  CONSTRAINT [DF_sa_amos_tutkinnot_pohjakoulutus_kaikki_username]  DEFAULT (suser_sname()) FOR [username]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[DF_sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot_loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot] ADD  CONSTRAINT [DF_sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot_loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[DF_sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot_username]') AND type = 'D')
BEGIN
ALTER TABLE [sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot] ADD  CONSTRAINT [DF_sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot_username]  DEFAULT (suser_sname()) FOR [username]
END

