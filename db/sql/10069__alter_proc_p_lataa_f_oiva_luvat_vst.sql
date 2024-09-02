USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_oiva_luvat_vst]    Script Date: 2.9.2024 10:15:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER PROCEDURE [dw].[p_lataa_f_oiva_luvat_vst] @vuosi as int = 2018 AS


DECLARE @vuosi2 int
SET @vuosi2 = @vuosi

DROP TABLE dw.f_oiva_luvat_vst

WHILE @vuosi2 <= YEAR(GETDATE())

BEGIN


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
		 tarkasteluvuosi = @vuosi2
		,d_kalenteri_luvan_alku_id = coalesce(d5.id, -1)
		,d_kalenteri_luvan_loppu_id = coalesce(d6.id, -1)
		,tarkastelukuukausi -- Lupa voimassa muutos tarkastelupäiväksi JK
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
			,tarkastelukuukausi = kk.kk -- Lupa voimassa muutos tarkastelupäiväksi JK
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
		join  (select kk = 1 union select 8) kk on  datefromparts(@vuosi2, kk, 1) between l.alkupvm and   coalesce(l.loppupvm, '9999-12-31') -- Lupa voimassa muutos tarkastelupäiväksi JK
		WHERE rivi_nro=1 
		and @vuosi2 between year(l.alkupvm) and year(l.loppupvm)
		and datefromparts(@vuosi2, kk, 1) < GETDATE() -- Lupa voimassa muutos tarkastelupäiväksi JK

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

   

	IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dw' AND  TABLE_NAME = 'f_oiva_luvat_vst')
	BEGIN
		delete from dw.f_oiva_luvat_vst where tarkasteluvuosi=@vuosi2;
		insert into dw.f_oiva_luvat_vst select * from #temp
	END
	ELSE BEGIN
		select * into dw.f_oiva_luvat_vst from #temp
	END

	DROP TABLE #temp
		

	SET @vuosi2  = @vuosi2 + 1
	
END