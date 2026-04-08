USE [ANTERO]
GO

/****** Object:  Table [dw].[f_yo_henkilon_tyo]    Script Date: 8.4.2026 12.57.15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_yo_henkilon_tyo]') AND type in (N'U'))
DROP TABLE [dw].[f_yo_henkilon_tyo]
GO

/****** Object:  Table [dw].[f_yo_henkilon_tyo]    Script Date: 8.4.2026 12.57.15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

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
	[sopimus_alkupvm] [datetime] NULL,
	[sopimus_loppupvm] [datetime] NULL,
	[suorittanut_pedagogiset_opinnot] [int] NULL,
	[pedagogisten_opintojen_vuosi] [int] NULL,
	[d_virta_patevyydet_pedagogiset_opinnot_id] [int] NULL,
	[d_organisaatioluokitus_pedagogiset_opinnot_id] [int] NULL,
	[suorittanut_tohtorintutkinnon] [int] NULL,
	[tohtorintutkinto_vuosi] [int] NULL,
	[d_koulutusluokitus_tohtorintutkinto_id] [int] NULL,
	[d_organisaatioluokitus_tohtorintutkinto_id] [int] NULL,
	[tohtorintutkinnon_lahde] [varchar](30) NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__f_yo_henkilon_tyo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dw].[f_yo_henkilon_tyo] ADD  CONSTRAINT [DF_f_yo_henkilon_tyo_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_yo_henkilon_tyo] ADD  CONSTRAINT [DF_f_yo_henkilon_tyo_username]  DEFAULT (suser_sname()) FOR [username]