USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_yo_opintopisteet_kuukausi_esilataus]    Script Date: 9.1.2026 9.28.29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dw].[p_lataa_api_yo_opintopisteet_kuukausi_esilataus] AS

DECLARE @pvm date
DECLARE @alkuVuosi int
DECLARE @maxVuosi int
DECLARE @continue int = 1
DECLARE @taulu varchar(max)
DECLARE @sql varchar(max)
SET @pvm  = (SELECT cast(MAX(loadtime) as date) FROM ANTERO.sa.sa_virta_otp_opintopistepvmyo)
SET @alkuVuosi = 2019
SET @maxVuosi = (SELECT MAX(vuosi) FROM ANTERO.sa.sa_virta_otp_opintopistepvmyo WHERE cast(loadtime as date) = @pvm and
coalesce(perustutkOpiskelijat, 0) + coalesce(vieraskSuoritukset, 0) + coalesce(ulkomailtaHyvLuet, 0) + coalesce(ulkomaaharjoittelu, 0) + coalesce(avoinKK, 0) + 
coalesce(kansainvVaihto, 0) + coalesce(kkYhteistyo, 0) + coalesce(erillinenOpintoOikeus, 0) + coalesce(erillinenOpintoOpettaja, 0) +
coalesce(kvsuomivieraana, 0) + coalesce(kvruotsivieraana, 0) + coalesce(muunkuinkorkeakoulun, 0) > 0)

TRUNCATE TABLE AnteroAPI.dw.[api_yo_opintopisteet_kuukausi]

WHILE @continue = 1

BEGIN

	IF NOT EXISTS (SELECT * FROM ANTERO.sys.objects WHERE object_id = OBJECT_ID(N'[ANTERO].[sa].[sa_virta_otp_opintopistepvmyo_' + cast(@alkuVuosi as varchar) + ']') AND type in (N'U'))
	
	BEGIN

		SET @continue = 0

		INSERT INTO AnteroAPI.dw.[api_yo_opintopisteet_kuukausi]

		SELECT 
		   f.tilastovuosi, 
		   f.kuukausi,
		   f.yliopisto,
		   f.koodit_yliopisto,
		   f.okm_ohjauksen_ala,
		   f.koodit_okm_ohjauksen_ala,
		   SUM(op_perustutkinto_opiskelijat_lkm) as op_perustutkinto_opiskelijat_lkm, 
		   SUM(op_avoin_yo_opetus_lkm) as op_avoin_yo_opetus_lkm, 
		   SUM(op_erikoistumiskoulutus_lkm) as op_erikoistumiskoulutus_lkm, 
		   SUM(op_erilliset_opinto_oikeudet_lkm) as op_erilliset_opinto_oikeudet_lkm, 
		   SUM(op_erilliset_opinto_oikeudet_opettaja_lkm) as op_erilliset_opinto_oikeudet_opettaja_lkm,
		   SUM(op_korkeakoulujen_yhteistyo_lkm) as op_korkeakoulujen_yhteistyo_lkm, 
		   SUM(op_saapuvat_vaihto_opiskelijat_lkm) as op_saapuvat_vaihto_opiskelijat_lkm, 
		   SUM(op_ulkomainen_harjoittelu_lkm) as op_ulkomainen_harjoittelu_lkm, 
		   SUM(op_ulkomailta_hyvaksiluetut_lkm) as op_ulkomailta_hyvaksiluetut_lkm, 
		   SUM(op_vieraskielinen_opetus_lkm) as op_vieraskielinen_opetus_lkm,
		   SUM(op_kv_suomi_vieraana_lkm) as op_kv_suomi_vieraana_lkm,
		   SUM(op_kv_ruotsi_vieraana_lkm) as op_kv_ruotsi_vieraana_lkm,
		   SUM(op_muun_kuin_korkeakoulun_yhteistyo_lkm) as op_muun_kuin_korkeakoulun_yhteistyo_lkm,
		   f.tietojen_ajankohta

		FROM (
			SELECT 
			  [tilastovuosi] = sa.vuosi,
			  [kuukausi] = month(convert(date, dateadd(s, convert(bigint, sa.suorituspaiva) / 1000, convert(datetime, '1-1-1970 3:00:00')))),
			  [okm_ohjauksen_ala] = coalesce(d1.ohjauksenala_nimi_fi,'Tieto puuttuu'),
			  [yliopisto] = d3.organisaatio_fi,
			  [op_perustutkinto_opiskelijat_lkm] = sa.perustutkOpiskelijat,
			  [op_vieraskielinen_opetus_lkm] = sa.vieraskSuoritukset,
			  [op_ulkomailta_hyvaksiluetut_lkm] = sa.ulkomailtaHyvLuet,
			  [op_ulkomainen_harjoittelu_lkm] = sa.ulkomaaharjoittelu,
			  [op_avoin_yo_opetus_lkm] = sa.avoinKK,
			  [op_saapuvat_vaihto_opiskelijat_lkm] = sa.kansainvVaihto,
			  [op_korkeakoulujen_yhteistyo_lkm] = sa.kkYhteistyo,
			  [op_erilliset_opinto_oikeudet_lkm] = sa.erillinenOpintoOikeus,
			  [op_erilliset_opinto_oikeudet_opettaja_lkm] = sa.erillinenOpintoOpettaja,
			  [op_erikoistumiskoulutus_lkm] = sa.erikoistumiskoulutus,
			  [op_kv_suomi_vieraana_lkm] = sa.kvsuomivieraana,
			  [op_kv_ruotsi_vieraana_lkm] = sa.kvruotsivieraana,
			  [op_muun_kuin_korkeakoulun_yhteistyo_lkm] = sa.muunkuinkorkeakoulun,
			  [koodit_okm_ohjauksen_ala] = coalesce(d1.ohjauksenala_koodi, '-1'),
			  [koodit_yliopisto] = d3.organisaatio_nykyinen_koodi,
			  [tietojen_ajankohta] = right('0'+cast(day(dateadd(day, -1, sa.loadtime)) as nvarchar(2)), 2) + '.' + right('0'+cast(month(dateadd(day, -1, sa.loadtime)) as nvarchar(2)), 2) + '.' + cast(year(dateadd(day, -1, sa.loadtime)) as nvarchar(4))
			FROM ANTERO.sa.sa_virta_otp_opintopistepvmyo as sa
			LEFT JOIN ANTERO.dw.d_ohjauksenala d1 ON d1.ohjauksenala_koodi = sa.koodi
			LEFT JOIN ANTERO.dw.d_organisaatioluokitus d3 ON d3.organisaatio_koodi = sa.oppilaitostunnus
			WHERE 
			(cast(sa.loadtime as date) = @pvm) AND 
			(sa.vuosi BETWEEN @alkuVuosi and @maxVuosi) AND NOT
			(sa.vuosi = @maxVuosi and MONTH(convert(date, dateadd(s, convert(bigint, sa.suorituspaiva) / 1000, convert(datetime, '1-1-1970 3:00:00')))) > MONTH(getdate()))
		) f 
		GROUP BY f.tilastovuosi, f.kuukausi, f.yliopisto, f.koodit_yliopisto, f.okm_ohjauksen_ala, f.koodit_okm_ohjauksen_ala, f.tietojen_ajankohta
		ORDER BY f.tilastovuosi, f.kuukausi, f.koodit_yliopisto, f.koodit_okm_ohjauksen_ala
	END

	IF EXISTS (SELECT * FROM ANTERO.sys.objects WHERE object_id = OBJECT_ID(N'[ANTERO].[sa].[sa_virta_otp_opintopistepvmyo_' + cast(@alkuVuosi as varchar) + ']') AND type in (N'U'))
	
	BEGIN
		
		SET @taulu = '[ANTERO].[sa].[sa_virta_otp_opintopistepvmyo_' + cast(@alkuVuosi as varchar) + ']'

		SET @sql = 

		'INSERT INTO AnteroAPI.dw.[api_yo_opintopisteet_kuukausi]
		 SELECT
			sa.tilastovuosi, 
			sa.kuukausi,
			d3.organisaatio_fi as yliopisto,
			d3.organisaatio_nykyinen_koodi as koodit_yliopisto,
			d1.ohjauksenala_nimi_fi as okm_ohjauksen_ala,
			d1.ohjauksenala_koodi as koodit_okm_ohjauksen_ala,
			op_perustutkinto_opiskelijat_lkm, 
			op_avoin_yo_opetus_lkm, 
			op_erikoistumiskoulutus_lkm, 
			op_erilliset_opinto_oikeudet_lkm, 
			op_erilliset_opinto_oikeudet_opettaja_lkm,
			op_korkeakoulujen_yhteistyo_lkm, 
			op_saapuvat_vaihto_opiskelijat_lkm, 
			op_ulkomainen_harjoittelu_lkm, 
			op_ulkomailta_hyvaksiluetut_lkm, 
			op_vieraskielinen_opetus_lkm,
			op_kv_suomi_vieraana_lkm,
			op_kv_ruotsi_vieraana_lkm,
			op_muun_kuin_korkeakoulun_yhteistyo_lkm,
			sa.tietojen_ajankohta
		FROM ' + @taulu + ' as sa
		LEFT JOIN ANTERO.dw.d_ohjauksenala d1 ON d1.ohjauksenala_koodi = coalesce(sa.ohjauksenala,-1)
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d3 ON d3.organisaatio_koodi = sa.oppilaitostunnus
		ORDER BY sa.tilastovuosi, sa.kuukausi, d3.organisaatio_koodi, d1.ohjauksenala_koodi'

		EXEC (@sql)

	END

	SET @alkuVuosi = @alkuVuosi + 1

END