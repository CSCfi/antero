IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_ovara_gen_valintaperuste_valintatapajono]') AND type in (N'U'))
DROP TABLE [sa].[sa_ovara_gen_valintaperuste_valintatapajono]
GO

/****** Object:  Table [sa].[sa_ovara_gen_valintaperuste_valintatapajono]    Script Date: 2.6.2026 8.53.43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_ovara_gen_valintaperuste_valintatapajono](
    [valintatapajono_id] [varchar](100) NULL,
    [valintatapajono_nimi] [varchar](500) NULL,
    [valintatapajono_tyyppi] [varchar](100) NULL,
    [valinnanvaihe_id] [varchar](100) NULL,
    [hakukohde_oid] [varchar](100) NULL,
    [muokattu] [datetime] NULL,
    [prioriteetti] [int] NULL,
    [aloituspaikat] [int] NULL,
    [tasasijasaanto] [varchar](100) NULL,
    [valisijoittelu] [bit] NULL,
    [merkitse_myoh_auto] [bit] NULL,
    [ei_varasijatayttoa] [bit] NULL,
    [poissaoleva_taytto] [bit] NULL,
    [jarjestyskriteerit] [varchar](max) NULL,
    [poistetaanko_hylatyt] [bit] NULL,
    [valmis_sijoiteltavaksi] [bit] NULL,
    [siirretaan_sijoitteluun] [bit] NULL,
    [kaytetaan_valintalaskentaa] [bit] NULL,
    [kaikki_ehdon_tayttyvat_hyvaksytaan] [bit] NULL,
    [loadtime] [datetime] NULL,
    [username] [varchar](100) NULL,
    [source] [varchar](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_ovara_gen_valintarekisteri_valintatapajono]') AND type in (N'U'))
DROP TABLE [sa].[sa_ovara_gen_valintarekisteri_valintatapajono]
GO

/****** Object:  Table [sa].[sa_ovara_gen_valintarekisteri_valintatapajono]    Script Date: 2.6.2026 8.56.13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_ovara_gen_valintarekisteri_valintatapajono](
    [valintatapajono_id] [varchar](100) NULL,
    [valintatapajono_nimi] [varchar](500) NULL,
    [hakukohde_oid] [varchar](100) NULL,
    [alin_hyvaksytty_pistemaara] [varchar](100) NULL,
    [alkuperaiset_aloituspaikat] [int] NULL,
    [aloituspaikat] [int] NULL,
    [ei_varasijatayttoa] [bit] NULL,
    [hakeneet] [int] NULL,
    [kaikki_ehdon_tayttavat_hyvaksytaan] [bit] NULL,
    [poissaoleva_taytto] [bit] NULL,
    [prioriteetti] [int] NULL,
    [sijoiteltu_ilman_varasijasaanto_ja_niidenollessa_voimassa] [bit] NULL,
    [tasasijasaanto] [varchar](100) NULL,
    [valintaesitys_hyvaksytty] [bit] NULL,
    [varasijan_tayttopaivat] [int] NULL,
    [varasijat] [int] NULL,
    [varasijoja_kaytetaan_asti] [datetime] NULL,
    [loadtime] [datetime] NULL,
    [username] [varchar](100) NULL,
    [source] [varchar](100) NULL
) ON [PRIMARY]
GO


