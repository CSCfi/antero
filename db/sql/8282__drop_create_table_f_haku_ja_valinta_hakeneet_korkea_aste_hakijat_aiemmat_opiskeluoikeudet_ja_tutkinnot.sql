USE [ANTERO]
GO

/****** Object:  Table [dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_aiemmat_opiskeluoikeudet_ja_tutkinnot]    Script Date: 17.11.2023 17:12:00 ******/
DROP TABLE [dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_aiemmat_opiskeluoikeudet_ja_tutkinnot]
GO

/****** Object:  Table [dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_aiemmat_opiskeluoikeudet_ja_tutkinnot]    Script Date: 17.11.2023 17:12:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_aiemmat_opiskeluoikeudet_ja_tutkinnot](
	[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_id] [int] NOT NULL,
	[henkilo_oid] [varchar](255) NULL,
	[hakemus_oid] [varchar](255) NULL,
	[d_haku_id] [int] NULL,
	[d_hakuaika_id] [int] NULL,
	[koulutuksen_alkamisvuosi] [int] NULL,
	[d_kausi_koulutuksen_alkamiskausi_id] [int] NULL,
	[d_haku_amk_yo_id] [int] NULL,
	[ensikertainen_hakija] [int] NULL,
	[d_organisaatioluokitus_muu_korkeakoulu_id] [bigint] NULL,
	[d_koulutusluokitus_muu_tutkinto_id] [int] NULL,
	[muu_alkamispvm] [date] NULL,
	[muu_paattymispvm] [date] NULL,
	[d_organisaatioluokitus_aiempi_tutkinto_korkeakoulu_id] [bigint] NULL,
	[d_koulutusluokitus_aiempi_tutkinto_id] [int] NULL,
	[aiempi_tutkinto_suorituspvm] [date] NULL,
	[op_oikeus_tai_tutkinto] [int] NOT NULL,
	[pohjakoulutus_suomessa_priorisoitu] [int] NULL,
	[ensi_kertaa_hakeva] [int] NULL,
	[vastaanottaa_paikan_3v] [int] NULL,
	[muu_paattymispvm_prio] [date] NULL,
	[loadtime] [datetime] NOT NULL
) ON [PRIMARY]

GO

USE [ANTERO]