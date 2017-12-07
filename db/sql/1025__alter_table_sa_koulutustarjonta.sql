USE [ANTERO]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[koulutustarjonta_koulutus]') AND type in (N'U'))
ALTER TABLE [sa].[koulutustarjonta_koulutus] DROP CONSTRAINT IF EXISTS [DF__koulutustarjonta_koulutus__username]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[koulutustarjonta_koulutus]') AND type in (N'U'))
ALTER TABLE [sa].[koulutustarjonta_koulutus] DROP CONSTRAINT IF EXISTS [DF__koulutustarjonta_koulutus__loadtime]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[koulutustarjonta_hakukohde]') AND type in (N'U'))
ALTER TABLE [sa].[koulutustarjonta_hakukohde] DROP CONSTRAINT IF EXISTS [DF__koulutustarjonta_hakukohde__username]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[koulutustarjonta_hakukohde]') AND type in (N'U'))
ALTER TABLE [sa].[koulutustarjonta_hakukohde] DROP CONSTRAINT IF EXISTS [DF__koulutustarjonta_hakukohde__loadtime]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[koulutustarjonta_haku]') AND type in (N'U'))
ALTER TABLE [sa].[koulutustarjonta_haku] DROP CONSTRAINT IF EXISTS [DF__koulutustarjonta_haku__username]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[koulutustarjonta_haku]') AND type in (N'U'))
ALTER TABLE [sa].[koulutustarjonta_haku] DROP CONSTRAINT IF EXISTS [DF__koulutustarjonta_haku__loadtime]
GO
/****** Object:  Table [sa].[koulutustarjonta_koulutus]    Script Date: 7.12.2017 11:52:08 ******/
DROP TABLE IF EXISTS [sa].[koulutustarjonta_koulutus]
GO
/****** Object:  Table [sa].[koulutustarjonta_hakukohde]    Script Date: 7.12.2017 11:52:08 ******/
DROP TABLE IF EXISTS [sa].[koulutustarjonta_hakukohde]
GO
/****** Object:  Table [sa].[koulutustarjonta_haku]    Script Date: 7.12.2017 11:52:08 ******/
DROP TABLE IF EXISTS [sa].[koulutustarjonta_haku]
GO
/****** Object:  Table [sa].[koulutustarjonta_haku]    Script Date: 7.12.2017 11:52:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[koulutustarjonta_haku]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[koulutustarjonta_haku](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
	[korkeakouluHaku] [bit] NULL,
	[kohdejoukkoUri] [nvarchar](max) NULL,
	[koulutuksenAlkamiskausiUri] [nvarchar](max) NULL,
	[koulutuksenAlkamisVuosi] [int] NULL,
	[hakutyyppiUri] [nvarchar](max) NULL,
	[hakutapaUri] [nvarchar](max) NULL,
	[hakukausiUri] [nvarchar](max) NULL,
	[hakukausiVuosi] [int] NULL,
	[sijoittelu] [bit] NULL,
	[haunTunniste] [nvarchar](max) NULL,
	[nimi] [nvarchar](max) NULL,
	[nimi_sv] [nvarchar](max) NULL,
	[nimi_en] [nvarchar](max) NULL,
	[tarjoajaOids] [nvarchar](max) NULL,
	[koulutusmoduuliTyyppi] [nvarchar](max) NULL,
	[ataruLomakeAvain] [nvarchar](max) NULL,
	[kohdejoukonTarkenne] [nvarchar](max) NULL,
	[maxHakukohdes] [int] NULL,
	[ylioppilastutkintoAntaaHakukelpoisuuden] [bit] NULL,
	[usePriority] [bit] NULL,
	[jarjestelmanHakulomake] [bit] NULL,
	[opintopolunNayttaminenLoppuu] [nvarchar](max) NULL,
	[tunnistusKaytossa] [bit] NULL,
	[autosyncTarjonta] [bit] NULL,
	[autosyncTarjontaFrom] [nvarchar](max) NULL,
	[autosyncTarjontaTo] [nvarchar](max) NULL,
	[hakulomakeUri] [nvarchar](max) NULL,
	[organisaatioOids] [nvarchar](max) NULL,
	[parentHakuOid] [nvarchar](max) NULL,
	[tila] [nvarchar](max) NULL,
	[maksumuuriKaytossa] [bit] NULL,
	[createdBy] [nvarchar](max) NULL,
	[modified] [nvarchar](max) NULL,
	[modifiedBy] [nvarchar](max) NULL,
	[created] [nvarchar](max) NULL,
	[oid] [nvarchar](max) NULL,
	[version] [int] NULL,
 CONSTRAINT [PK__koulutustarjonta_haku] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [sa].[koulutustarjonta_hakukohde]    Script Date: 7.12.2017 11:52:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[koulutustarjonta_hakukohde]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[koulutustarjonta_hakukohde](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
	[hakuaikaAlkuPvm] [nvarchar](max) NULL,
	[hakuaikaLoppuPvm] [nvarchar](max) NULL,
	[koulutuksenAlkamiskausiUri] [nvarchar](max) NULL,
	[aloituspaikatLkm] [int] NULL,
	[ensikertalaistenAloituspaikat] [int] NULL,
	[valintojenAloituspaikatLkm] [int] NULL,
	[hakukohteenNimiUri] [nvarchar](max) NULL,
	[lukioKoulutus] [bit] NULL,
	[alinHyvaksyttavaKeskiarvo] [float] NULL,
	[ammatillinenPerustutkinto] [bit] NULL,
	[hakulomakeUrl] [nvarchar](max) NULL,
	[koulutuksenAlkamisvuosi] [int] NULL,
	[tarjoajaOids] [nvarchar](max) NULL,
	[koulutusmoduuliTyyppi] [nvarchar](max) NULL,
	[hakuOid] [nvarchar](max) NULL,
	[koulutuslaji] [nvarchar](max) NULL,
	[uniqueExternalId] [nvarchar](max) NULL,
	[ulkoinenTunniste] [nvarchar](max) NULL,
	[ataruLomakeAvain] [nvarchar](max) NULL,
	[ylioppilastutkintoAntaaHakukelpoisuuden] [bit] NULL,
	[hakuaikaId] [nvarchar](max) NULL,
	[soraKuvausTunniste] [int] NULL,
	[valintaPerusteKuvausTunniste] [int] NULL,
	[alinValintaPistemaara] [int] NULL,
	[sahkoinenToimitusOsoite] [nvarchar](max) NULL,
	[soraKuvausKoodiUri] [nvarchar](max) NULL,
	[valintaperustekuvausKoodiUri] [nvarchar](max) NULL,
	[liitteidenToimitusPvm] [nvarchar](max) NULL,
	[kelaLinjaKoodi] [nvarchar](max) NULL,
	[kelaLinjaTarkenne] [nvarchar](max) NULL,
	[ohjeetUudelleOpiskelijalle] [nvarchar](max) NULL,
	[toteutusTyyppi] [nvarchar](max) NULL,
	[kaksoisTutkinto] [bit] NULL,
	[kaytetaanHaunPaattymisenAikaa] [bit] NULL,
	[kaytetaanJarjestelmanValintaPalvelua] [bit] NULL,
	[ylinValintapistemaara] [int] NULL,
	[josYoEiMuitaLiitepyyntoja] [bit] NULL,
	[overridesHaunHakulomakeUrl] [bit] NULL,
	[tila] [nvarchar](max) NULL,
	[edellisenVuodenHakijatLkm] [int] NULL,
	[hakukohteenNimi] [nvarchar](max) NULL,
	[kaytetaanHakukohdekohtaistaHakuaikaa] [bit] NULL,
	[koulutusAsteTyyppi] [nvarchar](max) NULL,
	[tutkintoonJohtava] [bit] NULL,
	[opetusKielet] [nvarchar](max) NULL,
	[createdBy] [nvarchar](max) NULL,
	[modified] [nvarchar](max) NULL,
	[modifiedBy] [nvarchar](max) NULL,
	[created] [nvarchar](max) NULL,
	[oid] [nvarchar](max) NULL,
	[version] [int] NULL,
	[hakukohdeKoulutusOids] [nvarchar](max) NULL,
	[hakukohteenNimet] [nvarchar](max) NULL,
 CONSTRAINT [PK__koulutustarjonta_hakukohde] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [sa].[koulutustarjonta_koulutus]    Script Date: 7.12.2017 11:52:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[koulutustarjonta_koulutus]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[koulutustarjonta_koulutus](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
	[organisaatio_oid] [nvarchar](max) NULL,
	[opintojenLaajuusarvo_arvo] [nvarchar](max) NULL,
	[koulutusohjelma_uri] [nvarchar](max) NULL,
	[toteutustyyppi] [nvarchar](max) NULL,
	[tunniste] [nvarchar](max) NULL,
	[koulutuksenAlkamiskausi_arvo] [nvarchar](max) NULL,
	[koulutuksenAlkamisvuosi] [int] NULL,
	[koulutusmoduuliTyyppi] [nvarchar](max) NULL,
	[koulutuslaji_uri] [nvarchar](max) NULL,
	[komoOid] [nvarchar](max) NULL,
	[uniqueExternalId] [nvarchar](max) NULL,
	[isAvoimenYliopistonKoulutus] [bit] NULL,
	[opintojenMaksullisuus] [bit] NULL,
	[komotoOid] [nvarchar](max) NULL,
	[tila] [nvarchar](max) NULL,
	[moduulityyppi] [nvarchar](max) NULL,
	[koulutusala_uri] [nvarchar](max) NULL,
	[koulutusaste_uri] [nvarchar](max) NULL,
	[koulutuskoodi_uri] [nvarchar](max) NULL,
	[opintoala_uri] [nvarchar](max) NULL,
	[opintojenLaajuusYksikko_uri] [nvarchar](max) NULL,
	[tutkinto_uri] [nvarchar](max) NULL,
	[eqf_uri] [nvarchar](max) NULL,
	[nqf_uri] [nvarchar](max) NULL,
	[koulutustyyppi_arvo] [nvarchar](max) NULL,
	[createdBy] [nvarchar](max) NULL,
	[modified] [nvarchar](max) NULL,
	[modifiedBy] [nvarchar](max) NULL,
	[created] [nvarchar](max) NULL,
	[oid] [nvarchar](max) NULL,
	[version] [int] NULL,
	[koulutuskoodi_arvo] [nvarchar](max) NULL,
	[koulutuskoodi_nimi] [nvarchar](max) NULL,
	[pohjakoulutusvaatimus_arvo] [nvarchar](max) NULL,
 CONSTRAINT [PK__koulutustarjonta_koulutus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[DF__koulutustarjonta_haku__loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [sa].[koulutustarjonta_haku] ADD  CONSTRAINT [DF__koulutustarjonta_haku__loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[DF__koulutustarjonta_haku__username]') AND type = 'D')
BEGIN
ALTER TABLE [sa].[koulutustarjonta_haku] ADD  CONSTRAINT [DF__koulutustarjonta_haku__username]  DEFAULT (suser_name()) FOR [username]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[DF__koulutustarjonta_hakukohde__loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [sa].[koulutustarjonta_hakukohde] ADD  CONSTRAINT [DF__koulutustarjonta_hakukohde__loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[DF__koulutustarjonta_hakukohde__username]') AND type = 'D')
BEGIN
ALTER TABLE [sa].[koulutustarjonta_hakukohde] ADD  CONSTRAINT [DF__koulutustarjonta_hakukohde__username]  DEFAULT (suser_name()) FOR [username]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[DF__koulutustarjonta_koulutus__loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [sa].[koulutustarjonta_koulutus] ADD  CONSTRAINT [DF__koulutustarjonta_koulutus__loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[DF__koulutustarjonta_koulutus__username]') AND type = 'D')
BEGIN
ALTER TABLE [sa].[koulutustarjonta_koulutus] ADD  CONSTRAINT [DF__koulutustarjonta_koulutus__username]  DEFAULT (suser_name()) FOR [username]
END


