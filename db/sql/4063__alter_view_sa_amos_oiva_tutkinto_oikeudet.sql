USE [ANTERO]
GO

/****** Object:  View [sa].[v_amos_oiva_tutkinto_oikeudet]    Script Date: 28.10.2020 9:12:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









ALTER VIEW [sa].[v_amos_oiva_tutkinto_oikeudet] AS


WITH luvat as (
	SELECT 
		l.jarjestajaYtunnus
		,alkupvm_tod = l.alkupvm
		,alkupvm = cast(case when l2.loppupvm is null then dateadd(yy, datediff(yy, 0, l.alkupvm), 0) else l.alkupvm end as date)
		,loppupvm = cast(coalesce(l.loppupvm,'9999-12-31') as date)
		,lupa_id = l._source_id
		,rivi_nro = row_number() over (partition by l.jarjestajaOid, l.alkupvm order by l.paatospvm desc)
	FROM sa.sa_oiva_luvat l
	--epäjatkuvuuskohtien tarkistus. jos ei löydy yhtään riviä niin luvan alkupvm:ksi muutetaan vuoden eka päivä.
	left join sa.sa_oiva_luvat l2 on l2.jarjestajaYtunnus = l.jarjestajaYtunnus and datediff(day,l2.loppupvm,l.alkupvm)=1
	WHERE coalesce(l.loppupvm,'9999-12-31') > l.alkupvm
)


SELECT distinct
	jarjestajaYtunnus
	,alkupvm 
	,loppupvm = 
		case 
			when alkupvm != max(alkupvm) over (partition by jarjestajaYtunnus,Q.tutkintokoodi,loppupvm) then dateadd(day,-1,max(alkupvm) over (partition by jarjestajaYtunnus, Q.tutkintokoodi,loppupvm)) 
			else cast(loppupvm as date) 
		end
	--,tutkintokoodi = Q.tutkintokoodi --coalesce(d1.uusi_eat_koodi, Q.tutkintokoodi)
	,tutkinto_nimi1 = s.nimi1
	,tutkinto_nimi2 = s.nimi2
	,tutkinto_nimi3 = s.nimi3
	,tutkinto_nimi4 = s.nimi4
	,tutkinto_nimi5 = s.nimi5
	--,diaarinumero = coalesce(s.diaarinumero, s2.diaarinumero)
	,siirtymapaattyy = 
		case 
			when loppupvm = max(loppupvm) over (partition by jarjestajaYtunnus, s.nimi1) and generoitu = max(generoitu) over (partition by jarjestajaYtunnus,s.nimi1) then siirtymapaattyy 
			else null 
		end

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
	WHERE m.koodisto = 'koulutus' and l.rivi_nro=1

	UNION 

	--fuusioituneelle järjestäjälle luodaan lupatiedot ajalle ennen voimaantuloa koska Koskessa voi olla uudelle järjestäjälle merkittyjä opiskeluoikeuksia, joista puuttuu organisaatiohistoria-tieto
	SELECT distinct
		l1.jarjestajaYtunnus
		,l2.alkupvm_tod
		,l2.alkupvm
		,l2.loppupvm
		,tutkintokoodi = m.koodiarvo
		,generoitu = 0
	FROM luvat l1
	left join dw.d_amos_spl_jarjestaja_linkki a on a.ytunnus_amos_spl = jarjestajaYtunnus
	left join luvat l2 on l2.jarjestajaYtunnus = a.ytunnus_avain
	left join sa.sa_oiva_maaraykset m on m.lupaId = l1.lupa_id
	WHERE m.koodisto = 'koulutus' and l1.rivi_nro=1
	and a.ytunnus_avain != a.ytunnus_amos_spl
	and datediff(day,l2.loppupvm,l1.alkupvm)=1

	UNION
	
	--vanhan järjestäjän siirtymäsäännöksen mukainen oikeus siirtyy fuusiossa uudelle järjestäjälle
	SELECT distinct
		a.ytunnus_amos_spl
		,alkupvm_tod = '2018-01-01'
		,alkupvm = a.voimaan_alkaen
		,loppupvm = DATEADD(yy, DATEDIFF(yy, 0, a.voimaan_alkaen) + 1, -1)
		,tutkintokoodi = m1.koodiarvo
		,generoitu = 1
	FROM luvat l1
	left join sa.sa_oiva_maaraykset m1 on m1.lupaId = l1.lupa_id and m1.koodisto = 'koulutus'
	left join dw.d_amos_spl_jarjestaja_linkki a on a.ytunnus_avain = l1.jarjestajaYtunnus
	left join luvat l2 on l2.jarjestajaYtunnus = a.ytunnus_amos_spl and l2.alkupvm = a.voimaan_alkaen
	left join sa.sa_oiva_maaraykset m2 on m2.lupaId = l2.lupa_id and m2.koodisto = 'koulutus' and m1.koodiarvo = m2.koodiarvo
	WHERE l1.rivi_nro=1 and m2.id is null
	and a.voimaan_alkaen is not null
	and a.ytunnus_amos_spl is not null


) Q

--eperusteista siirtyma-aika. Asetuksen voimaantulopäivä 6.8.2018.
--left join (
--	select 
--		tutkintokoodi
--		,nimi_fi
--		--,diaarinumero
--		,voimassaoloalkaa=min(voimassaoloalkaa)
--		,voimassaololoppuu=max(coalesce(voimassaololoppuu,'9999-12-31'))
--		,siirtymapaattyy=max(cast(siirtymapaattyy as date))
--	from [Koski_SA].[sa].[sa_eperusteet]
--	where 1=1 and nimi_fi not like '%kokeilu'
--	group by tutkintokoodi,nimi_fi
--) s on s.tutkintokoodi = Q.tutkintokoodi 
--	and 
--		(
--		Q.alkupvm between s.voimassaoloalkaa and s.voimassaololoppuu
--		or coalesce(Q.loppupvm,'9999-12-31') between s.voimassaoloalkaa and s.voimassaololoppuu
--		or Q.alkupvm between s.voimassaoloalkaa and s.siirtymapaattyy
--		)

--jos ei löydy matchia edellisessä niin haetaan pelkän tutkintokoodin perusteella
--left join (
--	select distinct
--		tutkintokoodi
--		,vanha_eat_koodi = '3'+right(tutkintokoodi,5)
--		,diaarinumero
--		--,voimassaoloalkaa=min(voimassaoloalkaa)
--		--,voimassaololoppuu=max(coalesce(voimassaololoppuu,'9999-12-31'))
--		--,siirtymapaattyy=max(siirtymapaattyy)
--	from [Koski_SA].[sa].[sa_eperusteet]
--	where 1=1 and nimi_fi not like '%kokeilu'
--	--group by tutkintokoodi,diaarinumero
--) s2 on s2.tutkintokoodi = Q.tutkintokoodi --or s2.vanha_eat_koodi = Q.tutkintokoodi

CROSS APPLY (select nimi1,nimi2,nimi3,nimi4,nimi5,siirtymapaattyy from [dbo].[hae_tutkinnon_nimet] (Q.alkupvm,Q.loppupvm,Q.tutkintokoodi)) s

WHERE not (Q.generoitu = 1 and s.siirtymapaattyy is null) and not (s.siirtymapaattyy is not null and alkupvm > s.siirtymapaattyy)

