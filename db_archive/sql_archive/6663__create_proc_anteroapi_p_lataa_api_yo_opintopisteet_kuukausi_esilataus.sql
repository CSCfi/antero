USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_yo_opintopisteet_kuukausi_esilataus]    Script Date: 22.11.2022 12:41:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE OR ALTER PROCEDURE [dw].[p_lataa_api_yo_opintopisteet_kuukausi_esilataus] AS

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
		  [koodit_okm_ohjauksen_ala] = coalesce(d1.ohjauksenala_koodi, '-1'),
		  [koodit_yliopisto] = d3.yo_tunnus,
		  [tietojen_ajankohta] = right('0'+cast(day(dateadd(day, -1, sa.loadtime)) as nvarchar(2)), 2) + '.' + right('0'+cast(month(dateadd(day, -1, sa.loadtime)) as nvarchar(2)), 2) + '.' + cast(year(dateadd(day, -1, sa.loadtime)) as nvarchar(4))
	FROM ANTERO.sa.sa_virta_otp_opintopistepvmyo as sa
	LEFT JOIN ANTERO.dw.d_ohjauksenala d1 ON d1.ohjauksenala_koodi = sa.koodi
	LEFT JOIN ANTERO.dw.d_yo d3 ON d3.yo_tunnus = sa.oppilaitostunnus
	WHERE 
	(cast(sa.loadtime as date) = (SELECT cast(MAX(loadtime) as date) FROM ANTERO.sa.sa_virta_otp_opintopistepvmamk)) AND 
	((sa.vuosi BETWEEN YEAR(getdate()) - 2 and YEAR(getdate()) - 1) OR
	(sa.vuosi = YEAR(getdate()) AND 
	MONTH(convert(date, dateadd(s, convert(bigint, sa.suorituspaiva) / 1000, convert(datetime, '1-1-1970 3:00:00')))) <= MONTH(getdate())))) f 
GROUP BY f.tilastovuosi, f.kuukausi, f.yliopisto, f.koodit_yliopisto, f.okm_ohjauksen_ala, f.koodit_okm_ohjauksen_ala, f.tietojen_ajankohta


GO


USE [ANTERO]

