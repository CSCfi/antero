USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_odw_hakeneet_valijoin]    Script Date: 27.9.2021 21:45:22 ******/
DROP TABLE IF EXISTS [sa].[sa_odw_hakeneet_valijoin]
GO

/****** Object:  Table [sa].[sa_odw_hakeneet_valijoin]    Script Date: 27.9.2021 21:45:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_odw_hakeneet_valijoin](
	[HakemusOid] [varchar](255) NULL,
	[d_hakukohde_ensisijainen_id] [int] NULL,
	[d_koulutus_ensisijainen_hakukohde_id] [int] NULL,
	[d_organisaatioluokitus_ensisijainen_hakukohde_id] [bigint] NULL,
	[d_tutkinnon_aloitussykli_ensisijainen_hakukohde_id] [int] NULL,
	[d_hakukohde_toinen_hakukohde_id] [int] NULL,
	[d_koulutus_toinen_hakukohde_id] [int] NULL,
	[d_organisaatioluokitus_toinen_hakukohde_id] [bigint] NULL,
	[d_tutkinnon_aloitussykli_toinen_hakukohde_id] [int] NULL,
	[d_hakukohde_kolmas_hakukohde_id] [int] NULL,
	[d_koulutus_kolmas_hakukohde_id] [int] NULL,
	[d_organisaatioluokitus_kolmas_hakukohde_id] [bigint] NULL,
	[d_tutkinnon_aloitussykli_kolmas_hakukohde_id] [int] NULL,
	[d_hakukohde_neljas_hakukohde_id] [int] NULL,
	[d_koulutus_neljas_hakukohde__id] [int] NULL,
	[d_organisaatioluokitus_neljas_hakukohde_id] [bigint] NULL,
	[d_tutkinnon_aloitussykli_neljas_hakukohde_id] [int] NULL,
	[d_hakukohde_viides_hakukohde_id] [int] NULL,
	[d_koulutus_viides_hakukohde_id] [int] NULL,
	[d_organisaatioluokitus_viides_hakukohde_id] [bigint] NULL,
	[d_tutkinnon_aloitussykli_viides_hakukohde_id] [int] NULL,
	[d_hakukohde_kuudes_hakukohde_id] [int] NULL,
	[d_koulutus_kuudes_hakukohde_id] [int] NULL,
	[d_organisaatioluokitus_kuudes_hakukohde_id] [bigint] NULL,
	[d_tutkinnon_aloitussykli_kuudes_hakukohde_id] [int] NULL
) ON [PRIMARY]

GO


