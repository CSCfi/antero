USE [ANTERO]
GO

ALTER TABLE [dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat] DROP CONSTRAINT [DF__f_haku_ja_valinta_hakeneet_korkea_aste_hakijat__username]
GO

ALTER TABLE [dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat] DROP CONSTRAINT [DF__f_haku_ja_valinta_hakeneet_korkea_aste_hakijat__loadtime]
GO

/****** Object:  Table [dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat]    Script Date: 27.9.2023 15:27:39 ******/
DROP TABLE [dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat]
GO

/****** Object:  Table [dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat]    Script Date: 27.9.2023 15:27:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[henkilo_oid] [varchar](255) NULL,
	[hakemus_oid] [varchar](255) NULL,
	[d_haku_id] [int] NULL,
	[d_hakuaika_id] [int] NULL,
	[d_hakuaika_kouta_id] [int] NULL,
	[hakuaikaId] [varchar](50) NULL,
	[koulutuksen_alkamisvuosi] [int] NULL,
	[d_kausi_koulutuksen_alkamiskausi_id] [int] NULL,
	[d_haku_amk_yo_id] [int] NULL,
	[d_koulutusluokitus_vastaanottanut_id] [int] NULL,
	[d_kytkin_valittu_ensisijaiseen_hakukohteeseen_id] [varchar](1) NULL,
	[d_kytkin_valittu_ensisijaisen_hakukohteen_koulutusalalle_id] [varchar](2) NULL,
	[ensikertainen_hakija] [varchar](24) NOT NULL,
	[pohjakoulutus_suomessa_priorisoitu] [int] NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](51) NOT NULL,
	[username] [nvarchar](128) NULL,
 CONSTRAINT [PK__f_haku_ja_valinta_hakeneet_korkea_aste_hakijat] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat] ADD  CONSTRAINT [DF__f_haku_ja_valinta_hakeneet_korkea_aste_hakijat__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat] ADD  CONSTRAINT [DF__f_haku_ja_valinta_hakeneet_korkea_aste_hakijat__username]  DEFAULT (suser_sname()) FOR [username]
GO


USE [ANTERO]