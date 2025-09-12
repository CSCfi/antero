USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [sa].[v_amos_oiva_muut_oikeudet] AS

SELECT
	jarjestajaYtunnus
	,alkupvm
	,loppupvm
	,tyovoima
	,laaja_oppis
	,erityinen_vaativa_tuki
	,sisaoppilaitosmuotoinen
	,vankila
	,valmistava
	,alkupvm_tod
	
FROM (

	SELECT distinct
		l.jarjestajaYtunnus
		--jos ei löydy edellistä lupaa niin lupa katsotaan alkaneeksi vuoden alusta
		,alkupvm = cast(case when l2.loppupvm is null then (select dateadd(yy, datediff(yy, 0, l.alkupvm), 0)) else l.alkupvm end as date)
		,loppupvm = case when l.alkupvm != max(l.alkupvm) over (partition by l.jarjestajaYtunnus,l.loppupvm) then dateadd(day,-1, max(l.alkupvm) over (partition by l.jarjestajaYtunnus,l.loppupvm)) else cast(coalesce(l.loppupvm,'9999-12-31') as date) end

		,tyovoima = case when m1.id is not null then 1 else 0 end
		,laaja_oppis = case when m2.id is not null then 1 else 0 end
		,erityinen_vaativa_tuki = case /*when l.jarjestajaYtunnus='0150951-1' and l.alkupvm='2018-01-01' then 0*/ when m3.id is not null then 1 else 0 end
		,sisaoppilaitosmuotoinen = case when m4.id is not null then 1 else 0 end
		,vankila = case /*when l.jarjestajaYtunnus='0203929-1' and l.alkupvm='2018-01-01' then 0*/ when m5.id is not null then 1 else 0 end
		,valmistava = case when m6.id is not null then 1 else 0 end

		,alkupvm_tod = l.alkupvm

		--,rank_paatos = rank() over (partition by l.diaarinumero order by l.paatospvm desc)
		,rank_paatos = rank() over (partition by l.jarjestajaYtunnus,l.alkupvm order by l.paatospvm desc)
		
	FROM sa.sa_oiva_luvat l
	--edellisen luvan tarkistus
	left join sa.sa_oiva_luvat l2 on l2.jarjestajaYtunnus = l.jarjestajaYtunnus and datediff(day,l2.loppupvm,l.alkupvm)=1
	--oikeudet
	left join sa.sa_oiva_maaraykset m1 on m1.lupaId = l.lupaId and m1.koodisto = 'oivatyovoimakoulutus' and m1.koodiarvo in (1,3)
	left join sa.sa_oiva_maaraykset m2 on m2.lupaId = l.lupaId and m2.koodisto = 'oivamuutoikeudetvelvollisuudetehdotjatehtavat' and m2.koodiarvo = '1'
	left join sa.sa_oiva_maaraykset m3 on m3.lupaId = l.lupaId and m3.koodisto = 'oivamuutoikeudetvelvollisuudetehdotjatehtavat' and m3.koodiarvo = '2'
	left join sa.sa_oiva_maaraykset m4 on m4.lupaId = l.lupaId and m4.koodisto = 'oivamuutoikeudetvelvollisuudetehdotjatehtavat' and m4.koodiarvo = '4'
	left join sa.sa_oiva_maaraykset m5 on m5.lupaId = l.lupaId and m5.koodisto = 'oivamuutoikeudetvelvollisuudetehdotjatehtavat' and m5.koodiarvo = '5'
	left join sa.sa_oiva_maaraykset m6 on m6.lupaId = l.lupaId and m6.koodisto = 'ammatilliseentehtavaanvalmistavakoulutus' and m6.koodiarvo is not null
	
	WHERE coalesce(l.loppupvm,'9999-12-31') > l.alkupvm --and l.paatospvm = max(l.paatospvm) over (partition by l.jarjestajaYtunnus,l.alkupvm)
	--and exists (select top 1 1 from sa.sa_oiva_maaraykset m where m.koodisto='koulutussektori' and m.koodiarvo='3' and m.lupaId=l.lupaId)
	and l.koulutustyyppi is null

) Q

WHERE rank_paatos=1

GO
