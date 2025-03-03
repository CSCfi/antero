--
--  drop and then create table f_yo_rekrytointi_valitut
--
USE [ANTERO]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='f_yo_rekrytointi_valitut')
BEGIN
DROP TABLE [dw].[f_yo_rekrytointi_valitut]
END
GO
IF NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='f_yo_rekrytointi_valitut')

BEGIN
CREATE TABLE [dw].[f_yo_rekrytointi_valitut]
 (
	[id] [int] IDENTITY(1,1) NOT NULL,
	[vuosi] [int] NULL,
	[d_yliopisto_id] [int] NOT NULL,
	[d_ek_nimike_id] [int] NULL,
	--[d_tutkijanporras_id] [int] NULL, -- sama kuin tutkijanuravaihe
	[d_yo_nimitystapa_id] [int] NULL,
	[d_tohtorintutkinnon_suoritusmaa_id] [int] NULL,
	[d_tohtorintutkinnon_yliopisto_id] [int] NULL,
	[tohtorintutkinnon_suoritusvuosi] [int] NULL,
	[d_kansalaisuus_id] [int] NULL,
	[d_sukupuoli_id]   [int] NULL,
	[d_aidinkieli_id] [int] NULL,
	[d_organisaation_alayksikko_id] [int] NULL,
	[d_yo_toimipisteen_toimipaikka_id][int] NULL,
	[d_tieteenala_id] [int] NULL,
	[d_yo_tutkijanuravaihe_id] [int] NULL,
	[d_yo_henkilostoryhma_id] [int] NULL,
	[d_yo_harjoittelukoulujen_henkilostoryhma_id] [int] NULL,
	[d_yo_tehtavajaottelu_id] [int] NULL,
	[d_arvokysymys_id] [int] NULL,
	[d_arvovastaus_id] [int] NULL,
	[d_ika_id] [int] NULL,
	[hakunumero] [nvarchar](30) NOT NULL,
	[sopimusnumero] [nvarchar](30) NULL,
	[henkilonumero] [nvarchar](30) NOT NULL,
	[sopimus_alkupvm] [datetime] NULL,
	[sopimus_loppupvm] [datetime] NULL,
	[loadtime] [datetime] NULL,
	[source] [nvarchar](100) NULL,
	[username] [nvarchar](30) NULL,
	CONSTRAINT [PK__f_yo_rekrytointi_valitut] PRIMARY KEY CLUSTERED
 	(
 	[id] ASC
 	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
 	) ON [PRIMARY]
END
GO

ALTER TABLE [dw].[f_yo_rekrytointi_valitut] ADD  CONSTRAINT [DF_f_yo_rekrytointi_valitut_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_yo_rekrytointi_valitut] ADD  CONSTRAINT [DF_f_yo_rekrytointivalitut_username]  DEFAULT (suser_sname()) FOR [username]
GO
