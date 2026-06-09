USE [ANTERO]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_kuntatalous_taksonomiat]') AND type in (N'U'))
DROP TABLE [sa].[sa_kuntatalous_taksonomiat]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_kuntatalous_taksonomiat](
	[id] [bigint] NULL,
	[solutunniste] [varchar](100) NULL,
	[taso] [int] NULL,
	[tunnusluku] [varchar](1000) NULL,
	[tunnusluku_sv] [varchar](1000) NULL,
	[tunnusluku_en] [varchar](1000) NULL,
	[tehtava] [varchar](100) NULL,
	[tehtava_sv] [varchar](100) NULL,
	[tehtava_en] [varchar](100) NULL,
	[tunnusluku_jarjestys] [int] NULL,
	[tehtava_jarjestys] [varchar](100) NULL,
	[tunnusluku_kayttokohde] [varchar](4000) NULL,
	[tunnusluku_kayttokohde_sv] [varchar](4000) NULL,
	[tunnusluku_kayttokohde_en] [varchar](4000) NULL,
	[tunnusluku_sisennys] [varchar](4000) NULL,
	[tekstitunniste] [varchar](4000) NULL,
	[entrypoint] [varchar](100) NULL,
	[versio] [varchar](100) NULL,
	[tekninen_versio] [datetime] NULL,
	[osakokonaisuus] [varchar](100) NULL,
	[pakollisuus] [varchar](10) NULL,
	[sektori] [varchar](4000) NULL,
	[sektori_sv] [varchar](4000) NULL,
	[sektori_en] [varchar](4000) NULL,
	[palvelu] [varchar](4000) NULL,
	[palvelu_sv] [varchar](4000) NULL,
	[palvelu_en] [varchar](4000) NULL,
	[suojattu] [varchar](100) NULL,
	[source] [varchar](255) NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](100) NULL
) ON [PRIMARY]
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_kuntatalous]') AND type in (N'U'))
DROP TABLE [sa].[sa_kuntatalous]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_kuntatalous](
	[raportointikokonaisuus] [varchar](255) NULL,
	[raportointikausi] [varchar](100) NULL,
	[osakokonaisuus] [varchar](100) NULL,
	[ytunnus] [varchar](15) NULL,
	[kieli] [varchar](10) NULL,
	[taksonomia] [varchar](100) NULL,
	[tunnusluku] [int] NULL,
	[arvo] [float] NULL,
	[tarkastushavainnot] [varchar](4000) NULL,
	[hyväksymisvaihe] [varchar](100) NULL,
	[hyväksymispvm] [datetime] NULL,
	[kommentti] [varchar](4000) NULL,
	[loadtime] [datetime] NULL,
	[source] [varchar](255) NULL,
	[username] [varchar](100) NULL
) ON [PRIMARY]
GO
