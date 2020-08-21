USE [ANTERO]
GO
/****** Object:  View [sa].[v_amos_oiva_muut_oikeudet]    Script Date: 21.8.2020 10:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[sa].[v_amos_oiva_muut_oikeudet]'))
EXEC dbo.sp_executesql @statement = N'






CREATE VIEW [sa].[v_amos_oiva_muut_oikeudet] AS

SELECT distinct
	l.jarjestajaYtunnus
	--jos ei löydy edellistä lupaa niin lupa katsotaan alkaneeksi vuoden alusta
	,alkupvm = cast(case when l2.loppupvm is null then (select dateadd(yy, datediff(yy, 0, l.alkupvm), 0)) else l.alkupvm end as date)
	,loppupvm = cast(coalesce(l.loppupvm,''9999-12-31'') as date)

	,tyovoima = case when m1.id is not null then 1 else 0 end
	,laaja_oppis = case when m2.id is not null then 1 else 0 end
	,erityinen_vaativa_tuki = case /*when l.jarjestajaYtunnus=''0150951-1'' and l.alkupvm=''2018-01-01'' then 0*/ when m3.id is not null then 1 else 0 end
	,sisaoppilaitosmuotoinen = case when m4.id is not null then 1 else 0 end
	,vankila = case /*when l.jarjestajaYtunnus=''0203929-1'' and l.alkupvm=''2018-01-01'' then 0*/ when m5.id is not null then 1 else 0 end
	,valmistava = case when m6.id is not null then 1 else 0 end

	,alkupvm_tod = l.alkupvm
FROM sa.sa_oiva_luvat l
--edellisen luvan tarkistus
left join sa.sa_oiva_luvat l2 on l2.jarjestajaYtunnus = l.jarjestajaYtunnus and datediff(day,l2.loppupvm,l.alkupvm)=1
--oikeudet
left join sa.sa_oiva_maaraykset m1 on m1.lupaId = l._source_id and m1.koodisto = ''oivatyovoimakoulutus'' and m1.koodiarvo in (1,3)
left join sa.sa_oiva_maaraykset m2 on m2.lupaId = l._source_id and m2.koodisto = ''oivamuutoikeudetvelvollisuudetehdotjatehtavat'' and m2.koodiarvo = 1
left join sa.sa_oiva_maaraykset m3 on m3.lupaId = l._source_id and m3.koodisto = ''oivamuutoikeudetvelvollisuudetehdotjatehtavat'' and m3.koodiarvo = 2
left join sa.sa_oiva_maaraykset m4 on m4.lupaId = l._source_id and m4.koodisto = ''oivamuutoikeudetvelvollisuudetehdotjatehtavat'' and m4.koodiarvo = 4
left join sa.sa_oiva_maaraykset m5 on m5.lupaId = l._source_id and m5.koodisto = ''oivamuutoikeudetvelvollisuudetehdotjatehtavat'' and m5.koodiarvo = 5
left join sa.sa_oiva_maaraykset m6 on m6.lupaId = l._source_id and m6.koodisto = ''ammatilliseentehtavaanvalmistavakoulutus'' and m6.koodiarvo is not null
WHERE coalesce(l.loppupvm,''9999-12-31'') > l.alkupvm









' 
GO
/****** Object:  View [sa].[v_amos_oiva_opiskelijavuodet_rajoite]    Script Date: 21.8.2020 10:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[sa].[v_amos_oiva_opiskelijavuodet_rajoite]'))
EXEC dbo.sp_executesql @statement = N'




CREATE VIEW [sa].[v_amos_oiva_opiskelijavuodet_rajoite] AS


SELECT 
	jarjestajaYtunnus
	,alkupvm = cast(case when month(alkupvm) != 1 then dateadd(year, datediff(year, -1, alkupvm), 0) else alkupvm end as date)
	,loppupvm = cast(case when month(loppupvm) != 1 then dateadd(yy, datediff(yy, 0, loppupvm) + 1, -1) else coalesce(loppupvm,''9999-12-31'') end as date)
	,vaativa_erityinen_tuki = [2]
	,sisaoppilaitosmuotoinen = [4]
	,alkupvm_tod = alkupvm_tod
	,loppupvm_tod = loppupvm
FROM (
	SELECT distinct
		 l.jarjestajaYtunnus
		,alkupvm = cast(case when l2.jarjestajaOid is null then dateadd(yy, datediff(yy, 0, l.alkupvm), 0) else l.alkupvm end as date)
		,alkupvm_tod = l.alkupvm
		,loppupvm = cast(l.loppupvm as date)
		,koodiarvo
		,arvo = cast(arvo as int)
	FROM sa.sa_oiva_maaraykset m
	left join sa.sa_oiva_luvat l on m.lupaId=l._source_id
	--epäjatkuvuuskohtien tarkistus. jos ei löydy yhtään riviä niin luvan alkupvm:ksi muutetaan vuoden eka päivä.
	left join sa.sa_oiva_luvat l2 on l2.jarjestajaYtunnus = l.jarjestajaYtunnus and datediff(day,l2.loppupvm,l.alkupvm)=1
	WHERE m.kohde_tunniste = ''opiskelijavuodet'' and m.maaraystyyppi_tunniste = ''RAJOITE''
	AND coalesce(l.loppupvm,''9999-12-31'') > l.alkupvm
) q
PIVOT (
	max(arvo) for koodiarvo in ([2],[4])
) pvt

WHERE (case when month(alkupvm) != 1 then dateadd(year, datediff(year, -1, alkupvm), 0) else alkupvm end < cast(coalesce(loppupvm,''9999-12-31'') as date))
















' 
GO
/****** Object:  View [sa].[v_amos_oiva_tutkinto_oikeudet]    Script Date: 21.8.2020 10:03:58 ******/
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
		,lupa_id = l._source_id
		,rivi_nro = row_number() over (partition by l.diaarinumero order by l.paatospvm desc)
	FROM sa.sa_oiva_luvat l
	--epäjatkuvuuskohtien tarkistus. jos ei löydy yhtään riviä niin luvan alkupvm:ksi muutetaan vuoden eka päivä.
	left join sa.sa_oiva_luvat l2 on l2.jarjestajaYtunnus = l.jarjestajaYtunnus and datediff(day,l2.loppupvm,l.alkupvm)=1
	WHERE coalesce(l.loppupvm,''9999-12-31'') > l.alkupvm
)


SELECT distinct
	jarjestajaYtunnus
	,alkupvm
	,loppupvm = cast(loppupvm as date)
	,tutkintokoodi = coalesce(d1.uusi_eat_koodi, Q.tutkintokoodi)
	,siirtymapaattyy = case when loppupvm = max_loppupvm then siirtymapaattyy else null end
	--,alkupvm_tod
FROM (

	--todelliset lupatiedot
	SELECT 
		l.jarjestajaYtunnus
		,l.alkupvm_tod
		,l.alkupvm
		,l.loppupvm
		,max_loppupvm = max(cast(coalesce(l.loppupvm,''9999-12-31'') as date)) over (partition by l.jarjestajaYtunnus,m.koodiarvo)
		,tutkintokoodi = m.koodiarvo
		,geneerinen = 0
	FROM luvat l
	left join sa.sa_oiva_maaraykset m on m.lupaId = l.lupa_id
	WHERE m.koodisto = ''koulutus'' and l.rivi_nro=1

	UNION 

	--fuusioituneelle järjestäjälle luodaan lupatiedot ajalle ennen voimaantuloa koska Koskessa voi olla uudelle järjestäjälle merkittyjä opiskeluoikeuksia, joista puuttuu organisaatiohistoria-tieto
	SELECT distinct
		l1.jarjestajaYtunnus
		,l2.alkupvm_tod
		,l2.alkupvm
		,l2.loppupvm
		,max_loppupvm = max(cast(coalesce(l1.loppupvm,''9999-12-31'') as date)) over (partition by l1.jarjestajaYtunnus,m.koodiarvo)
		,tutkintokoodi = m.koodiarvo
		,geneerinen = 0
	FROM luvat l1
	left join dw.d_amos_spl_jarjestaja_linkki a on a.ytunnus_amos_spl = jarjestajaYtunnus
	left join luvat l2 on l2.jarjestajaYtunnus = a.ytunnus_avain
	left join sa.sa_oiva_maaraykset m on m.lupaId = l1.lupa_id
	WHERE m.koodisto = ''koulutus'' and l1.rivi_nro=1
	and a.ytunnus_avain != a.ytunnus_amos_spl
	and datediff(day,l2.loppupvm,l1.alkupvm)=1

	UNION
	
	--vanhan järjestäjän siirtymäsäännöksen mukainen oikeus siirtyy fuusiossa uudelle järjestäjälle
	SELECT distinct
		a.ytunnus_amos_spl
		,alkupvm_tod = ''2018-01-01''
		,alkupvm = a.voimaan_alkaen
		,loppupvm = DATEADD(yy, DATEDIFF(yy, 0, a.voimaan_alkaen) + 1, -1)
		,max_loppupvm = DATEADD(yy, DATEDIFF(yy, 0, a.voimaan_alkaen) + 1, -1)
		,tutkintokoodi = m1.koodiarvo
		,geneerinen = 1
	FROM luvat l1
	left join sa.sa_oiva_maaraykset m1 on m1.lupaId = l1.lupa_id and m1.koodisto = ''koulutus''
	left join dw.d_amos_spl_jarjestaja_linkki a on a.ytunnus_avain = l1.jarjestajaYtunnus
	left join luvat l2 on l2.jarjestajaYtunnus = a.ytunnus_amos_spl and l2.alkupvm = a.voimaan_alkaen
	left join sa.sa_oiva_maaraykset m2 on m2.lupaId = l2.lupa_id and m2.koodisto = ''koulutus'' and m1.koodiarvo = m2.koodiarvo
	WHERE l1.rivi_nro=1 and m2.id is null
	and a.voimaan_alkaen is not null
	and a.ytunnus_amos_spl is not null


) Q

--eperusteista siirtyma-aika. Asetuksen voimaantulopäivä 6.8.2018.
left join (
	select 
		tutkintokoodi
		,siirtymapaattyy=cast(max(siirtymapaattyy) as date)
	from [Koski_SA].[sa].[sa_eperusteet]
	where 1=1
	and voimassaoloalkaa <= ''2018-08-06''
	and nimi_fi not like ''%kokeilu''
	group by tutkintokoodi
) s on s.tutkintokoodi = Q.tutkintokoodi and (case when geneerinen=0 and ''2018-08-06'' between Q.alkupvm and Q.loppupvm then 1 when geneerinen=1 and ''2018-08-06'' between Q.alkupvm_tod and Q.loppupvm then 1 else 0 end)=1

--uudet eat koodit
left join ANTERO.dw.d_koulutusluokitus d1 on d1.koulutusluokitus_koodi = Q.tutkintokoodi

where not (Q.geneerinen = 1 and siirtymapaattyy is null) and not (siirtymapaattyy is not null and alkupvm > siirtymapaattyy)



' 
