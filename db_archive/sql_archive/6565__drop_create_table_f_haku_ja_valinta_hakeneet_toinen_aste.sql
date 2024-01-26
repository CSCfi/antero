USE [ANTERO]
GO

/****** Object:  Table [dw].[f_haku_ja_valinta_hakeneet_toinen_aste]    Script Date: 12.10.2022 15:08:34 ******/
DROP TABLE [dw].[f_haku_ja_valinta_hakeneet_toinen_aste]
GO

/****** Object:  Table [dw].[f_haku_ja_valinta_hakeneet_toinen_aste]    Script Date: 12.10.2022 15:08:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_haku_ja_valinta_hakeneet_toinen_aste](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[henkilo_oid] [varchar](255) NULL,
	[hakemus_oid] [varchar](255) NULL,
	[sa_haku_ja_valinta_vuosikello_toinen_aste_id] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_kieli_aidinkieli_id] [int] NULL,
	[d_ika_id] [int] NULL,
	[d_alueluokitus_kotipaikka_id] [int] NULL,
	[d_maatjavaltiot_kansalaisuus_id] [int] NULL,
	[d_organisaatio_lahtokoulu_koulutuksen_jarjestaja_id] [int] NULL,
	[d_organisaatio_lahtokoulu_oppilaitos_id] [int] NULL,
	[d_alueluokitus_lahtokoulun_kunta_id] [int] NULL,
	[paattoluokka] [varchar](255) NULL,
	[pohjakoulutuksen_paattovuosi] [nvarchar](20) NULL,
	[d_pohjakoulutus_id] [int] NULL,
	[d_kytkin_kiinnostunut_oppisopimuksesta_id] [int] NULL,
	[d_kytkin_ammatillinen_perustutkinto_erityisopetuksena_id] [int] NULL,
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
	[username] [varchar](50) NULL,
	[alin_laskettu_valintapistemaara] [decimal](18, 0) NULL,
 CONSTRAINT [PK__f_haku_ja_valinta_hakeneet_toinen_aste] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


USE [ANTERO]