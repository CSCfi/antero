USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_oiva_luvat_lukio]    Script Date: 2.2.2024 11:06:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROCEDURE [dw].[p_lataa_f_oiva_luvat_lukio] @vuosi as int = 2018 AS

DECLARE @vuosi2 int
SET @vuosi2 = @vuosi

IF EXISTS (select top 1 1 from sa.sa_oiva_luvat) AND EXISTS (select top 1 1 from sa.sa_oiva_maaraykset) AND EXISTS (select top 1 1 from sa.sa_oiva_alimaaraykset)
BEGIN 

	DROP TABLE IF EXISTS dw.f_oiva_luvat_lukio

	WHILE @vuosi2 <= YEAR(GETDATE())

	BEGIN

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

SELECT distinct
			 tarkasteluvuosi = @vuosi2
			,d_kalenteri_luvan_alku_id = coalesce(d4.id, -1)
			,d_kalenteri_luvan_loppu_id = coalesce(d5.id, -1)
			,tarkastelukuukausi
			,d_organisaatioluokitus_id = coalesce(d1.id, -1)
			,d_alueluokitus_toiminta_alue_kunta_id = coalesce(d2a.id, d2b.id, -1)
			,d_alueluokitus_toiminta_alue_maakunta_id = coalesce(d2b.id, d2a.id, -1)
			,d_muutkoulutuksenjarjestamiseenliittyvatehdot_id = coalesce(d8.id, -1)
			,d_kieli_id = coalesce(d3.id, -1)
			,d_erityinen_koulutustehtava_id = coalesce(d7.id, -1)
			,d_opetuksen_jarjestamismuoto_id = coalesce(d8.id, -1)  --markus
		
		INTO #temp	

		FROM (
			SELECT DISTINCT 
				 l.jarjestajaYtunnus
				,jarjestajaOid
				,l.lupaId
				,l.alkupvm
				,l.loppupvm
				,tarkastelukuukausi = kk.kk 
				,kunta = m1.koodiarvo
				,maakunta = a.maakunta_koodi
				,kielikoodistoopetushallinto = m2.koodiarvo
				,opetuksen_jarjestamismuoto = m7.koodiarvo 
				,erityinen_koulutustehtava = m3.koodiarvo
				,muutkoulutuksenjarjestamiseenliittyvatehdot = m4.koodiarvo
			FROM luvat l 
			LEFT JOIN maaraykset m1 ON m1.lupaId=l.lupaId AND m1.koodisto='kunta'
			LEFT JOIN dw.d_alueluokitus a ON m1.koodiarvo = a.kunta_koodi
			LEFT JOIN maaraykset m2 ON m2.lupaId=l.lupaId AND m2.koodisto='kielikoodistoopetushallinto'
			LEFT JOIN sa.sa_oiva_maaraykset m3 ON m3.lupaId = l.lupaId AND m3.koodisto = 'lukioerityinenkoulutustehtavauusi'
			LEFT JOIN sa.sa_oiva_maaraykset m4 ON m4.lupaId = l.lupaId AND m4.koodisto = 'lukiomuutkoulutuksenjarjestamiseenliittyvatehdot'
			LEFT JOIN sa.sa_oiva_alimaaraykset am4 ON am4.maaraysId = m4.maaraysId and am4.koodisto = 'opetustehtava'
			LEFT JOIN sa.sa_oiva_maaraykset m5 ON m5.lupaId = l.lupaId AND m5.koodisto = 'kujalisamaareet'
			LEFT JOIN sa.sa_oiva_maaraykset m7 ON m7.lupaId = l.lupaId AND m7.koodisto = 'opetuksenjarjestamismuoto' --markus

		    join  (select kk = 1 union select 8) kk on  datefromparts(@vuosi2, kk, 1) between l.alkupvm and   coalesce(l.loppupvm, '9999-12-31')
			

			WHERE 
			@vuosi2 between year(l.alkupvm) and year(l.loppupvm)
			and datefromparts(@vuosi2, kk, 1) < GETDATE()


		) Q1

		LEFT JOIN dw.d_organisaatioluokitus d1 on d1.organisaatio_oid=Q1.jarjestajaOid
		LEFT JOIN dw.d_alueluokitus d2a on d2a.kunta_koodi=Q1.kunta
		LEFT JOIN dw.d_alueluokitus d2b on d2b.maakunta_koodi=Q1.maakunta
		LEFT JOIN dw.d_kieli d3 on d3.kieli_koodi = Q1.kielikoodistoopetushallinto
		LEFT JOIN dw.d_kalenteri d4 on d4.kalenteri_avain=Q1.alkupvm
		LEFT JOIN dw.d_kalenteri d5 on d5.kalenteri_avain=Q1.loppupvm
		 LEFT JOIN dw.d_erityinen_koulutustehtava_lukio d7 on d7.koodi = Q1.erityinen_koulutustehtava
		 LEFT JOIN dw.d_lukiomuutkoulutuksenjarjestamiseenliittyvatehdot d8 on d8.koodi=Q1.muutkoulutuksenjarjestamiseenliittyvatehdot
		 LEFT JOIN dw.d_opetuksen_jarjestamismuoto d9 on d9.koodi = Q1.opetuksen_jarjestamismuoto --markus


		IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dw' AND  TABLE_NAME = 'f_oiva_luvat_lukio')
		BEGIN
			delete from dw.f_oiva_luvat_lukio where tarkasteluvuosi=@vuosi2;
			insert into dw.f_oiva_luvat_lukio select * from #temp
		END
		ELSE BEGIN
			select * into dw.f_oiva_luvat_lukio from #temp
		END

		DROP TABLE #temp
		

		SET @vuosi2  = @vuosi2 + 1
	
	END

END

GO


