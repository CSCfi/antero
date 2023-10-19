USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki]    Script Date: 19.10.2023 12:53:41 ******/
DROP TABLE IF EXISTS [sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki]
GO

/****** Object:  Table [sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki]    Script Date: 19.10.2023 12:53:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki](
	[vuosi] [int] NULL,
	[ytunnus] [varchar](20) NULL,
	[koulutuksen_jarjestaja] [varchar](100) NULL,
	[ikar20] [varchar](1) NULL,
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

GO

ALTER TABLE [sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki] ADD  CONSTRAINT [DF_sa_amos_tutkinnot_pohjakoulutus_kaikki_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki] ADD  CONSTRAINT [DF_sa_amos_tutkinnot_pohjakoulutus_kaikki_username]  DEFAULT (suser_sname()) FOR [username]
GO
