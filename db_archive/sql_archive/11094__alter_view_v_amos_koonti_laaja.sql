USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dw].[v_amos_koonti_laaja] AS

--tässä versiossa laajempi sisältö (muissa kuin Koski-tiedoissa, ks. "--_s"); sijoittumistietojen laskenta suojattu kuutiossa
--viety vuosirajaukset toistaiseksi sisäkyselyihin; ks. myös generoituSuorituskausi

SELECT 
	q.*
	,apusarake_laskennallinen_rahoitus_osuus_ed_v = f.laskennallinen_rahoitus_osuus_ed_v
	,apusarake_laskennallinen_rahoitus_rajoitekerroin = 
		case 
			when [Toteuma/Estimaatti] = 'Estimaatti' then f.laskennallinen_rahoitus_rajoitekerroin_estimaatti
			else f.laskennallinen_rahoitus_rajoitekerroin
		end
	,apusarake_laskennallinen_rahoitus_osuus = 
		case 
			when [Toteuma/Estimaatti] = 'Estimaatti' then f.laskennallinen_rahoitus_osuus_estimaatti
			else f.laskennallinen_rahoitus_osuus
		end

FROM (  

	--opiskelijavuodet
	SELECT
		[Toteuma/Estimaatti]
		,[Varainhoitovuosi] = right([Rahoituskausi],4)+1
		,[Rahoituskausi]
		,[Rahoituskausi (palautteet)] = ' Tieto puuttuu'
		,[Suorituskausi]
		,Tilastovuosi = cast(Tilastovuosi as varchar(24))
		,[Suoritepäätös (viimeisin)]
		,[Koul. järjestäjän PILKE-alue (kokeilu)]
		,[jarjestys Koul. järjestäjän PILKE-alue (kokeilu)]
		,[Kokonaisuus] = 'Opiskelijavuodet' 

		,[Suorituksen tyyppi]

		,[Korkeakouluopiskelija] = 'Tieto puuttuu'
		,[Työllinen] = 'Tieto puuttuu'

		,[Kysely] = 'Tieto puuttuu'
		,[Kyselyn kohderyhmä] = 'Tieto puuttuu'

		,[Koulutuksen järjestäjä]
		,[Koulutuksen järjestäjän kunta] = [Koul. järjestäjän kunta]
		,[Koulutuksen järjestäjän maakunta] = [Koul. järjestäjän maakunta]
		,[Koodit Koulutuksen järjestäjä]
		,[jarj Koulutuksen järjestäjän maakunta] = jarj_koul_jarj_maakunta
		,[Hankintakoulutuksen järjestäjä]
		,[Koodit Hankintakoulutuksen järjestäjä]
		,Oppilaitos
		,[Oppilaitoksen kunta]
		,[Oppilaitoksen maakunta]
		,jarj_oppilaitoksen_maakunta
		,Toimipiste
		,[Toimipisteen kunta]
		,[Toimipisteen maakunta]
		,jarjestys_toimipisteen_maakunta
		
		,[Opiskelijavuoden tyyppi]
		,[jarj Opiskelijavuoden tyyppi] = jarj_painotuksen_tyyppi
		,[Hyväksytyt/hylätyt opiskelijavuodet]
		,[jarj Hyväksytyt/hylätyt opiskelijavuodet] = jarj_hylkaamisperuste

		,[Ikä (maksuttomuusraja)] 
		,[Ikä 20/alle/yli] 
		,Ikäryhmä
		,jarj_ikaryhma
		,[Äidinkieli (ryhmä)]
		,[jarj_aidinkieli_ryhma]
		,Sukupuoli
		,jarj_sukupuoli

		,[Maksuttomuus]
		,[Maksuttomuus (simulointi)]
		,Majoitus
		,[Vaativa erityinen tuki]	
		,[Kustannusryhmä]
		,[jarj_kustannusryhma]
		,Tutkintotyyppi
		,[Tutkintotyyppi (rahoitus)] = [Tutkintotyyppi rahoitus]
		,[jarjestys Tutkintotyyppi rahoitus]
		,Tutkinto
		,[Koodit Tutkinto]
		,[Koulutusala, taso 1]
		,jarj_koulutusala_taso1
		,[Koulutusala, taso 2]
		,jarj_koulutusala_taso2
		,[Koulutusala, taso 3]
		,jarj_koulutusala_taso3
		,[Rahoitusmuoto hyväksytään] = case when sisaltyy_okm_perusrahoitus = 1 then 'Rahoitusmuoto hyväksytään' else 'Rahoitusmuotoa ei hyväksytä' end
		,Rahoitusmuoto
		,jarj_rahoitusmuoto
		,Työvoimakoulutus
		,Suorituskieli
		,jarj_suorituskieli
		,Hankintakoulutus
		,Oppisopimuskoulutus
		,Vankilaopetus

		,[Ei maksuttomien opiskelijavuosien enimmäismäärä]
		,[Sisäoppilaitosmuotoisen majoituksen opiskelijavuosien enimmäismäärä]
		,[Vaativan erityisen tuen opiskelijavuosien enimmäismäärä]
		,[Luvaton koulutus]
		,[Luvaton majoitus]
		,[Luvaton korotustekijä]
		,[Luvanmukainen suorituskieli]
		,jarj_luvaton_koulutus
		,jarj_luvaton_majoitus
		,jarj_luvaton_korotustekija
		,jarj_suorituskieli_luvanmukainen
		
		,apusarake_opiskelijavuodet_painottamaton = cast(sum(painottamaton) as decimal(30,20))
		,apusarake_opiskelijavuodet_painotettu = cast(sum(painotettu) as decimal(30,20))
		,apusarake_opv_ei_maksuton_kerroin = cast(opv_ei_maksuton_kerroin as decimal(30,29))

		,apusarake_painottamaton_tutkinnot = cast(null as decimal(30,20))
		,apusarake_painottamaton_osaamispisteet = cast(null as decimal(30,20))
		,apusarake_osaamispisteet_kerroin = cast(null as decimal(30,29))
		,apusarake_painotettu_tutkinnot = cast(null as decimal(30,20))

		,apusarake_lkm = cast(null as int)

		,apusarake_pisteet = cast(null as decimal(30,20))
		,apusarake_painotetut_pisteet = cast(null as decimal(30,20))
		
	FROM [dw].[v_amos_opiskelijavuodet_uusi]
	WHERE right([Rahoituskausi],4)+1 = 2026

	GROUP BY 
		[Toteuma/Estimaatti]
		,[Rahoituskausi]
		,[Suorituskausi]
		,Tilastovuosi
		,[Suoritepäätös (viimeisin)]
		,[Koul. järjestäjän PILKE-alue (kokeilu)]
		,[jarjestys Koul. järjestäjän PILKE-alue (kokeilu)]
		,[Suorituksen tyyppi]
		,[Koulutuksen järjestäjä]
		,[Koul. järjestäjän kunta]
		,[Koul. järjestäjän maakunta]
		,[Koodit Koulutuksen järjestäjä]
		,jarj_koul_jarj_maakunta
		,[Hankintakoulutuksen järjestäjä]
		,[Koodit Hankintakoulutuksen järjestäjä]
		,Oppilaitos
		,[Oppilaitoksen kunta]
		,[Oppilaitoksen maakunta]
		,jarj_oppilaitoksen_maakunta
		,Toimipiste
		,[Toimipisteen kunta]
		,[Toimipisteen maakunta]
		,jarjestys_toimipisteen_maakunta
		,[Opiskelijavuoden tyyppi]
		,jarj_painotuksen_tyyppi
		,[Hyväksytyt/hylätyt opiskelijavuodet]
		,jarj_hylkaamisperuste
		,Ikäryhmä
		,jarj_ikaryhma
		,[Ikä (maksuttomuusraja)]
		,[Ikä 20/alle/yli]
		,[Äidinkieli (ryhmä)]
		,[jarj_aidinkieli_ryhma]
		,Sukupuoli
		,jarj_sukupuoli
		,[Maksuttomuus]
		,[Maksuttomuus (simulointi)]
		,Majoitus
		,[Vaativa erityinen tuki]	
		,[Kustannusryhmä]
		,[jarj_kustannusryhma]
		,Tutkintotyyppi
		,[Tutkintotyyppi rahoitus]
		,[jarjestys Tutkintotyyppi rahoitus]
		,Tutkinto
		,[Koodit Tutkinto]
		,[Koulutusala, taso 1]
		,jarj_koulutusala_taso1
		,[Koulutusala, taso 2]
		,jarj_koulutusala_taso2
		,[Koulutusala, taso 3]
		,jarj_koulutusala_taso3
		,sisaltyy_okm_perusrahoitus
		,Rahoitusmuoto
		,jarj_rahoitusmuoto
		,Työvoimakoulutus
		,Suorituskieli
		,jarj_suorituskieli
		,Hankintakoulutus
		,Oppisopimuskoulutus
		,Vankilaopetus
		,[Ei maksuttomien opiskelijavuosien enimmäismäärä]
		,[Sisäoppilaitosmuotoisen majoituksen opiskelijavuosien enimmäismäärä]
		,[Vaativan erityisen tuen opiskelijavuosien enimmäismäärä]
		,[Luvaton koulutus]
		,[Luvaton majoitus]
		,[Luvaton korotustekijä]
		,[Luvanmukainen suorituskieli]
		,jarj_luvaton_koulutus
		,jarj_luvaton_majoitus
		,jarj_luvaton_korotustekija
		,jarj_suorituskieli_luvanmukainen
		,cast(opv_ei_maksuton_kerroin as decimal(30,29))

	UNION ALL

	--tutkinnot ja osaamispisteet
	SELECT
		[Toteuma/Estimaatti]
		,[Varainhoitovuosi] = right([Rahoituskausi],4)+1
		,[Rahoituskausi]
		,[Rahoituskausi (palautteet)] = ' Tieto puuttuu'
		,[Suorituskausi]
		,Tilastovuosi = cast(Tilastovuosi as varchar(24))
		,[Suoritepäätös (viimeisin)]
		,[Koul. järjestäjän PILKE-alue (kokeilu)]
		,[jarjestys Koul. järjestäjän PILKE-alue (kokeilu)]
		,[Kokonaisuus] = 'Tutkinnot ja osaamispisteet' 

		,[Suorituksen tyyppi]

		,[Korkeakouluopiskelija] = 'Tieto puuttuu'
		,[Työllinen] = 'Tieto puuttuu'

		,[Kysely] = 'Tieto puuttuu'
		,[Kyselyn kohderyhmä] = 'Tieto puuttuu'

		,[Koulutuksen järjestäjä]
		,[Koulutuksen järjestäjän kunta]
		,[Koulutuksen järjestäjän maakunta]
		,[Koodit Koulutuksen järjestäjä]
		,[jarj Koulutuksen järjestäjän maakunta]
		,[Hankintakoulutuksen järjestäjä]
		,[Koodit Hankintakoulutuksen järjestäjä]
		,Oppilaitos
		,[Oppilaitoksen kunta]
		,[Oppilaitoksen maakunta]
		,jarj_oppilaitoksen_maakunta = [jarj Oppilaitoksen maakunta]
		,Toimipiste
		,[Toimipisteen kunta]
		,[Toimipisteen maakunta]
		,jarjestys_toimipisteen_maakunta = [jarj Toimipisteen maakunta]

		,[Opiskelijavuoden tyyppi] = 'Tieto puuttuu'
		,[jarj Opiskelijavuoden tyyppi] = 999
		,[Hyväksytyt/hylätyt opiskelijavuodet] = 'Tieto puuttuu'
		,[jarj Hyväksytyt/hylätyt opiskelijavuodet] = 999

		,[Ikä (maksuttomuusraja)] 
		,[Ikä 20/alle/yli]
		,Ikäryhmä
		,jarj_ikaryhma = [jarj Ikäryhmä]
		,[Äidinkieli (ryhmä)] = Äidinkieli
		,[jarj_aidinkieli_ryhma] = [jarj Äidinkieli]
		,Sukupuoli
		,jarj_sukupuoli = [jarj Sukupuoli]

		,[Maksuttomuus]
		,[Maksuttomuus (simulointi)] = 'Tieto puuttuu'
		,Majoitus = 'Tieto puuttuu'
		,[Vaativa erityinen tuki] = 'Tieto puuttuu'
		,[Kustannusryhmä] = 'Tieto puuttuu'
		,[jarj_kustannusryhma] = 99
		,Tutkintotyyppi
		,[Tutkintotyyppi (rahoitus)]
		,[jarjestys Tutkintotyyppi (rahoitus)]
		,Tutkinto
		,[Koodit Tutkinto]
		,[Koulutusala, taso 1]
		,jarj_koulutusala_taso1 = [jarj Koulutusala, taso 1]
		,[Koulutusala, taso 2]
		,jarj_koulutusala_taso2 = [jarj Koulutusala, taso 2]
		,[Koulutusala, taso 3]
		,jarj_koulutusala_taso3 = [jarj Koulutusala, taso 3]
		,[Rahoitusmuoto hyväksytään] = case when sisaltyy_okm_suoritusrahoitus = 1 then 'Rahoitusmuoto hyväksytään' else 'Rahoitusmuotoa ei hyväksytä' end
		,Rahoitusmuoto
		,jarj_rahoitusmuoto = [jarj Rahoitusmuoto]
		,Työvoimakoulutus
		,Suorituskieli
		,jarj_suorituskieli = [jarj Suorituskieli]
		,Hankintakoulutus
		,Oppisopimuskoulutus
		,Vankilaopetus

		,[Ei maksuttomien opiskelijavuosien enimmäismäärä] = -1
		,[Sisäoppilaitosmuotoisen majoituksen opiskelijavuosien enimmäismäärä] = -1
		,[Vaativan erityisen tuen opiskelijavuosien enimmäismäärä] = -1
		,[Luvaton koulutus]
		,[Luvaton majoitus] = 'Tieto puuttuu'
		,[Luvaton korotustekijä] = 'Tieto puuttuu'
		,[Luvanmukainen suorituskieli]
		,jarj_luvaton_koulutus
		,jarj_luvaton_majoitus = 99
		,jarj_luvaton_korotustekija = 99
		,jarj_suorituskieli_luvanmukainen = [jarj Suorituskieli luvanmukainen]

		,apusarake_opiskelijavuodet_painottamaton = cast(null as decimal(30,20))
		,apusarake_opiskelijavuodet_painotettu = cast(null as decimal(30,20))
		,apusarake_opv_ei_maksuton_kerroin = cast(null as decimal(30,29))

		,apusarake_painottamaton_tutkinnot = sum([painottamaton_tutkinnot])
		,apusarake_painottamaton_osaamispisteet = cast(sum([painottamaton_osaamispisteet]) as decimal(30,20))
		,apusarake_osaamispisteet_kerroin = cast([osaamispisteet_kerroin] as decimal(30,29))
		,apusarake_painotettu_tutkinnot = cast(sum([painotettu_tutkinnot]) as decimal(30,20))

		,apusarake_lkm = cast(null as int)

		,apusarake_pisteet = cast(null as decimal(30,20))
		,apusarake_painotetut_pisteet = cast(null as decimal(30,20))
	
	FROM [dw].[v_amos_tutkinnot_ja_tutkinnonosat_uusi]
	WHERE right([Rahoituskausi],4)+1 = 2026

	GROUP BY 
		[Toteuma/Estimaatti]
		,[Rahoituskausi]
		,[Suorituskausi]
		,Tilastovuosi
		,[Suoritepäätös (viimeisin)]
		,[Koul. järjestäjän PILKE-alue (kokeilu)]
		,[jarjestys Koul. järjestäjän PILKE-alue (kokeilu)]
		,[Suorituksen tyyppi]
		,[Koulutuksen järjestäjä]
		,[Koulutuksen järjestäjän kunta]
		,[Koulutuksen järjestäjän maakunta]
		,[Koodit Koulutuksen järjestäjä]
		,[jarj Koulutuksen järjestäjän maakunta]
		,[Hankintakoulutuksen järjestäjä]
		,[Koodit Hankintakoulutuksen järjestäjä]
		,Oppilaitos
		,[Oppilaitoksen kunta]
		,[Oppilaitoksen maakunta]
		,[jarj Oppilaitoksen maakunta]
		,Toimipiste
		,[Toimipisteen kunta]
		,[Toimipisteen maakunta]
		,[jarj Toimipisteen maakunta]
		,Ikäryhmä
		,[jarj Ikäryhmä]
		,[Ikä (maksuttomuusraja)]
		,[Ikä 20/alle/yli]
		,[Äidinkieli]
		,[jarj Äidinkieli]
		,Sukupuoli
		,[jarj Sukupuoli]
		,[Maksuttomuus]
		,Tutkintotyyppi
		,[Tutkintotyyppi (rahoitus)]
		,[jarjestys Tutkintotyyppi (rahoitus)]
		,Tutkinto
		,[Koodit Tutkinto]
		,[Koulutusala, taso 1]
		,[jarj Koulutusala, taso 1]
		,[Koulutusala, taso 2]
		,[jarj Koulutusala, taso 2]
		,[Koulutusala, taso 3]
		,[jarj Koulutusala, taso 3]
		,sisaltyy_okm_suoritusrahoitus
		,Rahoitusmuoto
		,[jarj Rahoitusmuoto]
		,Työvoimakoulutus
		,Suorituskieli
		,[jarj Suorituskieli]
		,Hankintakoulutus
		,Oppisopimuskoulutus
		,Vankilaopetus
		,[Luvaton koulutus]
		,[Luvanmukainen suorituskieli]
		,jarj_luvaton_koulutus
		,[jarj Suorituskieli luvanmukainen]
		,cast([osaamispisteet_kerroin] as decimal(30,29))

	UNION ALL

	--tyollistyminen_ja_jatkoopiskelu
	SELECT
		[Toteuma/Estimaatti]
		,[Varainhoitovuosi]
		,[Rahoituskausi]
		,[Rahoituskausi (palautteet)] = ' Tieto puuttuu'
		,[Suorituskausi] = coalesce(oa.generoituSuorituskausi, [Suorituskausi])
		,Tilastovuosi = ' Tieto puuttuu'
		,[Suoritepäätös (viimeisin)]
		,[Koul. järjestäjän PILKE-alue (kokeilu)]
		,[jarj Koul. järjestäjän PILKE-alue (kokeilu)]
		,[Kokonaisuus] = 'Työllistyminen ja jatko-opiskelu' 

		,[Suorituksen tyyppi] = [Koulutuksen tavoite]

		,[Korkeakouluopiskelija]
		,[Työllinen]

		,[Kysely] = 'Tieto puuttuu'
		,[Kyselyn kohderyhmä] = 'Tieto puuttuu'

		,[Koulutuksen järjestäjä]
		,[Koulutuksen järjestäjän kunta]
		,[Koulutuksen järjestäjän maakunta]
		,[Koodit Koulutuksen järjestäjä]
		,[jarj Koulutuksen järjestäjän maakunta]
		,[Hankintakoulutuksen järjestäjä] --_s = 'Tieto puuttuu'
		,[Koodit Koulutuksen järjestäjä] --_s = 'Tieto puuttuu'
		,Oppilaitos = 'Tieto puuttuu'
		,[Oppilaitoksen kunta] = 'Tieto puuttuu'
		,[Oppilaitoksen maakunta] = 'Tieto puuttuu'
		,jarj_oppilaitoksen_maakunta = 99999
		,Toimipiste = 'Tieto puuttuu'
		,[Toimipisteen kunta] = 'Tieto puuttuu'
		,[Toimipisteen maakunta] = 'Tieto puuttuu'
		,jarjestys_toimipisteen_maakunta = 99999

		,[Opiskelijavuoden tyyppi] = 'Tieto puuttuu'
		,[jarj Opiskelijavuoden tyyppi] = 999
		,[Hyväksytyt/hylätyt opiskelijavuodet] = 'Tieto puuttuu'
		,[jarj Hyväksytyt/hylätyt opiskelijavuodet] = 999

		,[Ikä (maksuttomuusraja)] --_s = 'Tieto puuttuu'
		,[Ikä 20/alle/yli] = [Ikä suoritusvuonna] --_s = 'Tieto puuttuu'
		,Ikäryhmä = 'Tieto puuttuu'
		,jarj_ikaryhma = 999
		,[Äidinkieli (ryhmä)] --_s = 'Tieto puuttuu'
		,[jarj Äidinkieli (ryhmä)] --_s = 99999
		,Sukupuoli = 'Tieto puuttuu'
		,[jarj Sukupuoli] = 99999

		,[Maksuttomuus] = 'Tieto puuttuu'
		,[Maksuttomuus (simulointi)] = 'Tieto puuttuu'
		,Majoitus = 'Tieto puuttuu'
		,[Vaativa erityinen tuki] = 'Tieto puuttuu'
		,[Kustannusryhmä] = 'Tieto puuttuu'
		,[jarj_kustannusryhma] = 99
		,Tutkintotyyppi --_s = 'Tieto puuttuu'
		,[Tutkintotyyppi (rahoitus)] --_s = 'Tieto puuttuu'
		,[jarj Tutkintotyyppi (rahoitus)] --_s = 9
		,Tutkinto = 'Tieto puuttuu'
		,[Koodit Tutkinto] = -1
		,[Koulutusala, taso 1] --_s = 'Tieto puuttuu'
		,jarj_koulutusala_taso1 = [jarj Koulutusala, taso 1] --_s = 99999
		,[Koulutusala, taso 2] = 'Tieto puuttuu'
		,jarj_koulutusala_taso2 = 99999 --= [jarj Koulutusala, taso 2]
		,[Koulutusala, taso 3] = 'Tieto puuttuu'
		,jarj_koulutusala_taso3 = 99999 --= [jarj Koulutusala, taso 3]
		,[Rahoitusmuoto hyväksytään] = 'Rahoitusmuoto hyväksytään'
		,Rahoitusmuoto --_s = 'Tieto puuttuu'
		,[jarj Rahoitusmuoto]	--_s = 99
		,Työvoimakoulutus --_s = 'Tieto puuttuu'
		,Suorituskieli = 'Tieto puuttuu'
		,jarj_suorituskieli = '99'
		,Hankintakoulutus --_s = 'Tieto puuttuu'
		,Oppisopimuskoulutus --_s = 'Tieto puuttuu'
		,Vankilaopetus = 'Tieto puuttuu'

		,[Ei maksuttomien opiskelijavuosien enimmäismäärä] = -1
		,[Sisäoppilaitosmuotoisen majoituksen opiskelijavuosien enimmäismäärä] = -1
		,[Vaativan erityisen tuen opiskelijavuosien enimmäismäärä] = -1
		,[Luvaton koulutus] = 'Tieto puuttuu'
		,[Luvaton majoitus] = 'Tieto puuttuu'
		,[Luvaton korotustekijä] = 'Tieto puuttuu'
		,[Luvanmukainen suorituskieli] = 'Tieto puuttuu'
		,jarj_luvaton_koulutus = 99
		,jarj_luvaton_majoitus = 99
		,jarj_luvaton_korotustekija = 99
		,jarj_suorituskieli_luvanmukainen = 99
	
		,apusarake_opiskelijavuodet_painottamaton = cast(null as decimal(30,20))
		,apusarake_opiskelijavuodet_painotettu = cast(null as decimal(30,20))
		,apusarake_opv_ei_maksuton_kerroin = cast(null as decimal(30,29))

		,apusarake_painottamaton_tutkinnot = cast(null as decimal(30,20))
		,apusarake_painottamaton_osaamispisteet = cast(null as decimal(30,20))
		,apusarake_osaamispisteet_kerroin = cast(null as decimal(30,29))
		,apusarake_painotettu_tutkinnot = cast(null as decimal(30,20))

		,apusarake_lkm = sum(lkm)

		,apusarake_pisteet = cast(null as decimal(30,20))
		,apusarake_painotetut_pisteet = cast(null as decimal(30,20))

	FROM [dw].[v_amos_tyollistyminen_ja_jatkoopiskelu]
	CROSS APPLY (
		SELECT [Toteuma/Estimaatti] = 'Toteuma', rnk=1
		UNION ALL 
		SELECT [Toteuma/Estimaatti] = 'Estimaatti', rnk=1
		UNION ALL 
		SELECT [Toteuma/Estimaatti] = 'Estimaatti', rnk=2
	) ca
	OUTER APPLY (
		SELECT	
			generoituSuorituskausi = '01.07.2023 - 30.06.2024' 
		WHERE 1=1
		AND [Toteuma/Estimaatti] = 'Estimaatti'
		AND rnk = 2
	) oa

	WHERE 1=1
	AND [jarj Työllisen määritelmä] = 2 --'Väh. 2 kk työllisenä'
	AND [jarj Työllisen määritelmä (palkansaaja)] = 2 
	AND [jarj Työllisen määritelmä (yrittäjä)] = 2 
	AND [Työllinen ennen koulutusta] = 'Ei työllinen ennen koulutuksen alkamisvuotta'
	AND Varainhoitovuosi = 2026

	GROUP BY 
		[Toteuma/Estimaatti]
		,[Varainhoitovuosi]
		,[Rahoituskausi]
		,coalesce(oa.generoituSuorituskausi, [Suorituskausi])
		,[Suoritepäätös (viimeisin)]
		,[Koulutuksen järjestäjä]
		,[Koulutuksen järjestäjän kunta]
		,[Koulutuksen järjestäjän maakunta]
		,[Koodit Koulutuksen järjestäjä]
		,[jarj Koulutuksen järjestäjän maakunta]
		,[Koul. järjestäjän PILKE-alue (kokeilu)]
		,[jarj Koul. järjestäjän PILKE-alue (kokeilu)]
		,[Koulutuksen tavoite]
		,[Korkeakouluopiskelija]
		,[Työllinen]
		,Rahoitusmuoto --_s = 'Tieto puuttuu'
		,[jarj Rahoitusmuoto]	--_s = 99
		,Työvoimakoulutus --_s = 'Tieto puuttuu'
		,Hankintakoulutus --_s = 'Tieto puuttuu'
		,Oppisopimuskoulutus --_s = 'Tieto puuttuu'
		,[Ikä (maksuttomuusraja)] --_s = 'Tieto puuttuu'
		,[Ikä suoritusvuonna] --_s = 'Tieto puuttuu'
		,[Äidinkieli (ryhmä)] --_s = 'Tieto puuttuu'
		,[jarj Äidinkieli (ryhmä)] --_s = 99999
		,Tutkintotyyppi --_s = 'Tieto puuttuu'
		,[Tutkintotyyppi (rahoitus)] --_s = 'Tieto puuttuu'
		,[jarj Tutkintotyyppi (rahoitus)] --_s = 9
		,[Koulutusala, taso 1] --_s = 'Tieto puuttuu'
		,[jarj Koulutusala, taso 1] --_s = 99999
		,[Hankintakoulutuksen järjestäjä] --_s= 'Tieto puuttuu'
		,[Koodit Hankintakoulutuksen järjestäjä] --_s= 'Tieto puuttuu'

	UNION ALL

	--palautteet
	SELECT
		[Toteuma/Estimaatti]
		,[Varainhoitovuosi]
		,[Rahoituskausi] = ' Tieto puuttuu'
		,[Rahoituskausi (palautteet)]
		,[Suorituskausi] = ' Tieto puuttuu'
		,Tilastovuosi = ' Tieto puuttuu'
		,[Suoritepäätös (viimeisin)]
		,[Koul. järjestäjän PILKE-alue (kokeilu)]
		,[jarjestys Koul. järjestäjän PILKE-alue (kokeilu)]
		,[Kokonaisuus] 
		,[Suorituksen tyyppi] = 'Tieto puuttuu'

		,[Korkeakouluopiskelija] = 'Tieto puuttuu'
		,[Työllinen] = 'Tieto puuttuu'

		,[Kysely]
		,[Kyselyn kohderyhmä]

		,[Koulutuksen järjestäjä]
		,[Koulutuksen järjestäjän kunta]
		,[Koulutuksen järjestäjän maakunta]
		,[Koodit Koulutuksen järjestäjä]
		,[jarj Koulutuksen järjestäjän maakunta]
		,[Hankintakoulutuksen järjestäjä] = 'Tieto puuttuu'
		,[Koodit Hankintakoulutuksen järjestäjä] = '-1'
		,Oppilaitos
		,[Oppilaitoksen kunta]
		,[Oppilaitoksen maakunta]
		,jarj_oppilaitoksen_maakunta = [jarj Koulutuksen järjestäjän maakunta]
		,Toimipiste = 'Tieto puuttuu'
		,[Toimipisteen kunta] = 'Tieto puuttuu'
		,[Toimipisteen maakunta] = 'Tieto puuttuu'
		,jarjestys_toimipisteen_maakunta = 99999
		
		,[Opiskelijavuoden tyyppi] = 'Tieto puuttuu'
		,[jarj Opiskelijavuoden tyyppi] = 999
		,[Hyväksytyt/hylätyt opiskelijavuodet] = 'Tieto puuttuu'
		,[jarj Hyväksytyt/hylätyt opiskelijavuodet] = 999

		,[Ikä (maksuttomuusraja)] = 'Tieto puuttuu'
		,[Ikä 20/alle/yli] = 'Tieto puuttuu'
		,Ikäryhmä = 'Tieto puuttuu'
		,jarj_ikaryhma = 999
		,[Äidinkieli (ryhmä)] = 'Tieto puuttuu'
		,[jarj_aidinkieli_ryhma] = 99999
		,Sukupuoli = 'Tieto puuttuu'
		,[jarj Sukupuoli] = 99999

		,[Maksuttomuus] = 'Tieto puuttuu'
		,[Maksuttomuus (simulointi)] = 'Tieto puuttuu'
		,Majoitus = 'Tieto puuttuu'
		,[Vaativa erityinen tuki] = 'Tieto puuttuu'
		,[Kustannusryhmä] = 'Tieto puuttuu'
		,[jarj_kustannusryhma] = 99
		,Tutkintotyyppi
		,[Tutkintotyyppi (rahoitus)] = 'Tieto puuttuu'
		,[jarjestys Tutkintotyyppi rahoitus] = 9
		,Tutkinto
		,[Koodit Tutkinto]
		,[Koulutusala, taso 1]
		,[jarjestys Koulutusala, taso 1]
		,[Koulutusala, taso 2]
		,[jarjestys Koulutusala, taso 2]
		,[Koulutusala, taso 3]
		,[jarjestys Koulutusala, taso 3]
		,[Rahoitusmuoto hyväksytään] = 'Rahoitusmuoto hyväksytään'
		,Rahoitusmuoto = 'Tieto puuttuu'
		,jarj_rahoitusmuoto	= 99
		,Työvoimakoulutus = 'Tieto puuttuu'
		,Suorituskieli = 'Tieto puuttuu'
		,jarj_suorituskieli = '99'
		,Hankintakoulutus = 'Tieto puuttuu'
		,Oppisopimuskoulutus = 'Tieto puuttuu'
		,Vankilaopetus = 'Tieto puuttuu'

		,[Ei maksuttomien opiskelijavuosien enimmäismäärä] = -1
		,[Sisäoppilaitosmuotoisen majoituksen opiskelijavuosien enimmäismäärä] = -1
		,[Vaativan erityisen tuen opiskelijavuosien enimmäismäärä] = -1
		,[Luvaton koulutus] = 'Tieto puuttuu'
		,[Luvaton majoitus] = 'Tieto puuttuu'
		,[Luvaton korotustekijä] = 'Tieto puuttuu'
		,[Luvanmukainen suorituskieli] = 'Tieto puuttuu'
		,jarj_luvaton_koulutus = 99
		,jarj_luvaton_majoitus = 99
		,jarj_luvaton_korotustekija = 99
		,jarj_suorituskieli_luvanmukainen = 99
	
		,apusarake_opiskelijavuodet_painottamaton = cast(null as decimal(30,20))
		,apusarake_opiskelijavuodet_painotettu = cast(null as decimal(30,20))
		,apusarake_opv_ei_maksuton_kerroin = cast(null as decimal(30,29))

		,apusarake_painottamaton_tutkinnot = cast(null as decimal(30,20))
		,apusarake_painottamaton_osaamispisteet = cast(null as decimal(30,20))
		,apusarake_osaamispisteet_kerroin = cast(null as decimal(30,29))
		,apusarake_painotettu_tutkinnot = cast(null as decimal(30,20))

		,apusarake_lkm = cast(null as int)

		,apusarake_pisteet = cast([pisteet] as decimal(30,20))
		,apusarake_painotetut_pisteet = cast([painotetut_pisteet] as decimal(30,20))

	FROM [dw].[v_amos_palautteet]
	WHERE Varainhoitovuosi = 2026

) q

--taulu monivuotiseksi, jos halutaan esittää aikasarja myös liveraportilla
LEFT JOIN dw.f_amos_koonti_rahoitusperusteet f 
	ON f.ytunnus_amos_spl = q.[Koodit Koulutuksen järjestäjä]
	--AND f.[Varainhoitovuosi] = q.Varainhoitovuosi
	--AND f.[Toteuma/Estimaatti] = q.[Toteuma/Estimaatti]

GO
