USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dw].[v_amos_koonti_estimaatti] AS

/*
huom. 
- rajaukset optimointisyistä sisäkyselyissä (kuutiossa partitiot)
- sijoittumistietojen laskenta suojattu kuutiossa laajemman sisällön tapauksessa lippujen avulla (ks. "--_s", suppea_sisalto_1_0 ja laaja_sisalto_1_0)
*/

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
		suppea_sisalto_1_0 = 1
		,laaja_sisalto_1_0 = 1
		,[Toteuma/Estimaatti]
		,[Varainhoitovuosi]
		,[Rahoituskausi (pl. palautteet)] = [Rahoituskausi]
		,[Rahoituskausi (palautteet)] = ' Tieto puuttuu'
		,[Tilastokausi]
		,Tilastovuosi = cast(Tilastovuosi as varchar(24))
		,[Järjestäjärakenne]
		,[Toiminnanohjauksen kokeilu]
		,[jarjestys Toiminnanohjauksen kokeilu]
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
		
		,[Hyväksytyt/hylätyt opiskelijavuodet]
		,[jarj Hyväksytyt/hylätyt opiskelijavuodet] = jarj_hylkaamisperuste

		,[Ikä (maksuttomuusraja)] --= case when left([Ikäryhmä],2) in ('14','15') then '19 tai alle' when [Ikä]='20' then '20' else '21 tai yli' end
		,[Ikä 20/alle/yli]
		,Ikäryhmä
		,jarj_ikaryhma
		,[Äidinkieli (ryhmä)]
		,[jarj_aidinkieli_ryhma]
		,Sukupuoli
		,jarj_sukupuoli

		,[Maksuttomuus (rahoitus)]
		,[Maksuttomuus (simulointi)]
		,Majoitus
		,[Vaativa erityinen tuki]
		,[jarjestys Vaativa erityinen tuki]	
		,[Kustannusryhmä]
		,[jarj_kustannusryhma]
		,Tutkintotyyppi
		,[Tutkintotyyppi (rahoitus)]
		,[jarjestys Tutkintotyyppi (rahoitus)]
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
		,[jarjestys Ei maksuttomien opiskelijavuosien enimmäismäärä]
		,[Vaativan erityisen tuen opiskelijavuosien enimmäismäärä]
		,[jarjestys Vaativan erityisen tuen opiskelijavuosien enimmäismäärä]
		,[Luvaton koulutus]
		,[Luvaton majoitus]
		,[Luvaton korotustekijä]
		,[Luvanmukainen suorituskieli]
		,jarj_luvaton_koulutus
		,jarj_luvaton_majoitus
		,jarj_luvaton_korotustekija
		,jarj_suorituskieli_luvanmukainen
		
		,apusarake_opiskelijavuodet_painottamaton = cast(sum(painottamaton) as decimal(30,20))
		,apusarake_opiskelijavuodet_painotettu_lahtotaso = cast(sum(painotettu_lahtotaso) as decimal(30,20))
		,apusarake_opiskelijavuodet_painotettu_kustannusryhma = cast(sum(painotettu_kustannusryhma) as decimal(30,20))
		,apusarake_opiskelijavuodet_painotettu_erityistuki = cast(sum(painotettu_erityistuki) as decimal(30,20))
		,apusarake_opiskelijavuodet_painotettu_majoitus = cast(sum(painotettu_majoitus) as decimal(30,20))
		,apusarake_opv_ei_maksuton_kerroin = cast(opv_ei_maksuton_kerroin as decimal(30,29))

		,apusarake_painottamaton_tutkinnot = cast(null as decimal(30,20))
		,apusarake_painottamaton_osaamispisteet = cast(null as decimal(30,20))
		,apusarake_osaamispisteet_kerroin = cast(null as decimal(30,29))
		,apusarake_painotettu_tutkinnot = cast(null as decimal(30,20))

		,apusarake_lkm = cast(null as int)

		,apusarake_pisteet = cast(null as decimal(30,20))
		,apusarake_painotetut_pisteet = cast(null as decimal(30,20))
		
	FROM [dw].[v_amos_opiskelijavuodet_uusi]

	WHERE [Toteuma/Estimaatti] = 'Estimaatti'

	GROUP BY 
		[Toteuma/Estimaatti]
		,[Varainhoitovuosi]
		,[Rahoituskausi]
		,[Tilastokausi]
		,Tilastovuosi
		,[Järjestäjärakenne]
		,[Toiminnanohjauksen kokeilu]
		,[jarjestys Toiminnanohjauksen kokeilu]
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
		,[Hyväksytyt/hylätyt opiskelijavuodet]
		,jarj_hylkaamisperuste
		,[Ikä (maksuttomuusraja)]
		,[Ikä 20/alle/yli]
		,Ikäryhmä
		,jarj_ikaryhma
		,[Äidinkieli (ryhmä)]
		,[jarj_aidinkieli_ryhma]
		,Sukupuoli
		,jarj_sukupuoli
		,[Maksuttomuus (rahoitus)]
		,[Maksuttomuus (simulointi)]
		,Majoitus
		,[Vaativa erityinen tuki]
		,[jarjestys Vaativa erityinen tuki]	
		,[Kustannusryhmä]
		,[jarj_kustannusryhma]
		,Tutkintotyyppi
		,[Tutkintotyyppi (rahoitus)]
		,[jarjestys Tutkintotyyppi (rahoitus)]
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
		,[jarjestys Ei maksuttomien opiskelijavuosien enimmäismäärä]
		,[Vaativan erityisen tuen opiskelijavuosien enimmäismäärä]
		,[jarjestys Vaativan erityisen tuen opiskelijavuosien enimmäismäärä]
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
		suppea_sisalto_1_0 = 1
		,laaja_sisalto_1_0 = 1
		,[Toteuma/Estimaatti]
		,[Varainhoitovuosi]
		,[Rahoituskausi (pl. palautteet)] = [Rahoituskausi]
		,[Rahoituskausi (palautteet)] = ' Tieto puuttuu'
		,[Tilastokausi]
		,Tilastovuosi = cast(Tilastovuosi as varchar(24))
		,[Järjestäjärakenne]
		,[Toiminnanohjauksen kokeilu]
		,[jarjestys Toiminnanohjauksen kokeilu]
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

		,[Hyväksytyt/hylätyt opiskelijavuodet] = 'Tieto puuttuu'
		,[jarj Hyväksytyt/hylätyt opiskelijavuodet] = 999

		,[Ikä (maksuttomuusraja)] --= case when left([Ikäryhmä],2) in ('14','15') then '19 tai alle' when [Ikä]='20' then '20' else '21 tai yli' end
		,[Ikä 20/alle/yli]
		,Ikäryhmä
		,jarj_ikaryhma = [jarj Ikäryhmä]
		,[Äidinkieli (ryhmä)] = Äidinkieli
		,[jarj_aidinkieli_ryhma] = [jarj Äidinkieli]
		,Sukupuoli
		,jarj_sukupuoli = [jarj Sukupuoli]

		,[Maksuttomuus (rahoitus)]
		,[Maksuttomuus (simulointi)] = 'Tieto puuttuu'
		,Majoitus = 'Tieto puuttuu'
		,[Vaativa erityinen tuki] = 'Tieto puuttuu'
		,[jarjestys Vaativa erityinen tuki]	= 9
		,[Kustannusryhmä] = 'Tieto puuttuu'
		,[jarj_kustannusryhma] = 99
		,Tutkintotyyppi
		,[Tutkintotyyppi (rahoitus)] = 'Tieto puuttuu'
		,[jarjestys Tutkintotyyppi rahoitus] = 9	
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
		
		,[Ei maksuttomien opiskelijavuosien enimmäismäärä] = 'Tieto puuttuu'
		,[jarjestys Ei maksuttomien opiskelijavuosien enimmäismäärä] = 999999
		,[Vaativan erityisen tuen opiskelijavuosien enimmäismäärä] = 'Tieto puuttuu'
		,[jarjestys Vaativan erityisen tuen opiskelijavuosien enimmäismäärä] = 999999
		,[Luvaton koulutus]
		,[Luvaton majoitus] = 'Tieto puuttuu'
		,[Luvaton korotustekijä] = 'Tieto puuttuu'
		,[Luvanmukainen suorituskieli]
		,jarj_luvaton_koulutus
		,jarj_luvaton_majoitus = 99
		,jarj_luvaton_korotustekija = 99
		,jarj_suorituskieli_luvanmukainen = [jarj Suorituskieli luvanmukainen]

		,apusarake_opiskelijavuodet_painottamaton = cast(null as decimal(30,20))
		,apusarake_opiskelijavuodet_painotettu_lahtotaso = cast(null as decimal(30,20))
		,apusarake_opiskelijavuodet_painotettu_kustannusryhma = cast(null as decimal(30,20))
		,apusarake_opiskelijavuodet_painotettu_erityistuki = cast(null as decimal(30,20))
		,apusarake_opiskelijavuodet_painotettu_majoitus = cast(null as decimal(30,20))
		,apusarake_opv_ei_maksuton_kerroin = cast(null as decimal(30,29))

		,apusarake_painottamaton_tutkinnot = sum([painottamaton_tutkinnot])
		,apusarake_painottamaton_osaamispisteet = cast(sum([painottamaton_osaamispisteet]) as decimal(30,20))
		,apusarake_osaamispisteet_kerroin = cast([osaamispisteet_kerroin] as decimal(30,29))
		,apusarake_painotettu_tutkinnot = cast(sum([painotettu_tutkinnot]) as decimal(30,20))

		,apusarake_lkm = cast(null as int)

		,apusarake_pisteet = cast(null as decimal(30,20))
		,apusarake_painotetut_pisteet = cast(null as decimal(30,20))
	
	FROM [dw].[v_amos_tutkinnot_ja_tutkinnonosat_uusi]

	WHERE [Toteuma/Estimaatti] = 'Estimaatti'

	GROUP BY 
		[Toteuma/Estimaatti]
		,[Varainhoitovuosi]
		,[Rahoituskausi]
		,[Tilastokausi]
		,Tilastovuosi
		,[Järjestäjärakenne]
		,[Toiminnanohjauksen kokeilu]
		,[jarjestys Toiminnanohjauksen kokeilu]
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
		,[Ikä (maksuttomuusraja)]
		,[Ikä 20/alle/yli]
		,Ikäryhmä
		,[jarj Ikäryhmä]
		,[Äidinkieli]
		,[jarj Äidinkieli]
		,Sukupuoli
		,[jarj Sukupuoli]
		,[Maksuttomuus (rahoitus)]
		,Tutkintotyyppi
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

	--palautteet
	SELECT  
		suppea_sisalto_1_0 = 1
		,laaja_sisalto_1_0 = 1
		,[Toteuma/Estimaatti]
		,[Varainhoitovuosi]
		,[Rahoituskausi (pl. palautteet)] = ' Tieto puuttuu'
		,[Rahoituskausi (palautteet)]
		,[Tilastokausi]
		,Tilastovuosi = cast(Tilastovuosi as varchar(24))
		,[Järjestäjärakenne]
		,[Toiminnanohjauksen kokeilu]
		,[jarjestys Toiminnanohjauksen kokeilu]
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

		,[Maksuttomuus (rahoitus)] = 'Tieto puuttuu'
		,[Maksuttomuus (simulointi)] = 'Tieto puuttuu'
		,Majoitus = 'Tieto puuttuu'
		,[Vaativa erityinen tuki] = 'Tieto puuttuu'
		,[jarjestys Vaativa erityinen tuki]	= 9
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
		
		,[Ei maksuttomien opiskelijavuosien enimmäismäärä] = 'Tieto puuttuu'
		,[jarjestys Ei maksuttomien opiskelijavuosien enimmäismäärä] = 999999
		,[Vaativan erityisen tuen opiskelijavuosien enimmäismäärä] = 'Tieto puuttuu'
		,[jarjestys Vaativan erityisen tuen opiskelijavuosien enimmäismäärä] = 999999
		,[Luvaton koulutus] = 'Tieto puuttuu'
		,[Luvaton majoitus] = 'Tieto puuttuu'
		,[Luvaton korotustekijä] = 'Tieto puuttuu'
		,[Luvanmukainen suorituskieli] = 'Tieto puuttuu'
		,jarj_luvaton_koulutus = 99
		,jarj_luvaton_majoitus = 99
		,jarj_luvaton_korotustekija = 99
		,jarj_suorituskieli_luvanmukainen = 99
	
		,apusarake_opiskelijavuodet_painottamaton = cast(null as decimal(30,20))
		,apusarake_opiskelijavuodet_painotettu_lahtotaso = cast(null as decimal(30,20))
		,apusarake_opiskelijavuodet_painotettu_kustannusryhma = cast(null as decimal(30,20))
		,apusarake_opiskelijavuodet_painotettu_erityistuki = cast(null as decimal(30,20))
		,apusarake_opiskelijavuodet_painotettu_majoitus = cast(null as decimal(30,20))
		,apusarake_opv_ei_maksuton_kerroin = cast(null as decimal(30,29))

		,apusarake_painottamaton_tutkinnot = cast(null as decimal(30,20))
		,apusarake_painottamaton_osaamispisteet = cast(null as decimal(30,20))
		,apusarake_osaamispisteet_kerroin = cast(null as decimal(30,29))
		,apusarake_painotettu_tutkinnot = cast(null as decimal(30,20))

		,apusarake_lkm = cast(null as int)

		,apusarake_pisteet = cast(sum([pisteet]) as decimal(30,20))
		,apusarake_painotetut_pisteet = cast(sum([painotetut_pisteet]) as decimal(30,20))

	FROM [dw].[v_amos_palautteet]
	
	WHERE [Toteuma/Estimaatti] = 'Estimaatti'

	GROUP BY 
		[Toteuma/Estimaatti]
		,[Varainhoitovuosi]
		,[Rahoituskausi (palautteet)]
		,[Tilastokausi]
		,Tilastovuosi
		,[Järjestäjärakenne]
		,[Toiminnanohjauksen kokeilu]
		,[jarjestys Toiminnanohjauksen kokeilu]
		,[Koul. järjestäjän PILKE-alue (kokeilu)]
		,[jarjestys Koul. järjestäjän PILKE-alue (kokeilu)]
		,[Kokonaisuus]
		,[Kysely]
		,[Kyselyn kohderyhmä]
		,[Koulutuksen järjestäjä]
		,[Koulutuksen järjestäjän kunta]
		,[Koulutuksen järjestäjän maakunta]
		,[Koodit Koulutuksen järjestäjä]
		,[jarj Koulutuksen järjestäjän maakunta]
		,Oppilaitos
		,[Oppilaitoksen kunta]
		,[Oppilaitoksen maakunta]
		,Tutkintotyyppi
		,Tutkinto
		,[Koodit Tutkinto]
		,[Koulutusala, taso 1]
		,[jarjestys Koulutusala, taso 1]
		,[Koulutusala, taso 2]
		,[jarjestys Koulutusala, taso 2]
		,[Koulutusala, taso 3]
		,[jarjestys Koulutusala, taso 3]

	UNION ALL

	--tyollistyminen_ja_jatkoopiskelu, suppea sisältö
	SELECT 
		suppea_sisalto_1_0 = 1
		,laaja_sisalto_1_0 = 0
		,[Toteuma/Estimaatti]
		,[Varainhoitovuosi]
		,[Rahoituskausi (pl. palautteet)] = [Rahoituskausi]
		,[Rahoituskausi (palautteet)] = ' Tieto puuttuu'
		,[Tilastokausi]
		,[Tilastovuosi]
		,[Järjestäjärakenne]
		,[Toiminnanohjauksen kokeilu]
		,[jarj Toiminnanohjauksen kokeilu]
		,[Koul. järjestäjän PILKE-alue (kokeilu)]
		,[jarj Koul. järjestäjän PILKE-alue (kokeilu)]
		,[Kokonaisuus] = 'Työllistyminen ja jatko-opiskelu' 

		,[Suorituksen tyyppi] --= [Koulutuksen tavoite]

		,[Korkeakouluopiskelija]
		,[Työllinen]

		,[Kysely] = 'Tieto puuttuu'
		,[Kyselyn kohderyhmä] = 'Tieto puuttuu'

		,[Koulutuksen järjestäjä]
		,[Koulutuksen järjestäjän kunta]
		,[Koulutuksen järjestäjän maakunta]
		,[Koodit Koulutuksen järjestäjä]
		,[jarj Koulutuksen järjestäjän maakunta]
		,[Hankintakoulutuksen järjestäjä] = 'Tieto puuttuu'
		,[Koodit Hankintakoulutuksen järjestäjä] = '-1'
		,Oppilaitos = 'Tieto puuttuu'
		,[Oppilaitoksen kunta] = 'Tieto puuttuu'
		,[Oppilaitoksen maakunta] = 'Tieto puuttuu'
		,jarj_oppilaitoksen_maakunta = 99999
		,Toimipiste = 'Tieto puuttuu'
		,[Toimipisteen kunta] = 'Tieto puuttuu'
		,[Toimipisteen maakunta] = 'Tieto puuttuu'
		,jarjestys_toimipisteen_maakunta = 99999

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

		,[Maksuttomuus (rahoitus)] = 'Tieto puuttuu'
		,[Maksuttomuus (simulointi)] = 'Tieto puuttuu'
		,Majoitus = 'Tieto puuttuu'
		,[Vaativa erityinen tuki] = 'Tieto puuttuu'
		,[jarjestys Vaativa erityinen tuki]	= 9
		,[Kustannusryhmä] = 'Tieto puuttuu'
		,[jarj_kustannusryhma] = 99
		,Tutkintotyyppi = 'Tieto puuttuu'
		,[Tutkintotyyppi (rahoitus)] = 'Tieto puuttuu'
		,[jarjestys Tutkintotyyppi rahoitus] = 9
		,Tutkinto = 'Tieto puuttuu'
		,[Koodit Tutkinto] = -1
		,[Koulutusala, taso 1] = 'Tieto puuttuu'
		,jarj_koulutusala_taso1 = 99999
		,[Koulutusala, taso 2] = 'Tieto puuttuu'
		,jarj_koulutusala_taso2 = 99999
		,[Koulutusala, taso 3] = 'Tieto puuttuu'
		,jarj_koulutusala_taso3 = 99999
		,[Rahoitusmuoto hyväksytään] = 'Rahoitusmuoto hyväksytään'
		,Rahoitusmuoto = 'Tieto puuttuu'
		,jarj_rahoitusmuoto	= 99
		,Työvoimakoulutus = 'Tieto puuttuu'
		,Suorituskieli = 'Tieto puuttuu'
		,jarj_suorituskieli = '99'
		,Hankintakoulutus = 'Tieto puuttuu'
		,Oppisopimuskoulutus = 'Tieto puuttuu'
		,Vankilaopetus = 'Tieto puuttuu'
	
		,[Ei maksuttomien opiskelijavuosien enimmäismäärä] = 'Tieto puuttuu'
		,[jarjestys Ei maksuttomien opiskelijavuosien enimmäismäärä] = 999999
		,[Vaativan erityisen tuen opiskelijavuosien enimmäismäärä] = 'Tieto puuttuu'
		,[jarjestys Vaativan erityisen tuen opiskelijavuosien enimmäismäärä] = 999999
		,[Luvaton koulutus] = 'Tieto puuttuu'
		,[Luvaton majoitus] = 'Tieto puuttuu'
		,[Luvaton korotustekijä] = 'Tieto puuttuu'
		,[Luvanmukainen suorituskieli] = 'Tieto puuttuu'
		,jarj_luvaton_koulutus = 99
		,jarj_luvaton_majoitus = 99
		,jarj_luvaton_korotustekija = 99
		,jarj_suorituskieli_luvanmukainen = 99
	
		,apusarake_opiskelijavuodet_painottamaton = cast(null as decimal(30,20))
		,apusarake_opiskelijavuodet_painotettu_lahtotaso = cast(null as decimal(30,20))
		,apusarake_opiskelijavuodet_painotettu_kustannusryhma = cast(null as decimal(30,20))
		,apusarake_opiskelijavuodet_painotettu_erityistuki = cast(null as decimal(30,20))
		,apusarake_opiskelijavuodet_painotettu_majoitus = cast(null as decimal(30,20))
		,apusarake_opv_ei_maksuton_kerroin = cast(null as decimal(30,29))

		,apusarake_painottamaton_tutkinnot = cast(null as decimal(30,20))
		,apusarake_painottamaton_osaamispisteet = cast(null as decimal(30,20))
		,apusarake_osaamispisteet_kerroin = cast(null as decimal(30,29))
		,apusarake_painotettu_tutkinnot = cast(null as decimal(30,20))

		,apusarake_lkm = sum(lkm)

		,apusarake_pisteet = cast(null as decimal(30,20))
		,apusarake_painotetut_pisteet = cast(null as decimal(30,20))

	FROM [dw].[v_amos_tyollistyminen_ja_jatkoopiskelu]

	WHERE 1=1
	AND [jarj Työllisen määritelmä] = 2 --'Väh. 2 kk työllisenä'
	AND [jarj Työllisen määritelmä (palkansaaja)] = 2 
	AND [jarj Työllisen määritelmä (yrittäjä)] = 2 
	AND [Työllinen ennen koulutusta] = 'Ei työllinen ennen koulutuksen alkamisvuotta'
	AND [Toteuma/Estimaatti] = 'Estimaatti'

	GROUP BY 
		[Toteuma/Estimaatti]
		,[Varainhoitovuosi]
		,[Rahoituskausi]
		,[Tilastokausi]
		,[Tilastovuosi]
		,[Järjestäjärakenne]
		,[Toiminnanohjauksen kokeilu]
		,[jarj Toiminnanohjauksen kokeilu]
		,[Koul. järjestäjän PILKE-alue (kokeilu)]
		,[jarj Koul. järjestäjän PILKE-alue (kokeilu)]
		,[Suorituksen tyyppi]
		,[Korkeakouluopiskelija]
		,[Työllinen]
		,[Koulutuksen järjestäjä]
		,[Koulutuksen järjestäjän kunta]
		,[Koulutuksen järjestäjän maakunta]
		,[Koodit Koulutuksen järjestäjä]
		,[jarj Koulutuksen järjestäjän maakunta]

	UNION ALL

	--tyollistyminen_ja_jatkoopiskelu, laaja sisältö
	SELECT
		suppea_sisalto_1_0 = 0
		,laaja_sisalto_1_0 = 1
		,[Toteuma/Estimaatti]
		,[Varainhoitovuosi]
		,[Rahoituskausi (pl. palautteet)] = [Rahoituskausi]
		,[Rahoituskausi (palautteet)] = ' Tieto puuttuu'
		,[Tilastokausi]
		,[Tilastovuosi]
		,[Järjestäjärakenne]
		,[Toiminnanohjauksen kokeilu]
		,[jarj Toiminnanohjauksen kokeilu]
		,[Koul. järjestäjän PILKE-alue (kokeilu)]
		,[jarj Koul. järjestäjän PILKE-alue (kokeilu)]
		,[Kokonaisuus] = 'Työllistyminen ja jatko-opiskelu' 

		,[Suorituksen tyyppi] --= [Koulutuksen tavoite]

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

		,[Maksuttomuus (rahoitus)] = 'Tieto puuttuu'
		,[Maksuttomuus (simulointi)] = 'Tieto puuttuu'
		,Majoitus = 'Tieto puuttuu'
		,[Vaativa erityinen tuki] = 'Tieto puuttuu'
		,[jarjestys Vaativa erityinen tuki]	= 9
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
		
		,[Ei maksuttomien opiskelijavuosien enimmäismäärä] = 'Tieto puuttuu'
		,[jarjestys Ei maksuttomien opiskelijavuosien enimmäismäärä] = 999999
		,[Vaativan erityisen tuen opiskelijavuosien enimmäismäärä] = 'Tieto puuttuu'
		,[jarjestys Vaativan erityisen tuen opiskelijavuosien enimmäismäärä] = 999999
		,[Luvaton koulutus] = 'Tieto puuttuu'
		,[Luvaton majoitus] = 'Tieto puuttuu'
		,[Luvaton korotustekijä] = 'Tieto puuttuu'
		,[Luvanmukainen suorituskieli] = 'Tieto puuttuu'
		,jarj_luvaton_koulutus = 99
		,jarj_luvaton_majoitus = 99
		,jarj_luvaton_korotustekija = 99
		,jarj_suorituskieli_luvanmukainen = 99
	
		,apusarake_opiskelijavuodet_painottamaton = cast(null as decimal(30,20))
		,apusarake_opiskelijavuodet_painotettu_lahtotaso = cast(null as decimal(30,20))
		,apusarake_opiskelijavuodet_painotettu_kustannusryhma = cast(null as decimal(30,20))
		,apusarake_opiskelijavuodet_painotettu_erityistuki = cast(null as decimal(30,20))
		,apusarake_opiskelijavuodet_painotettu_majoitus = cast(null as decimal(30,20))
		,apusarake_opv_ei_maksuton_kerroin = cast(null as decimal(30,29))

		,apusarake_painottamaton_tutkinnot = cast(null as decimal(30,20))
		,apusarake_painottamaton_osaamispisteet = cast(null as decimal(30,20))
		,apusarake_osaamispisteet_kerroin = cast(null as decimal(30,29))
		,apusarake_painotettu_tutkinnot = cast(null as decimal(30,20))

		,apusarake_lkm = sum(lkm)

		,apusarake_pisteet = cast(null as decimal(30,20))
		,apusarake_painotetut_pisteet = cast(null as decimal(30,20))

	FROM [dw].[v_amos_tyollistyminen_ja_jatkoopiskelu]

	WHERE 1=1
	AND [jarj Työllisen määritelmä] = 2 --'Väh. 2 kk työllisenä'
	AND [jarj Työllisen määritelmä (palkansaaja)] = 2 
	AND [jarj Työllisen määritelmä (yrittäjä)] = 2 
	AND [Työllinen ennen koulutusta] = 'Ei työllinen ennen koulutuksen alkamisvuotta'
	AND [Toteuma/Estimaatti] = 'Estimaatti'

	GROUP BY 
		[Toteuma/Estimaatti]
		,[Varainhoitovuosi]
		,[Rahoituskausi]
		,[Tilastokausi]
		,[Tilastovuosi]
		,[Järjestäjärakenne]
		,[Koulutuksen järjestäjä]
		,[Koulutuksen järjestäjän kunta]
		,[Koulutuksen järjestäjän maakunta]
		,[Koodit Koulutuksen järjestäjä]
		,[jarj Koulutuksen järjestäjän maakunta]
		,[Toiminnanohjauksen kokeilu]
		,[jarj Toiminnanohjauksen kokeilu]
		,[Koul. järjestäjän PILKE-alue (kokeilu)]
		,[jarj Koul. järjestäjän PILKE-alue (kokeilu)]
		,[Suorituksen tyyppi]
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

) q

LEFT JOIN dw.f_amos_koonti_rahoitusperusteet f 
	ON f.ytunnus_amos_spl = q.[Koodit Koulutuksen järjestäjä]
	AND f.[Varainhoitovuosi] = q.Varainhoitovuosi
	--AND f.[Toteuma/Estimaatti] = q.[Toteuma/Estimaatti]

GO
