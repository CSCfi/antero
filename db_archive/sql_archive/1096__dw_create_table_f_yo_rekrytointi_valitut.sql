--
--  create table f_yo_rekrytointi_valitut
--

IF NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_SCHEMA='dw'
	AND TABLE_NAME='f_yo_rekrytointi_valitut')

BEGIN

CREATE TABLE [dw].[f_yo_rekrytointi_valitut]
 (
	[id] [int] IDENTITY(1,1) NOT NULL,
	[vuosi] [int] NULL,
	[d_yliopisto_id] [int] NULL,
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
	[hakunumero] [nvarchar](30) NULL,
	[sopimusnumero] [nvarchar](30) NULL,
	[henkilonumero] [nvarchar](30) NULL,
	[sopimus_alkupvm] [datetime] NULL,
	[sopimus_loppupvm] [datetime] NULL,
	[loadtime] [datetime] NULL,
	[source] [nvarchar](100) NULL,
	[username] [nvarchar](30) NULL
)
END
