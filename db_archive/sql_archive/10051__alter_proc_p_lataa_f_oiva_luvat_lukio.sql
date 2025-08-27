USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_oiva_luvat_lukio]    Script Date: 26.8.2024 12:34:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


















ALTER   PROCEDURE [dw].[p_lataa_f_oiva_luvat_lukio] @alku as date = '2018-01-01' AS

DECLARE @pvmAlku as date
DECLARE @pvmLoppu as date
DECLARE @TKmax as int


SET @pvmAlku = @alku
SET @pvmLoppu = GETDATE()
SET @TKmax = YEAR((select max(alkaa) from VipunenTK.dbo.d_oppilaitoksen_taustatiedot_historia))

IF EXISTS (select top 1 1 from sa.sa_oiva_luvat) AND EXISTS (select top 1 1 from sa.sa_oiva_maaraykset) AND EXISTS (select top 1 1 from sa.sa_oiva_alimaaraykset)
 AND EXISTS (select top 1 1 from dw.f_koski_lukio_opiskelijat_kuukausittain)
BEGIN 

	DROP TABLE IF EXISTS sa.temp_lukio_jarjluvat_kalenteri

	SELECT kalenteri_avain
	INTO sa.temp_lukio_jarjluvat_kalenteri
	FROM antero.dw.d_kalenteri
	WHERE kalenteri_avain between @pvmAlku and @pvmLoppu and kuukausi in (1, 8) and paiva=1

	DROP TABLE IF EXISTS dw.temp_f_koski_lukio_op_kk

	SELECT DISTINCT 
		 koulutustoimija_oid
		,oppilaitos_oid
	INTO dw.temp_f_koski_lukio_op_kk
	FROM dw.f_koski_lukio_opiskelijat_kuukausittain


	DROP TABLE IF EXISTS dw.f_oiva_luvat_lukio


		;WITH 
		luvat as (
			SELECT 
				 jarjestajaYtunnus
				,jarjestajaOid --
				,lupaId
				,alkupvm = l.alkupvm
				,loppupvm = cast(coalesce(l.loppupvm,'9999-12-31') as date)
			FROM sa.sa_oiva_luvat l
			WHERE coalesce(l.loppupvm,'9999-12-31') > l.alkupvm
			and koulutustyyppi = 2
			
		)


SELECT distinct
			 d_kalenteri_tarkastelupaiva = d10.id
			,d_kalenteri_luvan_alku_id = coalesce(d4.id, -1)
			,d_kalenteri_luvan_loppu_id = coalesce(d5.id, -1)
			,d_organisaatioluokitus_jarjestaja_id = coalesce(d1.id, d1b.id, -1) -- Lisätty jarjestajaYtunnus JK
			,d_organisaatioluokitus_oppilaitos_id = coalesce(oa1.id, oa2.id, -1)		-- Lisätty JK
			,d_alueluokitus_toiminta_alue_kunta_id = coalesce(d2a.id, d2b.id, -1)
			,d_alueluokitus_toiminta_alue_maakunta_id = coalesce(d2b.id, d2a.id, -1)
			,d_muutkoulutuksenjarjestamiseenliittyvatehdot_id = coalesce(d8.id, -1)
			,d_kieli_id = coalesce(d3.id, -1)
			,d_erityinen_koulutustehtava_id = coalesce(d7.id, -1)
			,d_opetuksen_jarjestamismuoto_id = coalesce(d9.id, -1) 
		
		INTO #temp	

		FROM (
			SELECT DISTINCT 
				 l.jarjestajaYtunnus
				,l.jarjestajaOid
				,l.lupaId
				,l.alkupvm
				,l.loppupvm
				,tarkastelupaiva=ka.kalenteri_avain 
				,kunta = m1.koodiarvo
				,maakunta = a.maakunta_koodi
				,kielikoodistoopetushallinto = m2.koodiarvo
				,opetuksen_jarjestamismuoto = m7.koodiarvo 
				,erityinen_koulutustehtava = m3.koodiarvo
				,muutkoulutuksenjarjestamiseenliittyvatehdot = m4.koodiarvo
			FROM luvat l 
			LEFT JOIN sa.sa_oiva_maaraykset m1 ON m1.lupaId=l.lupaId AND m1.koodisto='kunta'
			LEFT JOIN dw.d_alueluokitus a ON m1.koodiarvo = a.kunta_koodi
			LEFT JOIN sa.sa_oiva_maaraykset m2 ON m2.lupaId=l.lupaId AND m2.koodisto='kielikoodistoopetushallinto'
			LEFT JOIN sa.sa_oiva_maaraykset m3 ON m3.lupaId = l.lupaId AND m3.koodisto = 'lukioerityinenkoulutustehtavauusi'
			LEFT JOIN sa.sa_oiva_maaraykset m4 ON m4.lupaId = l.lupaId AND m4.koodisto = 'lukiomuutkoulutuksenjarjestamiseenliittyvatehdot'
			LEFT JOIN sa.sa_oiva_alimaaraykset am4 ON am4.maaraysId = m4.maaraysId and am4.koodisto = 'opetustehtava'
			LEFT JOIN sa.sa_oiva_maaraykset m5 ON m5.lupaId = l.lupaId AND m5.koodisto = 'kujalisamaareet'
			LEFT JOIN sa.sa_oiva_maaraykset m7 ON m7.lupaId = l.lupaId AND m7.koodisto = 'lukiooikeussisaooppilaitosmuotoiseenkoulutukseen'
			join  sa.temp_lukio_jarjluvat_kalenteri ka ON kalenteri_avain between l.alkupvm and coalesce(l.loppupvm, '9999-12-31')

		) Q1
		-- Järjestäjä
		LEFT JOIN dw.d_organisaatioluokitus d1 on d1.organisaatio_koodi=Q1.jarjestajaYtunnus
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
					Select 1
					from dw.temp_f_koski_lukio_op_kk
					where koulutustoimija_oid= coalesce(d1.organisaatio_oid, d1b.organisaatio_oid))
				 
				 or exists (
					select 1 
					from dw.temp_f_koski_lukio_op_kk
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
			    and( not exists(
					Select 1
					from dw.temp_f_koski_lukio_op_kk
					where koulutustoimija_oid= coalesce(d1.organisaatio_oid, d1b.organisaatio_oid))
				 
				 or exists (
				select 1 
				from dw.temp_f_koski_lukio_op_kk
				where oppilaitos_oid = d1d.organisaatio_oid)
			)
		) oa2
		LEFT JOIN dw.d_alueluokitus d2a on d2a.kunta_koodi=Q1.kunta
		LEFT JOIN dw.d_alueluokitus d2b on d2b.maakunta_koodi=Q1.maakunta
		LEFT JOIN dw.d_kieli d3 on d3.kieli_koodi = Q1.kielikoodistoopetushallinto
		LEFT JOIN dw.d_kalenteri d4 on d4.kalenteri_avain=Q1.alkupvm
		LEFT JOIN dw.d_kalenteri d5 on d5.kalenteri_avain=Q1.loppupvm
		LEFT JOIN dw.d_erityinen_koulutustehtava_lukio d7 on d7.koodi = Q1.erityinen_koulutustehtava
		LEFT JOIN dw.d_lukiomuutkoulutuksenjarjestamiseenliittyvatehdot d8 on d8.koodi=Q1.muutkoulutuksenjarjestamiseenliittyvatehdot
		LEFT JOIN dw.d_opetuksen_jarjestamismuoto_lukio d9 on d9.koodi = Q1.opetuksen_jarjestamismuoto
		LEFT JOIN dw.d_kalenteri d10 on d10.kalenteri_avain=Q1.tarkastelupaiva


		select * into dw.f_oiva_luvat_lukio from #temp

		DROP TABLE #temp
		DROP TABLE sa.temp_lukio_jarjluvat_kalenteri
		DROP TABLE dw.temp_f_koski_lukio_op_kk

	

END

GO

