USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_amk_opintopisteet_kuukausi_esilataus]    Script Date: 2.1.2023 10:38:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dw].[p_lataa_api_amk_opintopisteet_kuukausi_esilataus] AS

DECLARE @pvm date
SET @pvm  = (SELECT cast(MAX(loadtime) as date) FROM ANTERO.sa.sa_virta_otp_opintopistepvmamk)

DECLARE @vuosi int
SET @vuosi = (SELECT MAX(vuosi) FROM ANTERO.sa.sa_virta_otp_opintopistepvmamk WHERE cast(loadtime as date) = @pvm and
coalesce(perustutkOpiskelijat, 0) + coalesce(tkiToiminnanLaajuus, 0) + coalesce(tkiHarjoittelunLaajuus, 0) + coalesce(tkiMuutLaajuus, 0) + 
coalesce(vieraskSuoritukset, 0) + coalesce(ulkomailtaHyvLuet, 0) + coalesce(ulkomaaharjoittelu, 0) + coalesce(avoinKK, 0) + coalesce(kansainvVaihto, 0) + 
coalesce(kkYhteistyo, 0) + coalesce(erillinenOpintoOikeus, 0) + coalesce(maahanmValKoulutus, 0) + coalesce(erikoistumiskoulutus, 0) > 0)

TRUNCATE TABLE AnteroAPI.dw.[api_amk_opintopisteet_kuukausi];

INSERT INTO AnteroAPI.dw.[api_amk_opintopisteet_kuukausi]

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
	   f.tietojen_ajankohta
FROM (
	SELECT 
		  [tilastovuosi] = sa.vuosi,
		  [kuukausi] = month(convert(date, dateadd(s, convert(bigint, sa.suorituspaiva) / 1000, convert(datetime, '1-1-1970 3:00:00')))),
		  [okm_ohjauksen_ala] = coalesce(d1.ohjauksenala_nimi_fi,'Tieto puuttuu'),
		  [koulutustyyppi] = coalesce(d2.selite_fi, 'Tieto puuttuu'), 
		  [ammattikorkeakoulu] = d3.amk_nimi_fi,
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
		  [koodit_okm_ohjauksen_ala] = coalesce(d1.ohjauksenala_koodi, '-1'),
		  [koodit_ammattikorkeakoulu] = d3.amk_tunnus,
		  [tietojen_ajankohta] = right('0'+cast(day(dateadd(day, -1, sa.loadtime)) as nvarchar(2)), 2) + '.' + right('0'+cast(month(dateadd(day, -1, sa.loadtime)) as nvarchar(2)), 2) + '.' + cast(year(dateadd(day, -1, sa.loadtime)) as nvarchar(4))
	FROM ANTERO.sa.sa_virta_otp_opintopistepvmamk as sa
	LEFT JOIN ANTERO.dw.d_ohjauksenala d1 ON d1.ohjauksenala_koodi = sa.koodi
	LEFT JOIN ANTERO.dw.d_amk_koulutustyyppi d2 ON d2.koodi = sa.koulutustyyppi
	LEFT JOIN ANTERO.dw.d_amk d3 ON d3.amk_tunnus = sa.oppilaitostunnus
	WHERE 
	(cast(sa.loadtime as date) = @pvm) AND 
	((sa.vuosi BETWEEN @vuosi - 2 and @vuosi - 1) OR
	((@vuosi = YEAR(getdate()) - 1 AND sa.vuosi = @vuosi) OR (sa.vuosi = @vuosi AND @vuosi = YEAR(getdate()) AND
	MONTH(convert(date, dateadd(s, convert(bigint, sa.suorituspaiva) / 1000, convert(datetime, '1-1-1970 3:00:00')))) <= MONTH(getdate()))))) f 
GROUP BY f.tilastovuosi, f.kuukausi, f.ammattikorkeakoulu, f.koodit_ammattikorkeakoulu, f.okm_ohjauksen_ala, f.koodit_okm_ohjauksen_ala, f.koulutustyyppi, f.tietojen_ajankohta

GO

USE [ANTERO]