USE [AnteroAPI]
GO
/****** Object:  Table [api].[amm_rahoitus_opiskelijavuodet]    Script Date: 23.9.2022 16:15:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[api].[amm_rahoitus_opiskelijavuodet]') AND type in (N'U'))
BEGIN
CREATE TABLE [api].[amm_rahoitus_opiskelijavuodet](
	[defaultorder] [bigint] NOT NULL,
	[tilastovuosi] [int] NOT NULL,
	[tilastokuukausi] [int] NOT NULL,
	[sukupuoli] [nvarchar](100) NOT NULL,
	[aidinkieli] [nvarchar](100) NOT NULL,
	[ika] [nvarchar](100) NOT NULL,
	[tutkinto] [nvarchar](200) NOT NULL,
	[osaamisala] [nvarchar](200) NOT NULL,
	[suorituksen_tyyppi] [varchar](255) NOT NULL,
	[suorituskieli] [nvarchar](100) NOT NULL,
	[kustannusryhma] [nvarchar](100) NOT NULL,
	[rahoitusmuoto] [nvarchar](100) NOT NULL,
	[erityisopetus] [varchar](100) NOT NULL,
	[majoitus] [varchar](100) NOT NULL,
	[oppivelvollisuus] [varchar](20) NOT NULL,
	[osa_aikaisuus_kylla_ei] [bit] NOT NULL,
	[oppisopimuskoulutus_kylla_ei] [bit] NOT NULL,
	[vankilaopetus_kylla_ei] [bit] NOT NULL,
	[henkilostokoulutus_kylla_ei] [bit] NOT NULL,
	[tyovoimakoulutus_kylla_ei] [bit] NOT NULL,
	[hankintakoulutus_kylla_ei] [bit] NOT NULL,
	[koulutuksen_jarjestaja] [nvarchar](500) NOT NULL,
	[koulutuksen_jarjestajan_kunta] [nvarchar](200) NOT NULL,
	[hankintakoulutuksen_jarjestaja] [nvarchar](500) NOT NULL,
	[hankintakoulutuksen_jarjestajan_kunta] [nvarchar](200) NOT NULL,
	[oppilaitos] [nvarchar](500) NOT NULL,
	[oppilaitoksen_kunta] [nvarchar](200) NOT NULL,
	[toimipiste] [nvarchar](500) NOT NULL,
	[hyvaksytyt_hylatyt_opiskelijavuodet] [nvarchar](100) NOT NULL,
	[luvaton_koulutus] [varchar](255) NOT NULL,
	[luvaton_majoitus] [varchar](255) NOT NULL,
	[luvaton_korotustekija] [varchar](255) NOT NULL,
	[luvanmukainen_suorituskieli] [varchar](33) NOT NULL,
	[koodit_koulutuksen_jarjestaja] [varchar](20) NOT NULL,
	[koodit_koulutuksen_jarjestajan_kunta] [varchar](3) NOT NULL,
	[koodit_hankintakoulutuksen_jarjestaja] [varchar](20) NOT NULL,
	[koodit_hankintakoulutuksen_jarjestajan_kunta] [varchar](3) NOT NULL,
	[koodit_oppilaitos] [varchar](20) NOT NULL,
	[koodit_oppilaitoksen_kunta] [varchar](3) NOT NULL,
	[koodit_tutkinto] [varchar](6) NOT NULL,
	[koodit_osaamisala] [nvarchar](5) NOT NULL,
	[opiskelijavuoden_tyyppi] [varchar](255) NOT NULL,
	[opiskelijavuodet_painottamaton] [decimal](20, 10) NOT NULL,
	[opiskelijavuodet_painotettu] [decimal](20, 10) NOT NULL,
 CONSTRAINT [PK_amos_opiskelijavuodet] PRIMARY KEY CLUSTERED 
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[api_amm_rahoitus_opiskelijavuodet]    Script Date: 23.9.2022 16:15:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[api_amm_rahoitus_opiskelijavuodet]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[api_amm_rahoitus_opiskelijavuodet](
	[defaultorder] [bigint] NOT NULL,
	[tilastovuosi] [int] NOT NULL,
	[tilastokuukausi] [int] NOT NULL,
	[sukupuoli] [nvarchar](100) NOT NULL,
	[aidinkieli] [nvarchar](100) NOT NULL,
	[ika] [nvarchar](100) NOT NULL,
	[tutkinto] [nvarchar](200) NOT NULL,
	[koodit_tutkinto] [varchar](6) NOT NULL,
	[osaamisala] [nvarchar](200) NOT NULL,
	[koodit_osaamisala] [nvarchar](5) NOT NULL,
	[suorituksen_tyyppi] [varchar](255) NOT NULL,
	[suorituskieli] [nvarchar](100) NOT NULL,
	[kustannusryhma] [nvarchar](100) NOT NULL,
	[rahoitusmuoto] [nvarchar](100) NOT NULL,
	[erityisopetus] [varchar](100) NOT NULL,
	[majoitus] [varchar](100) NOT NULL,
	[oppivelvollisuus] [varchar](20) NOT NULL,
	[osa_aikaisuus_kylla_ei] [bit] NOT NULL,
	[oppisopimuskoulutus_kylla_ei] [bit] NOT NULL,
	[vankilaopetus_kylla_ei] [bit] NOT NULL,
	[henkilostokoulutus_kylla_ei] [bit] NOT NULL,
	[tyovoimakoulutus_kylla_ei] [bit] NOT NULL,
	[hankintakoulutus_kylla_ei] [bit] NOT NULL,
	[koulutuksen_jarjestaja] [nvarchar](500) NOT NULL,
	[koodit_koulutuksen_jarjestaja] [varchar](20) NOT NULL,
	[koulutuksen_jarjestajan_kunta] [nvarchar](200) NOT NULL,
	[koodit_koulutuksen_jarjestajan_kunta] [varchar](3) NOT NULL,
	[hankintakoulutuksen_jarjestaja] [nvarchar](500) NOT NULL,
	[koodit_hankintakoulutuksen_jarjestaja] [varchar](20) NOT NULL,
	[hankintakoulutuksen_jarjestajan_kunta] [nvarchar](200) NOT NULL,
	[koodit_hankintakoulutuksen_jarjestajan_kunta] [varchar](3) NOT NULL,
	[oppilaitos] [nvarchar](500) NOT NULL,
	[koodit_oppilaitos] [varchar](20) NOT NULL,
	[oppilaitoksen_kunta] [nvarchar](200) NOT NULL,
	[koodit_oppilaitoksen_kunta] [varchar](3) NOT NULL,
	[toimipiste] [nvarchar](500) NOT NULL,
	[hyvaksytyt_hylatyt_opiskelijavuodet] [nvarchar](100) NOT NULL,
	[luvaton_koulutus] [varchar](255) NOT NULL,
	[luvaton_majoitus] [varchar](255) NOT NULL,
	[luvaton_korotustekija] [varchar](255) NOT NULL,
	[luvanmukainen_suorituskieli] [varchar](33) NOT NULL,
	[opiskelijavuoden_tyyppi] [varchar](255) NOT NULL,
	[opiskelijavuodet_painottamaton] [decimal](20, 10) NOT NULL,
	[opiskelijavuodet_painotettu] [decimal](20, 10) NOT NULL
) ON [PRIMARY]
END

GO

USE ANTERO