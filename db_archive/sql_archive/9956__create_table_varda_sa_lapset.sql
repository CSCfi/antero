USE [Varda_SA]
GO

SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER ON
GO


IF NOT EXISTS
  (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_varda_lapsi]' )
    AND type in (N'U'))
BEGIN

  CREATE TABLE [sa].[sa_varda_lapsi](
  	[lapsi_id] [bigint] NULL,
  	[henkilo_id] [nvarchar](100) NULL,
  	[henkilo_oid] [nvarchar](100) NULL,
  	[vakatoimija_id] [nvarchar](100) NULL,
  	[oma_organisaatio_id] [nvarchar](100) NULL,
  	[paos_organisaatio_id] [nvarchar](100) NULL,
  	[paos_kytkin] [nvarchar](10) NULL,
  	[syntyma_pvm] [datetime2](4) NULL,
  	[aidinkieli_koodi] [nvarchar](10) NULL,
  	[kotikunta_koodi] [nvarchar](10) NULL,
  	[sukupuoli_koodi] [nvarchar](10) NULL,
  	[action] [nvarchar](100) NULL,
  	[loadtime] [datetime2](4) NOT NULL,
  	[source] [nvarchar](255) NULL,
  	[username] [nvarchar](128) NOT NULL
  ) ON [PRIMARY]

  ALTER TABLE [sa].[sa_varda_lapsi] ADD  CONSTRAINT [DF__sa_varda_lapset__loadtime]  DEFAULT (getdate()) FOR [loadtime];
  ALTER TABLE [sa].[sa_varda_lapsi] ADD  CONSTRAINT [DF__sa_varda_lapsi__source]  DEFAULT ('/reporting/v1/vipunen/lapset/') FOR [source];
  ALTER TABLE [sa].[sa_varda_lapsi] ADD  CONSTRAINT [DF__sa_varda_lapset__username]  DEFAULT (suser_name()) FOR [username];

END

GO

IF NOT EXISTS
  (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_varda_varhaiskasvatuspaatos]' )
    AND type in (N'U'))
BEGIN

  CREATE TABLE [sa].[sa_varda_varhaiskasvatuspaatos](
  	[varhaiskasvatuspaatos_id] [bigint] NULL,
  	[vuorohoito_kytkin] [nvarchar](100) NULL,
  	[pikakasittely_kytkin] [nvarchar](100) NULL,
  	[tuntimaara_viikossa] [nvarchar](20) NULL,
  	[paivittainen_vaka_kytkin] [nvarchar](100) NULL,
  	[kokopaivainen_vaka_kytkin] [nvarchar](100) NULL,
  	[jarjestamismuoto_koodi] [nvarchar](100) NULL,
  	[tilapainen_vaka_kytkin] [nvarchar](100) NULL,
  	[hakemus_pvm] [date] NULL,
  	[alkamis_pvm] [date] NULL,
  	[paattymis_pvm] [date] NULL,
  	[lapsi_id] [bigint] NULL,
  	[action] [nvarchar](100) NULL,
  	[loadtime] [datetime2](4) NOT NULL,
  	[source] [nvarchar](255) NULL,
  	[username] [nvarchar](128) NOT NULL
  ) ON [PRIMARY];

  ALTER TABLE [sa].[sa_varda_varhaiskasvatuspaatos] ADD  CONSTRAINT [DF__sa_varda_varhaiskasvatuspaatokset__paattymis_pvm]  DEFAULT (CONVERT([date],'9999-01-01')) FOR [paattymis_pvm];
  ALTER TABLE [sa].[sa_varda_varhaiskasvatuspaatos] ADD  CONSTRAINT [DF__sa_varda_varhaiskasvatuspaatokset__loadtime]  DEFAULT (getdate()) FOR [loadtime];
  ALTER TABLE [sa].[sa_varda_varhaiskasvatuspaatos] ADD  CONSTRAINT [DF__sa_varda_varhaiskasvatuspaatos__source]  DEFAULT ('/reporting/v1/vipunen/varhaiskasvatuspaatokset/') FOR [source];
  ALTER TABLE [sa].[sa_varda_varhaiskasvatuspaatos] ADD  CONSTRAINT [DF__sa_varda_varhaiskasvatuspaatokset__username]  DEFAULT (suser_name()) FOR [username];

END

GO

IF NOT EXISTS
  (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_varda_varhaiskasvatussuhde]' )
    AND type in (N'U'))
BEGIN

  CREATE TABLE [sa].[sa_varda_varhaiskasvatussuhde](
  	[varhaiskasvatussuhde_id] [bigint] NULL,
  	[toimipaikka_id] [bigint] NULL,
  	[varhaiskasvatuspaatos_id] [bigint] NULL,
  	[alkamis_pvm] [date] NULL,
  	[paattymis_pvm] [date] NULL,
  	[action] [nvarchar](100) NULL,
  	[loadtime] [datetime2](4) NOT NULL,
  	[source] [nvarchar](255) NULL,
  	[username] [nvarchar](128) NOT NULL
  ) ON [PRIMARY];

  ALTER TABLE [sa].[sa_varda_varhaiskasvatussuhde] ADD  CONSTRAINT [DF__sa_varda_varhaiskasvatussuhteet__paattymis_pvm]  DEFAULT (CONVERT([date],'9999-01-01')) FOR [paattymis_pvm];
  ALTER TABLE [sa].[sa_varda_varhaiskasvatussuhde] ADD  CONSTRAINT [DF__sa_varda_varhaiskasvatussuhteet__loadtime]  DEFAULT (getdate()) FOR [loadtime];
  ALTER TABLE [sa].[sa_varda_varhaiskasvatussuhde] ADD  CONSTRAINT [DF__sa_varda_varhaiskasvatussuhde__source]  DEFAULT ('/reporting/v1/vipunen/varhaiskasvatussuhteet/') FOR [source];
  ALTER TABLE [sa].[sa_varda_varhaiskasvatussuhde] ADD  CONSTRAINT [DF__sa_varda_varhaiskasvatussuhteet__username]  DEFAULT (suser_name()) FOR [username];

END

GO


IF NOT EXISTS
  (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_varda_maksutieto]' )
    AND type in (N'U'))
BEGIN

  CREATE TABLE [sa].[sa_varda_maksutieto](
  	[maksutieto_id] [bigint] NULL,
  	[lapsi_id] [bigint] NULL,
  	[yksityinen_jarjestaja] [nvarchar](10) NULL,
  	[maksun_peruste_koodi] [nvarchar](10) NULL,
  	[palveluseteli_arvo] [nvarchar](10) NULL,
  	[asiakasmaksu] [nvarchar](10) NULL,
  	[perheen_koko] [nvarchar](10) NULL,
  	[alkamis_pvm] [date] NULL,
  	[paattymis_pvm] [date] NULL,
  	[action] [nvarchar](100) NULL,
  	[loadtime] [datetime2](4) NOT NULL,
  	[source] [nvarchar](255) NULL,
  	[username] [nvarchar](128) NOT NULL
  ) ON [PRIMARY];

  ALTER TABLE [sa].[sa_varda_maksutieto] ADD  CONSTRAINT [DF__sa_varda_maksutiedot__paattymis_pvm]  DEFAULT (CONVERT([date],'9999-01-01')) FOR [paattymis_pvm];
  ALTER TABLE [sa].[sa_varda_maksutieto] ADD  CONSTRAINT [DF__sa_varda_maksutiedot__loadtime]  DEFAULT (getdate()) FOR [loadtime];
  ALTER TABLE [sa].[sa_varda_maksutieto] ADD  CONSTRAINT [DF__sa_varda_maksutieto__source]  DEFAULT ('/reporting/v1/vipunen/maksutiedot/') FOR [source];
  ALTER TABLE [sa].[sa_varda_maksutieto] ADD  CONSTRAINT [DF__sa_varda_maksutiedot__username]  DEFAULT (suser_name()) FOR [username];

END
