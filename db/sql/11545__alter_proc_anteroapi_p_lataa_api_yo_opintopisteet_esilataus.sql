USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_yo_opintopisteet_esilataus]    Script Date: 9.1.2026 9.27.06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER PROCEDURE [dw].[p_lataa_api_yo_opintopisteet_esilataus] AS

TRUNCATE TABLE AnteroAPI.dw.[api_yo_opintopisteet];

INSERT INTO AnteroAPI.dw.[api_yo_opintopisteet]

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
	   f.aineistotyyppi,
	   f.tietojen_ajankohta

FROM (
	SELECT
		 [tilastovuosi] = f.vuosi
		,[kuukausi] = NULL
		,[okm_ohjauksen_ala] = d2.ohjauksenala_nimi_fi
		,[yliopisto] = d3.organisaatio_fi
		,[kaikki_tutk_op_lkm] AS op_perustutkinto_opiskelijat_lkm
		,[vierkielper_op_lkm] AS op_vieraskielinen_opetus_lkm
		,[ulkom_hyv_luetut_op_lkm] AS op_ulkomailta_hyvaksiluetut_lkm
		,[ulkom_harj_op_lkm] AS op_ulkomainen_harjoittelu_lkm
		,[avoinop_lkm] AS op_avoin_yo_opetus_lkm
		,[kv_vaihtoopiskelijat_op_lkm] AS op_saapuvat_vaihto_opiskelijat_lkm
		,[joo_op_lkm] AS op_korkeakoulujen_yhteistyo_lkm
		,[erillisilla_oik_op_lkm] AS op_erilliset_opinto_oikeudet_lkm
		,[erillisilla_oik_opkoul_op_lkm] AS op_erilliset_opinto_oikeudet_opettaja_lkm
		,[erikoul_suor_op_lkm] AS op_erikoistumiskoulutus_lkm
		,[kv_suomi_vieraana_op_lkm] as op_kv_suomi_vieraana_lkm
		,[kv_ruotsi_vieraana_op_lkm] as op_kv_ruotsi_vieraana_lkm
		,[muu_kuin_kk_yhteistyo_op_lkm] as op_muun_kuin_korkeakoulun_yhteistyo_lkm
		,[koodit_okm_ohjauksen_ala] = case d2.ohjauksenala_koodi when -1 then 99 else d2.ohjauksenala_koodi end
		,[koodit_yliopisto] = d3.organisaatio_nykyinen_koodi
		,[aineistotyyppi] = 'Lopullinen'
		,[tietojen_ajankohta] = concat('05.03.', f.vuosi+1)
	FROM ANTERO.dw.f_yo_opintopisteet f
	LEFT JOIN ANTERO.dw.d_ohjauksenala d2 on d2.id=f.d_ohjauksenala_id
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus d3 on d3.id=f.d_yo_id
	LEFT JOIN ANTERO.dw.d_kalenteri d5 on d5.id=f.d_tilannepvm_id

	UNION ALL

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
		  [aineistotyyppi] = 'Live',
		  [tietojen_ajankohta] = right('0'+cast(day(dateadd(day, -1, sa.loadtime)) as nvarchar(2)), 2) + '.' + right('0'+cast(month(dateadd(day, -1, sa.loadtime)) as nvarchar(2)), 2) + '.' + cast(year(dateadd(day, -1, sa.loadtime)) as nvarchar(4))
	FROM ANTERO.sa.sa_virta_otp_opintopistepvmyo as sa
	LEFT JOIN ANTERO.dw.d_ohjauksenala d1 ON d1.ohjauksenala_koodi = sa.koodi
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus d3 ON d3.organisaatio_koodi = sa.oppilaitostunnus
	WHERE 
	cast(sa.loadtime as date) = (SELECT cast(MAX(loadtime) as date) FROM ANTERO.sa.sa_virta_otp_opintopistepvmyo) AND 
	sa.vuosi > (SELECT MAX(vuosi) FROM ANTERO.dw.f_yo_opintopisteet) AND 
	(sa.vuosi < YEAR(getdate()) OR 
	(sa.vuosi = YEAR(getdate()) AND 
	MONTH(convert(date, dateadd(s, convert(bigint, sa.suorituspaiva) / 1000, convert(datetime, '1-1-1970 3:00:00')))) <= MONTH(getdate())))) f 
GROUP BY f.tilastovuosi, f.kuukausi, f.yliopisto, f.koodit_yliopisto, f.okm_ohjauksen_ala, f.koodit_okm_ohjauksen_ala, f.aineistotyyppi, f.tietojen_ajankohta


GO