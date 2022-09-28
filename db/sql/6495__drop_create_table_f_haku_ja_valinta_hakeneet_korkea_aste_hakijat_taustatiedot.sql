USE [ANTERO]
GO

ALTER TABLE [dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_taustatiedot] DROP CONSTRAINT [DF__f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_taustatiedot__username]
GO

ALTER TABLE [dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_taustatiedot] DROP CONSTRAINT [DF__f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_taustatiedot__loadtime]
GO

/****** Object:  Table [dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_taustatiedot]    Script Date: 28.9.2022 10:46:47 ******/
DROP TABLE [dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_taustatiedot]
GO

/****** Object:  Table [dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_taustatiedot]    Script Date: 28.9.2022 10:46:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

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
	[ylioppilastutkinnon_suoritusvuosi] [nvarchar](30) NULL,
	[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_id] [int] NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](51) NOT NULL,
	[username] [nvarchar](128) NULL,
 CONSTRAINT [PK__f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_taustatiedot] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_taustatiedot] ADD  CONSTRAINT [DF__f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_taustatiedot__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_taustatiedot] ADD  CONSTRAINT [DF__f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_taustatiedot__username]  DEFAULT (suser_sname()) FOR [username]
GO


USE [ANTERO]