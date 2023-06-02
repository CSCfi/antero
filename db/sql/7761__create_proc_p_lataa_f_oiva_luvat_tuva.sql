USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_oiva_luvat_tuva]    Script Date: 2.6.2023 9:56:29 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_oiva_luvat_tuva]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_oiva_luvat_tuva]    Script Date: 2.6.2023 9:56:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO















CREATE PROCEDURE [dw].[p_lataa_f_oiva_luvat_tuva] @vuosi as int = 2018 AS


DECLARE @vuosi2 int
SET @vuosi2 = @vuosi

IF EXISTS (select top 1 1 from sa.sa_oiva_luvat) AND EXISTS (select top 1 1 from sa.sa_oiva_maaraykset) AND EXISTS (select top 1 1 from sa.sa_oiva_alimaaraykset)
BEGIN 

	DROP TABLE IF EXISTS dw.f_oiva_luvat_tuva

	WHILE @vuosi2 <= YEAR(GETDATE())

	BEGIN

		;WITH 
		luvat as (
			SELECT 
				 jarjestajaYtunnus
				,jarjestajaOid
				,lupaId
				,paalupa_id
				,alkupvm = l.alkupvm
				,loppupvm = cast(coalesce(l.loppupvm,'9999-12-31') as date)
				,koulutusmuodonPaasivunOtsikko
				,rivi_nro = row_number() over (partition by jarjestajaYtunnus, alkupvm order by l.paatospvm desc)
			FROM sa.sa_oiva_luvat l
			WHERE coalesce(l.loppupvm,'9999-12-31') > l.alkupvm
			and koulutustyyppi = 5
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
		,opetuskieli as (	--Sis‰lt‰‰ "suomi ja ruotsi"
			select
				pvt.lupaId
				,opetuskieli_koodi = concat(max([1]),max([2]),max([3]),max([4]),max([5]),max([6]),max([7]),max([8]),max([9]))
			from sa.sa_oiva_maaraykset m
			pivot (
				max(koodiarvo) for koodiarvo in ([1],[2],[3],[4],[5],[6],[7],[8],[9])
			) pvt
			where pvt.koodisto='oppilaitoksenopetuskieli'
			group by pvt.lupaId
		)
		,opetuskieli2 as (	--Poistettu "suomi ja ruotsi"
			select
				lupaId
				,opetuskieli_koodi2
			from opetuskieli m
			cross apply (values (substring(opetuskieli_koodi, 1, 1),
				substring(opetuskieli_koodi, 2, 1),
				substring(opetuskieli_koodi, 3, 1),
				substring(opetuskieli_koodi, 4, 1))) v(c1, c2, c3, c4)
			cross apply (values (v.c1),(v.c2),(v.c3),(v.c4)) u(opetuskieli_koodi2)
			WHERE LEN(opetuskieli_koodi2) != 0 AND opetuskieli_koodi != -1
		)

		SELECT distinct
			 tarkasteluvuosi = @vuosi2
			,alkup_jarjestamislupa
			,d_kalenteri_luvan_alku_id = coalesce(d5.id, -1)
			,d_kalenteri_luvan_loppu_id = coalesce(d6.id, -1)
			,d_kytkin_lupa_voimassa_id = coalesce(d13.id, -1)
			,d_organisaatioluokitus_jarjestaja_id = coalesce(d1.id, -1)
			,d_alueluokitus_toiminta_alue_kunta_id = coalesce(d2a.id, d2b.id, -1)
			,d_alueluokitus_toiminta_alue_maakunta_id = coalesce(d2b.id, d2a.id, -1)
			,d_kytkin_toiminta_alue_koko_maa_id = coalesce(d10.id, -1)
			,d_kytkin_toiminta_alue_koko_maakunta_id = coalesce(d11.id, -1)
			,d_oppilaitoksenopetuskieli_id = coalesce(d7.id, -1)
			,d_kieli_id = coalesce(d3.id, -1)
			,opiskelijavuodet = coalesce(opiskelijavuodet,0)
			,opiskelijavuodet_sisa = coalesce(opiskelijavuodet_sisa,0)
			,opiskelijavuodet_vet = coalesce(opiskelijavuodet_vet,0)
		INTO #temp	

		FROM (
			SELECT DISTINCT 
				 l.jarjestajaYtunnus
				,l.jarjestajaOid
				,l.lupaId
				,l.paalupa_id
				,l.alkupvm
				,l.loppupvm
				,alkup_jarjestamislupa = l.koulutusmuodonPaasivunOtsikko
				,voimassa = case when getdate() between l.alkupvm and coalesce(l.loppupvm, '9999-12-31') then 1 else 0 end
				,kunta = m1.koodiarvo
				,maakunta=(case when m10.koodiarvo='FI2' then (select top 1 maakunta_koodi from dw.d_alueluokitus where maakunta_fi='Ahvenanmaa') else m2.koodiarvo end)
				,toiminta_alue_koko_maa=(case m10.koodiarvo when 'FI1' then 1 else 0 end)
				,toiminta_alue_koko_maakunta=(case when m2.koodiarvo is not null or m10.koodiarvo in ('FI1','FI2') then 1 else 0 end)
				--,oppilaitoksenopetuskieli = ok.opetuskieli_koodi		--Sis‰lt‰‰ "suomi ja ruotsi"
				,oppilaitoksenopetuskieli = ok.opetuskieli_koodi2		--Poistettu "suomi ja ruotsi"
				,kielikoodistoopetushallinto = m3.koodiarvo
				,opiskelijavuodet = o.sekt
				,opiskelijavuodet_sisa = o.sisa
				,opiskelijavuodet_vet = o.vet
			FROM luvat l 
			LEFT JOIN maaraykset m1 ON m1.lupaId=l.paalupa_id AND m1.koodisto='kunta'
			LEFT JOIN maaraykset m2 ON m2.lupaId=l.paalupa_id AND m2.koodisto='maakunta'
			LEFT JOIN maaraykset m10 ON m10.lupaId=l.paalupa_id AND m10.koodisto='nuts1'
			LEFT JOIN maaraykset m3 ON m3.lupaId=l.paalupa_id AND m3.koodisto='kielikoodistoopetushallinto'
			--LEFT JOIN opetuskieli ok ON ok.lupaId=l.paalupa_id	--Sis‰lt‰‰ "suomi ja ruotsi"
			LEFT JOIN opetuskieli2 ok ON ok.lupaId=l.paalupa_id		--Poistettu "suomi ja ruotsi"
			LEFT JOIN opiskelijavuodet o ON o.lupaId=l.paalupa_id
			WHERE rivi_nro=1 
			and @vuosi2 between year(l.alkupvm) and year(l.loppupvm)

		) Q1

		LEFT JOIN dw.d_organisaatioluokitus d1 on d1.organisaatio_koodi=Q1.jarjestajaYtunnus
		LEFT JOIN dw.d_organisaatioluokitus d1b on d1b.organisaatio_oid = Q1.jarjestajaOid
		OUTER APPLY (SELECT distinct maakunta_koodi FROM dw.d_alueluokitus where maakunta_koodi not in ('-1','99') and maakunta_koodi is not null and voimassa=1 and Q1.toiminta_alue_koko_maa=1) oa
		LEFT JOIN dw.d_alueluokitus d2a on d2a.kunta_koodi=Q1.kunta
		LEFT JOIN dw.d_alueluokitus d2b on d2b.maakunta_koodi=Q1.maakunta
		LEFT JOIN dw.d_kalenteri d5 on d5.kalenteri_avain=Q1.alkupvm
		LEFT JOIN dw.d_kalenteri d6 on d6.kalenteri_avain=Q1.loppupvm
		LEFT JOIN dw.d_kieli d3 on d3.kieli_koodi = Q1.kielikoodistoopetushallinto
		LEFT JOIN dw.d_oppilaitoksenopetuskieli d7 on d7.koodi=Q1.oppilaitoksenopetuskieli
		LEFT JOIN dw.d_kytkin d10 on d10.kytkin_koodi=Q1.toiminta_alue_koko_maa
		LEFT JOIN dw.d_kytkin d11 on d11.kytkin_koodi=Q1.toiminta_alue_koko_maakunta
		LEFT JOIN dw.d_kytkin d13 on d13.kytkin_koodi = Q1.voimassa
      

		IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dw' AND  TABLE_NAME = 'f_oiva_luvat_tuva')
		BEGIN
			delete from dw.f_oiva_luvat_tuva where tarkasteluvuosi=@vuosi2;
			insert into dw.f_oiva_luvat_tuva select * from #temp
		END
		ELSE BEGIN
			select * into dw.f_oiva_luvat_tuva from #temp
		END

		DROP TABLE #temp
		

		SET @vuosi2  = @vuosi2 + 1
	
	END

END












GO


