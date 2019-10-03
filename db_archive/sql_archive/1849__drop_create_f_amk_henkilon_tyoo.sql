USE [ANTERO]
GO

IF EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='f_amk_henkilon_tyo')
BEGIN
	ALTER TABLE [dw].[f_amk_henkilon_tyo] DROP  CONSTRAINT [DF_f_amk_henkilosto_loadtime];
	ALTER TABLE [dw].[f_amk_henkilon_tyo] DROP  CONSTRAINT [DF_f_amk_henkilosto_username];
	DROP TABLE [dw].[f_amk_henkilon_tyo];
END

IF  NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='[f_amk_henkilon_tyo')
BEGIN

CREATE TABLE [dw].[f_amk_henkilon_tyo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[d_amk_id] [int] NOT NULL,
	[d_tieteenala_id] [int] NOT NULL,
	[d_ohjauksenala_id] [int] NOT NULL,
	[d_koulutusala02_id] [int] NOT NULL,
	[d_toimipaikka_id] [int] NOT NULL,
	[d_nimike_id] [int] NOT NULL,
	[d_tutkinnon_taso] [int] NOT NULL,
	[d_maa_id] [int] NOT NULL,
	[d_sukupuoli_id] [int] NOT NULL,
	[d_muun_henkiloston_henkilostoryhma_id] [int] NOT NULL,
	[d_tehtavanjaottelu] [int] NOT NULL,
	[d_nimitystapa_id] [int] NOT NULL,
	[d_kieli_id] [int] NOT NULL,
	[d_paatoimiset_opettajat] [int] NOT NULL,
	[d_ika_id] [int] NULL,
	[vuosi] [int] NOT NULL,
	[henkilotyovuosi] [decimal](10, 4) NOT NULL,
	[tyoajan_kayttotiedot_opetus] [decimal](10, 4) NOT NULL,
	[tyoajan_kayttotiedot_tki_toiminta] [decimal](10, 4) NOT NULL,
	[tyoajan_kayttotiedot_tki_hallinto] [decimal](10, 4) NOT NULL,
	[kelpoisuus_tutkinto] [int] NOT NULL,
	[kelpoisuus_tyokokemus] [int] NOT NULL,
	[kelpoisuus_opettajankoulutus] [int] NOT NULL,
	[sopimus_alkupvm]  [datetime] NOT NULL,
	[sopimus_loppupvm] [datetime] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__f_amk_henkilon_tyo] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

ALTER TABLE [dw].[f_amk_henkilon_tyo] ADD  CONSTRAINT [DF_f_amk_henkilosto_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_amk_henkilon_tyo] ADD  CONSTRAINT [DF_f_amk_henkilosto_username]  DEFAULT (suser_sname()) FOR [username]
GO
