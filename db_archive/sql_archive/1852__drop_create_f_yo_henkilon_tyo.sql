USE [ANTERO]
GO

IF EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='f_yo_henkilon_tyo')
BEGIN
	DROP TABLE [dw].[f_yo_henkilon_tyo];
END

IF  NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='[f_yo_henkilon_tyo')
BEGIN

CREATE TABLE [dw].[f_yo_henkilon_tyo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[d_yliopisto_id] [int] NULL,
	[d_toimipaikka_id] [int] NULL,
	[d_koulutusala_id] [int] NULL,
	[d_ohjauksenala_id] [int] NULL,
	[d_laitos_id] [int] NULL,
	[d_tieteenala_id] [int] NULL,
	[d_tiedekunta_id] [int] NULL,
	[d_tutkinnon_suoritusmaa_id] [int] NULL,
	[d_nimike_id] [int] NULL,
	[d_kieli_id] [int] NULL,
	[d_kansalaisuus_id] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_tutkijanuravaihe_id] [int] NULL,
	[d_henkilostoryhma_id] [int] NULL,
	[d_tehtavanjaottelu_id] [int] NULL,
	[d_harjoittelukoulujen_henkilostoryhma_id] [int] NULL,
	[d_valinta_kutsumenettelylla_id] [int] NULL,
	[d_nimitystapa_id] [int] NULL,
	[d_ika_id] [int] NULL,
	[d_tutkinnon_taso_id] [int] NULL,
	[vuosi] [int] NULL,
	[henkilotyovuosi] [decimal](10, 4) NULL,
	[sopimus_alkupvm]  [datetime]  NULL,
	[sopimus_loppupvm] [datetime]  NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__f_yo_henkilon_tyo] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

ALTER TABLE [dw].[f_yo_henkilon_tyo] ADD  CONSTRAINT [DF_f_yo_henkilon_tyo_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_yo_henkilon_tyo] ADD  CONSTRAINT [DF_f_yo_henkilon_tyo_username]  DEFAULT (suser_sname()) FOR [username]
GO
