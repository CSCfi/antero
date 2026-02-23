USE [AnteroAPI]
GO

DROP TABLE IF EXISTS [api].[amm_rahoitus_palautteet]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [api].[amm_rahoitus_palautteet](
	[defaultorder] [bigint] NOT NULL,
	[koulutuksen_jarjestaja] [nvarchar](255) NULL,
	[oppilaitos] [nvarchar](255) NULL,
	[toimipiste] [nvarchar](255) NULL,
	[varainhoitovuosi] [int] NOT NULL,
	[rahoituskausi] [nvarchar](50) NULL,
	[tilastovuosi] [int] NULL,
	[tilastokuukausi] [int] NULL,
	[kysely] [nvarchar](255) NULL,
	[kyselyn_kohderyhma] [nvarchar](255) NULL,
	[tutkinto] [nvarchar](255) NULL,
	[huomioidaan_rahoituksessa_kylla_ei] [bit] NULL,
	[jarjestajarakenne_viimeisin_suoritepaatos_kylla_ei] [bit] NULL,
	[toiminnanohjauksen_kokeilu_kylla_ei] [bit] NULL,
	[koodit_koulutuksen_jarjestajan_pilke_alue_kokeilu] [nvarchar](1) NULL,
	[koodit_koulutuksen_jarjestaja] [varchar](20) NULL,
	[koodit_oppilaitos] [varchar](20) NULL,
	[koodit_toimipiste_oid] [varchar](100) NULL,
	[koodit_tutkinto] [varchar](6) NULL,
	[kyselyn_kohteet_lkm] [float] NULL,
	[vastanneet_lkm] [float] NULL,
	[pisteet_lkm] [decimal](12, 4) NULL,
	[painotetut_pisteet_lkm] [decimal](28, 18) NULL,
	[kyselyn_rahoitusosuus] [decimal](30, 29) NULL,
	[tietojoukko_paivitetty_pvm] [date] NOT NULL,
	CONSTRAINT [PK__amm_rahoitus_palautteet] PRIMARY KEY CLUSTERED (
		[defaultorder] ASC
	) 
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) 
	ON [PRIMARY]
) ON [PRIMARY]
GO
