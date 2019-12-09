USE [ANTERO]
GO

/****** Object:  View [dw].[v_amos_tutkinnot_ja_tutkinnonosat]    Script Date: 8.12.2019 22:03:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









ALTER VIEW [dw].[v_amos_tutkinnot_ja_tutkinnonosat] AS

SELECT 
	 [Tilastovuosi] = f.[tilastovuosi]
	,[Tilastokuukausi] = d6.kuukausi_fi

	,[Tutkinto] = d2.koulutusluokitus_fi
	,[Koulutusala, taso 1] = d2.koulutusalataso1_fi
	,[Koulutusala, taso 2] = d2.koulutusalataso2_fi
	,[Koulutusala, taso 3] = d2.koulutusalataso3_fi
	,[Tutkintotyyppi] = d2.tutkintotyyppi_fi
	
	,[Rahoitusmuoto] = d5.selite_fi
	,[Kustannusryhmä] = d7.selite_fi
	,[Oppisopimuskoulutus] = d4.selite_fi
	,[Erityisopetus] = d3.erityisopetus_nimi_fi
	,[Suorituksen tyyppi] = d8.selite_fi

	,[Koulutuksen järjestäjä] = d1.organisaatio_fi

	,[Koodit Koulutuksen järjestäjä] = d1.organisaatio_koodi
	,[Koodit Tutkinto] = d2.koulutusluokitus_koodi
	,[Koodit Tutkintotyyppi] = d2.tutkintotyyppi_koodi

    ,[painottamaton_tutkinnot]
    ,[painottamaton_osatutkinnot]
	,[painottamaton_osaamispisteet]

	,[painotettu_tutkinnot_pt_kr_pk]
    ,[painotettu_tutkinnot_at_eat_kr_pk]
    ,[painotettu_tutkinnot_erityistuki]
    ,[painotettu_tutkinnon_osien_osaamispisteet_pt_kr]
    ,[painotettu_tutkinnon_osien_osaamispisteet_at_eat_kr]
    ,[painotettu_tutkinnon_osien_osaamispisteet_erityistuki]
    ,[painotettu_tutkinnot_yht]
    ,[painotettu_tutkinnon_osien_osaamispisteet_yht]

	--oikaisutestausta
	,[oikaisu] = case when d1.organisaatio_koodi = '0155402-1' then 1 else 0 end
	,[painotettu_tutkinnon_osien_osaamispisteet_pt_kr_oikaisu] = painotettu_tutkinnon_osien_osaamispisteet_pt_kr * 0.5
	,[painotettu_tutkinnon_osien_osaamispisteet_at_eat_kr_oikaisu] = painotettu_tutkinnon_osien_osaamispisteet_at_eat_kr * 0.5
	,[painotettu_tutkinnon_osien_osaamispisteet_erityistuki_oikaisu] = painotettu_tutkinnon_osien_osaamispisteet_erityistuki * 0.5

	--leikkuri (120 osaamispistettä varainhoitovuoden tavoitteellista opiskelijavuotta kohti)
	,[leikkauskerroin] = 
		CASE 
			WHEN f.painottamaton_osaamispisteet_summa > 120.0 * sa1.tavoitteelliset_opiskelijavuodet_2018 THEN (120.0 * sa1.tavoitteelliset_opiskelijavuodet_2018) / f.painottamaton_osaamispisteet_summa
			ELSE 1.0
		END
	,[tavoitteelliset_opv] = sa1.tavoitteelliset_opiskelijavuodet_2018
	,[rahoitusmuoto_maksetaan] = d5.sisaltyy_okm_suoritusrahoitus

	--järjestykset
	,[jarj Tilastokuukausi] = d6.kuukausi
	,[jarj Koulutusala, taso 1] = d2.jarjestys_koulutusalataso1_koodi
	,[jarj Koulutusala, taso 2] = d2.jarjestys_koulutusalataso2_koodi
	,[jarj Koulutusala, taso 3] = d2.jarjestys_koulutusalataso3_koodi
	,[jarj Tutkintotyyppi] = d2.jarjestys_tutkintotyyppi_koodi
	
	,[jarj Rahoitusmuoto] = d5.jarjestys_koodi
	,[jarj Kustannusryhmä] = d7.jarjestys_koodi
	,[jarj Oppisopimuskoulutus] = d4.jarjestys
	,[jarj Erityisopetus] = d3.jarjestys_erityisopetus_koodi
	,[jarj Suorituksen tyyppi] = d8.jarjestys

FROM  dw.f_amos_tutkinnot_ja_tutkinnonosat_painotetut  f

LEFT JOIN dw.d_organisaatioluokitus d1 on d1.id = f.d_organisaatioluokitus_jarjestaja_id
LEFT JOIN dw.d_koulutusluokitus d2 on d2.id = f.d_koulutusluokitus_id
LEFT JOIN dw.d_erityisopetus d3 on d3.id = f.d_erityisopetus_id
LEFT JOIN dw.d_oppisopimuskoulutus d4 on d4.id = f.d_oppisopimuskoulutus_id
LEFT JOIN dw.d_opintojenrahoitus d5 on d5.id = f.d_opintojenrahoitus_id
LEFT JOIN dw.d_kalenteri d6 on d6.id = f.d_kalenteri_id
LEFT JOIN dw.d_ammatillisen_tutkinnon_kustannusryhma d7 on d7.id = f.d_kustannusryhma_id
LEFT JOIN dw.d_suorituksen_tyyppi d8 on d8.id = f.d_suorituksen_tyyppi_id
--tavoitteelliset opiskelijavuodet (fuusiot huomioiden)
LEFT JOIN (
	SELECT
		ytunnus
		,tavoitteelliset_opiskelijavuodet_2018 = SUM(tavoitteelliset_opiskelijavuodet_2018)
	FROM (
		SELECT DISTINCT
			ytunnus = coalesce(d.ytunnus_amos_spl, sa.ytunnus)
			,tavoitteelliset_opiskelijavuodet_2018
		FROM sa.sa_amos_tavoitteelliset_opiskelijavuodet sa
		LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d on d.ytunnus_avain = sa.ytunnus 
	) Q
	GROUP BY ytunnus
) sa1 on sa1.ytunnus = d1.organisaatio_koodi
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d9 on d9.id = f.d_amos_spl_jarjestaja_linkki_id	


