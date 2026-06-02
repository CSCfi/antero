USE ANTERO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_ovara_gen_valintarekisteri_valintatapajono]') AND type in (N'U'))
DROP TABLE [sa].[sa_ovara_gen_valintarekisteri_valintatapajono]
GO


CREATE TABLE [sa].[sa_ovara_gen_valintarekisteri_valintatapajono](
    [valintatapajono_id] [varchar](100) NULL,
    [valintatapajono_nimi] [varchar](500) NULL,
    [hakukohde_oid] [varchar](100) NULL,
    [alin_hyvaksytty_pistemaara] float NULL,
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


