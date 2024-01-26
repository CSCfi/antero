USE [Koski_SA]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_TK_amm_tutkinnot]    Script Date: 12.10.2023 13:17:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP PROCEDURE IF EXISTS [dbo].[p_lataa_TK_amm_tutkinnot]
GO



CREATE PROCEDURE [dbo].[p_lataa_TK_amm_tutkinnot] @vuosi int = null AS

DECLARE @vuosi2 as int = case when @vuosi is null then year(getdate())-1 else @vuosi end

DROP TABLE IF EXISTS dbo.TK_amm_tutkinnot

;WITH ep AS (
	SELECT
		tutkintokoodi
		,nimi_fi
		,voimassaoloalkaa = case when diaarinumero='OPH-2596-2019' then '2018-01-01' else voimassaoloalkaa end --Tieto- ja viestintätekniikan perustutkinto hyväksytään jo ennen varsinaista voimaantuloa
		,voimassaololoppuu
		,siirtymapaattyy
		,min_alkaa = min(voimassaoloalkaa) over (partition by tutkintokoodi)
	FROM sa.sa_eperusteet
	WHERE nimi_fi not like '%kokeilu%'
)

SELECT 
	suorv

	,master_oppija
	,oppija
	,opiskeluoikeus
	,aikielir1
	,alvv
	,alkk

	,jarj_opisk
	,jarjnimi_opisk
	,jarj_tutk
	,jarjnimi_tutk
	
	,tavoite
	,toteuma_tutk
	,koulk
	,oppis
	,kustannusryhma
	,rahoitus
	,tyov
	,rnk

INTO dbo.TK_amm_tutkinnot

FROM (

	SELECT
		 suorv = @vuosi2

		,master_oppija = h.master_oid
		,oppija = h.oppija_oid
		,opiskeluoikeus = q.opiskeluoikeus_oid
		,aikielir1 = 
			case
				when h.aidinkieli in ('fi','se') then 'fs'
				when h.aidinkieli = 'sv' then 'sv'
				else '99'
			end

		,alvv = year(q.alkamispaiva)
		,alkk = month(q.alkamispaiva)

		,jarj_opisk = ol2.organisaatio_koodi
		,jarjnimi_opisk = ol2.organisaatio_fi
		,jarj_tutk = ol1.organisaatio_koodi
		,jarjnimi_tutk = ol1.organisaatio_fi

		,tavoite = coalesce(nullif(q.suorittaa_koko_tutkintoa,0),2)
		,toteuma_tutk = case when paataso=1 and suorittaa_koko_tutkintoa=1 then 1 else 2 end
		,koulk = q.tutkinto_koodi
		,oppis = case q.oppisopimus_koodi when 0 then 2 else 1 end
		,kustannusryhma = q.kustannusryhma_koodi
		,rahoitus = q.opintojen_rahoitus_koodi
		,tyov = case opr.tyovoimakoulutus when 0 then 2 else 1 end

		,luvallinen = ca3.luvallinen
		,rnk = 
			row_number() over (
				partition by coalesce(h.master_oid, q.oppija_oid), ol2.organisaatio_koodi 
				order by ca3.luvallinen desc, opr.sisaltyy_okm_suoritusrahoitus desc, q.paataso desc, q.suorittaa_koko_tutkintoa desc, q.vahvistus_paiva, q.arviointi_paiva
			)

	FROM dbo.tutkinnot_ja_tutkinnonosat_valitaulu q
	left join ANTERO.dw.d_koulutusluokitus d1 ON d1.koulutusluokitus_koodi = q.tutkinto_koodi
	left join ANTERO.dw.d_opintojenrahoitus opr on opr.koodi = q.opintojen_rahoitus_koodi
	left join sa.sa_koski_henkilo h on h.oppija_oid = q.oppija_oid
	left join ANTERO.dw.d_organisaatioluokitus ol1 on ol1.organisaatio_oid = q.koulutustoimija_oid_pihvi
	left join ANTERO.dw.d_organisaatioluokitus ol2 on ol2.organisaatio_oid = q.koulutustoimija_oid
	cross apply (SELECT tilv_pvm = datefromparts(vuosi,kuukausi,1)) ca1
	outer apply (
		select top 1 *
		from ep
		where tutkintokoodi = q.tutkinto_koodi 
		and (
			case
				when ca1.tilv_pvm < ep.min_alkaa then ep.min_alkaa
				else ca1.tilv_pvm
			end
		) between ep.voimassaoloalkaa and coalesce(ep.siirtymapaattyy, ep.voimassaololoppuu, '9999-12-31') 
	) d12 
	---
	left join ANTERO.dw.d_kytkin d10 on d10.kytkin_koodi = q.oppisopimus_koodi
	left join ANTERO.dw.d_kytkin d21 on d21.kytkin_koodi = 
	(
		case 
			when (d1.tutkintotyyppi_koodi = '02' and q.alkamispaiva >= '2018-08-01') or (d1.tutkintotyyppi_koodi in ('19','20') and q.alkamispaiva >= '2019-01-01') then 1
			else 0
		end
	)
	left join ANTERO.dw.d_amos_spl_jarjestaja_linkki sjl on sjl.oid_avain = coalesce(q.koulutustoimija_oid_pihvi_hist, q.koulutustoimija_oid_pihvi, q.koulutustoimija_oid_hist, q.koulutustoimija_oid)
	outer apply (
		SELECT 
			jarj =
				case 
					when ca1.tilv_pvm < sjl.voimaan_alkaen then sjl.ytunnus_avain
					else coalesce(sjl.ytunnus_amos_spl,sjl.ytunnus_avain)
				end
	) ca2

	--ammatillisen koulutuksen luvat
	OUTER APPLY (
		select top 1 jarjestajaYtunnus
		from ANTERO.sa.sa_amos_oiva_opetuskielet v0 
		where ca1.tilv_pvm between v0.alkupvm and v0.loppupvm 
		and v0.jarjestajaYtunnus = ca2.jarj
	) l

	--tutkinto-oikeudet
	OUTER APPLY (
		select top 1 jarjestajaYtunnus
		from ANTERO.sa.sa_amos_oiva_tutkinto_oikeudet v1 
		where ca1.tilv_pvm between v1.alkupvm and coalesce(v1.siirtymapaattyy, v1.loppupvm)
		and v1.jarjestajaYtunnus = ca2.jarj
		and d12.nimi_fi in (v1.tutkinto_nimi1, v1.tutkinto_nimi2, v1.tutkinto_nimi3, v1.tutkinto_nimi4, v1.tutkinto_nimi5)
	) v1

	--muut oikeudet
	OUTER APPLY (
		select top 1 *
		from ANTERO.sa.v_amos_oiva_muut_oikeudet v2
		where ca1.tilv_pvm between v2.alkupvm and v2.loppupvm 
		and v2.jarjestajaYtunnus = ca2.jarj
	) v2

	--kielet, opetus
	OUTER APPLY (
		select top 1 jarjestajaYtunnus
		from ANTERO.sa.sa_amos_oiva_opetuskielet v3 
		where ca1.tilv_pvm between v3.alkupvm and v3.loppupvm 
		and v3.jarjestajaYtunnus = ca2.jarj 
		and q.suorituskieli_koodiarvo in (v3.kieli1, v3.kieli2, v3.kieli3)
	) v3

	--kielet, tutkinto
	OUTER APPLY (
		select top 1 jarjestajaYtunnus
		from ANTERO.sa.sa_amos_oiva_tutkintokielet v4
		where ca1.tilv_pvm between v4.alkupvm and coalesce(v4.siirtymapaattyy, v4.loppupvm) 
		and v4.jarjestajaYtunnus = ca2.jarj 
		and q.suorituskieli_koodiarvo in (v4.kieli1, v4.kieli2, v4.kieli3) 
		and v4.tutkintokoodi = d1.koulutusluokitus_koodi
	) v4
	outer apply (
		select	
			luvallinen = 
				case 
					when (d1.tutkintotyyppi_koodi = '02' and q.alkamispaiva >= '2018-08-01') or (d1.tutkintotyyppi_koodi in ('19','20') and q.alkamispaiva >= '2019-01-01') then 
						case
							when v1.jarjestajaYtunnus is null and (q.oppisopimus_koodi=0 or (q.oppisopimus_koodi=1 and v2.laaja_oppis=0)) then 0
							else 1
						end
					else 1 
				end
			,lupa_suorituskieli =
				case 		
					when v3.jarjestajaYtunnus is null and v4.jarjestajaYtunnus is null and l.jarjestajaYtunnus is not null then -2
					when l.jarjestajaYtunnus is null and q.suorituskieli_koodiarvo != 'FI' then -2
					else 1
				end
	) ca3
	
	WHERE 1=1
	and q.vuosi = @vuosi2
	and ca3.luvallinen = 1
	and ca3.lupa_suorituskieli != -2
	and opr.sisaltyy_okm_suoritusrahoitus = 1
	and q.duplikaatti = 0
	and q.paallekkainen_tuva = 0
	
) Q

drop table if exists #temp_oiva

GO
