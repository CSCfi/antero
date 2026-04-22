USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER VIEW [dw].[v_amos_tyollistyminen_ja_jatkoopiskelu_toimipisteittain] AS

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
	,[Koulutusala, taso 1] = oa2.koulutusalataso1_fi
	,[Oppisopimuskoulutus] = case oppis when 1 then 'Oppisopimuskoulutus' when 2 then 'Ei oppisopimuskoulutus' end
	,[Työvoimakoulutus] = case tyov when 1 then 'Työvoimakoulutus' when 2 then 'Ei työvoimakoulutus' end
	,[Rahoitusmuoto] = d4.selite_fi
	,[Hankintakoulutus] = case when jarj_tutk is not null then 'Hankintakoulutus' else 'Ei hankintakoulutus' end
	,[Pohjakoulutuksen koulutusaste, taso 2] = coalesce(oa.koulutusastetaso2_fi, 'Tieto puuttuu')
	
	,[Järjestäjärakenne] = case when d1.sisaltyy_amos_spl = 1 then 'Viimeisin suoritepäätös' else 'Poistuneet järjestäjät' end
	,d1.[Toiminnanohjauksen kokeilu]
	,d1.[Koul. järjestäjän PILKE-alue (kokeilu)]
	,[Koulutuksen järjestäjä] = d1.nimi_amos_spl
	,[Koulutuksen järjestäjän kunta] = d3.kunta_fi
	,[Koulutuksen järjestäjän maakunta] = d3.maakunta_fi
	,[Oppilaitos] = d1b.organisaatio_fi
	,[Toimipiste] = d1c.organisaatio_fi
	,[Hankintakoulutuksen järjestäjä] = d2.nimi_amos_spl
	,[Hankintakoulutuksen oppilaitos] = d2b.organisaatio_fi
	,[Hankintakoulutuksen toimipiste] = d2c.organisaatio_fi

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
	,[Koodit Oppilaitos] = coalesce(nullif(d1b.organisaatio_koodi, ''), '-1')
	,[Koodit Toimipiste (OID)] = coalesce(d1c.organisaatio_oid, '-1')
	,[Koodit Hankintakoulutuksen järjestäjä] = coalesce(d2.ytunnus_amos_spl, [jarj_tutk], '-1')
	,[Koodit Hankintakoulutuksen oppilaitos] = coalesce(nullif(d2b.organisaatio_koodi, ''), '-1')
	,[Koodit Hankintakoulutuksen toimipiste (OID)] = coalesce(d2c.organisaatio_oid, '-1')

	--jarjestys
	,[jarj Tutkintotyyppi] = v.kaste_t2
	,[jarj Tutkintotyyppi (rahoitus)] = 
		case 
			when v.kaste_t2 = '32' or (tyov = '1' and v.kaste_t2 in ('33','41')) then 1 --'Pt, työvoimak. at, työvoimak. eat'
			when v.kaste_t2 in ('33','41') then 2 --'At (pl. työvoimak.), eat (pl. työvoimak.)'
			else 9 --'Tieto puuttuu'
		end
	,[jarj Koulutusala, taso 1] = v.iscfibroad2013
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

FROM [dw].[v_TK_K1_13d] v
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d1 on d1.ytunnus_avain = jarj_opisk
LEFT JOIN dw.d_organisaatioluokitus d1b on d1b.organisaatio_oid = oppilaitos_opisk
LEFT JOIN dw.d_organisaatioluokitus d1c on d1c.organisaatio_oid = toimipiste_opisk
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d2 on d2.ytunnus_avain = coalesce(jarj_tutk, '-1')
LEFT JOIN dw.d_organisaatioluokitus d2b on d2b.organisaatio_oid = coalesce(oppilaitos_tutk, '-1')
LEFT JOIN dw.d_organisaatioluokitus d2c on d2c.organisaatio_oid = coalesce(toimipiste_tutk, '-1')
LEFT JOIN dw.d_alueluokitus d3 on d3.kunta_koodi = coalesce(d1.kunta_koodi, '-1')
LEFT JOIN dw.d_opintojenrahoitus d4 on d4.koodi = v.rahoitus
LEFT JOIN (
	select distinct
		koulutusastetaso2_koodi
		,koulutusastetaso2_fi--, koulutusastetaso2_sv, koulutusastetaso2_en
	from dw.d_koulutusluokitus
	where koulutusastetaso2_koodi != '-1'
) oa on oa.koulutusastetaso2_koodi = v.kaste_t2_e
LEFT JOIN (
	select distinct
		koulutusalataso1_koodi
		,koulutusalataso1_fi--, koulutusalataso1_sv, koulutusalataso1_en
	from dw.d_koulutusluokitus
	where koulutusalataso1_koodi != '-1'
) oa2 on oa2.koulutusalataso1_koodi = v.iscfibroad2013

GO
