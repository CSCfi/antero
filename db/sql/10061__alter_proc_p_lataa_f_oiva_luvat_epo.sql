USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_oiva_luvat_epo]    Script Date: 28.8.2024 12:59:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO











ALTER PROCEDURE [dw].[p_lataa_f_oiva_luvat_epo] @alku as date = '2018-01-01' AS


DECLARE @pvmAlku as date
DECLARE @pvmLoppu as date
DECLARE @TKmax as int


SET @pvmAlku = @alku
SET @pvmLoppu = GETDATE()
SET @TKmax = YEAR((select max(alkaa) from VipunenTK.dbo.d_oppilaitoksen_taustatiedot_historia))

--EXEC sa.p_lataa_oiva_luvat_epo_opiskelijamaara
IF EXISTS (select top 1 1 from sa.sa_oiva_luvat) AND EXISTS (select top 1 1 from sa.sa_oiva_maaraykset) AND EXISTS (select top 1 1 from sa.sa_oiva_alimaaraykset)
 AND EXISTS (select top 1 1 from dw.f_koski_esi_ja_perus_oppilaat_ja_paattaneet_lukuvuosittain)
BEGIN 

DROP TABLE IF EXISTS sa.temp_epo_jarjluvat_kalenteri

SELECT kalenteri_avain
INTO sa.temp_epo_jarjluvat_kalenteri
FROM antero.dw.d_kalenteri
WHERE kalenteri_avain between @pvmAlku and @pvmLoppu and kuukausi in (1, 8) and paiva=1

DROP TABLE IF EXISTS dw.temp_f_koski_epo_paat_lukuv

SELECT DISTINCT 
		 d_organisaatioluokitus_jarj_id
		,oppilaitos_oid
INTO dw.temp_f_koski_epo_paat_lukuv
FROM ANTERO.dw.f_koski_esi_ja_perus_oppilaat_ja_paattaneet_lukuvuosittain




DROP TABLE IF EXISTS dw.f_oiva_luvat_epo
DROP TABLE IF EXISTS #temp_epo


	;WITH 
	luvat as (
		SELECT 
			 jarjestajaYtunnus
			,jarjestajaOid
			,lupaId
			,alkupvm = l.alkupvm
			,loppupvm = cast(coalesce(l.loppupvm,'9999-12-31') as date)
		    ,rivi_nro = row_number() over (partition by jarjestajaYtunnus, alkupvm order by l.paatospvm desc)
		FROM sa.sa_oiva_luvat l
		WHERE coalesce(l.loppupvm,'9999-12-31') > l.alkupvm
		and koulutustyyppi = '1'
	)


	SELECT distinct
		 d_kalenteri_tarkastelupaiva = d9.id
		,d_kalenteri_luvan_alku_id = coalesce(d5.id, -1)
		,d_kalenteri_luvan_loppu_id = coalesce(d6.id, -1)
		,d_organisaatioluokitus_jarjestaja_id = coalesce(d1.id, d1b.id, -1)
		,d_organisaatioluokitus_oppilaitos_id =  coalesce(oa1.id, oa2.id, -1)
		,d1.organisaatio_koodi
		,d_alueluokitus_opetus_id = coalesce(d2_1.id, d2.id, -1)
		,d_kieli_id = coalesce(d3.id, -1)
		,d_opetustehtava_id = coalesce(d4.id, -1)
		,d_erityinen_koulutustehtava_id = coalesce(d7.id, -1)
		,d_opetuksen_jarjestamismuoto_id = coalesce(d8.id, -1)
		--
		,muutkoulutuksenjarjestamiseenliittyvatehdot
		--
		,opiskelijamaara = null--om.opiskelijamaara
		

	INTO #temp_epo

	FROM (
		SELECT DISTINCT 
			 l.jarjestajaYtunnus
			,l.jarjestajaOid
			,l.lupaId
			,l.alkupvm
			,l.loppupvm
			,tarkastelupaiva=ka.kalenteri_avain -- Lupa voimassa muutos tarkastelupäiväksi JK
			,kunta = m1.koodiarvo
			,kielikoodistoopetushallinto = m5.koodiarvo
			,opetusksen_jarjestamismuoto = m7.koodiarvo
			,opetustehtava = m8.koodiarvo
			,erityinen_koulutustehtava = m9.koodiarvo
			,muutkoulutuksenjarjestamiseenliittyvatehdot = k10.nimi

		FROM luvat l 
		LEFT JOIN sa.sa_oiva_maaraykset m1 ON m1.lupaId = l.lupaId AND m1.koodisto = 'kunta'
		
		LEFT JOIN sa.sa_oiva_maaraykset m5 ON m5.lupaId = l.lupaId AND m5.koodisto = 'kielikoodistoopetushallinto'
		LEFT JOIN sa.sa_oiva_alimaaraykset am5 ON am5.maaraysId = m5.maaraysId and am5.koodisto = 'kunta'

		LEFT JOIN sa.sa_oiva_maaraykset m7 ON m7.lupaId = l.lupaId AND m7.koodisto = 'opetuksenjarjestamismuoto'
		LEFT JOIN sa.sa_oiva_alimaaraykset am7_1 ON am7_1.maaraysId = m7.maaraysId and am7_1.koodisto = 'opetustehtava'
		LEFT JOIN sa.sa_oiva_alimaaraykset am7_2 ON am7_2.ylempi_alimaaraysId = am7_1.alimaaraysId 

		LEFT JOIN sa.sa_oiva_maaraykset m8 ON m8.lupaId = l.lupaId AND m8.koodisto = 'opetustehtava'
		LEFT JOIN sa.sa_oiva_alimaaraykset am8 ON am8.maaraysId = m1.maaraysId and am8.koodisto = 'opetustehtava'

		LEFT JOIN sa.sa_oiva_maaraykset m9 ON m9.lupaId = l.lupaId AND m9.koodisto = 'poerityinenkoulutustehtava'

		LEFT JOIN sa.sa_oiva_maaraykset m10 ON m10.lupaId = l.lupaId AND m10.koodisto = 'pomuutkoulutuksenjarjestamiseenliittyvatehdot'
		LEFT JOIN sa.sa_koodistot k10 ON k10.koodisto = m10.koodisto and k10.koodi = m10.koodiarvo
		LEFT JOIN sa.sa_oiva_alimaaraykset am10 ON am10.maaraysId = m10.maaraysId and am10.koodisto = 'opetustehtava'
		join  sa.temp_epo_jarjluvat_kalenteri ka ON kalenteri_avain between l.alkupvm and coalesce(l.loppupvm, '9999-12-31') -- Lupa voimassa muutos tarkastelupäiväksi JK

		WHERE rivi_nro=1 
	) Q1

	--LEFT JOIN sa.oiva_luvat_epo_opiskelijamaara om on om.lupaId = Q1.lupaId
	LEFT JOIN dw.d_organisaatioluokitus d1 on d1.organisaatio_koodi = Q1.jarjestajaYtunnus
	LEFT JOIN dw.d_organisaatioluokitus d1b on d1b.organisaatio_oid = Q1.jarjestajaOid
	-- Oppilaitokset historia TK-aineistosta
	OUTER APPLY (
				select 
					d1c.id
				from VipunenTK.dbo.d_oppilaitoksen_taustatiedot_historia d
				join dw.d_organisaatioluokitus d1c on d1c.organisaatio_avain = 'oppilaitos_' + d.oppilaitos_avain
				where 1=1
				and d1.organisaatio_koodi = d.koulutuksen_jarjestajakoodi
				and Q1.tarkastelupaiva /*paiva*/ between d.alkaa and coalesce(NULLIF(d.paattyy, '9999-01-01'), datefromparts(@TKmax, 12, 31))
				 and ( not exists(
				      select 1 
				      from dw.temp_f_koski_epo_paat_lukuv
				      where d_organisaatioluokitus_jarj_id = coalesce(d1.id, d1b.id)) 
				or exists (
				      select 1 
				      from dw.temp_f_koski_epo_paat_lukuv
				      where oppilaitos_oid = d1c.organisaatio_oid)
					  )
				)oa1
	-- Oppilaitokset nykytilanne
	OUTER APPLY(
				select 
					d1d.id
				from dw.d_organisaatioluokitus d1d 	
				where 1=1
				and d1d.ylaorganisaatio_oid = coalesce(d1.organisaatio_oid, d1b.organisaatio_oid)
				and d1d.organisaatio_avain like 'oppilaitos%'
				and Q1.tarkastelupaiva /*paiva*/ between d1d.alkupvm and coalesce(d1d.loppupvm,'9999-12-31')			
			    and ( not exists(
				      select 1 
				      from dw.temp_f_koski_epo_paat_lukuv
				      where d_organisaatioluokitus_jarj_id = coalesce(d1.id, d1b.id)) 
				or exists (
					select 1 
					from dw.temp_f_koski_epo_paat_lukuv
					where oppilaitos_oid = d1d.organisaatio_oid	
			))
		) oa2
	--
	LEFT JOIN dw.d_alueluokitus d2 on d2.kunta_koodi = coalesce(Q1.kunta, d1.kunta_koodi, d1b.kunta_koodi)
	--uusin kuntakoodi
	LEFT JOIN dw.d_alueluokitus d2_1 on d2_1.kunta_fi = d2.kunta_fi and d2_1.kunta_koodi ! = d2.kunta_koodi and d2_1.voimassa = 1
	--
	LEFT JOIN dw.d_kieli d3 on d3.kieli_koodi = Q1.kielikoodistoopetushallinto
	LEFT JOIN dw.d_opetustehtava d4 on d4.koodi = Q1.opetustehtava
	LEFT JOIN dw.d_kalenteri d5 on d5.kalenteri_avain = Q1.alkupvm
	LEFT JOIN dw.d_kalenteri d6 on d6.kalenteri_avain = Q1.loppupvm
	LEFT JOIN dw.d_erityinen_koulutustehtava d7 on d7.koodi = Q1.erityinen_koulutustehtava
	LEFT JOIN dw.d_opetuksen_jarjestamismuoto d8 on d8.koodi = Q1.opetusksen_jarjestamismuoto
	LEFT JOIN dw.d_kalenteri d9 on d9.kalenteri_avain=Q1.tarkastelupaiva



	select * into dw.f_oiva_luvat_epo from #temp_epo


	DROP TABLE #temp_epo


	DROP TABLE sa.temp_epo_jarjluvat_kalenteri
	DROP TABLE dw.temp_f_koski_epo_paat_lukuv

END
;
