USE ANTERO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_ovara_onr_henkilo]') AND type in (N'U'))
DROP TABLE [sa].[sa_ovara_onr_henkilo]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_ovara_onr_henkilo](
	[henkilo_oid] [varchar](100) NULL,
	[master_oid] [varchar](100) NULL,
	[master] [int] NULL,
	[kotikunta] [varchar](10) NULL,
	[syntymaaika] [date] NULL,
	[aidinkieli] [varchar](100) NULL,
	[kansalaisuus] [varchar](100) NULL,
	[sukupuoli] [int] NULL,
	[turvakielto] [int] NULL,
	[yksiloityvtj] [int] NULL,
	[luotu] [datetime] NULL,
	[muokattu] [datetime] NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](100) NULL,
	[source] [varchar](100) NULL
) ON [PRIMARY]
GO

-------------------------------------------------------------------------------------------

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_ovara_pohjakoulutus_kk]') AND type in (N'U'))
DROP TABLE [sa].[sa_ovara_pohjakoulutus_kk]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_ovara_pohjakoulutus_kk](
	[hakemus_oid] [varchar](100) NULL,
	[pohjakoulutus_koodi] [varchar](100) NULL,
	[pohjakoulutusvuosi] [varchar](100) NULL,
	[pohjakoulutusvuodet] [varchar](1000) NULL,
	[source] [varchar](255) NULL,
	[username] [varchar](255) NULL,
	[loadtime] [datetime] NULL,
	[pohjakoulutusvuosi_check] [varchar](100) NULL,
	[muokattu_pkv] [bit] NULL
) ON [PRIMARY]
GO

-------------------------------------------------------------------------------------------

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_ovara_pohjakoulutus_kk_vialliset]') AND type in (N'U'))
DROP TABLE [sa].[sa_ovara_pohjakoulutus_kk_vialliset]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_ovara_pohjakoulutus_kk_vialliset](
	[hakemus_oid] [varchar](100) NULL,
	[pohjakoulutus_koodi] [varchar](100) NULL,
	[pohjakoulutusvuodet] [varchar](4000) NULL,
	[pohjakoulutusvuosi_check] [varchar](1000) NULL,
	[muokattu_pkv] [int] NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](100) NULL,
	[source] [varchar](100) NULL
) ON [PRIMARY]
GO

-------------------------------------------------------------------------------------------

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_ovara_pohjakoulutus_koodit]') AND type in (N'U'))
DROP TABLE [sa].[sa_ovara_pohjakoulutus_koodit]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_ovara_pohjakoulutus_koodit](
	[hakemus_oid] [varchar](100) NULL,
	[pohjakoulutus_koodi] [varchar](100) NULL,
	[pohjakoulutus_kk_valmistusmisvuosi] [varchar](1000) NULL
) ON [PRIMARY]
GO

-------------------------------------------------------------------------------------------

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_ovara_sure_arvosana]') AND type in (N'U'))
DROP TABLE [sa].[sa_ovara_sure_arvosana]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_ovara_sure_arvosana](
	[sure_arvosana_id] [varchar](100) NULL,
	[suoritus] [varchar](100) NULL,
	[arvosana] [varchar](10) NULL,
	[asteikko] [varchar](10) NULL,
	[aine] [varchar](100) NULL,
	[lisatieto] [varchar](100) NULL,
	[valinnainen] [int] NULL,
	[muokattu] [datetime] NULL,
	[deleted] [int] NULL,
	[pisteet] [int] NULL,
	[myonnetty] [datetime] NULL,
	[lahde] [varchar](100) NULL,
	[jarjestys] [int] NULL,
	[arvot] [varchar](100) NULL,
	[yo_aine] [varchar](15) NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](100) NULL,
	[source] [varchar](100) NULL
) ON [PRIMARY]
GO

-------------------------------------------------------------------------------------------

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_ovara_sure_ensikertalainen]') AND type in (N'U'))
DROP TABLE [sa].[sa_ovara_sure_ensikertalainen]
GO

/****** Object:  Table [sa].[sa_ovara_sure_ensikertalainen]    Script Date: 31.12.2025 10.06.51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_ovara_sure_ensikertalainen](
	[haku_oid] [varchar](50) NULL,
	[henkilo_oid] [varchar](50) NULL,
	[isensikertalainen] [int] NULL,
	[menettamisenperuste] [varchar](100) NULL,
	[menettamisenpaivamaara] [datetime] NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](100) NULL,
	[source] [varchar](100) NULL,
	[master_oid] [varchar](100) NULL
) ON [PRIMARY]
GO

-------------------------------------------------------------------------------------------

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_ovara_sure_opiskelija]') AND type in (N'U'))
DROP TABLE [sa].[sa_ovara_sure_opiskelija]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_ovara_sure_opiskelija](
	[resourceid] [varchar](100) NULL,
	[oppilaitos_oid] [varchar](100) NULL,
	[luokkataso] [varchar](100) NULL,
	[luokka] [varchar](100) NULL,
	[henkilo_oid] [varchar](100) NULL,
	[alkupaiva] [datetime] NULL,
	[loppupaiva] [datetime] NULL,
	[muokattu] [datetime] NULL,
	[poistettu] [int] NULL,
	[lahde] [varchar](100) NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](100) NULL,
	[source] [varchar](100) NULL,
	[master_oid] [varchar](100) NULL
) ON [PRIMARY]
GO

-------------------------------------------------------------------------------------------

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_ovara_sure_opiskeluoikeus]') AND type in (N'U'))
DROP TABLE [sa].[sa_ovara_sure_opiskeluoikeus]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_ovara_sure_opiskeluoikeus](
	[resourceid] [varchar](100) NULL,
	[alkupaiva] [varchar](100) NULL,
	[loppupaiva] [varchar](100) NULL,
	[henkilo_oid] [varchar](100) NULL,
	[komo] [varchar](1000) NULL,
	[myontaja_oid] [varchar](100) NULL,
	[lahde] [varchar](100) NULL,
	[muokattu] [varchar](100) NULL,
	[poistettu] [varchar](100) NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](100) NULL,
	[source] [varchar](100) NULL
) ON [PRIMARY]
GO

-------------------------------------------------------------------------------------------

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_ovara_sure_proxysuoritus]') AND type in (N'U'))
DROP TABLE [sa].[sa_ovara_sure_proxysuoritus]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_ovara_sure_proxysuoritus](
	[pohjakoulutus] [int] NULL,
	[keyvalues] [varchar](max) NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](100) NULL,
	[source] [varchar](100) NULL,
	[hakemus_oid] [varchar](100) NULL,
	[haku_oid] [varchar](100) NULL,
	[henkilo_oid] [varchar](100) NULL,
	[master_oid] [varchar](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

-------------------------------------------------------------------------------------------

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_ovara_sure_suoritus]') AND type in (N'U'))
DROP TABLE [sa].[sa_ovara_sure_suoritus]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_ovara_sure_suoritus](
	[resourceid] [varchar](100) NULL,
	[komo] [varchar](100) NULL,
	[myontaja] [varchar](100) NULL,
	[tila] [varchar](100) NULL,
	[valmistuminen] [datetime] NULL,
	[henkilo_oid] [varchar](100) NULL,
	[yksilollistaminen] [varchar](100) NULL,
	[suorituskieli] [varchar](100) NULL,
	[muokattu] [datetime] NULL,
	[poistettu] [int] NULL,
	[lahde] [varchar](100) NULL,
	[vahvistettu] [int] NULL,
	[arvot] [varchar](1000) NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](100) NULL,
	[source] [varchar](100) NULL,
	[yksilollistetty_ma_ai] [int] NULL,
	[vuosiluokkiin_sitomaton_opetus] [int] NULL,
	[master_oid] [varchar](100) NULL
) ON [PRIMARY]
GO

-------------------------------------------------------------------------------------------

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_ovara_valintapiste_service_pistetieto]') AND type in (N'U'))
DROP TABLE [sa].[sa_ovara_valintapiste_service_pistetieto]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_ovara_valintapiste_service_pistetieto](
	[valintakoe_hakemus_id] [varchar](100) NULL,
	[hakemus_oid] [varchar](50) NULL,
	[valintakoe_tunniste] [varchar](1000) NULL,
	[arvo] [varchar](100) NULL,
	[osallistuminen] [varchar](100) NULL,
	[tallettaja] [varchar](100) NULL,
	[poistettu] [int] NULL,
	[muokattu] [datetime] NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](100) NULL,
	[source] [varchar](100) NULL
) ON [PRIMARY]
GO

-------------------------------------------------------------------------------------------

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_ovara_valintarekisteri_ilmoittautuminen]') AND type in (N'U'))
DROP TABLE [sa].[sa_ovara_valintarekisteri_ilmoittautuminen]
GO

/****** Object:  Table [sa].[sa_ovara_valintarekisteri_ilmoittautuminen]    Script Date: 31.12.2025 10.12.15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_ovara_valintarekisteri_ilmoittautuminen](
	[hakukohde_henkilo_id] [varchar](100) NULL,
	[ilmoittautuminen_id] [varchar](100) NULL,
	[hakukohde_oid] [varchar](100) NULL,
	[henkilo_oid] [varchar](100) NULL,
	[ilmoittaja] [varchar](100) NULL,
	[selite] [varchar](4000) NULL,
	[tila] [varchar](100) NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](100) NULL,
	[source] [varchar](100) NULL,
	[master_oid] [varchar](100) NULL
) ON [PRIMARY]
GO

-------------------------------------------------------------------------------------------

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_ovara_valintarekisteri_jonosija]') AND type in (N'U'))
DROP TABLE [sa].[sa_ovara_valintarekisteri_jonosija]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_ovara_valintarekisteri_jonosija](
	[jonosija_id] [varchar](100) NULL,
	[hakemus_hakukohde_valintatapa_id] [varchar](100) NULL,
	[hakutoive_id] [varchar](100) NULL,
	[hakemus_oid] [varchar](100) NULL,
	[hakukohde_oid] [varchar](100) NULL,
	[valintatapajono_oid] [varchar](100) NULL,
	[hyvaksytty_harkinnanvaraisesti] [int] NULL,
	[jonosija] [int] NULL,
	[varasijan_numero] [int] NULL,
	[onko_muuttunut_viime_sijoittelussa] [int] NULL,
	[prioriteetti] [int] NULL,
	[pisteet] [float] NULL,
	[siirtynyt_toisesta_valintatapajonosta] [int] NULL,
	[sijoitteluajo_id] [bigint] NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](255) NULL,
	[source] [varchar](255) NULL
) ON [PRIMARY]
GO

-------------------------------------------------------------------------------------------

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_ovara_valintarekisteri_valinnantulos]') AND type in (N'U'))
DROP TABLE [sa].[sa_ovara_valintarekisteri_valinnantulos]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_ovara_valintarekisteri_valinnantulos](
	[valinnantulos_id] [varchar](100) NULL,
	[hakutoive_id] [varchar](100) NULL,
	[hakemus_hakukohde_valintatapa_id] [varchar](100) NULL,
	[hakukohde_oid] [varchar](100) NULL,
	[valintatapajono_oid] [varchar](100) NULL,
	[hakemus_oid] [varchar](100) NULL,
	[henkilo_oid] [varchar](100) NULL,
	[valinnan_tila] [varchar](100) NULL,
	[ehdollisesti_hyvaksyttavissa] [int] NULL,
	[ehdollisen_hyvaksymisen_ehto] [varchar](4000) NULL,
	[valinnantilan_kuvauksen_teksti] [varchar](max) NULL,
	[julkaistavissa] [int] NULL,
	[hyvaksyperuuntunut] [int] NULL,
	[valintatiedon_pvm] [datetime] NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](100) NULL,
	[source] [varchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

-------------------------------------------------------------------------------------------

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_ovara_valintarekisteri_valintatapajono]') AND type in (N'U'))
DROP TABLE [sa].[sa_ovara_valintarekisteri_valintatapajono]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_ovara_valintarekisteri_valintatapajono](
	[valintatapajono_oid] [varchar](100) NULL,
	[valintatapajono_nimi] [varchar](1000) NULL,
	[hakukohde_oid] [varchar](100) NULL,
	[alinhyvaksyttypistemaara] [float] NULL,
	[alkuperaisetaloituspaikat] [int] NULL,
	[aloituspaikat] [int] NULL,
	[eivarasijatayttoa] [int] NULL,
	[hakeneet] [int] NULL,
	[kaikkiehdontayttavathyvaksytaan] [int] NULL,
	[poissaolevataytto] [int] NULL,
	[prioriteetti] [int] NULL,
	[sijoiteltuilmanvarasijasaantojaniidenollessavoimassa] [int] NULL,
	[tasasijasaanto] [varchar](100) NULL,
	[valintaesityshyvaksytty] [int] NULL,
	[varasijantayttopaivat] [int] NULL,
	[varasijat] [int] NULL,
	[varasijojakaytetaanasti] [datetime] NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](100) NULL,
	[source] [varchar](100) NULL
) ON [PRIMARY]
GO

-------------------------------------------------------------------------------------------

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_ovara_valintarekisteri_vastaanotto]') AND type in (N'U'))
DROP TABLE [sa].[sa_ovara_valintarekisteri_vastaanotto]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_ovara_valintarekisteri_vastaanotto](
	[hakukohde_henkilo_id] [varchar](100) NULL,
	[hakukohde_oid] [varchar](100) NULL,
	[henkilo_oid] [varchar](100) NULL,
	[ilmoittaja] [varchar](100) NULL,
	[selite] [varchar](4000) NULL,
	[operaatio] [varchar](100) NULL,
	[id] [int] NULL,
	[muokattu] [datetime] NULL,
	[poistettu_aikaleima] [datetime] NULL,
	[poistaja] [varchar](100) NULL,
	[selite_poisto] [varchar](1000) NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](100) NULL,
	[source] [varchar](100) NULL,
	[master_oid] [varchar](100) NULL
) ON [PRIMARY]
GO

-------------------------------------------------------------------------------------------

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_ovara_yo_arvosanat]') AND type in (N'U'))
DROP TABLE [sa].[sa_ovara_yo_arvosanat]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_ovara_yo_arvosanat](
	[master_oid] [nvarchar](255) NULL,
	[valmistumispaivamaara] [date] NULL,
	[arvosana_id] [nvarchar](255) NULL,
	[arvosana] [nvarchar](255) NULL,
	[arvosana_asteikko] [int] NULL,
	[pisteet] [int] NULL,
	[aine] [nvarchar](255) NULL,
	[koetunnus] [nvarchar](255) NULL,
	[lisatieto] [nvarchar](255) NULL,
	[valinnainen] [int] NULL,
	[myonnetty] [date] NULL,
	[loadtime] [datetime] NOT NULL
) ON [PRIMARY]
GO

-------------------------------------------------------------------------------------------
