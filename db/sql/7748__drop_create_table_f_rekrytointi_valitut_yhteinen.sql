USE [ANTERO]
GO

/****** Object:  Table [dw].[f_rekrytointi_valitut_yhteinen]    Script Date: 24.5.2023 16:13:03 ******/
DROP TABLE [dw].[f_rekrytointi_valitut_yhteinen]
GO

/****** Object:  Table [dw].[f_rekrytointi_valitut_yhteinen]    Script Date: 24.5.2023 16:13:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_rekrytointi_valitut_yhteinen](
	[Tilastovuosi] [nvarchar](5) NULL,
	[d_korkeakoulu_id] [bigint] NULL,
	[hakunumero] [nvarchar](100) NULL,
	[henkilonumero] [nvarchar](20) NULL,
	[sopimusnumero] [nvarchar](100) NULL,
	[d_nimitystapa_id] [int] NULL,
	[d_tehtavaryhma_id] [int] NULL,
	[d_arvo_kysymys_id] [int] NULL,
	[d_arvo_vastaus_id] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_kansalaisuus_id] [int] NULL,
	[d_aidinkieli_id] [bigint] NULL,
	[d_tieteenala_id] [int] NULL,
	[d_amk_tehtavajaottelu_id] [int] NULL,
	[d_yo_tehtavajaottelu_id] [int] NULL,
	[d_paatoimiset_opettajat_id] [int] NULL,
	[d_amk_toimipaikka_id] [int] NULL,
	[d_yo_toimipaikka_id] [int] NULL,
	[d_amk_merkittavimmän_tutkinnon_taso_id] [int] NULL,
	[d_tutkinnon_suoritusmaa_amk_id] [int] NULL,
	[Tohtorintutkinnon suoritusvuosi] [varchar](4000) NULL,
	[d_tohtorintutkinnon_yliopisto_id] [bigint] NULL,
	[d_tohtorintutkinnon_suoritusmaa_id] [int] NULL,
	[d_tohtorintutkinnon_koulutusluokitus_id] [int] NULL,
	[d_ylemman_kk_tutkinnon_koulutusluokitus_id] [int] NULL,
	[d_ylemman_kk_tutkinnon_organisaatioluokitus_id] [int] NULL,
	[Ylemmän korkeakoulututkinnon suoritusvuosi] [varchar](4000) NULL,
	[d_kelpoisuus_tutkinto_id] [int] NULL,
	[d_kelpoisuus_tyokokemus_id] [int] NULL,
	[d_kelpoisuus_opettajankoulutus_id] [int] NULL,
	[d_alayksikko_id] [int] NULL,
	[sop_alk_pvm] [datetime] NULL,
	[sop_lop_pvm] [datetime] NULL,
	[d_ika_id] [bigint] NULL,
	[d_kansainvalinen_haku_id] [nvarchar](5) NULL,
	[d_kutsuhaku_id] [varchar](4000) NULL,
	[d_yhteisprofessuuri_id] [nvarchar](5) NULL,
	[d_merkittavin_tutkinto_id] [int] NULL,
	[d_tutkijanuravaihe_id] [int] NULL,
	[d_henkilostoryhma_id] [int] NULL,
	[d_harjoittelukoulujen_henkilostoryhma_id] [int] NULL,
	[d_nimike_id] [int] NULL,
	[tunnus_sektori] [varchar](3) NOT NULL,
	[loadtime] [datetime] NULL,
	[source] [nvarchar](100) NULL,
	[username] [nvarchar](30) NULL
) ON [PRIMARY]

GO

USE [ANTERO]