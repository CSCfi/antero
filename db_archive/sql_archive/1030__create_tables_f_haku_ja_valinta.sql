USE [ANTERO]
GO
/****** Object:  Table [dw].[f_haku_ja_valinta_aloituspaikat_ja_pistemaarat]    Script Date: 7.12.2017 17:17:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_haku_ja_valinta_aloituspaikat_ja_pistemaarat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_haku_ja_valinta_aloituspaikat_ja_pistemaarat](
	[koulutuksen_alkamisvuosi] [int] NULL,
	[d_kausi_koulutuksen_alkamiskausi_id] [int] NULL,
	[d_haku_id] [int] NULL,
	[d_hakuaika_id] [int] NULL,
	[d_hakukohde_id] [int] NULL,
	[d_organisaatio_koulutuksen_jarjestaja_id] [int] NULL,
	[d_organisaatio_oppilaitos_id] [int] NULL,
	[d_organisaatio_toimipiste_id] [int] NULL,
	[d_alueluokitus_hakukohde_id] [int] NULL,
	[d_koulutusluokitus_hakukohde_id] [int] NULL,
	[d_koulutustyyppi_id] [int] NULL,
	[hakukohteen_tutkinnon_taso_kk_sykli] [nvarchar](50) NULL,
	[hakukohteen_tutkinnon_taso_kk] [nvarchar](50) NULL,
	[d_kieli_koulutus_id] [int] NULL,
	[d_opintojen_laajuus_id] [int] NULL,
	[d_pohjakoulutusvaatimus_id] [int] NULL,
	[aloituspaikat] [int] NULL,
	[valintojen_aloituspaikat] [int] NULL,
	[ensikertalaisten_aloituspaikat] [int] NULL,
	[alin_laskettuvalintapistemaara] [int] NULL,
	[loadtime] [datetime] NULL,
	[source] [varchar](59) NULL,
	[username] [varchar](50) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[f_haku_ja_valinta_hakeneet_korkea_aste]    Script Date: 7.12.2017 17:17:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_haku_ja_valinta_hakeneet_korkea_aste]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_haku_ja_valinta_hakeneet_korkea_aste](
	[henkilo_oid] [varchar](255) NULL,
	[hakemus_oid] [varchar](255) NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_kieli_aidinkieli_id] [int] NULL,
	[d_ika_id] [int] NULL,
	[d_alueluokitus_kotipaikka_id] [int] NULL,
	[d_maatjavaltiot_kansalaisuus_id] [int] NULL,
	[toisen_asteen_koulutuksen_suoritusvuosi] [nvarchar](50) NULL,
	[pohjakoulutuksen_paattovuosi] [nvarchar](50) NULL,
	[d_pohjakoulutuskk_id] [int] NULL,
	[d_maatjavaltiot_pohjakoulutuksen_maa_kk] [int] NULL,
	[ensikertainen_hakija] [nvarchar](50) NULL,
	[haku_amk_yo] [varchar](250) NULL,
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
	[hakukohteen_tutkinnon_taso_kk_sykli] [varchar](255) NULL,
	[hakukohteen_tutkinnon_taso_kk] [varchar](255) NULL,
	[d_kieli_koulutus_id] [int] NULL,
	[d_opintojen_laajuus_id] [int] NULL,
	[valinnan_tila] [varchar](255) NULL,
	[vastaanoton_tila] [varchar](255) NULL,
	[ilmoittautumisen_tila] [varchar](255) NULL,
	[d_hakukohde_ensisijainen_id] [int] NULL,
	[d_koulutus_ensisijainen_hakukohde_id] [int] NULL,
	[d_hakukohde_toinen_hakukohde_id] [int] NULL,
	[d_koulutus_toinen_hakukohde_id] [int] NULL,
	[d_hakukohde_kolmas_hakukohde_id] [int] NULL,
	[d_koulutus_kolmas_hakukohde_id] [int] NULL,
	[d_hakukohde_neljas_hakukohde_id] [int] NULL,
	[d_koulutus_neljas_hakukohde__id] [int] NULL,
	[d_hakukohde_viides_hakukohde_id] [int] NULL,
	[d_koulutus_viides_hakukohde_id] [int] NULL,
	[d_hakukohde_kuudes_hakukohde_id] [int] NULL,
	[d_koulutus_kuudes_hakukohde_id] [int] NULL,
	[loadtime] [datetime] NULL,
	[source] [varchar](250) NOT NULL,
	[username] [varchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[f_haku_ja_valinta_hakeneet_toinen_aste]    Script Date: 7.12.2017 17:17:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_haku_ja_valinta_hakeneet_toinen_aste]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_haku_ja_valinta_hakeneet_toinen_aste](
	[henkilo_oid] [varchar](255) NULL,
	[hakemus_oid] [varchar](255) NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_kieli_aidinkieli_id] [int] NULL,
	[d_ika_id] [int] NULL,
	[d_alueluokitus_kotipaikka_id] [int] NULL,
	[d_maatjavaltiot_kansalaisuus_id] [int] NULL,
	[d_organisaatio_lahtokoulu_koulutuksen_jarjestaja_id] [int] NULL,
	[d_organisaatio_lahtokoulu_oppilaitos_id] [int] NULL,
	[d_alueluokitus_lahtokoulun_kunta_id] [int] NULL,
	[paattoluokka] [varchar](255) NULL,
	[pohjakoulutuksen_paattovuosi] [nvarchar](50) NULL,
	[d_pohjakoulutus_id] [int] NULL,
	[d_kytkin_kiinnostunut_oppisopimuksesta_id] [int] NULL,
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
	[d_koulutustyyppi_id] [int] NULL,
	[d_kieli_koulutus_id] [int] NULL,
	[d_pohjakoulutusvaatimus_id] [int] NULL,
	[valinnan_tila] [varchar](255) NULL,
	[vastaanoton_tila] [varchar](255) NULL,
	[ilmoittautumisen_tila] [varchar](255) NULL,
	[loadtime] [datetime] NULL,
	[source] [varchar](239) NOT NULL,
	[username] [varchar](50) NULL
) ON [PRIMARY]
END

