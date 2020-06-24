USE [ANTERO]
GO

/****** Object:  Table [dw].[f_haku_ja_valinta_hakeneet_korkea_aste]    Script Date: 23.6.2020 18:32:23 ******/
DROP TABLE [dw].[f_haku_ja_valinta_hakeneet_korkea_aste]
GO

/****** Object:  Table [dw].[f_haku_ja_valinta_hakeneet_korkea_aste]    Script Date: 23.6.2020 18:32:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_haku_ja_valinta_hakeneet_korkea_aste](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[henkilo_oid] [varchar](255) NULL,
	[hakemus_oid] [varchar](255) NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_kieli_aidinkieli_id] [int] NULL,
	[d_ika_id] [int] NULL,
	[d_alueluokitus_kotipaikka_id] [int] NULL,
	[d_maatjavaltiot_kansalaisuus_id] [int] NULL,
	[toisen_asteen_koulutuksen_suoritusvuosi] [nvarchar](50) NULL,
	[ylioppilastutkinnon_suoritusvuosi] [nvarchar](50) NULL,
	[d_kausi_ylioppilastutkinto_id] [int] NULL,
	[pohjakoulutuksen_paattovuosi] [nvarchar](50) NULL,
	[d_pohjakoulutuskk_id] [int] NULL,
	[ensikertainen_hakija] [nvarchar](50) NULL,
	[koulutuksen_alkamisvuosi] [int] NULL,
	[d_kausi_koulutuksen_alkamiskausi_id] [int] NULL,
	[d_haku_id] [int] NULL,
	[d_hakuaika_id] [int] NULL,
	[d_hakukohde_id] [int] NULL,
	[hakutoive] [int] NULL,
	[d_organisaatio_koulutuksen_jarjestaja_id] [int] NULL,
	[d_organisaatio_oppilaitos_id] [int] NULL,
	[d_organisaatio_toimipiste_id] [int] NULL,
	[d_alueluokitus_hakukohde_id] [int] NULL,
	[d_koulutusluokitus_hakukohde_id] [int] NULL,
	[d_kieli_koulutus_id] [int] NULL,
	[d_opintojen_laajuus_id] [int] NULL,
	[valinnan_tila] [varchar](255) NULL,
	[vastaanoton_tila] [varchar](255) NULL,
	[ilmoittautumisen_tila] [varchar](255) NULL,
	[d_hakukohde_ensisijainen_id] [int] NULL,
	[d_koulutus_ensisijainen_hakukohde_id] [int] NULL,
	[d_organisaatioluokitus_ensisijainen_hakukohde_id] [int] NULL,
	[d_tutkinnon_aloitussykli_ensisijainen_hakukohde_id] [int] NULL,
	[d_hakukohde_toinen_hakukohde_id] [int] NULL,
	[d_koulutus_toinen_hakukohde_id] [int] NULL,
	[d_organisaatioluokitus_toinen_hakukohde_id] [int] NULL,
	[d_tutkinnon_aloitussykli_toinen_hakukohde_id] [int] NULL,
	[d_hakukohde_kolmas_hakukohde_id] [int] NULL,
	[d_koulutus_kolmas_hakukohde_id] [int] NULL,
	[d_organisaatioluokitus_kolmas_hakukohde_id] [int] NULL,
	[d_tutkinnon_aloitussykli_kolmas_hakukohde_id] [int] NULL,
	[d_hakukohde_neljas_hakukohde_id] [int] NULL,
	[d_koulutus_neljas_hakukohde__id] [int] NULL,
	[d_organisaatioluokitus_neljas_hakukohde_id] [int] NULL,
	[d_tutkinnon_aloitussykli_neljas_hakukohde_id] [int] NULL,
	[d_hakukohde_viides_hakukohde_id] [int] NULL,
	[d_koulutus_viides_hakukohde_id] [int] NULL,
	[d_organisaatioluokitus_viides_hakukohde_id] [int] NULL,
	[d_tutkinnon_aloitussykli_viides_hakukohde_id] [int] NULL,
	[d_hakukohde_kuudes_hakukohde_id] [int] NULL,
	[d_koulutus_kuudes_hakukohde_id] [int] NULL,
	[d_organisaatioluokitus_kuudes_hakukohde_id] [int] NULL,
	[d_tutkinnon_aloitussykli_kuudes_hakukohde_id] [int] NULL,
	[d_kytkin_pohjakoulutuskk_ulkomaat_id] [int] NULL,
	[d_tutkinnon_aloitussykli_kk_id] [int] NULL,
	[d_tutkinnon_taso_kk_id] [int] NULL,
	[d_haku_amk_yo_id] [int] NULL,
	[d_valintatapajono_id] [int] NULL,
	[valintatapajono_nimi] [varchar](250) NULL,
	[kokonaispisteet] [decimal](12, 2) NULL,
	[d_valittu_ensisijaiseen_kohteeseen_id] [int] NULL,
	[d_valittu_ensisijaisen_kohteen_koulutusalalle_id] [int] NULL,
	[loadtime] [datetime] NULL,
	[source] [varchar](250) NOT NULL,
	[username] [varchar](250) NULL,
 CONSTRAINT [PK__f_haku_ja_valinta_hakeneet_korkea_aste] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

