USE [ANTERO]
GO

/****** Object:  Table [dw].[f_haku_ja_valinta_hakeneet_toinen_aste]    Script Date: 4.2.2026 9.35.07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_haku_ja_valinta_hakeneet_toinen_aste]') AND type in (N'U'))
DROP TABLE [dw].[f_haku_ja_valinta_hakeneet_toinen_aste]
GO

/****** Object:  Table [dw].[f_haku_ja_valinta_hakeneet_toinen_aste]    Script Date: 4.2.2026 9.35.07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_haku_ja_valinta_hakeneet_toinen_aste](
	[master_oid] [varchar](100) NULL,
	[hakemus_oid] [varchar](100) NULL,
	[sa_haku_ja_valinta_vuosikello_toinen_aste_id] [int] NULL,
	[koulutuksen_alkamisvuosi] [int] NULL,
	[d_kausi_koulutuksen_alkamiskausi_id] [int] NULL,
	[d_haku_id] [int] NULL,
	[d_hakukohde_id] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_kieli_aidinkieli_id] [bigint] NULL,
	[d_ika_id] [bigint] NULL,
	[d_alueluokitus_kotikunta_id] [int] NULL,
	[d_maatjavaltiot_kansalaisuus_id] [int] NULL,
	[d_organisaatioluokitus_lahtokoulu_koulutuksen_jarjestaja_id] [bigint] NULL,
	[d_organisaatioluokitus_lahtokoulu_oppilaitos_id] [bigint] NULL,
	[d_alueluokitus_lahtokoulun_kunta_id] [int] NULL,
	[paattoluokka] [varchar](100) NULL,
	[d_organisaatioluokitus_koulutuksen_jarjestaja_id] [bigint] NULL,
	[d_organisaatioluokitus_oppilaitos_id] [bigint] NULL,
	[d_organisaatioluokitus_toimipiste_id] [bigint] NULL,
	[d_alueluokitus_hakukohde_id] [int] NULL,
	[d_koulutusluokitus_hakukohde_id] [int] NULL,
	[d_koulutustyyppi_id] [int] NULL,
	[d_pohjakoulutusvaatimus_toinen_aste_id] [int] NULL,
	[d_oppilaitoksenopetuskieli_id] [int] NULL,
	[d_pohjakoulutus_id] [int] NULL,
	[pohjakoulutuksen_vuosi] [int] NULL,
	[d_kytkin_kiinnostunut_oppisopimuksesta_id] [int] NULL,
	[hakutoive] [int] NULL,
	[valittu] [int] NULL,
	[vastaanottanut_paikan] [int] NULL,
	[ilmoittautunut] [int] NULL,
	[pisteraja] [float] NULL,
	[aloituspaikat] [int] NULL,
	[source] [varchar] (100) NULL,
	[username] [varchar] (100) NULL,
	[loadtime] [datetime] NULL
) ON [PRIMARY]