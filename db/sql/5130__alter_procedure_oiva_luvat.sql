USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_oiva_luvat_vst]    Script Date: 22.11.2021 14:23:14 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_oiva_luvat_vst]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_oiva_luvat_amm]    Script Date: 22.11.2021 14:23:14 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_oiva_luvat_amm]
GO
/****** Object:  StoredProcedure [dw].[p_lataa__oiva_luvat]    Script Date: 22.11.2021 14:23:14 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa__oiva_luvat]
GO
/****** Object:  StoredProcedure [dw].[p_lataa__oiva_luvat]    Script Date: 22.11.2021 14:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa__oiva_luvat]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa__oiva_luvat] AS' 
END
GO



ALTER PROCEDURE [dw].[p_lataa__oiva_luvat] AS
	
DECLARE @vuosi INT = 2018

DROP TABLE IF EXISTS dw.f_oiva_luvat_amm
DROP TABLE IF EXISTS dw.f_oiva_luvat_vst

WHILE @vuosi <= YEAR(GETDATE())
BEGIN
    EXEC dw.p_lataa_f_oiva_luvat_amm @vuosi
	EXEC dw.p_lataa_f_oiva_luvat_vst @vuosi
    SET @vuosi  = @vuosi  + 1
END
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_oiva_luvat_amm]    Script Date: 22.11.2021 14:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_oiva_luvat_amm]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_oiva_luvat_amm] AS' 
END
GO


ALTER PROCEDURE [dw].[p_lataa_f_oiva_luvat_amm] @vuosi as int = 2021 AS


;WITH 
luvat as (
	SELECT 
		 jarjestajaYtunnus
		,lupaId
		,alkupvm = l.alkupvm
		,loppupvm = cast(coalesce(l.loppupvm,'9999-12-31') as date)
		,rivi_nro = row_number() over (partition by jarjestajaYtunnus, alkupvm order by l.paatospvm desc)
	FROM sa.sa_oiva_luvat l
	WHERE coalesce(l.loppupvm,'9999-12-31') > l.alkupvm
	and koulutustyyppi is null
	--and exists (select * from sa.sa_oiva_koulutusluvat kl where kl.jarjestajaYtunnus=l.jarjestajaYtunnus)
	--ao pois kun ko luvat korjattu oivassa
	and l.lupaId not in (select distinct lupaId from sa.sa_oiva_luvat l	left join dw.d_amos_spl_jarjestaja_linkki d on d.ytunnus_avain=l.jarjestajaYtunnus where coalesce(l.loppupvm,'9999-12-31') > coalesce(d.voimaan_alkaen,'9999-12-31') AND l.koulutustyyppi is null)
)
,maaraykset as (
	SELECT 
		 maaraysId
		,lupaId
		,koodisto
		,koodiarvo
		,arvo
		,kohde_tunniste
		,maaraystyyppi_tunniste
	FROM sa.sa_oiva_maaraykset m
)
,alimaaraykset as (
	SELECT 
		maaraysId
		,koodisto
		,koodiarvo
		,maaraystyyppi_tunniste
	FROM sa.sa_oiva_alimaaraykset m
)
,koodisto as (
	SELECT 
		 koodisto
		,koodi
		,nimi
	FROM sa.sa_koodistot
)
,osaamisalat as (
	SELECT
		 l.jarjestajaYtunnus
		,l.lupaId
		,koodiarvo
		,d.selite_fi
	FROM maaraykset m
	JOIN luvat l on l.lupaId=m.lupaId
	JOIN dw.d_osaamisala d on d.koodi=m.koodiarvo
	WHERE koodisto='osaamisala' and m.maaraystyyppi_tunniste='RAJOITE'

	UNION

	SELECT
		 l.jarjestajaYtunnus
		,l.lupaId
		,am.koodiarvo
		,d.selite_fi
	FROM alimaaraykset am
	JOIN dw.d_osaamisala d on d.koodi=am.koodiarvo
	JOIN maaraykset m on m.maaraysId=am.maaraysId
	JOIN luvat l on l.lupaId=m.lupaId
	WHERE am.koodisto='osaamisala' and am.maaraystyyppi_tunniste='RAJOITE'
)

,koulutukset as (
	SELECT distinct 
		m.lupaId
		,m.koodisto
		,m.koodiarvo 
	FROM maaraykset m
	WHERE m.koodisto IN ('ammatilliseentehtavaanvalmistavakoulutus','kuljettajakoulutus','oivatyovoimakoulutus','koulutus')
	and ((m.koodisto = 'koulutus' and m.koodiarvo in ('999901','999902','999903')) or m.koodisto != 'koulutus')
)
,opiskelijavuodet as (
	SELECT 
		* 
	FROM (
		SELECT
			lupaId
			,tyyppi = case 
				when koodisto='koulutussektori' then 'sekt'
				when koodiarvo='4' then 'sisa'
				when koodiarvo='2' then 'vet'
			end
			,arvo = cast(arvo as int)
		FROM maaraykset
		WHERE 1=1
		and (koodisto='koulutussektori' or (koodisto='oivamuutoikeudetvelvollisuudetehdotjatehtavat' and koodiarvo IN ('2','4')))
		and arvo is not null
	) Q
	pivot (
		sum(arvo) for tyyppi in ([sekt],[sisa],[vet])
	) pvt
)
,opetuskieli as (
	select
		pvt.lupaId
		,opetuskieli_koodi = concat(max([1]),max([2]),max([3]),max([4]),max([5]),max([6]),max([7]),max([8]),max([9]))
	from maaraykset m
	pivot (
		max(koodiarvo) for koodiarvo in ([1],[2],[3],[4],[5],[6],[7],[8],[9])
	) pvt
	where pvt.koodisto='oppilaitoksenopetuskieli'
	group by pvt.lupaId
)
,tutkintokieli2 as (
	select
		lupaId
		,tutkinto_koodi=ca.koodiarvo
		,tutkintokieli_koodi=case m1.koodiarvo when '5' then 'SE' else k2.koodi end
	from maaraykset m1
	cross apply (select koodiarvo from maaraykset m2 where m2.lupaId=m1.lupaId and m2.koodisto='KOULUTUS') ca
	left join koodisto k1 on k1.koodi=m1.koodiarvo and k1.koodisto='oppilaitoksenopetuskieli'
	left join koodisto k2 on k2.nimi=k1.nimi and k2.koodisto='kieli'
	where m1.koodisto='oppilaitoksenopetuskieli'
	
	union

	select
		lupaId
		,tutkinto_koodi=m.koodiarvo
		,tutkintokieli_koodi=am.koodiarvo
	from maaraykset m
	join alimaaraykset am on am.maaraysId = m.maaraysId and am.koodisto='kieli'
	where m.koodisto='koulutus'	
)

SELECT distinct
	 tarkasteluvuosi = @vuosi
	,d_kalenteri_luvan_alku_id = coalesce(d5.id, -1)
	,d_kalenteri_luvan_loppu_id = coalesce(d6.id, -1)
	,d_kytkin_lupa_voimassa_id = coalesce(d13.id, -1)
	,d_organisaatioluokitus_id = coalesce(d1.id, -1)
	,d_alueluokitus_toiminta_alue_id = coalesce(d2a.id, d2b.id, -1)
	,d_kytkin_toiminta_alue_koko_maa_id = coalesce(d10.id, -1)
	,d_kytkin_toiminta_alue_koko_maakunta_id = coalesce(d11.id, -1)
	,d_koulutusluokitus_tutkinto_id = coalesce(d3.id, -1)
	,d_osaamisala_tutkinto_id = coalesce(d12.id, -1)
	,d_kieli_tutkinto_id = coalesce(d3b.id, -1)
	,d_kieli_tutkinto_ja_opetus_id = coalesce(d3c.id, -1)
	,d_osaamisala_luvan_rajoite_id = coalesce(d4.id, -1)
	,d_oppilaitoksenopetuskieli_id = coalesce(d7.id, -1)
	,d_oivamuutoikeudetvelvollisuudetehdotjatehtavat_id = coalesce(d8.id, -1)
	,d_oivakoulutukset_id = coalesce(d9.id, -1)
	,opiskelijavuodet = coalesce(opiskelijavuodet,0)
	,opiskelijavuodet_sisa = coalesce(opiskelijavuodet_sisa,0)
	,opiskelijavuodet_vet = coalesce(opiskelijavuodet_vet,0)
INTO #temp	

FROM (
	SELECT DISTINCT 
		 l.jarjestajaYtunnus
		,l.lupaId
		,l.alkupvm
		,l.loppupvm
		,voimassa = case when getdate() between l.alkupvm and coalesce(l.loppupvm, '9999-12-31') then 1 else 0 end
		,kunta = m1.koodiarvo
		,maakunta=(case when m10.koodiarvo='FI2' then (select top 1 maakunta_koodi from dw.d_alueluokitus where maakunta_fi='Ahvenanmaa') else m2.koodiarvo end)
		,toiminta_alue_koko_maa=(case m10.koodiarvo when 'FI1' then 1 else 0 end)
		,toiminta_alue_koko_maakunta=(case when m2.koodiarvo is not null or m10.koodiarvo in ('FI1','FI2') then 1 else 0 end)
		,koulutus = m3.koodiarvo
		,tutkinnon_kieli = am3.koodiarvo
		,tutkinnon_kieli2 = coalesce(tk2.tutkintokieli_koodi,(select k2.koodi from sa.sa_koodistot k1 join sa.sa_koodistot k2 on k2.nimi=k1.nimi and k2.koodisto='kieli' where k1.koodi=ok.opetuskieli_koodi and k1.koodisto='oppilaitoksenopetuskieli'))
		,koulutukset_koodisto = k4.koodisto
		,koulutukset_koodi = k4.koodiarvo
		,kielikoodistoopetushallinto = k5.nimi
		,oivamuutoikeudetvelvollisuudetehdotjatehtavat = m11.koodiarvo
		,oppilaitoksenopetuskieli = ok.opetuskieli_koodi
		,osaamisala_rajoite = coalesce(am16.koodiarvo,m16.koodiarvo)
		,opiskelijavuodet = o.sekt
		,opiskelijavuodet_sisa = o.sisa
		,opiskelijavuodet_vet = o.vet
	FROM luvat l 
	LEFT JOIN maaraykset m1 ON m1.lupaId=l.lupaId AND m1.koodisto='kunta'
	LEFT JOIN maaraykset m2 ON m2.lupaId=l.lupaId AND m2.koodisto='maakunta'
	LEFT JOIN maaraykset m3 ON m3.lupaId=l.lupaId AND m3.koodisto='koulutus'
	LEFT JOIN alimaaraykset am3 on am3.maaraysId = m3.maaraysId AND am3.koodisto='kieli'
	LEFT JOIN tutkintokieli2 tk2 ON tk2.lupaId=m3.lupaId and tk2.tutkinto_koodi=m3.koodiarvo
	LEFT JOIN koulutukset k4 ON k4.lupaId=l.lupaId
	LEFT JOIN maaraykset m5 ON m5.lupaId=l.lupaId AND m5.koodisto='kielikoodistoopetushallinto'
	LEFT JOIN koodisto k5 ON k5.koodisto=m5.koodisto and k5.koodi=m5.koodiarvo
	LEFT JOIN maaraykset m7 ON m7.lupaId=l.lupaId AND m7.koodisto='koulutustehtava'
	LEFT JOIN maaraykset m10 ON m10.lupaId=l.lupaId AND m10.koodisto='nuts1'
	LEFT JOIN maaraykset m11 ON m11.lupaId=l.lupaId AND m11.koodisto='oivamuutoikeudetvelvollisuudetehdotjatehtavat'
	LEFT JOIN maaraykset m13 ON m13.lupaId=l.lupaId AND m13.koodisto='opetustehtava'
	LEFT JOIN opetuskieli ok ON ok.lupaId=l.lupaId
	LEFT JOIN maaraykset m15 ON m15.lupaId=l.lupaId AND m15.koodisto='oppilaitos'
	LEFT JOIN alimaaraykset am16 ON am16.maaraysId=m3.maaraysId AND am16.koodisto='osaamisala'
	LEFT JOIN maaraykset m16 ON m16.lupaId=l.lupaId AND m16.koodisto='osaamisala'
	LEFT JOIN opiskelijavuodet o ON o.lupaId=l.lupaId
	WHERE rivi_nro=1 
	and @vuosi between year(l.alkupvm) and year(l.loppupvm)
	and coalesce(m3.koodiarvo,'') not in ('999901','999902','999903')

) Q1

LEFT JOIN dw.d_organisaatioluokitus d1 on d1.organisaatio_koodi=Q1.jarjestajaYtunnus
OUTER APPLY (SELECT distinct maakunta_koodi FROM dw.d_alueluokitus where maakunta_koodi not in ('-1','99') and maakunta_koodi is not null and voimassa=1 and Q1.toiminta_alue_koko_maa=1) oa
LEFT JOIN dw.d_alueluokitus d2a on d2a.kunta_koodi=Q1.kunta
LEFT JOIN dw.d_alueluokitus d2b on d2b.maakunta_koodi=(case when Q1.kunta is null and Q1.maakunta is not null then Q1.maakunta when Q1.toiminta_alue_koko_maa=1 then oa.maakunta_koodi end) and d2b.voimassa=1
LEFT JOIN dw.d_koulutusluokitus d3 on d3.koulutusluokitus_koodi=Q1.koulutus
LEFT JOIN dw.d_kieli d3b on d3b.kieli_koodi=Q1.tutkinnon_kieli
LEFT JOIN dw.d_kieli d3c on d3c.kieli_koodi=Q1.tutkinnon_kieli2
LEFT JOIN dw.d_osaamisala d4 on d4.koodi=Q1.osaamisala_rajoite
LEFT JOIN dw.d_kalenteri d5 on d5.kalenteri_avain=Q1.alkupvm
LEFT JOIN dw.d_kalenteri d6 on d6.kalenteri_avain=Q1.loppupvm
LEFT JOIN dw.d_oppilaitoksenopetuskieli d7 on d7.koodi=Q1.oppilaitoksenopetuskieli
LEFT JOIN dw.d_oivamuutoikeudetvelvollisuudetehdotjatehtavat d8 on d8.koodi=Q1.oivamuutoikeudetvelvollisuudetehdotjatehtavat
LEFT JOIN dw.d_oivakoulutukset d9 on d9.koodisto=Q1.koulutukset_koodisto and d9.koodi=Q1.koulutukset_koodi
LEFT JOIN dw.d_kytkin d10 on d10.kytkin_koodi=Q1.toiminta_alue_koko_maa
LEFT JOIN dw.d_kytkin d11 on d11.kytkin_koodi=Q1.toiminta_alue_koko_maakunta
LEFT JOIN sa.v_tutkinto_osaamisalat_linkitys tol on tol.tutkinto_koodi=Q1.koulutus
LEFT JOIN dw.d_osaamisala d12 on d12.koodi = tol.osaamisala_koodi and d12.selite_fi not in (select oa.selite_fi from osaamisalat oa where oa.lupaId=Q1.lupaId)
LEFT JOIN dw.d_kytkin d13 on d13.kytkin_koodi = Q1.voimassa
      

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dw' AND  TABLE_NAME = 'f_oiva_luvat_amm')
BEGIN
	delete from dw.f_oiva_luvat_amm where tarkasteluvuosi=@vuosi;
	insert into dw.f_oiva_luvat_amm select * from #temp
END
ELSE BEGIN
	select * into dw.f_oiva_luvat_amm from #temp
END

DROP TABLE #temp
		

GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_oiva_luvat_vst]    Script Date: 22.11.2021 14:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_oiva_luvat_vst]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_oiva_luvat_vst] AS' 
END
GO


ALTER PROCEDURE [dw].[p_lataa_f_oiva_luvat_vst] @vuosi as int = 2021 AS

--DROP TABLE dw.f_oiva_luvat_vst

;WITH 
luvat as (
	SELECT 
		 jarjestajaYtunnus
		,lupaId
		,alkupvm = l.alkupvm
		,loppupvm = cast(coalesce(l.loppupvm,'9999-12-31') as date)
		,rivi_nro = row_number() over (partition by jarjestajaYtunnus, diaarinumero, alkupvm order by l.paatospvm desc)
	FROM sa.sa_oiva_luvat l
	WHERE coalesce(l.loppupvm,'9999-12-31') > l.alkupvm
	and koulutustyyppi = '3'
)
,maaraykset as (
	SELECT 
		 maaraysId
		,lupaId
		,koodisto
		,koodiarvo
		,arvo
		,kohde_tunniste
		,maaraystyyppi_tunniste
		,orgOid
	FROM sa.sa_oiva_maaraykset m
)
,koodisto as (
	SELECT 
		 koodisto
		,koodi
		,nimi
	FROM sa.sa_koodistot
)
,koulutukset as (
	SELECT distinct 
		m.lupaId
		,m.koodisto
		,m.koodiarvo 
	FROM maaraykset m
	WHERE m.koodisto IN ('vstetaopetus','vstoppilaitoksenalueellisuusjavaltakunnallisuus','')
	and ((m.koodisto = 'koulutus' and m.koodiarvo in ('999901','999902','999903')) or m.koodisto != 'koulutus')
)


SELECT distinct
	 tarkasteluvuosi = @vuosi
	,d_kalenteri_luvan_alku_id = coalesce(d5.id, -1)
	,d_kalenteri_luvan_loppu_id = coalesce(d6.id, -1)
	,d_kytkin_lupa_voimassa_id = coalesce(d11.id, -1)
	,d_organisaatioluokitus_jarjestaja_id = coalesce(d1.id, -1)
	,d_organisaatioluokitus_oppilaitos_id = coalesce(d1b.id, -1)
	,d_alueluokitus_oppilaitos_id = coalesce(d2_1.id, d2.id, -1)
	,d_kieli_id = coalesce(d3.id, -1)
	,d_vst_tyypit_id = coalesce(d7.id, -1)
	,d_vst_etaopetus_id = coalesce(d8.id, -1)
	,d_vst_oppilaitoksen_alueellisuus_ja_valtakunnallisuus_id = coalesce(d9.id, -1)
	,d_vst_erityinen_koulutustehtava_id = coalesce(d10.id, -1)
	,vsterityinenkoulutustehtava_selite
	,vstetaopetus_selite
	,vstoppilaitoksenalueellisuusjavaltakunnallisuus_selite
	,vsttyypit_selite
	--,opiskelijamaara = coalesce(opiskelijamaara, 0)
INTO #temp	

FROM (
	SELECT DISTINCT 
		 l.jarjestajaYtunnus
		,l.alkupvm
		,l.loppupvm
		,voimassa = case when getdate() between l.alkupvm and coalesce(l.loppupvm, '9999-12-31') then 1 else 0 end
		,kunta=m1.koodiarvo
		--,koulutukset_koodisto = k4.koodisto
		--,koulutukset_koodi = k4.koodiarvo
		,kielikoodistoopetushallinto = m5.koodiarvo
		--,kujamuutoikeudetmaarayksetjarajoitukset = k7.nimi
		--,opetustehtava = k12.koodi
		,vsterityinenkoulutustehtava = k8.koodi
		,vsterityinenkoulutustehtava_selite = k8.nimi
		,vstetaopetus = k9.koodi
		,vstetaopetus_selite = k9.nimi
		,vstoppilaitoksenalueellisuusjavaltakunnallisuus = k10.koodi
		,vstoppilaitoksenalueellisuusjavaltakunnallisuus_selite = k10.nimi
		,vsttyypit = k11.koodi
		,vsttyypit_selite = k11.nimi
		,oppilaitos = m15.orgOid

	FROM luvat l 
	LEFT JOIN maaraykset m1 ON m1.lupaId = l.lupaId AND m1.koodisto = 'kunta'
	--LEFT JOIN koulutukset k4 ON k4.lupaId = l.lupaId
	LEFT JOIN maaraykset m5 ON m5.lupaId = l.lupaId AND m5.koodisto = 'kielikoodistoopetushallinto'
	LEFT JOIN koodisto k5 ON k5.koodisto = m5.koodisto and k5.koodi = m5.koodiarvo
	LEFT JOIN maaraykset m7 ON m7.lupaId = l.lupaId AND m7.koodisto = 'kujamuutoikeudetmaarayksetjarajoitukset'
	LEFT JOIN koodisto k7 ON k7.koodisto = m7.koodisto and k7.koodi = m7.koodiarvo
	LEFT JOIN maaraykset m8 ON m8.lupaId = l.lupaId AND m8.koodisto = 'vsterityinenkoulutustehtava'
	LEFT JOIN koodisto k8 ON k8.koodisto = m8.koodisto and k8.koodi = m8.koodiarvo
	LEFT JOIN maaraykset m9 ON m9.lupaId = l.lupaId AND m9.koodisto = 'vstetaopetus'
	LEFT JOIN koodisto k9 ON k9.koodisto = m9.koodisto and k9.koodi = m9.koodiarvo
	LEFT JOIN maaraykset m10 ON m10.lupaId = l.lupaId AND m10.koodisto = 'vstoppilaitoksenalueellisuusjavaltakunnallisuus'
	LEFT JOIN koodisto k10 ON k10.koodisto = m10.koodisto and k10.koodi = m10.koodiarvo
	LEFT JOIN maaraykset m11 ON m11.lupaId = l.lupaId AND m11.koodisto = 'vsttyypit'
	LEFT JOIN koodisto k11 ON k11.koodisto = m11.koodisto and k11.koodi = m11.koodiarvo
	LEFT JOIN maaraykset m12 ON m12.lupaId = l.lupaId AND m12.koodisto = 'opetustehtava'
	LEFT JOIN koodisto k12 ON k12.koodisto = m12.koodisto and k12.koodi = m12.koodiarvo
	LEFT JOIN maaraykset m15 ON m15.lupaId = l.lupaId AND m15.koodisto = 'oppilaitos' and m15.orgOid is not null
	LEFT JOIN maaraykset m17 ON m17.lupaId = l.lupaId AND m17.koodisto = 'koulutussektori' and m17.kohde_tunniste = 'opiskelijamaara'
	WHERE rivi_nro=1 
	and @vuosi between year(l.alkupvm) and year(l.loppupvm)

) Q1

LEFT JOIN dw.d_organisaatioluokitus d1 on d1.organisaatio_koodi=Q1.jarjestajaYtunnus
LEFT JOIN dw.d_organisaatioluokitus d1b on d1b.organisaatio_oid=Q1.oppilaitos
LEFT JOIN dw.d_alueluokitus d2 on d2.kunta_koodi=Q1.kunta
--jos vanha kuntakoodi niin haetaan uusin
LEFT JOIN dw.d_alueluokitus d2_1 on d2_1.kunta_fi=d2.kunta_fi and d2_1.kunta_koodi != d2.kunta_koodi and d2_1.voimassa=1
LEFT JOIN dw.d_kieli d3 on d3.kieli_koodi=Q1.kielikoodistoopetushallinto
LEFT JOIN dw.d_kalenteri d5 on d5.kalenteri_avain=Q1.alkupvm
LEFT JOIN dw.d_kalenteri d6 on d6.kalenteri_avain=Q1.loppupvm
LEFT JOIN dw.d_vst_tyypit d7 on d7.koodi = Q1.vsttyypit
LEFT JOIN dw.d_vst_etaopetus d8 on d8.koodi = Q1.vstetaopetus
LEFT JOIN dw.d_vst_oppilaitoksen_alueellisuus_ja_valtakunnallisuus d9 on d9.koodi = Q1.vstoppilaitoksenalueellisuusjavaltakunnallisuus
LEFT JOIN dw.d_vst_erityinen_koulutustehtava d10 on d10.koodi = Q1.vsterityinenkoulutustehtava
LEFT JOIN dw.d_kytkin d11 on d11.kytkin_koodi = Q1.voimassa
   

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dw' AND  TABLE_NAME = 'f_oiva_luvat_vst')
BEGIN
	delete from dw.f_oiva_luvat_vst where tarkasteluvuosi=@vuosi;
	insert into dw.f_oiva_luvat_vst select * from #temp
END
ELSE BEGIN
	select * into dw.f_oiva_luvat_vst from #temp
END

DROP TABLE #temp
		