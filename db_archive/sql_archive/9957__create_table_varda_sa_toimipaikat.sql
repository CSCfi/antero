USE [Varda_SA]
GO

SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS
  (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_varda_organisaatio]' )
    AND type in (N'U'))
BEGIN

  CREATE TABLE [sa].[sa_varda_organisaatio](
  	[id] [int] NULL,
  	[nimi] [varchar](500) NULL,
  	[y_tunnus] [varchar](30) NULL,
  	[organisaatio_oid] [varchar](100) NULL,
  	[kunta_koodi] [int] NULL,
  	[ytjkieli] [varchar](10) NULL,
  	[yritysmuoto] [int] NULL,
  	[alkamis_pvm] [datetime] NULL,
  	[paattymis_pvm] [datetime] NULL,
  	[action] [varchar](100) NULL,
  	[loadtime] [datetime] NULL,
  	[username] [varchar](255) NULL,
  	[source] [varchar](255) NULL
  ) ON [PRIMARY];

  ALTER TABLE [sa].[sa_varda_organisaatio] ADD  CONSTRAINT [DF__sa_varda_organisaatio__source]  DEFAULT ('/reporting/v1/vipunen/organisaatiot/') FOR [source];
  ALTER TABLE [sa].[sa_varda_organisaatio] ADD  CONSTRAINT [DF__sa_varda_organisaatio__loadtime]  DEFAULT (getdate()) FOR [loadtime];
  ALTER TABLE [sa].[sa_varda_organisaatio] ADD  CONSTRAINT [DF__sa_varda_organisaatio__username]  DEFAULT (suser_name()) FOR [username];

END

GO

IF NOT EXISTS
  (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_varda_toimipaikka]' )
    AND type in (N'U'))
BEGIN

  CREATE TABLE [sa].[sa_varda_toimipaikka](
  	[toimipaikka_id] [bigint] NULL,
  	[vakajarjestaja_id] [nvarchar](255) NULL,
  	[nimi] [nvarchar](255) NULL,
  	[organisaatio_oid] [nvarchar](255) NULL,
  	[kunta_koodi] [int] NULL,
  	[kasvatusopillinen_jarjestelma_koodi] [nvarchar](255) NULL,
  	[toimintamuoto_koodi] [nvarchar](255) NULL,
  	[toimintakieli_koodi] [nvarchar](255) NULL,
  	[jarjestamismuoto_koodi] [nvarchar](255) NULL,
  	[varhaiskasvatuspaikat] [bigint] NULL,
  	[toiminnallinenpainotus_kytkin] [nvarchar](255) NULL,
  	[kielipainotus_kytkin] [nvarchar](255) NULL,
  	[alkamis_pvm] [date] NULL,
  	[paattymis_pvm] [date] NULL,
  	[action] [nvarchar](100) NULL,
  	[loadtime] [datetime2](4) NOT NULL,
  	[source] [nvarchar](255) NULL,
  	[username] [nvarchar](128) NOT NULL
  ) ON [PRIMARY];

  ALTER TABLE [sa].[sa_varda_toimipaikka] ADD  CONSTRAINT [DF__sa_varda_toimipaikka__paattymis_pvm]  DEFAULT (CONVERT([date],'9999-01-01')) FOR [paattymis_pvm];
  ALTER TABLE [sa].[sa_varda_toimipaikka] ADD  CONSTRAINT [DF__sa_varda_toimipaikka__loadtime]  DEFAULT (getdate()) FOR [loadtime];
  ALTER TABLE [sa].[sa_varda_toimipaikka] ADD  CONSTRAINT [DF__sa_varda_toimipaikka__source]  DEFAULT ('/reporting/v1/vipunen/toimipaikat/') FOR [source];
  ALTER TABLE [sa].[sa_varda_toimipaikka] ADD  CONSTRAINT [DF__sa_varda_toimipaikka__username]  DEFAULT (suser_name()) FOR [username];

END

GO


IF NOT EXISTS
  (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_varda_toimintapainotus]' )
    AND type in (N'U'))
BEGIN

  CREATE TABLE [sa].[sa_varda_toimintapainotus](
  	[toimintapainotus_id] [int] NULL,
  	[toimintapainotus_koodi] [nvarchar](100) NULL,
  	[alkamis_pvm] [date] NULL,
  	[paattymis_pvm] [date] NULL,
  	[toimipaikka_id] [int] NULL,
  	[action] [nvarchar](100) NOT NULL,
  	[loadtime] [datetime2](4) NULL,
  	[source] [nvarchar](255) NULL,
  	[username] [nvarchar](128) NULL
  ) ON [PRIMARY];

  ALTER TABLE [sa].[sa_varda_toimintapainotus] ADD  CONSTRAINT [DF__sa_varda_toimintapainotus__paattymis_pvm]  DEFAULT (CONVERT([date],'9999-01-01')) FOR [paattymis_pvm];
  ALTER TABLE [sa].[sa_varda_toimintapainotus] ADD  CONSTRAINT [DF__sa_varda_toimintapainotus__loadtime]  DEFAULT (getdate()) FOR [loadtime];
  ALTER TABLE [sa].[sa_varda_toimintapainotus] ADD  CONSTRAINT [DF__sa_varda_toimintapainotus__source]  DEFAULT ('/reporting/v1/vipunen/toiminnallisetpainotukset/') FOR [source];
  ALTER TABLE [sa].[sa_varda_toimintapainotus] ADD  CONSTRAINT [DF__sa_varda_toimintapainotus_username]  DEFAULT (suser_name()) FOR [username];

END

GO

IF NOT EXISTS
  (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_varda_kielipainotus]' )
    AND type in (N'U'))
BEGIN

  CREATE TABLE [sa].[sa_varda_kielipainotus](
  	[kielipainotus_id] [int] NULL,
  	[kielipainotus_koodi] [nvarchar](100) NULL,
  	[alkamis_pvm] [date] NULL,
  	[paattymis_pvm] [date] NULL,
  	[toimipaikka_id] [int] NULL,
  	[action] [nvarchar](100) NULL,
  	[loadtime] [datetime2](4) NOT NULL,
  	[source] [nvarchar](255) NULL,
  	[username] [nvarchar](128) NOT NULL
  ) ON [PRIMARY];

  ALTER TABLE [sa].[sa_varda_kielipainotus] ADD  CONSTRAINT [DF__sa_varda_kielipainotus_default_paattymis_pvm]  DEFAULT (CONVERT([date],'9999-01-01')) FOR [paattymis_pvm];
  ALTER TABLE [sa].[sa_varda_kielipainotus] ADD  CONSTRAINT [DF__sa_varda_kielipainotus__loadtime]  DEFAULT (getdate()) FOR [loadtime];
  ALTER TABLE [sa].[sa_varda_kielipainotus] ADD  CONSTRAINT [DF__sa_varda_kielipainotus__source]  DEFAULT ('/reporting/v1/vipunen/kielipainotukset/') FOR [source];
  ALTER TABLE [sa].[sa_varda_kielipainotus] ADD  CONSTRAINT [DF__sa_varda_kielipainotus__username]  DEFAULT (suser_name()) FOR [username];

END
