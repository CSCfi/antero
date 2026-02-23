USE [AnteroAPI]
GO

DROP TABLE IF EXISTS [dw].[api_amm_rahoitus_palautteet]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[api_amm_rahoitus_palautteet](
	[defaultorder] [bigint] NULL,
	[koulutuksen_jarjestaja] [nvarchar](255) NULL,
	[oppilaitos] [nvarchar](500) NULL,
	[toimipiste] [nvarchar](500) NULL,
	[varainhoitovuosi] [int] NULL,
	[rahoituskausi] [nvarchar](50) NULL,
	[tilastovuosi] [int] NULL,
	[tilastokuukausi] [int] NULL,
	[kysely] [nvarchar](500) NULL,
	[kyselyn_kohderyhma] [nvarchar](500) NULL,
	[tutkinto] [nvarchar](200) NULL,
	[huomioidaan_rahoituksessa_kylla_ei] [bit] NULL,
	[jarjestajarakenne_viimeisin_suoritepaatos_kylla_ei] [bit] NULL,
	[toiminnanohjauksen_kokeilu_kylla_ei] [bit] NULL,
	[koodit_koulutuksen_jarjestajan_pilke_alue_kokeilu] [nvarchar](1) NULL,
	[koodit_koulutuksen_jarjestaja] [varchar](20) NULL,
	[koodit_oppilaitos] [varchar](20) NULL,
	[koodit_toimipiste_oid] [varchar](200) NULL,
	[koodit_tutkinto] [varchar](6) NULL,
	[kyselyn_kohteet_lkm] [float] NULL,
	[vastanneet_lkm] [float] NULL,
	[pisteet_lkm] [decimal](12, 4) NULL,
	[painotetut_pisteet_lkm] [decimal](28, 18) NULL,
	[kyselyn_rahoitusosuus] [decimal](30, 29) NULL
) ON [PRIMARY]
GO
