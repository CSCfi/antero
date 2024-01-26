USE [ANTERO]
GO

/****** Object:  View [sa].[v_amos_oiva_opetuskielet]    Script Date: 7.3.2022 11:15:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [sa].[v_amos_oiva_opetuskielet] AS


WITH luvat as (
	SELECT 
		l.jarjestajaYtunnus
		,alkupvm_tod = l.alkupvm
		,alkupvm = cast(case when l2.loppupvm is null then dateadd(yy, datediff(yy, 0, l.alkupvm), 0) else l.alkupvm end as date)
		,loppupvm = cast(coalesce(l.loppupvm,'9999-12-31') as date)
		,lupa_id = l.lupaId
		,q.opetuskieli_koodi
		,m.id
		,rivi_nro = rank() over (partition by l.jarjestajaYtunnus, l.alkupvm order by (case when m.id is null then 0 else 1 end) desc, l.paatospvm desc)
	FROM (
		select
			lupaId
			,opetuskieli_koodi = case m1.koodiarvo when '5' then 'SE' else k2.koodi end
		from sa.sa_oiva_maaraykset m1
		left join sa.sa_koodistot k1 on k1.koodi=m1.koodiarvo and k1.koodisto=m1.koodisto
		left join sa.sa_koodistot k2 on k2.nimi=k1.nimi and k2.koodisto='kieli'
		where m1.koodisto='oppilaitoksenopetuskieli'
	) q
	left join sa.sa_oiva_luvat l on l.lupaId = q.lupaId
	--epäjatkuvuuskohtien tarkistus. jos ei löydy yhtään riviä niin luvan alkupvm:ksi muutetaan vuoden eka päivä.
	left join sa.sa_oiva_luvat l2 on l2.jarjestajaYtunnus = l.jarjestajaYtunnus and datediff(day,l2.loppupvm,l.alkupvm)=1
	left join sa.sa_oiva_maaraykset m on m.lupaId = l.lupaId and m.koodisto='koulutussektori' and m.koodiarvo='3'
	WHERE coalesce(l.loppupvm,'9999-12-31') > l.alkupvm
	and l.koulutustyyppi is null
)

SELECT
	jarjestajaYtunnus
	,jarjestaja_nimi = coalesce(nimi_ennen_fuusiota,nimi_amos_spl)
	,alkupvm
	,loppupvm 
	,kieli1 = [1]
	,kieli2 = [2]
	,kieli3 = [3]
--INTO [ANTERO].[sa].[sa_amos_oiva_tutkinto_kielet]
FROM (

	SELECT distinct
		jarjestajaYtunnus
		,alkupvm 
		,loppupvm
		,opetuskieli_koodi = upper(opetuskieli_koodi)
		,rnk_opetuskieli = rank() over (partition by jarjestajaYtunnus, alkupvm order by opetuskieli_koodi)
		,rank_jarj = rank() over (partition by jarjestajaYtunnus, loppupvm order by alkupvm)

	FROM (

		--todelliset lupatiedot
		SELECT 
			l.jarjestajaYtunnus
			,l.alkupvm_tod
			,l.alkupvm
			,l.loppupvm
			,opetuskieli_koodi
			,generoitu = 0
		FROM luvat l
		WHERE l.rivi_nro=1

		UNION 

		--fuusioituneelle järjestäjälle luodaan lupatiedot ajalle ennen voimaantuloa koska Koskessa voi olla uudelle järjestäjälle merkittyjä opiskeluoikeuksia, joista puuttuu organisaatiohistoria-tieto
		SELECT distinct
			l1.jarjestajaYtunnus
			,l2.alkupvm_tod
			,alkupvm = cast(dateadd(yy, datediff(yy, 0, l2.loppupvm)-1, 0) as date)
			,l2.loppupvm
			,l2.opetuskieli_koodi
			,generoitu = 0
		FROM luvat l1
		left join dw.d_amos_spl_jarjestaja_linkki a on a.ytunnus_amos_spl = l1.jarjestajaYtunnus
		left join luvat l2 on l2.jarjestajaYtunnus = a.ytunnus_avain and l2.alkupvm < l1.alkupvm and datediff(day, l2.loppupvm, l1.alkupvm) = 1
		WHERE l1.rivi_nro=1
		and a.ytunnus_avain != a.ytunnus_amos_spl
		and datediff(day,dateadd(day,-1,a.voimaan_alkaen),l1.alkupvm)=1

	) Q1


) Q2
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki jl on jl.ytunnus_avain=Q2.jarjestajaYtunnus

PIVOT (
	min(opetuskieli_koodi) for rnk_opetuskieli in ([1],[2],[3],[4],[5])
) pvt


WHERE rank_jarj = 1



