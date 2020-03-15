USE [ANTERO]
GO
/****** Object:  Table [dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat]    Script Date: 15.3.2020 15:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[henkilo_oid] [varchar](255) NULL,
	[hakemus_oid] [varchar](255) NULL,
	[d_haku_id] [int] NULL,
	[d_hakuaika_id] [int] NULL,
	[hakuaikaId] [varchar](50) NULL,
	[koulutuksen_alkamisvuosi] [int] NULL,
	[d_kausi_koulutuksen_alkamiskausi_id] [int] NULL,
	[d_haku_amk_yo_id] [int] NULL,
	[d_koulutusluokitus_vastaanottanut_id] [int] NULL,
	[d_kytkin_valittu_ensisijaiseen_hakukohteeseen_id] [varchar](1) NULL,
	[d_kytkin_valittu_ensisijaisen_hakukohteen_koulutusalalle_id] [varchar](2) NULL,
	[ensikertainen_hakija] [varchar](24) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](51) NOT NULL,
	[username] [nvarchar](128) NULL,
 CONSTRAINT [PK__f_haku_ja_valinta_hakeneet_korkea_aste_hakijat] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_aiemmat_opiskeluoikeudet_ja_tutkinnot]    Script Date: 15.3.2020 15:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_aiemmat_opiskeluoikeudet_ja_tutkinnot]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_aiemmat_opiskeluoikeudet_ja_tutkinnot](
	[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_id] [int] NOT NULL,
	[henkilo_oid] [varchar](255) NULL,
	[hakemus_oid] [varchar](255) NULL,
	[d_haku_id] [int] NULL,
	[d_hakuaika_id] [int] NULL,
	[koulutuksen_alkamisvuosi] [int] NULL,
	[d_kausi_koulutuksen_alkamiskausi_id] [int] NULL,
	[d_haku_amk_yo_id] [int] NULL,
	[ensikertainen_hakija] [varchar](24) NOT NULL,
	[d_organisaatioluokitus_muu_korkeakoulu_id] [bigint] NULL,
	[d_koulutusluokitus_muu_tutkinto_id] [int] NULL,
	[muu_alkamispvm] [date] NULL,
	[muu_paattymispvm] [date] NULL,
	[d_organisaatioluokitus_aiempi_tutkinto_korkeakoulu_id] [bigint] NULL,
	[d_koulutusluokitus_aiempi_tutkinto_id] [int] NULL,
	[aiempi_tutkinto_suorituspvm] [date] NULL,
	[op_oikeus_tai_tutkinto] [int] NOT NULL,
	[loadtime] [datetime] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_taustatiedot]    Script Date: 15.3.2020 15:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_taustatiedot]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_taustatiedot](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[henkilo_oid] [varchar](255) NULL,
	[hakemus_oid] [varchar](255) NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_kieli_aidinkieli_id] [bigint] NULL,
	[d_ika_id] [bigint] NULL,
	[d_alueluokitus_kotipaikka_id] [int] NULL,
	[d_maatjavaltiot_kansalaisuus_id] [int] NULL,
	[d_pohjakoulutuskk_id] [int] NULL,
	[d_kytkin_pohjakoulutuskk_ulkomaat_id] [int] NULL,
	[toisen_asteen_koulutuksen_suoritusvuosi] [varchar](255) NULL,
	[pohjakoulutuksen_paattovuosi] [nvarchar](30) NULL,
	[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_id] [int] NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](51) NOT NULL,
	[username] [nvarchar](128) NULL,
 CONSTRAINT [PK__f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_taustatiedot] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakutoiveet]    Script Date: 15.3.2020 15:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakutoiveet]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakutoiveet](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[henkilo_oid] [varchar](255) NULL,
	[hakemus_oid] [varchar](255) NULL,
	[hakutoive] [int] NULL,
	[d_hakukohde_id] [int] NULL,
	[d_organisaatio_koulutuksen_jarjestaja_id] [int] NULL,
	[d_organisaatio_oppilaitos_id] [int] NULL,
	[d_organisaatio_toimipiste_id] [int] NULL,
	[d_alueluokitus_hakukohde_id] [int] NULL,
	[d_koulutusluokitus_hakukohde_id] [int] NULL,
	[d_kieli_koulutus_id] [int] NULL,
	[d_opintojen_laajuus_id] [int] NULL,
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
	[d_tutkinnon_aloitussykli_kk_id] [int] NULL,
	[d_tutkinnon_taso_kk_id] [int] NULL,
	[d_valintatapajono_id] [int] NULL,
	[valintatapajono_nimi] [varchar](250) NULL,
	[kokonaispisteet] [decimal](12, 2) NULL,
	[valinnan_tila] [varchar](255) NULL,
	[vastaanoton_tila] [varchar](255) NULL,
	[ilmoittautumisen_tila] [varchar](255) NULL,
	[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_id] [int] NULL,
	[loadtime] [datetime] NULL,
	[source] [varchar](250) NOT NULL,
	[username] [varchar](250) NULL,
 CONSTRAINT [PK__f_haku_ja_valinta_hakeneet_korkea_aste_hakutoiveet] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__f_haku_ja_valinta_hakeneet_korkea_aste_hakijat__loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat] ADD  CONSTRAINT [DF__f_haku_ja_valinta_hakeneet_korkea_aste_hakijat__loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__f_haku_ja_valinta_hakeneet_korkea_aste_hakijat__username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat] ADD  CONSTRAINT [DF__f_haku_ja_valinta_hakeneet_korkea_aste_hakijat__username]  DEFAULT (suser_sname()) FOR [username]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_taustatiedot__loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_taustatiedot] ADD  CONSTRAINT [DF__f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_taustatiedot__loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_taustatiedot__username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_taustatiedot] ADD  CONSTRAINT [DF__f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_taustatiedot__username]  DEFAULT (suser_sname()) FOR [username]
END

