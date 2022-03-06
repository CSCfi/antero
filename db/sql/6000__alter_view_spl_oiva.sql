USE [ANTERO]
GO
/****** Object:  View [sa].[v_amos_oiva_tutkintokielet]    Script Date: 6.3.2022 19:36:22 ******/
DROP VIEW IF EXISTS [sa].[v_amos_oiva_tutkintokielet]
GO
/****** Object:  View [sa].[v_amos_oiva_tutkinto_oikeudet]    Script Date: 6.3.2022 19:36:22 ******/
DROP VIEW IF EXISTS [sa].[v_amos_oiva_tutkinto_oikeudet]
GO
/****** Object:  View [sa].[v_amos_oiva_opetuskielet]    Script Date: 6.3.2022 19:36:22 ******/
DROP VIEW IF EXISTS [sa].[v_amos_oiva_opetuskielet]
GO
/****** Object:  View [sa].[v_amos_oiva_opetuskielet]    Script Date: 6.3.2022 19:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[sa].[v_amos_oiva_opetuskielet]'))
EXEC dbo.sp_executesql @statement = N'





CREATE VIEW [sa].[v_amos_oiva_opetuskielet] AS


WITH luvat as (
	SELECT 
		l.jarjestajaYtunnus
		,alkupvm_tod = l.alkupvm
		,alkupvm = cast(case when l2.loppupvm is null then dateadd(yy, datediff(yy, 0, l.alkupvm), 0) else l.alkupvm end as date)
		,loppupvm = cast(coalesce(l.loppupvm,''9999-12-31'') as date)
		,lupa_id = l.lupaId
		,q.opetuskieli_koodi
		,m.id
		,rivi_nro = rank() over (partition by l.jarjestajaYtunnus, l.alkupvm order by (case when m.id is null then 0 else 1 end) desc, l.paatospvm desc)
	FROM (
		select
			lupaId
			,opetuskieli_koodi=case m1.koodiarvo when ''5'' then ''SE'' else k2.koodi end
		from sa.sa_oiva_maaraykset m1
		left join sa.sa_koodistot k1 on k1.koodi=m1.koodiarvo and k1.koodisto=m1.koodisto
		left join sa.sa_koodistot k2 on k2.nimi=k1.nimi and k2.koodisto=''kieli''
		where m1.koodisto=''oppilaitoksenopetuskieli''
	) q
	left join sa.sa_oiva_luvat l on l.lupaId = q.lupaId
	--epäjatkuvuuskohtien tarkistus. jos ei löydy yhtään riviä niin luvan alkupvm:ksi muutetaan vuoden eka päivä.
	left join sa.sa_oiva_luvat l2 on l2.jarjestajaYtunnus = l.jarjestajaYtunnus and datediff(day,l2.loppupvm,l.alkupvm)=1
	left join sa.sa_oiva_maaraykset m on m.lupaId = l.lupaId and m.koodisto=''koulutussektori'' and m.koodiarvo=''3''
	WHERE coalesce(l.loppupvm,''9999-12-31'') > l.alkupvm
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
			,l3.alkupvm_tod
			,l3.alkupvm
			,l2.loppupvm --loppupvm = dateadd(day,-1,a.voimaan_alkaen)
			,tutkintokoodi = m.koodiarvo
			,generoitu = 0
		FROM luvat l1
		left join dw.d_amos_spl_jarjestaja_linkki a on a.ytunnus_amos_spl = l1.jarjestajaYtunnus
		left join luvat l2 on l2.jarjestajaYtunnus = a.ytunnus_avain and l2.alkupvm < l1.alkupvm
		left join luvat l3 on l3.jarjestajaYtunnus = l1.jarjestajaYtunnus and datediff(day,l3.loppupvm,l1.alkupvm)=1
		left join sa.sa_oiva_maaraykset m on m.lupaId = l1.lupa_id
		WHERE m.koodisto = ''koulutus'' and l1.rivi_nro=1
		and a.ytunnus_avain != a.ytunnus_amos_spl
		and datediff(day,dateadd(day,-1,a.voimaan_alkaen),l1.alkupvm)=1
		
		UNION
	
		--vanhan järjestäjän siirtymäsäännöksen mukainen oikeus siirtyy fuusiossa uudelle järjestäjälle
		SELECT distinct
			a.ytunnus_amos_spl
			,alkupvm_tod = ''2018-01-01''
			,alkupvm = a.voimaan_alkaen
			,loppupvm = l2.loppupvm--cast(DATEADD(yy, DATEDIFF(yy, 0, a.voimaan_alkaen) + 1, -1) as date)
			,tutkintokoodi = m1.koodiarvo
			,generoitu = 1
		FROM luvat l1
		left join sa.sa_oiva_maaraykset m1 on m1.lupaId = l1.lupa_id and m1.koodisto = ''koulutus''
		left join dw.d_amos_spl_jarjestaja_linkki a on a.ytunnus_avain = l1.jarjestajaYtunnus
		left join luvat l2 on l2.jarjestajaYtunnus = a.ytunnus_amos_spl and l2.alkupvm = a.voimaan_alkaen
		left join sa.sa_oiva_maaraykset m2 on m2.lupaId = l2.lupa_id and m2.koodisto = ''koulutus'' and m1.koodiarvo = m2.koodiarvo
		WHERE l1.rivi_nro=1 and m2.id is null
		and a.voimaan_alkaen is not null
		and a.ytunnus_amos_spl is not null

	) Q1


) Q2
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki jl on jl.ytunnus_avain=Q2.jarjestajaYtunnus

PIVOT (
	min(opetuskieli_koodi) for rnk_opetuskieli in ([1],[2],[3],[4],[5])
) pvt


WHERE rank_jarj = 1







' 
GO
/****** Object:  View [sa].[v_amos_oiva_tutkinto_oikeudet]    Script Date: 6.3.2022 19:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[sa].[v_amos_oiva_tutkinto_oikeudet]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [sa].[v_amos_oiva_tutkinto_oikeudet] AS


WITH luvat as (
	SELECT 
		l.jarjestajaYtunnus
		,alkupvm_tod = l.alkupvm
		,alkupvm = cast(case when l2.loppupvm is null then dateadd(yy, datediff(yy, 0, l.alkupvm), 0) else l.alkupvm end as date)
		,loppupvm = cast(coalesce(l.loppupvm,''9999-12-31'') as date)
		,lupa_id = l.lupaId
		,m.id
		,rivi_nro = row_number() over (partition by l.jarjestajaYtunnus, l.alkupvm order by (case when m.id is null then 0 else 1 end) desc,l.paatospvm desc)
	FROM sa.sa_oiva_luvat l
	--epäjatkuvuuskohtien tarkistus. jos ei löydy yhtään riviä niin luvan alkupvm:ksi muutetaan vuoden eka päivä.
	left join sa.sa_oiva_luvat l2 on l2.jarjestajaYtunnus = l.jarjestajaYtunnus and datediff(day,l2.loppupvm,l.alkupvm)=1
	left join sa.sa_oiva_maaraykset m on m.lupaId = l.lupaId and m.koodisto=''koulutussektori'' and m.koodiarvo=''3''
	WHERE coalesce(l.loppupvm,''9999-12-31'') > l.alkupvm
	and l.koulutustyyppi is null
)

SELECT 
	jarjestajaYtunnus
	,jarjestaja_nimi = coalesce(jl.nimi_ennen_fuusiota,jl.nimi_amos_spl)
	,alkupvm
	,loppupvm 
	,tutkinto_nimi1
	,tutkinto_nimi2
	,tutkinto_nimi3
	,tutkinto_nimi4
	,tutkinto_nimi5
	,siirtymapaattyy
FROM (

	SELECT distinct
		jarjestajaYtunnus
		,alkupvm 
		,loppupvm
		,tutkinto_nimi1 = s.nimi1
		,tutkinto_nimi2 = s.nimi2
		,tutkinto_nimi3 = s.nimi3
		,tutkinto_nimi4 = s.nimi4
		,tutkinto_nimi5 = s.nimi5
		,siirtymapaattyy = 
			case 
				when loppupvm = max(loppupvm) over (partition by jarjestajaYtunnus, s.nimi1) and loppupvm < siirtymapaattyy /*and generoitu = max(generoitu) over (partition by jarjestajaYtunnus,s.nimi1)*/ then siirtymapaattyy
			end
		,rank_jarj = rank() over (partition by jarjestajaYtunnus,s.nimi1,loppupvm order by alkupvm)

	FROM (

		--todelliset lupatiedot
		SELECT 
			l.jarjestajaYtunnus
			,l.alkupvm_tod
			,l.alkupvm
			,l.loppupvm
			,tutkintokoodi = m.koodiarvo
			,generoitu = 0
		FROM luvat l
		left join sa.sa_oiva_maaraykset m on m.lupaId = l.lupa_id
		WHERE m.koodisto = ''koulutus'' and l.rivi_nro=1

		UNION 

		--fuusioituneelle järjestäjälle luodaan lupatiedot ajalle ennen voimaantuloa koska Koskessa voi olla uudelle järjestäjälle merkittyjä opiskeluoikeuksia, joista puuttuu organisaatiohistoria-tieto
		SELECT distinct
			l1.jarjestajaYtunnus
			,l2.alkupvm_tod
			,alkupvm = cast(dateadd(yy, datediff(yy, 0, l2.loppupvm), 0) as date)
			,l2.loppupvm
			,tutkintokoodi = m.koodiarvo
			,generoitu = 0
		FROM luvat l1
		left join dw.d_amos_spl_jarjestaja_linkki a on a.ytunnus_amos_spl = l1.jarjestajaYtunnus
		left join luvat l2 on l2.jarjestajaYtunnus = a.ytunnus_avain and l2.alkupvm < l1.alkupvm and datediff(day, l2.loppupvm, l1.alkupvm) = 1
		left join sa.sa_oiva_maaraykset m on m.lupaId = l1.lupa_id
		WHERE 1=1
		and m.koodisto = ''koulutus'' and l1.rivi_nro=1
		and a.ytunnus_avain != a.ytunnus_amos_spl
		and datediff(day,dateadd(day, -1, a.voimaan_alkaen), l1.alkupvm) = 1
		
		UNION
	
		--vanhan järjestäjän siirtymäsäännöksen mukainen oikeus siirtyy fuusiossa uudelle järjestäjälle
		SELECT distinct
			a.ytunnus_amos_spl
			,alkupvm_tod = ''2018-01-01''
			,alkupvm = a.voimaan_alkaen
			,loppupvm = l2.loppupvm
			,tutkintokoodi = m1.koodiarvo
			,generoitu = 1
		FROM luvat l1
		left join sa.sa_oiva_maaraykset m1 on m1.lupaId = l1.lupa_id and m1.koodisto = ''koulutus''
		left join dw.d_amos_spl_jarjestaja_linkki a on a.ytunnus_avain = l1.jarjestajaYtunnus
		left join luvat l2 on l2.jarjestajaYtunnus = a.ytunnus_amos_spl and l2.alkupvm = a.voimaan_alkaen
		left join sa.sa_oiva_maaraykset m2 on m2.lupaId = l2.lupa_id and m2.koodisto = ''koulutus'' and m1.koodiarvo = m2.koodiarvo
		WHERE l1.rivi_nro=1 and m2.id is null
		and a.voimaan_alkaen is not null
		and a.ytunnus_amos_spl is not null

	) Q1

	CROSS APPLY (select nimi1,nimi2,nimi3,nimi4,nimi5,siirtymapaattyy from [dbo].[hae_tutkinnon_nimet] (Q1.alkupvm,Q1.loppupvm,Q1.tutkintokoodi)) s
	WHERE not (Q1.generoitu = 1 and s.siirtymapaattyy is null) and not (s.siirtymapaattyy is not null and alkupvm > s.siirtymapaattyy)

) Q2

LEFT JOIN dw.d_amos_spl_jarjestaja_linkki jl on jl.ytunnus_avain=Q2.jarjestajaYtunnus
WHERE rank_jarj = 1
' 
GO
/****** Object:  View [sa].[v_amos_oiva_tutkintokielet]    Script Date: 6.3.2022 19:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[sa].[v_amos_oiva_tutkintokielet]'))
EXEC dbo.sp_executesql @statement = N'






CREATE VIEW [sa].[v_amos_oiva_tutkintokielet] AS


WITH luvat as (
	SELECT 
		l.jarjestajaYtunnus
		,alkupvm_tod = l.alkupvm
		,alkupvm = cast(case when l2.loppupvm is null then dateadd(yy, datediff(yy, 0, l.alkupvm), 0) else l.alkupvm end as date)
		,loppupvm = cast(coalesce(l.loppupvm,''9999-12-31'') as date)
		,lupa_id = l.lupaId
		,q.tutkinto_koodi
		,q.tutkintokieli_koodi
		,m.id
		,rivi_nro = rank() over (partition by l.jarjestajaYtunnus, l.alkupvm order by (case when m.id is null then 0 else 1 end) desc, l.paatospvm desc)
	FROM (
		select
			lupaId
			,tutkinto_koodi=m.koodiarvo
			,tutkintokieli_koodi=am.koodiarvo
		from sa.sa_oiva_maaraykset m
		join sa.sa_oiva_alimaaraykset am on am.maaraysId = m.maaraysId and am.koodisto=''kieli''
		where m.koodisto=''koulutus''	
	) q
	left join sa.sa_oiva_luvat l on l.lupaId = q.lupaId
	--epäjatkuvuuskohtien tarkistus. jos ei löydy yhtään riviä niin luvan alkupvm:ksi muutetaan vuoden eka päivä.
	left join sa.sa_oiva_luvat l2 on l2.jarjestajaYtunnus = l.jarjestajaYtunnus and datediff(day,l2.loppupvm,l.alkupvm)=1
	left join sa.sa_oiva_maaraykset m on m.lupaId = l.lupaId and m.koodisto=''koulutussektori'' and m.koodiarvo=''3''
	WHERE coalesce(l.loppupvm,''9999-12-31'') > l.alkupvm
	and l.koulutustyyppi is null
)

SELECT
	jarjestajaYtunnus
	,jarjestaja_nimi = coalesce(nimi_ennen_fuusiota,nimi_amos_spl)
	,alkupvm
	,loppupvm 
	,tutkintokoodi
	,tutkinto_nimi = koulutusluokitus_fi
	,kieli1 = [1]
	,kieli2 = [2]
	,kieli3 = [3]
	,siirtymapaattyy
--INTO [ANTERO].[sa].[sa_amos_oiva_tutkinto_kielet]
FROM (

	SELECT distinct
		jarjestajaYtunnus
		,alkupvm 
		,loppupvm
		,tutkintokoodi
		,tutkintokieli_koodi = upper(tutkintokieli_koodi)
		,rnk_tutkintokieli = rank() over (partition by jarjestajaYtunnus, alkupvm, tutkintokoodi order by tutkintokieli_koodi)
		,siirtymapaattyy = 
			case 
				when loppupvm = max(loppupvm) over (partition by jarjestajaYtunnus,tutkintokoodi) and loppupvm < siirtymapaattyy /*and generoitu = max(generoitu) over (partition by jarjestajaYtunnus,tutkintokoodi)*/ then siirtymapaattyy 
			end
		,rank_jarj = rank() over (partition by jarjestajaYtunnus, tutkintokoodi, loppupvm order by alkupvm)

	FROM (

		--todelliset lupatiedot
		SELECT 
			l.jarjestajaYtunnus
			,l.alkupvm_tod
			,l.alkupvm
			,l.loppupvm
			,tutkintokoodi = tutkinto_koodi
			,tutkintokieli_koodi
			,generoitu = 0
		FROM luvat l
		WHERE l.rivi_nro=1

		UNION 

		--fuusioituneelle järjestäjälle luodaan lupatiedot ajalle ennen voimaantuloa koska Koskessa voi olla uudelle järjestäjälle merkittyjä opiskeluoikeuksia, joista puuttuu organisaatiohistoria-tieto
		SELECT distinct
			l1.jarjestajaYtunnus
			,l3.alkupvm_tod
			,l3.alkupvm
			,l2.loppupvm --loppupvm = dateadd(day,-1,a.voimaan_alkaen)
			,tutkintokoodi = m.koodiarvo
			,l1.tutkintokieli_koodi
			,generoitu = 0
		FROM luvat l1
		left join dw.d_amos_spl_jarjestaja_linkki a on a.ytunnus_amos_spl = l1.jarjestajaYtunnus
		left join luvat l2 on l2.jarjestajaYtunnus = a.ytunnus_avain and l2.alkupvm < l1.alkupvm
		left join luvat l3 on l3.jarjestajaYtunnus = l1.jarjestajaYtunnus and datediff(day,l3.loppupvm,l1.alkupvm)=1
		left join sa.sa_oiva_maaraykset m on m.lupaId = l1.lupa_id
		WHERE m.koodisto = ''koulutus'' and l1.rivi_nro=1
		and a.ytunnus_avain != a.ytunnus_amos_spl
		and datediff(day,dateadd(day,-1,a.voimaan_alkaen),l1.alkupvm)=1
		
		UNION
	
		--vanhan järjestäjän siirtymäsäännöksen mukainen oikeus siirtyy fuusiossa uudelle järjestäjälle
		SELECT distinct
			a.ytunnus_amos_spl
			,alkupvm_tod = ''2018-01-01''
			,alkupvm = a.voimaan_alkaen
			,loppupvm = l2.loppupvm--cast(DATEADD(yy, DATEDIFF(yy, 0, a.voimaan_alkaen) + 1, -1) as date)
			,tutkintokoodi = m1.koodiarvo
			,l1.tutkintokieli_koodi
			,generoitu = 1
		FROM luvat l1
		left join sa.sa_oiva_maaraykset m1 on m1.lupaId = l1.lupa_id and m1.koodisto = ''koulutus''
		left join dw.d_amos_spl_jarjestaja_linkki a on a.ytunnus_avain = l1.jarjestajaYtunnus
		left join luvat l2 on l2.jarjestajaYtunnus = a.ytunnus_amos_spl and l2.alkupvm = a.voimaan_alkaen
		left join sa.sa_oiva_maaraykset m2 on m2.lupaId = l2.lupa_id and m2.koodisto = ''koulutus'' and m1.koodiarvo = m2.koodiarvo
		WHERE l1.rivi_nro=1 and m2.id is null
		and a.voimaan_alkaen is not null
		and a.ytunnus_amos_spl is not null

	) Q1

	CROSS APPLY (select siirtymapaattyy from [dbo].[hae_tutkinnon_nimet] (Q1.alkupvm,Q1.loppupvm,Q1.tutkintokoodi)) s

	WHERE not (Q1.generoitu = 1 and s.siirtymapaattyy is null) and not (s.siirtymapaattyy is not null and alkupvm > s.siirtymapaattyy)

) Q2
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki jl on jl.ytunnus_avain=Q2.jarjestajaYtunnus

PIVOT (
	min(tutkintokieli_koodi) for rnk_tutkintokieli in ([1],[2],[3],[4],[5])
) pvt
LEFT JOIN dw.d_koulutusluokitus kl on kl.koulutusluokitus_koodi=tutkintokoodi

WHERE rank_jarj = 1
--GROUP BY 
--	jarjestajaYtunnus
--	,coalesce(nimi_ennen_fuusiota,nimi_amos_spl)
--	,alkupvm
--	,loppupvm 
--	,tutkintokoodi
--	,koulutusluokitus_fi
--	,siirtymapaattyy
--ORDER BY coalesce(nimi_ennen_fuusiota,nimi_amos_spl), alkupvm





' 
