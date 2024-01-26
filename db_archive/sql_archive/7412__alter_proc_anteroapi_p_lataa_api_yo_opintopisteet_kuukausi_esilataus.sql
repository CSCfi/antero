USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_yo_opintopisteet_kuukausi_esilataus]    Script Date: 22.2.2023 7:48:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_api_yo_opintopisteet_kuukausi_esilataus] AS

DECLARE @pvm date
SET @pvm  = (SELECT cast(MAX(loadtime) as date) FROM ANTERO.sa.sa_virta_otp_opintopistepvmyo)

DECLARE @vuosi int
SET @vuosi = (SELECT MAX(vuosi) FROM ANTERO.sa.sa_virta_otp_opintopistepvmyo WHERE cast(loadtime as date) = @pvm and
coalesce(perustutkOpiskelijat, 0) + coalesce(vieraskSuoritukset, 0) + coalesce(ulkomailtaHyvLuet, 0) + coalesce(ulkomaaharjoittelu, 0) + coalesce(avoinKK, 0) + 
coalesce(kansainvVaihto, 0) + coalesce(kkYhteistyo, 0) + coalesce(erillinenOpintoOikeus, 0) + coalesce(erillinenOpintoOpettaja, 0) +
coalesce(kvsuomivieraana, 0) + coalesce(kvruotsivieraana, 0) + coalesce(muunkuinkorkeakoulun, 0) > 0)

TRUNCATE TABLE AnteroAPI.dw.[api_yo_opintopisteet_kuukausi];

INSERT INTO AnteroAPI.dw.[api_yo_opintopisteet_kuukausi]

SELECT 
	   ROW_NUMBER() 
		OVER( ORDER BY 
			f.tilastovuosi ASC, 
			f.kuukausi ASC,
			f.koodit_yliopisto ASC, 
			f.koodit_okm_ohjauksen_ala ASC) as defaultorder,
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
		  [yliopisto] = d3.yo_nimi_fi,
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
		  [koodit_yliopisto] = d3.yo_tunnus,
		  [tietojen_ajankohta] = right('0'+cast(day(dateadd(day, -1, sa.loadtime)) as nvarchar(2)), 2) + '.' + right('0'+cast(month(dateadd(day, -1, sa.loadtime)) as nvarchar(2)), 2) + '.' + cast(year(dateadd(day, -1, sa.loadtime)) as nvarchar(4))
	FROM ANTERO.sa.sa_virta_otp_opintopistepvmyo as sa
	LEFT JOIN ANTERO.dw.d_ohjauksenala d1 ON d1.ohjauksenala_koodi = sa.koodi
	LEFT JOIN ANTERO.dw.d_yo d3 ON d3.yo_tunnus = sa.oppilaitostunnus
	WHERE 
	(cast(sa.loadtime as date) = @pvm) AND 
	((sa.vuosi BETWEEN @vuosi - 2 and @vuosi - 1) OR
	((@vuosi = YEAR(getdate()) - 1 AND sa.vuosi = @vuosi) OR (sa.vuosi = @vuosi AND @vuosi = YEAR(getdate()) AND
	MONTH(convert(date, dateadd(s, convert(bigint, sa.suorituspaiva) / 1000, convert(datetime, '1-1-1970 3:00:00')))) <= MONTH(getdate()))))) f 
GROUP BY f.tilastovuosi, f.kuukausi, f.yliopisto, f.koodit_yliopisto, f.okm_ohjauksen_ala, f.koodit_okm_ohjauksen_ala, f.tietojen_ajankohta


GO

USE [ANTERO]