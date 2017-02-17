IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='f_yo_henkilon_tyo') BEGIN

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
	[vuosi] [int] NULL,
	[syntymavuosi] [nvarchar](50) NULL,
	[henkilotyovuosi] [decimal](10, 4) NULL,
	[loadtime] [datetime] NULL,
	[source] [varchar](100) NULL,
	[username] [varchar](30) NULL,
 CONSTRAINT [PK__f_yo_hen__3213E83F35DEA67C] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
;

END

