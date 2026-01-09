USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_amk_opintopisteet_esilataus]    Script Date: 9.1.2026 8.05.27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_api_amk_opintopisteet_esilataus] AS

TRUNCATE TABLE AnteroAPI.dw.[api_amk_opintopisteet];

INSERT INTO AnteroAPI.dw.[api_amk_opintopisteet]

SELECT 
	   ROW_NUMBER() 
		OVER( ORDER BY 
			f.tilastovuosi ASC, 
			f.kuukausi ASC,
			f.koodit_ammattikorkeakoulu ASC, 
			f.koodit_okm_ohjauksen_ala ASC, 
			f.koulutustyyppi ASC) as defaultorder,
	   f.tilastovuosi, 
	   f.kuukausi,
	   f.ammattikorkeakoulu,
	   f.koodit_ammattikorkeakoulu,
	   f.okm_ohjauksen_ala,
	   f.koodit_okm_ohjauksen_ala,
	   f.koulutustyyppi,
	   SUM(op_perustutkinto_opiskelijat_lkm) as op_perustutkinto_opiskelijat_lkm, 
	   SUM(op_avoin_amk_opetus_lkm) as op_avoin_amk_opetus_lkm, 
	   SUM(op_erikoistumiskoulutus_lkm) as op_erikoistumiskoulutus_lkm, 
	   SUM(op_erilliset_opinto_oikeudet_lkm) as op_erilliset_opinto_oikeudet_lkm, 
	   SUM(op_korkeakoulujen_yhteistyo_lkm) as op_korkeakoulujen_yhteistyo_lkm, 
	   SUM(op_maahanmuuttajien_valmentava_lkm) as op_maahanmuuttajien_valmentava_lkm, 
	   SUM(op_saapuvat_vaihto_opiskelijat_lkm) as op_saapuvat_vaihto_opiskelijat_lkm, 
	   SUM(op_tki_opinnayte_lkm) as op_tki_opinnayte_lkm, 
	   SUM(op_tki_harjoittelu_lkm) as op_tki_harjoittelu_lkm, 
	   SUM(op_tki_muu_lkm) as op_tki_muu_lkm, 
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
		,[koulutustyyppi] = d4.selite_fi
		,[ammattikorkeakoulu] = d3.organisaatio_fi
		,[kaikki_tutk_lkm] AS op_perustutkinto_opiskelijat_lkm
		,[tki_pisteet_lkm] AS op_tki_opinnayte_lkm
		,[tki_harj_pisteet_lkm] AS op_tki_harjoittelu_lkm
		,[tki_muu_pisteet_lkm] AS op_tki_muu_lkm
		,[vierkiel_pisteet_lkm] AS op_vieraskielinen_opetus_lkm
		,[ulkom_hyv_op_lkm] AS op_ulkomailta_hyvaksiluetut_lkm
		,[ulkom_harj_op_lkm] AS op_ulkomainen_harjoittelu_lkm
		,[avoinamk_op_lkm] AS op_avoin_amk_opetus_lkm
		,[kv_vaihtoopiskelijat_op_lkm] AS op_saapuvat_vaihto_opiskelijat_lkm
		,[kk_yhteistyo_op_lkm] AS op_korkeakoulujen_yhteistyo_lkm
		,[erilopintooik_op_lkm] AS op_erilliset_opinto_oikeudet_lkm
		,[mamu_op_lkm] AS op_maahanmuuttajien_valmentava_lkm
		,[erikoul_suor_op_lkm] AS op_erikoistumiskoulutus_lkm
		,[kv_suomi_vieraana_op_lkm] as op_kv_suomi_vieraana_lkm
		,[kv_ruotsi_vieraana_op_lkm] as op_kv_ruotsi_vieraana_lkm
		,[muu_kuin_kk_yhteistyo_op_lkm] as op_muun_kuin_korkeakoulun_yhteistyo_lkm
		,[koodit_okm_ohjauksen_ala] = case d2.ohjauksenala_koodi when -1 then 99 else d2.ohjauksenala_koodi end
		,[koodit_ammattikorkeakoulu] = d3.organisaatio_nykyinen_koodi
		,[aineistotyyppi] = 'Lopullinen'
		,[tietojen_ajankohta] = concat('05.03.', f.vuosi+1)
	FROM ANTERO.dw.f_amk_opintopisteet f
	LEFT JOIN ANTERO.dw.d_koulutusala_2002 d1 on d1.id=f.d_koulutusala_2002_id
	LEFT JOIN ANTERO.dw.d_ohjauksenala d2 on d2.id=f.d_ohjauksenala_id
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus d3 on d3.id=f.d_amk_id
	LEFT JOIN ANTERO.dw.d_amk_koulutustyyppi d4 on d4.id=f.d_amk_koulutustyyppi_id
	LEFT JOIN ANTERO.dw.d_kalenteri d5 on d5.id=f.d_tilannepvm_id

	UNION ALL

	SELECT 
		  [tilastovuosi] = sa.vuosi,
		  [kuukausi] = month(convert(date, dateadd(s, convert(bigint, sa.suorituspaiva) / 1000, convert(datetime, '1-1-1970 3:00:00')))),
		  [okm_ohjauksen_ala] = coalesce(d1.ohjauksenala_nimi_fi,'Tieto puuttuu'),
		  [koulutustyyppi] = coalesce(d2.selite_fi, 'Tieto puuttuu'), 
		  [ammattikorkeakoulu] = d3.organisaatio_fi,
		  [op_perustutkinto_opiskelijat_lkm] = sa.perustutkOpiskelijat,
		  [op_tki_opinnayte_lkm] = sa.tkiToiminnanLaajuus,
		  [op_tki_harjoittelu_lkm] = sa.tkiHarjoittelunLaajuus,
		  [op_tki_muu_lkm] = sa.tkiMuutLaajuus,
		  [op_vieraskielinen_opetus_lkm] = sa.vieraskSuoritukset,
		  [op_ulkomailta_hyvaksiluetut_lkm] = sa.ulkomailtaHyvLuet,
		  [op_ulkomainen_harjoittelu_lkm] = sa.ulkomaaharjoittelu,
		  [op_avoin_amk_opetus_lkm] = sa.avoinKK,
		  [op_saapuvat_vaihto_opiskelijat_lkm] = sa.kansainvVaihto,
		  [op_korkeakoulujen_yhteistyo_lkm] = sa.kkYhteistyo,
		  [op_erilliset_opinto_oikeudet_lkm] = sa.erillinenOpintoOikeus,
		  [op_maahanmuuttajien_valmentava_lkm] = sa.maahanmValKoulutus,
		  [op_erikoistumiskoulutus_lkm] = sa.erikoistumiskoulutus,
		  [op_kv_suomi_vieraana_lkm] = sa.kvsuomivieraana,
		  [op_kv_ruotsi_vieraana_lkm] = sa.kvruotsivieraana,
		  [op_muun_kuin_korkeakoulun_yhteistyo_lkm] = sa.muunkuinkorkeakoulun,
		  [koodit_okm_ohjauksen_ala] = coalesce(d1.ohjauksenala_koodi, '-1'),
		  [koodit_ammattikorkeakoulu] = d3.organisaatio_nykyinen_koodi,
		  [aineistotyyppi] = 'Live',
		  [tietojen ajankohta] = right('0'+cast(day(dateadd(day, -1, sa.loadtime)) as nvarchar(2)), 2) + '.' + right('0'+cast(month(dateadd(day, -1, sa.loadtime)) as nvarchar(2)), 2) + '.' + cast(year(dateadd(day, -1, sa.loadtime)) as nvarchar(4))
	FROM ANTERO.sa.sa_virta_otp_opintopistepvmamk as sa
	LEFT JOIN ANTERO.dw.d_ohjauksenala d1 ON d1.ohjauksenala_koodi = sa.koodi
	LEFT JOIN ANTERO.dw.d_amk_koulutustyyppi d2 ON d2.koodi = sa.koulutustyyppi
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus d3 ON d3.organisaatio_koodi = sa.oppilaitostunnus
	WHERE 
	cast(sa.loadtime as date) = (SELECT cast(MAX(loadtime) as date) FROM ANTERO.sa.sa_virta_otp_opintopistepvmamk) AND 
	sa.vuosi > (SELECT MAX(vuosi) FROM ANTERO.dw.f_amk_opintopisteet) AND 
	(sa.vuosi < YEAR(getdate()) OR 
	(sa.vuosi = YEAR(getdate()) AND 
	MONTH(convert(date, dateadd(s, convert(bigint, sa.suorituspaiva) / 1000, convert(datetime, '1-1-1970 3:00:00')))) <= MONTH(getdate())))) f 
GROUP BY f.tilastovuosi, f.kuukausi, f.ammattikorkeakoulu, f.koodit_ammattikorkeakoulu, f.okm_ohjauksen_ala, f.koodit_okm_ohjauksen_ala, f.koulutustyyppi, f.aineistotyyppi, f.tietojen_ajankohta

GO