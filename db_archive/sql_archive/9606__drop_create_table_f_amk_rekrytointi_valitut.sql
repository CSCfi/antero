USE [ANTERO]
GO

DROP TABLE [dw].[f_amk_rekrytointi_valitut]
GO

/****** Object:  Table [dw].[f_amk_rekrytointi_valitut]    Script Date: 15.2.2024 9:13:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_amk_rekrytointi_valitut](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[d_amk_id] [int] NOT NULL,
	[d_ek_nimike_id] [int] NOT NULL,
	[d_amk_tehtavaryhma_id] [int] NOT NULL,
	[d_amk_tehtavanjaottelu_id] [int] NOT NULL,
	[d_nimitystapa_id] [int] NOT NULL,
	[d_amk_kelpoisuus_tutkinto_id] [int] NOT NULL,
	[d_amk_kelpoisuus_tyokokemus_id] [int] NOT NULL,
	[d_amk_kelpoisuus_opettajankoulutus_d] [int] NOT NULL,
	[d_tieteenala_id] [int] NOT NULL,
	[d_amk_paatoimiset_opettajat_id] [int] NOT NULL,
	[d_koulutusluokitus_id] [int] NOT NULL,
	[d_tutkinnon_taso_id] [int] NOT NULL,
	[d_tohtorintutkinnon_suoritusyliopisto_id] [int] NOT NULL,
	[d_tohtorintutkinnon_suoritusmaa_id] [int] NOT NULL,
	[d_korkeimman_tutkinnon_suoritusmaa_id] [int] NOT NULL,
	[d_amk_toimipisteen_toimipaikka_id] [int] NOT NULL,
	[d_organisaation_alayksikko_id] [int] NOT NULL,
	[d_sukupuoli_id] [int] NOT NULL,
	[d_kansalaisuus_id] [int] NOT NULL,
	[d_aidinkieli_id] [int] NOT NULL,
	[d_ika_id] [int] NOT NULL,
	[d_arvokysymys_id] [int] NOT NULL,
	[d_arvovastaus_id] [int] NOT NULL,
	[vuosi] [int] NULL,
	[hakunumero] [nvarchar](50) NOT NULL,
	[sopimusnumero] [nvarchar](50) NULL,
	[henkilonumero] [nvarchar](50) NOT NULL,
	[sopimus_alkupvm] [datetime] NULL,
	[sopimus_loppupvm] [datetime] NULL,
	[tohtorintutkinnon_suoritusvuosi] [nvarchar](5) NULL,
	[loadtime] [datetime] NULL,
	[source] [nvarchar](100) NULL,
	[username] [nvarchar](30) NULL,
 CONSTRAINT [PK__f_amk_rekrytointi_valitut] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[f_amk_rekrytointi_valitut] ADD  CONSTRAINT [DF_f_amk_rekrytointi_valitut_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_amk_rekrytointi_valitut] ADD  CONSTRAINT [DF_f_amk_rekrytointi_valitut_username]  DEFAULT (suser_sname()) FOR [username]
GO

USE [ANTERO]