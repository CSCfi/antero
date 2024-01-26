USE [Varda_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_varda_henkilo_organisaatio2022]') AND type in (N'U'))
BEGIN

	CREATE TABLE [sa].[sa_varda_henkilo_organisaatio2022](
		[id] [int] NULL,
		[nimi] [varchar](500) NULL,
		[y_tunnus] [varchar](30) NULL,
		[organisaatio_oid] [varchar](100) NULL,
		[kunta_koodi] [int] NULL,
		[ytjkieli] [varchar](10) NULL,
		[yritysmuoto] [int] NULL,
		[alkamis_pvm] [datetime] NULL,
		[paattymis_pvm] [datetime] NULL,
		[loadtime] [datetime] NULL,
		[username] [varchar](255) NULL,
		[source] [varchar](100) NULL
	) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_varda_henkilo_palvelussuhde2022]') AND type in (N'U'))
BEGIN
	CREATE TABLE [sa].[sa_varda_henkilo_palvelussuhde2022](
		[id] [int] NULL,
		[tyontekija_id] [int] NULL,
		[tyosuhde_koodi] [int] NULL,
		[tyoaika_koodi] [int] NULL,
		[tutkinto_koodi] [int] NULL,
		[tyoaika_viikossa] [float] NULL,
		[alkamis_pvm] [datetime] NULL,
		[paattymis_pvm] [datetime] NULL,
		[loadtime] [datetime] NULL,
		[username] [varchar](255) NULL,
		[source] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_varda_henkilo_taydennyskoulutus2022]') AND type in (N'U'))
BEGIN
	CREATE TABLE [sa].[sa_varda_henkilo_taydennyskoulutus2022](
		[id] [int] NULL,
		[nimi] [varchar](500) NULL,
		[suoritus_pvm] [datetime] NULL,
		[koulutuspaivia] [float] NULL,
		[loadtime] [datetime] NULL,
		[username] [varchar](255) NULL,
		[source] [varchar](100) NULL
	) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_varda_henkilo_taydennyskoulutustyontekija2022]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[sa_varda_henkilo_taydennyskoulutustyontekija2022](
	[taydennyskoulutus_id] [bigint] NULL,
	[tyontekija_id] [bigint] NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](255) NULL,
	[source] [varchar](100) NULL
) ON [PRIMARY]
END
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_varda_henkilo_tilapainenhenkilosto2022]') AND type in (N'U'))
BEGIN
	CREATE TABLE [sa].[sa_varda_henkilo_tilapainenhenkilosto2022](
		[id] [int] NULL,
		[vakajarjestaja_id] [int] NULL,
		[kuukausi] [datetime] NULL,
		[tyontekijamaara] [int] NULL,
		[tuntimaara] [float] NULL,
		[loadtime] [datetime] NULL,
		[username] [varchar](2022) NULL,
		[source] [varchar](100) NULL
	) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_varda_henkilo_toimipaikka2022]') AND type in (N'U'))
BEGIN
	CREATE TABLE [sa].[sa_varda_henkilo_toimipaikka2022](
		[id] [int] NULL,
		[organisaatio_oid] [varchar](100) NULL,
		[kunta_koodi] [int] NULL,
		[kasvatusopillinen_jarjestelma_koodi] [varchar](10) NULL,
		[toimintamuoto_koodi] [varchar](10) NULL,
		[asiointikieli_koodi] [varchar](10) NULL,
		[jarjestamismuoto_koodi] [varchar](100) NULL,
		[varhaiskasvatuspaikat] [int] NULL,
		[toiminnallinenpainotus_kytkin] [varchar](10) NULL,
		[kielipainotus_kytkin] [varchar](10) NULL,
		[vakajarjestaja_id] [int] NULL,
		[alkamis_pvm] [datetime] NULL,
		[paattymis_pvm] [datetime] NULL,
		[loadtime] [datetime] NULL,
		[username] [varchar](255) NULL,
		[source] [varchar](100) NULL
	) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_varda_henkilo_tutkinto2022]') AND type in (N'U'))
BEGIN
	CREATE TABLE [sa].[sa_varda_henkilo_tutkinto2022](
		[id] [bigint] NULL,
		[vakajarjestaja_id] [bigint] NULL,
		[henkilo_id] [bigint] NULL,
		[tutkinto_koodi] [bigint] NULL,
		[loadtime] [datetime] NULL,
		[username] [varchar](100) NULL,
		[source] [varchar](100) NULL
	) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_varda_henkilo_tyontekija2022]') AND type in (N'U'))
BEGIN
	CREATE TABLE [sa].[sa_varda_henkilo_tyontekija2022](
		[id] [bigint] NULL,
		[henkilo_id] [bigint] NULL,
		[vakajarjestaja_id] [bigint] NULL,
		[loadtime] [datetime] NULL,
		[username] [varchar](255) NULL,
		[source] [varchar](100) NULL
	) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_varda_henkilo_tyoskentelypaikka2022]') AND type in (N'U'))
BEGIN

	CREATE TABLE [sa].[sa_varda_henkilo_tyoskentelypaikka2022](
		[id] [int] NULL,
		[palvelussuhde_id] [int] NULL,
		[toimipaikka_id] [int] NULL,
		[kiertava_tyontekija_kytkin] [varchar](100) NULL,
		[tehtavanimike_koodi] [int] NULL,
		[kelpoisuus_kytkin] [varchar](100) NULL,
		[alkamis_pvm] [datetime] NULL,
		[paattymis_pvm] [datetime] NULL,
		[loadtime] [datetime] NULL,
		[username] [varchar](100) NULL,
		[source] [varchar](255) NULL
	) ON [PRIMARY]
END
GO
USE ANTERO
