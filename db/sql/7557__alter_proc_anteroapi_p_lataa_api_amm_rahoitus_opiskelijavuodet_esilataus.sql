USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_amm_rahoitus_opiskelijavuodet_esilataus]    Script Date: 5.4.2023 9:03:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_api_amm_rahoitus_opiskelijavuodet_esilataus] AS

TRUNCATE TABLE [dw].[api_amm_rahoitus_opiskelijavuodet]

INSERT INTO [dw].[api_amm_rahoitus_opiskelijavuodet] (
	[defaultorder]
	,[tilastovuosi]
	,[tilastokuukausi]
	,[sukupuoli]
	,[aidinkieli]
	,[ika]
	,[tutkinto]
	,[koodit_tutkinto]
	,[osaamisala]
	,[koodit_osaamisala]
	,[suorituksen_tyyppi]
	,[suorituskieli]
	,[kustannusryhma]
	,[rahoitusmuoto]
	,[erityisopetus]
	,[majoitus]
	,[oppivelvollisuus]
	,[osa_aikaisuus_kylla_ei]
	,[oppisopimuskoulutus_kylla_ei]
	,[vankilaopetus_kylla_ei]
	,[henkilostokoulutus_kylla_ei]
	,[tyovoimakoulutus_kylla_ei]
	,[hankintakoulutus_kylla_ei]
	,[koulutuksen_jarjestaja]
	,[koodit_koulutuksen_jarjestaja]
	,[koulutuksen_jarjestajan_kunta]
	,[koodit_koulutuksen_jarjestajan_kunta]
	,[hankintakoulutuksen_jarjestaja]
	,[koodit_hankintakoulutuksen_jarjestaja]
	,[hankintakoulutuksen_jarjestajan_kunta]
	,[koodit_hankintakoulutuksen_jarjestajan_kunta]
	,[oppilaitos]
	,[koodit_oppilaitos]
	,[oppilaitoksen_kunta]
	,[koodit_oppilaitoksen_kunta]
	,[toimipiste]
	,[hyvaksytyt_hylatyt_opiskelijavuodet]
	,[luvaton_koulutus]
	,[luvaton_majoitus]
	,[luvaton_korotustekija]
	,[luvanmukainen_suorituskieli]
	,[opiskelijavuoden_tyyppi]
	,[opiskelijavuodet_painottamaton]
	,[opiskelijavuodet_painotettu]
)

--DROP TABLE IF EXISTS [dw].[api_amm_rahoitus_opiskelijavuodet]

SELECT

	defaultorder = row_number() over (order by Tilastovuosi, [Koodit Tilastokuukausi], [Koodit Koulutuksen järjestäjä], [Koodit Tutkinto], [Opiskelijavuoden tyyppi])

	,tilastovuosi
	,tilastokuukausi = [Koodit Tilastokuukausi]
	--
	,sukupuoli
	,aidinkieli = Äidinkieli
	,ika = ikä
	--
	,tutkinto
	,koodit_tutkinto = [Koodit Tutkinto]
	,osaamisala
	,koodit_osaamisala = [Koodit Osaamisala]
	,suorituksen_tyyppi = [Suorituksen tyyppi]
	,suorituskieli
	,kustannusryhma = Kustannusryhmä
	,rahoitusmuoto
	,REPLACE(erityisopetus, ';', ',') as erityisopetus -- CSCVIPUNEN-3110
	,majoitus
	,oppivelvollisuus
	--
	,osa_aikaisuus_kylla_ei = [Koodit Osa-aikaisuus]
	,oppisopimuskoulutus_kylla_ei = [Koodit Oppisopimuskoulutus]
	,vankilaopetus_kylla_ei = [Koodit Vankilaopetus]
	,henkilostokoulutus_kylla_ei = [Koodit Henkilöstokoulutus]
	,tyovoimakoulutus_kylla_ei = [Koodit Työvoimakoulutus]
	,hankintakoulutus_kylla_ei = [Koodit Hankintakoulutus]
	--
	,koulutuksen_jarjestaja = [Koulutuksen järjestäjä]
	,koodit_koulutuksen_jarjestaja = [Koodit Koulutuksen järjestäjä]
	,koulutuksen_jarjestajan_kunta = [Koul. järjestäjän kunta]
	,koodit_koulutuksen_jarjestajan_kunta = [Koodit Koulutuksen järjestäjän kunta]
	,hankintakoulutuksen_jarjestaja = [Hankintakoulutuksen järjestäjä]
	,koodit_hankintakoulutuksen_jarjestaja = [Koodit Hankintakoulutuksen järjestäjä]
	,hankintakoulutuksen_jarjestajan_kunta = [Hankintakoulutuksen järjestäjän kunta]
	,koodit_hankintakoulutuksen_jarjestajan_kunta = [Koodit Hankintakoulutuksen järjestäjän kunta]
	,oppilaitos
	,koodit_oppilaitos = [Koodit Oppilaitos]
	,oppilaitoksen_kunta = [Oppilaitoksen kunta]
	,koodit_oppilaitoksen_kunta = [Koodit Oppilaitoksen kunta]
	,toimipiste
	--
	,hyvaksytyt_hylatyt_opiskelijavuodet = [Hyväksytyt/hylätyt opiskelijavuodet]
	,luvaton_koulutus = [Luvaton koulutus]
	,luvaton_majoitus = [Luvaton majoitus]
	,luvaton_korotustekija = [Luvaton korotustekijä]
	,luvanmukainen_suorituskieli = [Luvanmukainen suorituskieli]
	,opiskelijavuoden_tyyppi = [Opiskelijavuoden tyyppi]
	--
	,opiskelijavuodet_painottamaton = coalesce([painottamaton], 0)
	,opiskelijavuodet_painotettu = coalesce([painotettu], 0)

--INTO [dw].[api_amm_rahoitus_opiskelijavuodet]

FROM [ANTERO].[dw].[v_amos_opiskelijavuodet]

GO

USE [ANTERO]