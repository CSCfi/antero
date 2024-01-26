USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_oiva_luvat_epo]    Script Date: 21.2.2022 20:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_oiva_luvat_epo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_oiva_luvat_epo] AS' 
END
GO


ALTER PROCEDURE [dw].[p_lataa_f_oiva_luvat_epo] @vuosi as int = 2018 AS


DECLARE @vuosi2 int
SET @vuosi2 = @vuosi

--EXEC sa.p_lataa_oiva_luvat_epo_opiskelijamaara

DROP TABLE IF EXISTS dw.f_oiva_luvat_epo
DROP TABLE IF EXISTS #temp_epo

WHILE @vuosi2 <= YEAR(GETDATE())

BEGIN

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
		 tarkasteluvuosi = @vuosi2
		,d_kalenteri_luvan_alku_id = coalesce(d5.id, -1)
		,Q1.alkupvm
		,d_kalenteri_luvan_loppu_id = coalesce(d6.id, -1)
		,d_kytkin_lupa_voimassa_id = coalesce(d13.id, -1)
		,d_organisaatioluokitus_jarjestaja_id = coalesce(d1.id, d1b.id, -1)
		,d_organisaatioluokitus_oppilaitos_id = coalesce(d1c.id, -1)
		,d1.organisaatio_koodi
		,d_alueluokitus_opetus_id = coalesce(d2_1.id, d2.id, -1)
		,d_kieli_id = coalesce(d3.id, -1)
		,d_opetustehtava_id = coalesce(d4.id, -1)
		,d_erityinen_koulutustehtava_id = coalesce(d7.id, -1)
		,d_opetuksen_jarjestamismuoto_id = coalesce(d8.id, -1)
		--
		,muutkoulutuksenjarjestamiseenliittyvatehdot
		--
		,opiskelijamaara = om.opiskelijamaara
		

	INTO #temp_epo

	FROM (
		SELECT DISTINCT 
			 l.jarjestajaYtunnus
			,l.jarjestajaOid
			,l.lupaId
			,l.alkupvm
			,l.loppupvm
			,voimassa = case when getdate() between l.alkupvm and coalesce(l.loppupvm, '9999-12-31') then 1 else 0 end
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

		WHERE rivi_nro=1 
		and @vuosi2 between year(l.alkupvm) and year(l.loppupvm)

	) Q1

	LEFT JOIN sa.oiva_luvat_epo_opiskelijamaara om on om.lupaId = Q1.lupaId
	LEFT JOIN dw.d_organisaatioluokitus d1 on d1.organisaatio_koodi = Q1.jarjestajaYtunnus
	LEFT JOIN dw.d_organisaatioluokitus d1b on d1b.organisaatio_oid = Q1.jarjestajaOid
	LEFT JOIN dw.d_organisaatioluokitus d1c on d1c.ylaorganisaatio_oid = coalesce(d1.organisaatio_oid, d1b.organisaatio_oid) and year(coalesce(d1c.loppupvm,'9999-12-31')) >= @vuosi2 and d1c.organisaatio_avain like 'oppilaitos%' 
	--oppilaitos kosken tietojen perusteella
	LEFT JOIN (
		select distinct 
			d.id 
		from ANTERO.dw.f_koski_esi_ja_perus_oppilaat_ja_paattaneet_lukuvuosittain f
		left join dw.d_organisaatioluokitus d on d.id = f.d_organisaatioluokitus_jarj_id
	) f_jarj on f_jarj.id = coalesce(d1.id, d1b.id)
	LEFT JOIN (
		select distinct 
			d.id 
		from ANTERO.dw.f_koski_esi_ja_perus_oppilaat_ja_paattaneet_lukuvuosittain f
		left join dw.d_organisaatioluokitus d on d.id = f.d_organisaatioluokitus_oppilaitos_id
	) f_opp on f_opp.id = d1c.id
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
	LEFT JOIN dw.d_kytkin d13 on d13.kytkin_koodi = Q1.voimassa

	WHERE (
		case
			when f_jarj.id is null or f_opp.id is not null then 1
			else 0
		end
	) = 1

	IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dw' AND  TABLE_NAME = 'f_oiva_luvat_epo')
	BEGIN
		delete from dw.f_oiva_luvat_epo where tarkasteluvuosi=@vuosi2;
		insert into dw.f_oiva_luvat_epo select * from #temp_epo
	END
	ELSE BEGIN
		select * into dw.f_oiva_luvat_epo from #temp_epo
	END

	DROP TABLE #temp_epo


	SET @vuosi2  = @vuosi2 + 1
	
END
		

GO
