USE [ANTERO]
GO

/****** Object:  View [dw].[v_amos_tyollistyminen_ja_jatkoopiskelu]    Script Date: 1.12.2025 10.19.39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dw].[v_amos_tyollistyminen_ja_jatkoopiskelu] AS

SELECT 
	[Toteuma/Estimaatti] = case when v.generoitu = 1 then 'Estimaatti' else 'Toteuma' end
	,[Varainhoitovuosi] 
	,[Rahoituskausi]
	,[Tilastokausi]
	,[Tilastovuosi]
	,[Suorituskausi]
	,[Suoritusvuosi]
	,[Pohjakoulutuksen suoritusvuosi] = coalesce(nullif(v.suorv_e, 9999), -1)

	,[Vaikuttavuusrahoituksen peruste] = 'Työllistyminen ja jatko-opintoihin siirtyminen' --poistuva

	,[Koulutuksen alkamisvuosi] = coalesce(nullif([alvv],'9999'), -1)
	,[Suorituksen tyyppi] = case [toteuma_tutk] when '1' then 'Koko tutkinto' when '2' then 'Tutkinnon osa/osia' end
	,[Koulutusala, taso 1] = v.kala_t1ni
	,[Tutkintotyyppi] = 
		case kaste_t2
			when '32' then 'Ammatilliset perustutkinnot'
			when '33' then 'Ammattitutkinnot'
			when '41' then 'Erikoisammattitutkinnot'
		end
	,[Tutkintotyyppi (rahoitus)] = 
		case 
			when kaste_t2 = '32' or (tyov = '1' and kaste_t2 in ('33','41')) then 'Pt, työvoimak. at, työvoimak. eat'
			when kaste_t2 in ('33','41') then 'At (pl. työvoimak.), eat (pl. työvoimak.)'
		end
	,[Oppisopimuskoulutus] = case oppis when 1 then 'Oppisopimuskoulutus' when 2 then 'Ei oppisopimuskoulutus' end
	,[Työvoimakoulutus] = case tyov when 1 then 'Työvoimakoulutus' when 2 then 'Ei työvoimakoulutus' end
	,[Rahoitusmuoto] = d4.selite_fi
	,[Hankintakoulutus] = case when jarj_tutk is not null then 'Hankintakoulutus' else 'Ei hankintakoulutus' end
	,[Pohjakoulutuksen koulutusaste, taso 2] = coalesce(nullif(v.kaste_t2ni_e, 'P'), 'Tieto puuttuu')
	
	,[Järjestäjärakenne] = case when d1.sisaltyy_amos_spl = 1 then 'Viimeisin suoritepäätös' else 'Poistuneet järjestäjät' end
	,[Koulutuksen järjestäjä] = d1.nimi_amos_spl
	,[Koulutuksen järjestäjän kunta] = d3.kunta_fi
	,[Koulutuksen järjestäjän maakunta] = d3.maakunta_fi
	,d1.[Toiminnanohjauksen kokeilu]
	,d1.[Koul. järjestäjän PILKE-alue (kokeilu)]
	,[Hankintakoulutuksen järjestäjä] = d2.nimi_amos_spl

	,[Ikä (maksuttomuusraja)] = 
		case [ikar21]
			when '1' then '20 tai alle'
			when '2' then '20 tai alle'
			when '3' then '21 tai yli'
			else 'Tieto puuttuu'
		end
	,[Ikä suoritusvuonna] = 
		case [ikar21]
			when '1' then '19 tai alle'
			when '2' then '20'
			when '3' then '21 tai yli'
			else 'Tieto puuttuu'
		end
	,[Äidinkieli (ryhmä)] = 
		case aikielir1 
			when 'fs' then 'suomi (sis. saame)'
			when 'sv' then 'ruotsi'
			when '99' then 'muut kielet'
			else 'Tieto puuttuu'
		end

	,[Toiminta ennen koulutusta] = 
		case 
			when [ptoim1r2e] = '10' then 'Päätoiminen työllinen'
			when [ptoim1r2e] = '12' then 'Työtön'
			when [ptoim1r2e] = '13' then 'Työllinen opiskelija'
			when [ptoim1r2e] = '22' then 'Päätoiminen opiskelija, koululainen'
			when [ptoim1r2e] = '25' then 'Varusmies, siiviipalvelusmies'
			when [ptoim1r2e] = '26' then 'Eläkeläinen'
			when [ptoim1r2e] = '99' then 'Muu tai tuntematon'
			else 'Tieto puuttuu'
		end
	,[Työllinen ennen koulutusta] = 
		case 
			when [ptoim1r2e] in ('10','13') then 'Työllinen ennen koulutuksen alkamisvuotta'
			else 'Ei työllinen ennen koulutuksen alkamisvuotta'
		end

	,[Korkeakouluopiskelija] = 
		case 
			when /*[opisk_kk] = '1'*/ [opisk_syys] = '1' or [opisk_tammi] = '1' then 'Korkeakouluopiskelija' 
			else 'Ei korkeakouluopiskelija' 
		end

	,[Työllisen määritelmä] = 'Väh. ' + cast(ca.min_kk_tyollisena as varchar) + ' kk työllisenä'
	,[Työllisen määritelmä (palkansaaja)] = 'Väh. ' + cast(ca_palkansaaja.min_kk_tyollisena as varchar) + ' kk työllisenä palkansaajana'
	,[Työllisen määritelmä (yrittäjä)] = 'Väh. ' + cast(ca_yrittaja.min_kk_tyollisena as varchar) + ' kk työllisenä yrittäjänä'

	,[Työllinen] = 
		case 
			when 		
				case when [ptoim1r2_tilv_07] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilv_08] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilv_09] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilv_10] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilv_11] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilv_12] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilvseur_01] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilvseur_02] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilvseur_03] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilvseur_04] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilvseur_05] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilvseur_06] in ('11','13') then 1 else 0 end
				>= ca.min_kk_tyollisena
				or
				case when [amas_tilv_07] = '1' and [ptoim1r2_tilv_07] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_08] = '1' and [ptoim1r2_tilv_08] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_09] = '1' and [ptoim1r2_tilv_09] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_10] = '1' and [ptoim1r2_tilv_10] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_11] = '1' and [ptoim1r2_tilv_11] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_12] = '1' and [ptoim1r2_tilv_12] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_01] = '1' and [ptoim1r2_tilvseur_01] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_02] = '1' and [ptoim1r2_tilvseur_02] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_03] = '1' and [ptoim1r2_tilvseur_03] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_04] = '1' and [ptoim1r2_tilvseur_04] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_05] = '1' and [ptoim1r2_tilvseur_05] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_06] = '1' and [ptoim1r2_tilvseur_06] in ('11','13') then 1 else 0 end
				>= ca_palkansaaja.min_kk_tyollisena
				or			
				case when [amas_tilv_07] = '2' and [ptoim1r2_tilv_07] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_08] = '2' and [ptoim1r2_tilv_08] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_09] = '2' and [ptoim1r2_tilv_09] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_10] = '2' and [ptoim1r2_tilv_10] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_11] = '2' and [ptoim1r2_tilv_11] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_12] = '2' and [ptoim1r2_tilv_12] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_01] = '2' and [ptoim1r2_tilvseur_01] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_02] = '2' and [ptoim1r2_tilvseur_02] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_03] = '2' and [ptoim1r2_tilvseur_03] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_04] = '2' and [ptoim1r2_tilvseur_04] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_05] = '2' and [ptoim1r2_tilvseur_05] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_06] = '2' and [ptoim1r2_tilvseur_06] in ('11','13') then 1 else 0 end
				>= ca_yrittaja.min_kk_tyollisena
			then 'Työllinen' 
			else 'Ei työllinen' 
		end
	,[Työllinen (palkansaaja)] = 
		case 
			when 		
				case when [amas_tilv_07] = '1' and [ptoim1r2_tilv_07] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_08] = '1' and [ptoim1r2_tilv_08] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_09] = '1' and [ptoim1r2_tilv_09] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_10] = '1' and [ptoim1r2_tilv_10] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_11] = '1' and [ptoim1r2_tilv_11] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_12] = '1' and [ptoim1r2_tilv_12] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_01] = '1' and [ptoim1r2_tilvseur_01] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_02] = '1' and [ptoim1r2_tilvseur_02] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_03] = '1' and [ptoim1r2_tilvseur_03] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_04] = '1' and [ptoim1r2_tilvseur_04] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_05] = '1' and [ptoim1r2_tilvseur_05] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_06] = '1' and [ptoim1r2_tilvseur_06] in ('11','13') then 1 else 0 end
				>= ca_palkansaaja.min_kk_tyollisena
			then 'Työllinen (palkansaaja)' 
			else 'Ei työllinen (palkansaaja)' 
		end
	,[Työllinen (yrittäjä)] = 
		case 
			when 		
				case when [amas_tilv_07] = '2' and [ptoim1r2_tilv_07] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_08] = '2' and [ptoim1r2_tilv_08] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_09] = '2' and [ptoim1r2_tilv_09] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_10] = '2' and [ptoim1r2_tilv_10] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_11] = '2' and [ptoim1r2_tilv_11] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_12] = '2' and [ptoim1r2_tilv_12] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_01] = '2' and [ptoim1r2_tilvseur_01] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_02] = '2' and [ptoim1r2_tilvseur_02] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_03] = '2' and [ptoim1r2_tilvseur_03] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_04] = '2' and [ptoim1r2_tilvseur_04] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_05] = '2' and [ptoim1r2_tilvseur_05] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_06] = '2' and [ptoim1r2_tilvseur_06] in ('11','13') then 1 else 0 end
				>= ca_yrittaja.min_kk_tyollisena
			then 'Työllinen (yrittäjä)' 
			else 'Ei työllinen (yrittäjä)' 
		end

	,[Sijoittuminen] = 
		case
			when (/*[opisk_kk] = '1'*/ [opisk_syys] = '1' or [opisk_tammi] = '1')
				or 
				case when [amas_tilv_07] = '1' and [ptoim1r2_tilv_07] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_08] = '1' and [ptoim1r2_tilv_08] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_09] = '1' and [ptoim1r2_tilv_09] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_10] = '1' and [ptoim1r2_tilv_10] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_11] = '1' and [ptoim1r2_tilv_11] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_12] = '1' and [ptoim1r2_tilv_12] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_01] = '1' and [ptoim1r2_tilvseur_01] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_02] = '1' and [ptoim1r2_tilvseur_02] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_03] = '1' and [ptoim1r2_tilvseur_03] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_04] = '1' and [ptoim1r2_tilvseur_04] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_05] = '1' and [ptoim1r2_tilvseur_05] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_06] = '1' and [ptoim1r2_tilvseur_06] in ('11','13') then 1 else 0 end
				>= ca_palkansaaja.min_kk_tyollisena
				or 
				case when [amas_tilv_07] = '2' and [ptoim1r2_tilv_07] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_08] = '2' and [ptoim1r2_tilv_08] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_09] = '2' and [ptoim1r2_tilv_09] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_10] = '2' and [ptoim1r2_tilv_10] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_11] = '2' and [ptoim1r2_tilv_11] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_12] = '2' and [ptoim1r2_tilv_12] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_01] = '2' and [ptoim1r2_tilvseur_01] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_02] = '2' and [ptoim1r2_tilvseur_02] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_03] = '2' and [ptoim1r2_tilvseur_03] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_04] = '2' and [ptoim1r2_tilvseur_04] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_05] = '2' and [ptoim1r2_tilvseur_05] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_06] = '2' and [ptoim1r2_tilvseur_06] in ('11','13') then 1 else 0 end
				>= ca_yrittaja.min_kk_tyollisena
				or
				case when [ptoim1r2_tilv_07] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilv_08] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilv_09] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilv_10] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilv_11] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilv_12] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilvseur_01] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilvseur_02] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilvseur_03] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilvseur_04] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilvseur_05] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilvseur_06] in ('11','13') then 1 else 0 end
				>= ca.min_kk_tyollisena
				then ' Työllinen tai korkeakouluopiskelija' 
			else 'Ei työllinen eikä korkeakouluopiskelija'
		end
	,[Sijoittuminen (priorisoitu)] = 
		case
			when /*[opisk_kk] = '1'*/ [opisk_syys] = '1' or [opisk_tammi] = '1' then 'Korkeakouluopiskelija' 
			when case when [amas_tilv_07] = '1' and [ptoim1r2_tilv_07] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_08] = '1' and [ptoim1r2_tilv_08] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_09] = '1' and [ptoim1r2_tilv_09] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_10] = '1' and [ptoim1r2_tilv_10] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_11] = '1' and [ptoim1r2_tilv_11] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_12] = '1' and [ptoim1r2_tilv_12] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_01] = '1' and [ptoim1r2_tilvseur_01] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_02] = '1' and [ptoim1r2_tilvseur_02] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_03] = '1' and [ptoim1r2_tilvseur_03] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_04] = '1' and [ptoim1r2_tilvseur_04] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_05] = '1' and [ptoim1r2_tilvseur_05] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_06] = '1' and [ptoim1r2_tilvseur_06] in ('11','13') then 1 else 0 end
				>= ca_palkansaaja.min_kk_tyollisena
				then 'Työllinen (palkansaaja)' 
			when case when [amas_tilv_07] = '2' and [ptoim1r2_tilv_07] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_08] = '2' and [ptoim1r2_tilv_08] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_09] = '2' and [ptoim1r2_tilv_09] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_10] = '2' and [ptoim1r2_tilv_10] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_11] = '2' and [ptoim1r2_tilv_11] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_12] = '2' and [ptoim1r2_tilv_12] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_01] = '2' and [ptoim1r2_tilvseur_01] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_02] = '2' and [ptoim1r2_tilvseur_02] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_03] = '2' and [ptoim1r2_tilvseur_03] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_04] = '2' and [ptoim1r2_tilvseur_04] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_05] = '2' and [ptoim1r2_tilvseur_05] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_06] = '2' and [ptoim1r2_tilvseur_06] in ('11','13') then 1 else 0 end
				>= ca_yrittaja.min_kk_tyollisena
				then 'Työllinen (yrittäjä)' 
			when case when [ptoim1r2_tilv_07] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilv_08] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilv_09] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilv_10] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilv_11] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilv_12] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilvseur_01] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilvseur_02] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilvseur_03] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilvseur_04] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilvseur_05] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilvseur_06] in ('11','13') then 1 else 0 end
				>= ca.min_kk_tyollisena
				then 'Työllinen' 
			else 'Ei työllinen eikä korkeakouluopiskelija'
		end

	,[Työllisenä (kk), koko tilastokausi] = 
		case when [ptoim1r2_tilv_07] in ('11','13') then 1 else 0 end
		+case when [ptoim1r2_tilv_08] in ('11','13') then 1 else 0 end
		+case when [ptoim1r2_tilv_09] in ('11','13') then 1 else 0 end
		+case when [ptoim1r2_tilv_10] in ('11','13') then 1 else 0 end
		+case when [ptoim1r2_tilv_11] in ('11','13') then 1 else 0 end
		+case when [ptoim1r2_tilv_12] in ('11','13') then 1 else 0 end
		+case when [ptoim1r2_tilvseur_01] in ('11','13') then 1 else 0 end
		+case when [ptoim1r2_tilvseur_02] in ('11','13') then 1 else 0 end
		+case when [ptoim1r2_tilvseur_03] in ('11','13') then 1 else 0 end
		+case when [ptoim1r2_tilvseur_04] in ('11','13') then 1 else 0 end
		+case when [ptoim1r2_tilvseur_05] in ('11','13') then 1 else 0 end
		+case when [ptoim1r2_tilvseur_06] in ('11','13') then 1 else 0 end

	,[Työvoimassa (kk), koko tilastokausi] = 
		case when [ptoim1r2_tilv_07] in ('11','13','12') then 1 else 0 end
		+case when [ptoim1r2_tilv_08] in ('11','13','12') then 1 else 0 end
		+case when [ptoim1r2_tilv_09] in ('11','13','12') then 1 else 0 end
		+case when [ptoim1r2_tilv_10] in ('11','13','12') then 1 else 0 end
		+case when [ptoim1r2_tilv_11] in ('11','13','12') then 1 else 0 end
		+case when [ptoim1r2_tilv_12] in ('11','13','12') then 1 else 0 end
		+case when [ptoim1r2_tilvseur_01] in ('11','13','12') then 1 else 0 end
		+case when [ptoim1r2_tilvseur_02] in ('11','13','12') then 1 else 0 end
		+case when [ptoim1r2_tilvseur_03] in ('11','13','12') then 1 else 0 end
		+case when [ptoim1r2_tilvseur_04] in ('11','13','12') then 1 else 0 end
		+case when [ptoim1r2_tilvseur_05] in ('11','13','12') then 1 else 0 end
		+case when [ptoim1r2_tilvseur_06] in ('11','13','12') then 1 else 0 end
	
	--koodit
	,[Koodit Koulutuksen järjestäjä] = coalesce(d1.ytunnus_amos_spl, [jarj_opisk])
	,[Koodit Hankintakoulutuksen järjestäjä] = coalesce(d2.ytunnus_amos_spl, [jarj_tutk], '-1')

	--jarjestys
	,[jarj Koulutusala, taso 1] = v.iscfibroad2013
	,[jarj Tutkintotyyppi] = v.kaste_t2
	,[jarj Tutkintotyyppi (rahoitus)] = 
		case 
			when kaste_t2 = '32' or (tyov = '1' and kaste_t2 in ('33','41')) then 1 --'Pt, työvoimak. at, työvoimak. eat'
			when kaste_t2 in ('33','41') then 2 --'At (pl. työvoimak.), eat (pl. työvoimak.)'
			else 9 --'Tieto puuttuu'
		end
	,[jarj Rahoitusmuoto] = d4.jarjestys_koodi
	,[jarj Pohjakoulutuksen koulutusaste, taso 2] = v.kaste_t2_e
	,[jarj Toiminnanohjauksen kokeilu] = d1.[jarjestys Toiminnanohjauksen kokeilu]
	,[jarj Koul. järjestäjän PILKE-alue (kokeilu)] = d1.[jarjestys Koul. järjestäjän PILKE-alue (kokeilu)]
	,[jarj Koulutuksen järjestäjän maakunta] = d3.jarjestys_maakunta_koodi
	,[jarj Äidinkieli (ryhmä)] = 
		case aikielir1 
			when 'fs' then 1 --'suomi (sis. saame)'
			when 'sv' then 2 --'ruotsi'
			when '99' then 3 --'muut kielet'
			else 99999 --'Tieto puuttuu'
		end
	,[jarj Toiminta ennen koulutusta] = coalesce([ptoim1r2e],'öö')
	,[jarj Työllisen määritelmä] = ca.min_kk_tyollisena
	,[jarj Työllisen määritelmä (palkansaaja)] = ca_palkansaaja.min_kk_tyollisena
	,[jarj Työllisen määritelmä (yrittäjä)] = ca_yrittaja.min_kk_tyollisena
	,[jarj Sijoittuminen (priorisoitu)] = 
		case
			when /*[opisk_kk] = '1'*/ [opisk_syys] = '1' or [opisk_tammi] = '1' then 1 --'Korkeakouluopiskelija' 
			when case when [amas_tilv_07] = '1' and [ptoim1r2_tilv_07] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_08] = '1' and [ptoim1r2_tilv_08] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_09] = '1' and [ptoim1r2_tilv_09] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_10] = '1' and [ptoim1r2_tilv_10] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_11] = '1' and [ptoim1r2_tilv_11] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_12] = '1' and [ptoim1r2_tilv_12] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_01] = '1' and [ptoim1r2_tilvseur_01] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_02] = '1' and [ptoim1r2_tilvseur_02] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_03] = '1' and [ptoim1r2_tilvseur_03] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_04] = '1' and [ptoim1r2_tilvseur_04] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_05] = '1' and [ptoim1r2_tilvseur_05] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_06] = '1' and [ptoim1r2_tilvseur_06] in ('11','13') then 1 else 0 end
				>= ca_palkansaaja.min_kk_tyollisena
				then 2 --'Työllinen (palkansaaja)' 
			when case when [amas_tilv_07] = '2' and [ptoim1r2_tilv_07] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_08] = '2' and [ptoim1r2_tilv_08] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_09] = '2' and [ptoim1r2_tilv_09] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_10] = '2' and [ptoim1r2_tilv_10] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_11] = '2' and [ptoim1r2_tilv_11] in ('11','13') then 1 else 0 end
				+case when [amas_tilv_12] = '2' and [ptoim1r2_tilv_12] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_01] = '2' and [ptoim1r2_tilvseur_01] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_02] = '2' and [ptoim1r2_tilvseur_02] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_03] = '2' and [ptoim1r2_tilvseur_03] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_04] = '2' and [ptoim1r2_tilvseur_04] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_05] = '2' and [ptoim1r2_tilvseur_05] in ('11','13') then 1 else 0 end
				+case when [amas_tilvseur_06] = '2' and [ptoim1r2_tilvseur_06] in ('11','13') then 1 else 0 end
				>= ca_yrittaja.min_kk_tyollisena
				then 3 --'Työllinen (yrittäjä)' 
			when case when [ptoim1r2_tilv_07] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilv_08] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilv_09] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilv_10] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilv_11] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilv_12] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilvseur_01] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilvseur_02] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilvseur_03] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilvseur_04] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilvseur_05] in ('11','13') then 1 else 0 end
				+case when [ptoim1r2_tilvseur_06] in ('11','13') then 1 else 0 end
				>= ca.min_kk_tyollisena
				then 4 --'Työllinen' 
			else 5 --'Ei työllinen eikä korkeakouluopiskelija'
		end

	--apusarake
	,[lkm]
	
FROM [dw].[v_TK_K1_13b] v
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d1 on d1.ytunnus_avain = jarj_opisk
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d2 on d2.ytunnus_avain = coalesce(jarj_tutk, '-1')
LEFT JOIN dw.d_alueluokitus d3 on d3.kunta_koodi = coalesce(d1.kunta_koodi, '-1')
LEFT JOIN dw.d_opintojenrahoitus d4 on d4.koodi = v.rahoitus
CROSS APPLY (
	select 1 min_kk_tyollisena union
	select 2 union
	select 3 union
	select 4 union
	select 5 union
	select 6 
	--union select 99 --tarvittaessa muiden kuin palkansaajana tai yrittäjänä työllistyneiden erottelemiseksi
) ca
CROSS APPLY (
	select 1 min_kk_tyollisena union
	select 2 union
	select 3 union
	select 4 union
	select 5 union
	select 6
) ca_palkansaaja
CROSS APPLY (
	select 1 min_kk_tyollisena union
	select 2 union
	select 3 union
	select 4 union
	select 5 union
	select 6
) ca_yrittaja 

WHERE 1=1
AND ca_palkansaaja.min_kk_tyollisena <= ca.min_kk_tyollisena
AND ca_yrittaja.min_kk_tyollisena <= ca.min_kk_tyollisena

GO
