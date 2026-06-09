USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROCEDURE [dw].[p_lataa_f_amos_opiskelijavuodet_TK_K1_16] AS

--DROP TABLE IF EXISTS [dw].[f_amos_opiskelijavuodet_TK_K1_16] 

SELECT 
	tilv = q.vuosi
	,tarkastelukausi = d.rahoituskausi_amm
	,rahoituskausi_amm = '01.07.2023 – 30.06.2025' --HUOM

	--apumuuttujat
	,opiskeluoikeus = q.opiskeluoikeus_oid
	,opiskeluoikeuden_alkamispaiva = q.alkamispaiva
	,master_oppija = q.master_oid
	--

	,ikar8 = 
		case
			when q.ika < 0 or q.ika > 100 then null
			when q.ika < 20 then 15
			when q.ika < 25 then 20
			when q.ika < 35 then 25
			when q.ika < 45 then 35
			when q.ika < 55 then 45
			when q.ika < 65 then 55
			when q.ika >= 65 then 65
		end
	,ikar20 = 
		case
			when q.ika < 0 or q.ika > 100 then null
			when q.ika < 20 then 1
			when q.ika = 20 then 2
			when q.ika > 20 then 3
		end

	,maksuton_koulutus = case q.maksuttomuus when 1 then 1 else 2 end
	,maksuton_koulutus_simulointi = case q.maksuttomuus_simulointi when 1 then 1 else 2 end

	,aikielir1 = 
		case 
			when q.aidinkieli in ('fi','se') then 'fs'
			when q.aidinkieli = 'sv' then 'sv'
			else '99'
		end

	,jarj = d13b.ytunnus_amos_spl
	,jarjnim = d13b.nimi_amos_spl

	,[tutktyyp] = 
		CASE 
			WHEN d15.koodi = 'vt' THEN '5' --'Valmentava koulutus'
			WHEN d15.koodi = 'muu' THEN '4' --'Muu ammatillinen koulutus'
			WHEN d11a.id is null  THEN '1' --'Ammatillinen perustutkinto' (linkittymättömät tutk. osaa pien. raportilla näin)
			ELSE 
				CASE d11a.tutkintotyyppi_koodi
					WHEN '02' THEN '1' --'Ammatillinen perustutkinto'
					WHEN '19' THEN '2' --'Ammattitutkinto'
					WHEN '20' THEN '3' --'Erikoisammattitutkinto'
					WHEN '91' THEN '5' --'Valmentava koulutus'
				END
		END
	,[koulk] = d11a.koulutusluokitus_koodi
	,[alvv] = year(q.alkamispaiva)
	,rahoitus = q.opintojen_rahoitus
	,kustannusryhma = q.kustannusryhma_uusi

	,[opiskelijavuodet] = sum(op_vuodet)

	--metatiedot; ei poimintaan
	,username = SUSER_NAME()
	,loadtime = GETDATE()
	
INTO [dw].[f_amos_opiskelijavuodet_TK_K1_16]

FROM [Koski_SA].[dbo].[opiskelijavuodet_valitaulu_unpivot_luvat] q 
LEFT JOIN [Koski_SA].[sa].sa_koski_opiskeluoikeus oo ON oo.opiskeluoikeus_oid = q.opiskeluoikeus_oid
LEFT JOIN dw.d_kalenteri d ON d.paivays = q.tilv_date
LEFT JOIN dw.d_koulutusluokitus d11a ON d11a.koulutusluokitus_koodi = q.koulk 
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d13b ON d13b.oid_avain = q.jarj_oid
LEFT JOIN dw.d_ammatillisen_tutkinnon_kustannusryhma d15 ON d15.koodi = q.kustannusryhma
LEFT JOIN dw.d_opintojenrahoitus d16 ON d16.koodi = q.opintojen_rahoitus
LEFT JOIN dw.d_amos_spl_opiskelijavuodet_hylkaamisperuste d19 ON d19.koodi = q.hylkaamisen_peruste
LEFT JOIN dw.d_amos_luvaton_koulutus d22 ON d22.koodi = q.lupa_koulutus
LEFT JOIN dw.d_kieli d27 ON d27.kieli_koodi = q.lupa_suorituskieli

WHERE 1=1
AND q.tilv_date between '2023-07-01' and '2025-06-30' --HUOM
AND d13b.sisaltyy_amos_spl = 1
--raportin oletussuodattukset
AND d16.sisaltyy_okm_perusrahoitus = 1
AND d19.selite_fi = 'Hyväksytään'
AND d22.selite_fi = 'Ei luvaton, hyväksytty'
AND (
	COALESCE(d27.kieli_koodi,'-2') != '-2'
	OR d15.koodi = 'muu'
)

GROUP BY 
	q.vuosi
	,d.rahoituskausi_amm
	,q.opiskeluoikeus_oid
	,q.alkamispaiva
	,q.master_oid
	,case
		when q.ika < 0 or q.ika > 100 then null
		when q.ika < 20 then 15
		when q.ika < 25 then 20
		when q.ika < 35 then 25
		when q.ika < 45 then 35
		when q.ika < 55 then 45
		when q.ika < 65 then 55
		when q.ika >= 65 then 65
	end
	,case
		when q.ika < 0 or q.ika > 100 then null
		when q.ika < 20 then 1
		when q.ika = 20 then 2
		when q.ika > 20 then 3
	end
	,case q.maksuttomuus when 1 then 1 else 2 end
	,case q.maksuttomuus_simulointi when 1 then 1 else 2 end
	,case 
		when q.aidinkieli in ('fi','se') then 'fs'
		when q.aidinkieli = 'sv' then 'sv'
		else '99'
	end
	,d13b.ytunnus_amos_spl
	,d13b.nimi_amos_spl
	,d11a.koulutusluokitus_koodi
	,CASE 
		WHEN d15.koodi = 'vt' THEN '5' --'Valmentava koulutus'
		WHEN d15.koodi = 'muu' THEN '4' --'Muu ammatillinen koulutus'
		WHEN d11a.id is null  THEN '1' --'Ammatillinen perustutkinto' (linkittymättömät tutk. osaa pien. raportilla näin)
		ELSE 
			CASE d11a.tutkintotyyppi_koodi
				WHEN '02' THEN '1' --'Ammatillinen perustutkinto'
				WHEN '19' THEN '2' --'Ammattitutkinto'
				WHEN '20' THEN '3' --'Erikoisammattitutkinto'
				WHEN '91' THEN '5' --'Valmentava koulutus'
			END
	END
	,q.opintojen_rahoitus
	,q.kustannusryhma_uusi

HAVING SUM(op_vuodet) > 0.0000000

GO
