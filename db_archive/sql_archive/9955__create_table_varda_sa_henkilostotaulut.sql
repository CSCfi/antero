USE [Varda_SA]
GO

SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS
  (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_varda_vuokrattuhenkilosto]' )
    AND type in (N'U'))
BEGIN
	CREATE TABLE [sa].[sa_varda_vuokrattuhenkilosto](
		[id] [bigint] NULL,
		[vakajarjestaja_id] [int] NULL,
		[kuukausi] [datetime] NULL,
		[tuntimaara] [float] NULL,
		[tyontekijamaara] [bigint] NULL,
		[action] [varchar](100) NULL,
		[loadtime] [datetime2](4) NOT NULL,
		[source] [nvarchar](255) NULL,
		[username] [nvarchar](128) NOT NULL
	) ON [PRIMARY];

  ALTER TABLE [sa].[sa_varda_vuokrattuhenkilosto] ADD  CONSTRAINT [DF__sa_varda_vuokrattu_henkilosto_loadtime]  DEFAULT (getdate()) FOR [loadtime];
  ALTER TABLE [sa].[sa_varda_vuokrattuhenkilosto] ADD  CONSTRAINT [DF__sa_varda_vuokrattuhenkilosto__source]  DEFAULT ('/reporting/v1/vipunen/vuokrattu-henkilosto/') FOR [source];
  ALTER TABLE [sa].[sa_varda_vuokrattuhenkilosto] ADD  CONSTRAINT [DF__sa_varda_vuokrattu_henkilosto_username]  DEFAULT (suser_name()) FOR [username];
END

GO

IF NOT EXISTS
  (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_varda_tyontekija]' )
    AND type in (N'U'))
BEGIN
	CREATE TABLE [sa].[sa_varda_tyontekija](
	[id] [bigint] NULL,
	[henkilo_id] [int] NULL,
	[vakajarjestaja_id] [int] NULL,
	[henkilo_oid] [varchar](100) NULL,
	[syntyma_pvm] [datetime] NULL,
	[aidinkieli_koodi] [varchar](10) NULL,
	[kotikunta_koodi] [varchar](10) NULL,
	[sukupuoli_koodi] [varchar](2) NULL,
	[action] [varchar](100) NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](255) NULL,
	[source] [varchar](100) NULL
) ON [PRIMARY];

  ALTER TABLE [sa].[sa_varda_tyontekija] ADD  CONSTRAINT [DF__sa_varda_tyontekijat__loadtime]  DEFAULT (getdate()) FOR [loadtime];
  ALTER TABLE [sa].[sa_varda_tyontekija] ADD  CONSTRAINT [DF__sa_varda_tyontekijat__username]  DEFAULT (suser_name()) FOR [username];
  ALTER TABLE [sa].[sa_varda_tyontekija] ADD  CONSTRAINT [DF__sa_varda_tyontekija__source]  DEFAULT ('/reporting/v1/vipunen/tyontekijat/') FOR [source];
END

GO

IF NOT EXISTS
  (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_varda_palvelussuhde]' )
    AND type in (N'U'))
BEGIN

  CREATE TABLE [sa].[sa_varda_palvelussuhde](
  	[id] [bigint] NULL,
  	[tyontekija_id] [int] NULL,
  	[tyosuhde_koodi] [int] NULL,
  	[tyoaika_koodi] [int] NULL,
  	[tutkinto_koodi] [int] NULL,
  	[tyoaika_viikossa] [float] NULL,
  	[alkamis_pvm] [datetime] NULL,
  	[paattymis_pvm] [datetime] NULL,
  	[action] [varchar](100) NULL,
  	[loadtime] [datetime] NULL,
  	[username] [varchar](255) NULL,
  	[source] [varchar](100) NULL
  ) ON [PRIMARY];

  ALTER TABLE [sa].[sa_varda_palvelussuhde] ADD  CONSTRAINT [DF__sa_varda_palvelussuhteet__loadtime]  DEFAULT (getdate()) FOR [loadtime];
  ALTER TABLE [sa].[sa_varda_palvelussuhde] ADD  CONSTRAINT [DF__sa_varda_palvelussuhteet__username]  DEFAULT (suser_name()) FOR [username];
  ALTER TABLE [sa].[sa_varda_palvelussuhde] ADD  CONSTRAINT [DF__sa_varda_palvelussuhde__source]  DEFAULT ('/reporting/v1/vipunen/palvelussuhteet/') FOR [source];

END

GO

IF NOT EXISTS
  (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_varda_palvelussuhde]' )
    AND type in (N'U'))
BEGIN

  CREATE TABLE [sa].[sa_varda_palvelussuhde](
  	[id] [bigint] NULL,
  	[tyontekija_id] [int] NULL,
  	[tyosuhde_koodi] [int] NULL,
  	[tyoaika_koodi] [int] NULL,
  	[tutkinto_koodi] [int] NULL,
  	[tyoaika_viikossa] [float] NULL,
  	[alkamis_pvm] [datetime] NULL,
  	[paattymis_pvm] [datetime] NULL,
  	[action] [varchar](100) NULL,
  	[loadtime] [datetime] NULL,
  	[username] [varchar](255) NULL,
  	[source] [varchar](100) NULL
  ) ON [PRIMARY];

  ALTER TABLE [sa].[sa_varda_palvelussuhde] ADD  CONSTRAINT [DF__sa_varda_palvelussuhteet__loadtime]  DEFAULT (getdate()) FOR [loadtime];
  ALTER TABLE [sa].[sa_varda_palvelussuhde] ADD  CONSTRAINT [DF__sa_varda_palvelussuhteet__username]  DEFAULT (suser_name()) FOR [username];
  ALTER TABLE [sa].[sa_varda_palvelussuhde] ADD  CONSTRAINT [DF__sa_varda_palvelussuhde__source]  DEFAULT ('/reporting/v1/vipunen/palvelussuhteet/') FOR [source];

END

GO

IF NOT EXISTS
  (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_varda_tyoskentelypaikka]' )
    AND type in (N'U'))
BEGIN

	CREATE TABLE [sa].[sa_varda_tyoskentelypaikka](
		[id] [int] NULL,
		[palvelussuhde_id] [int] NULL,
		[toimipaikka_id] [int] NULL,
		[kiertava_tyontekija_kytkin] [varchar](5) NULL,
		[tehtavanimike_koodi] [int] NULL,
		[kelpoisuus_kytkin] [varchar](5) NULL,
		[alkamis_pvm] [datetime] NULL,
		[paattymis_pvm] [datetime] NULL,
		[action] [varchar](100) NULL,
		[loadtime] [datetime] NULL,
		[username] [varchar](100) NULL,
		[source] [varchar](255) NULL
	) ON [PRIMARY];

  ALTER TABLE [sa].[sa_varda_tyoskentelypaikka] ADD  CONSTRAINT [DF__sa_varda_tyoskentelypaikat__paattymispvm]  DEFAULT (CONVERT([date],'9999-01-01')) FOR [paattymis_pvm];
  ALTER TABLE [sa].[sa_varda_tyoskentelypaikka] ADD  CONSTRAINT [DF__sa_varda_tyoskentelypaikat__loadtime]  DEFAULT (getdate()) FOR [loadtime];
  ALTER TABLE [sa].[sa_varda_tyoskentelypaikka] ADD  CONSTRAINT [DF__sa_varda_tyoskentelypaikat__username]  DEFAULT (suser_name()) FOR [username];
  ALTER TABLE [sa].[sa_varda_tyoskentelypaikka] ADD  CONSTRAINT [DF__sa_varda_tyoskentelypaikka__source]  DEFAULT ('/reporting/v1/vipunen/tyoskentelypaikat/') FOR [source];

END

GO

IF NOT EXISTS
  (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_varda_tutkinto]' )
    AND type in (N'U'))
BEGIN

	CREATE TABLE [sa].[sa_varda_tutkinto](
		[id] [bigint] NULL,
		[vakajarjestaja_id] [int] NULL,
		[henkilo_id] [int] NULL,
		[tutkinto_koodi] [int] NULL,
		[action] [varchar](100) NULL,
		[loadtime] [datetime] NULL,
		[username] [varchar](100) NULL,
		[source] [varchar](100) NULL
	) ON [PRIMARY];

	ALTER TABLE [sa].[sa_varda_tutkinto] ADD  CONSTRAINT [DF__sa_varda_tutkinnot__loadtime]  DEFAULT (getdate()) FOR [loadtime];
	ALTER TABLE [sa].[sa_varda_tutkinto] ADD  CONSTRAINT [DF__sa_varda_tutkinnot__username]  DEFAULT (suser_name()) FOR [username];
	ALTER TABLE [sa].[sa_varda_tutkinto] ADD  CONSTRAINT [DF__sa_varda_tutkinto__source]  DEFAULT ('/reporting/v1/vipunen/tutkinnot/') FOR [source];

END

GO

IF NOT EXISTS
  (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_varda_pidemmatpoissaolot]' )
    AND type in (N'U'))
BEGIN

	CREATE TABLE [sa].[sa_varda_pidemmatpoissaolot](
		[id] [int] NULL,
		[palvelussuhde_id] [int] NULL,
		[alkamis_pvm] [datetime] NULL,
		[paattymis_pvm] [datetime] NULL,
		[action] [varchar](100) NULL,
		[loadtime] [datetime] NULL,
		[username] [varchar](100) NULL,
		[source] [varchar](255) NULL
	) ON [PRIMARY];

	ALTER TABLE [sa].[sa_varda_pidemmatpoissaolot] ADD  CONSTRAINT [DF__sa_varda_pidemmat_poissaolot__paattymispvm]  DEFAULT (CONVERT([date],'9999-01-01')) FOR [paattymis_pvm];
	ALTER TABLE [sa].[sa_varda_pidemmatpoissaolot] ADD  CONSTRAINT [DF__sa_varda_pidemmat_poissaolot__loadtime]  DEFAULT (getdate()) FOR [loadtime];
	ALTER TABLE [sa].[sa_varda_pidemmatpoissaolot] ADD  CONSTRAINT [DF__sa_varda_pidemmat_poissaolot__username]  DEFAULT (suser_name()) FOR [username];
	ALTER TABLE [sa].[sa_varda_pidemmatpoissaolot] ADD  CONSTRAINT [DF__sa_varda_pidemmatpoissaolot__source]  DEFAULT ('/reporting/v1/vipunen/pidemmatpoissaolot/') FOR [source];

END

GO

IF NOT EXISTS
  (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_varda_taydennyskoulutus]' )
    AND type in (N'U'))
BEGIN

CREATE TABLE [sa].[sa_varda_taydennyskoulutus](
	[id] [bigint] NULL,
	[nimi] [varchar](1000) NULL,
	[suoritus_pvm] [datetime] NULL,
	[koulutuspaivia] [float] NULL,
	[action] [varchar](100) NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](100) NULL,
	[source] [varchar](255) NULL
) ON [PRIMARY]

ALTER TABLE [sa].[sa_varda_taydennyskoulutus] ADD  CONSTRAINT [DF__sa_varda_taydennyskoulutukset__loadtime]  DEFAULT (getdate()) FOR [loadtime];
ALTER TABLE [sa].[sa_varda_taydennyskoulutus] ADD  CONSTRAINT [DF__sa_varda_taydennyskoulutukset__username]  DEFAULT (suser_name()) FOR [username];
ALTER TABLE [sa].[sa_varda_taydennyskoulutus] ADD  CONSTRAINT [DF__sa_varda_taydennyskoulutus__source]  DEFAULT ('/reporting/v1/vipunen/taydennyskoulutukset/') FOR [source];

END

GO

IF NOT EXISTS
  (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_varda_taydennyskoulutustyontekijat]' )
    AND type in (N'U'))
BEGIN

	CREATE TABLE [sa].[sa_varda_taydennyskoulutustyontekijat](
		[id] [bigint] NULL,
		[taydennyskoulutus_id] [int] NULL,
		[tyontekija_id] [int] NULL,
		[action] [varchar](100) NULL,
		[loadtime] [datetime] NULL,
		[username] [varchar](100) NULL,
		[source] [varchar](255) NULL
	) ON [PRIMARY];


	ALTER TABLE [sa].[sa_varda_taydennyskoulutustyontekijat] ADD  CONSTRAINT [DF__sa_varda_taydennyskoulutukset_tyontekijat__loadtime]  DEFAULT (getdate()) FOR [loadtime];
	ALTER TABLE [sa].[sa_varda_taydennyskoulutustyontekijat] ADD  CONSTRAINT [DF__sa_varda_taydennyskoulutukset_tyontekijat__username]  DEFAULT (suser_name()) FOR [username];
	ALTER TABLE [sa].[sa_varda_taydennyskoulutustyontekijat] ADD  CONSTRAINT [DF__sa_varda_taydennyskoulutustyontekijat__source]  DEFAULT ('/reporting/v1/vipunen/taydennyskoulutus-tyontekijat/') FOR [source];

END
