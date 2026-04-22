USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER VIEW [dw].[v_amos_tyollistyminen_ja_jatkoopiskelu_tutkinnoittain] AS

SELECT 
	[Varainhoitovuosi] 
	,[Toteuma/Estimaatti] = 'Toteuma'
	,[Rahoituskausi]
	,[Tilastokausi]
	,[Tilastovuosi]
	,[Suorituskausi]
	,[Suoritusvuosi]

	,[Koulutuksen alkamisvuosi] = coalesce(nullif([alvv],'9999'), -1)
	,[Suorituksen tyyppi] = case [toteuma_tutk] when '1' then 'Koko tutkinto' when '2' then 'Tutkinnon osa/osia' end
	,[Tutkinto] = d5.koulutusluokitus_fi
	,[Tutkintotyyppi] = 
		case d5.tutkintotyyppi_koodi
			when '02' then 'Ammatilliset perustutkinnot'
			when '19' then 'Ammattitutkinnot'
			when '20' then 'Erikoisammattitutkinnot'
		end
	,[Tutkintotyyppi (rahoitus)] = 
		case 
			when d5.tutkintotyyppi_koodi = '02' or (tyov = '1' and d5.tutkintotyyppi_koodi in ('19','20')) then 'Pt, työvoimak. at, työvoimak. eat'
			when d5.tutkintotyyppi_koodi in ('19','20') then 'At (pl. työvoimak.), eat (pl. työvoimak.)'
		end
	,[Koulutusala, taso 1] = d5.koulutusalataso1_fi
	,[Koulutusala, taso 2] = d5.koulutusalataso2_fi
	,[Koulutusala, taso 3] = d5.koulutusalataso3_fi
	,[Oppisopimuskoulutus] = case oppis when 1 then 'Oppisopimuskoulutus' when 2 then 'Ei oppisopimuskoulutus' end
	,[Työvoimakoulutus] = case tyov when 1 then 'Työvoimakoulutus' when 2 then 'Ei työvoimakoulutus' end
	,[Rahoitusmuoto] = d4.selite_fi
	,[Hankintakoulutus] = case when jarj_tutk is not null then 'Hankintakoulutus' else 'Ei hankintakoulutus' end
	,[Pohjakoulutuksen koulutusaste, taso 2] = coalesce(oa.koulutusastetaso2_fi, 'Tieto puuttuu')
	
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

	,[Työllinen ennen koulutusta] = 
		case 
			when [ek_tyollinen] = '1' then 'Työllinen ennen koulutuksen alkamisvuotta'
			else 'Ei työllinen ennen koulutuksen alkamisvuotta'
		end
	,[Korkeakouluopiskelija] = 
		case 
			when [jk_opisk] = '1' then 'Korkeakouluopiskelija' 
			else 'Ei korkeakouluopiskelija' 
		end
	,[Työllinen] = 
		case 
			when [jk_tyollinen_2kk] = '1' then 'Työllinen' 
			else 'Ei työllinen' 
		end
	,[Sijoittuminen] = 
		case
			when [jk_tyollinen_2kk] = '1' and [jk_opisk] = '2' then 'Työllinen, Ei korkeakouluopiskelija' 
			when [jk_tyollinen_2kk] = '1' and [jk_opisk] = '1' then 'Työllinen, Korkeakouluopiskelija'
			when [jk_tyollinen_2kk] = '2' and [jk_opisk] = '1' then 'Korkeakouluopiskelija, Ei työllinen'
			when [jk_tyollinen_2kk] = '2' and [jk_opisk] = '2' then 'Ei työllinen, Ei korkeakouluopiskelija'
		end
	
	--koodit
	,[Koodit Koulutuksen järjestäjä] = coalesce(d1.ytunnus_amos_spl, [jarj_opisk])
	,[Koodit Hankintakoulutuksen järjestäjä] = coalesce(d2.ytunnus_amos_spl, [jarj_tutk], '-1')
	,[Koodit Tutkinto] = v.tutk

	--jarjestys
	,[jarj Tutkintotyyppi] = d5.tutkintotyyppi_koodi
	,[jarj Tutkintotyyppi (rahoitus)] = 
		case 
			when d5.tutkintotyyppi_koodi = '02' or (tyov = '1' and d5.tutkintotyyppi_koodi in ('19','20')) then 1 --'Pt, työvoimak. at, työvoimak. eat'
			when d5.tutkintotyyppi_koodi in ('19','20') then 2 --'At (pl. työvoimak.), eat (pl. työvoimak.)'
			else 9 --'Tieto puuttuu'
		end
	,[jarj Koulutusala, taso 1] = d5.jarjestys_koulutusalataso1_koodi
	,[jarj Koulutusala, taso 2] = d5.jarjestys_koulutusalataso2_koodi
	,[jarj Koulutusala, taso 3] = d5.jarjestys_koulutusalataso3_koodi
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
	,[jarj Sijoittuminen] = 
		case
			when [jk_tyollinen_2kk] = '1' and [jk_opisk] = '2' then 1 --'Työllinen, Ei korkeakouluopiskelija' 
			when [jk_tyollinen_2kk] = '1' and [jk_opisk] = '1' then 2 --'Työllinen, Korkeakouluopiskelija'
			when [jk_tyollinen_2kk] = '2' and [jk_opisk] = '1' then 3 --'Korkeakouluopiskelija, Ei työllinen'
			when [jk_tyollinen_2kk] = '2' and [jk_opisk] = '2' then 4 --'Ei työllinen, Ei korkeakouluopiskelija'
		end

	--apusarake
	,[lkm]
	
FROM [dw].[v_TK_K1_13c] v
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d1 on d1.ytunnus_avain = jarj_opisk
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d2 on d2.ytunnus_avain = coalesce(jarj_tutk, '-1')
LEFT JOIN dw.d_alueluokitus d3 on d3.kunta_koodi = coalesce(d1.kunta_koodi, '-1')
LEFT JOIN dw.d_opintojenrahoitus d4 on d4.koodi = v.rahoitus
LEFT JOIN dw.d_koulutusluokitus d5 on d5.koulutusluokitus_koodi = v.tutk
LEFT JOIN (
	select distinct
		koulutusastetaso2_koodi
		,koulutusastetaso2_fi--, koulutusastetaso2_sv, koulutusastetaso2_en
	from dw.d_koulutusluokitus
	where koulutusastetaso2_koodi != '-1'
) oa on oa.koulutusastetaso2_koodi = v.kaste_t2_e

GO
