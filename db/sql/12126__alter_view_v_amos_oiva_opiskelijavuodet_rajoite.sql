USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [sa].[v_amos_oiva_opiskelijavuodet_rajoite] AS

SELECT 
	jarjestajaYtunnus
	,jarjestaja_nimi = d.organisaatio_fi
	,alkupvm = cast(case when month(pvt.alkupvm) != 1 then dateadd(year, datediff(year, -1, pvt.alkupvm), 0) else pvt.alkupvm end as date)
	,loppupvm = cast(case when month(pvt.loppupvm) != 1 then dateadd(yy, datediff(yy, 0, pvt.loppupvm) + 1, -1) else coalesce(pvt.loppupvm,'9999-12-31') end as date)
	,vaativa_erityinen_tuki = [2]
	,sisaoppilaitosmuotoinen = [4] --2025 asti
	,ei_maksuttomat = [5] --2026 alkaen
	,alkupvm_tod = alkupvm_tod
	,loppupvm_tod = pvt.loppupvm

FROM (

	SELECT DISTINCT
		 l.jarjestajaYtunnus
		,alkupvm = cast(case when l2.jarjestajaOid is null then dateadd(yy, datediff(yy, 0, l.alkupvm), 0) else l.alkupvm end as date)
		,alkupvm_tod = l.alkupvm
		,loppupvm = cast(l.loppupvm as date)
		,koodiarvo
		,arvo = cast(arvo as int)
		,rank_paatos = rank() over (partition by l.diaarinumero order by l.paatospvm desc)

	FROM sa.sa_oiva_maaraykset m
	LEFT JOIN sa.sa_oiva_luvat l on m.lupaId=l.lupaId 
	--epäjatkuvuuskohtien tarkistus. jos ei löydy yhtään riviä niin luvan alkupvm:ksi muutetaan vuoden eka päivä.
	LEFT JOIN sa.sa_oiva_luvat l2 on l2.jarjestajaYtunnus = l.jarjestajaYtunnus and datediff(day,l2.loppupvm,l.alkupvm)=1

	WHERE 1=1
	AND m.kohde_tunniste = 'opiskelijavuodet'
	AND (
		m.maaraystyyppi_tunniste = 'RAJOITE'
		OR (
			--ilm. jokin Oivan oma koodisto; tarvittaessa tapaukset "ei määritetty" löytyvät rajoitteista eri koodiston koodiarvolla 61242492610412222
			m.maaraystyyppi_tunniste = 'OIKEUS'
			AND m.koodisto = 'koulutussektori'
			AND m.koodiarvo = '5'
		)
	)
	AND coalesce(l.loppupvm,'9999-12-31') > l.alkupvm

) q

PIVOT (
	max(arvo) for koodiarvo in ([2],[4],[5])
) pvt

LEFT JOIN dw.d_organisaatioluokitus d on d.organisaatio_koodi = pvt.jarjestajaYtunnus

WHERE (
	case 
		when month(pvt.alkupvm) != 1 then dateadd(year, datediff(year, -1, pvt.alkupvm), 0) 
		else pvt.alkupvm 
	end 
	< cast(coalesce(pvt.loppupvm,'9999-12-31') as date)
)
AND rank_paatos = 1

GO
