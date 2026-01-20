USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_amm_opiskelijat_ja_tutkinnot_kuukausi_maakunta_esilataus]    Script Date: 4.8.2025 12.21.04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_api_amm_opiskelijat_ja_tutkinnot_kuukausi_maakunta_esilataus] AS

TRUNCATE TABLE [dw].[api_amm_opiskelijat_ja_tutkinnot_kuukausi_maakunta];

INSERT INTO [dw].[api_amm_opiskelijat_ja_tutkinnot_kuukausi_maakunta]

SELECT 
	ROW_NUMBER() OVER(ORDER BY f.tilastovuosi
							  ,d1.kuukausi
							  ,COALESCE(d4.maakunta_fi, 'Tieto puuttuu')
							  ,COALESCE(d2.sukupuoli_fi, 'Tieto puuttuu')
							  ,d5.kieliryhma1_fi
							  ,CASE WHEN (d6.ika_avain BETWEEN 15 AND 70) OR d6.ika_avain = -1 THEN d6.jarjestys_ika WHEN d6.ika_avain < 15 then 14 else 71 END
							  ,CASE WHEN d7.maatjavaltiot2_koodi = '246' THEN d7.maatjavaltiot2_fi WHEN d7.maatjavaltiot2_koodi != '-1'  THEN 'Muu' ELSE 'Tieto puuttuu' END
							  ) as defaultorder
	,f.tilastovuosi
	,d1.kuukausi
	,COALESCE(d4.maakunta_fi, 'Tieto puuttuu') as oppilaitoksenMaakunta
	,COALESCE(d2.sukupuoli_fi, 'Tieto puuttuu') as sukupuoli
	,d5.kieliryhma1_fi as aidinkieli
	,CASE WHEN (d6.ika_avain BETWEEN 15 AND 70) OR d6.ika_avain = -1 THEN d6.ika_fi WHEN ika_avain < 15 then 'alle 15-vuotiaat' else 'yli 70-vuotiaat' END as ika
	,CASE WHEN d7.maatjavaltiot2_koodi = '246' THEN d7.maatjavaltiot2_fi WHEN d7.maatjavaltiot2_koodi != '-1'  THEN 'Muu' ELSE 'Tieto puuttuu' END as kansalaisuus
	,count(distinct case when f.uudet_opiskelijat = 1 then f.master_oid end) as uudetOpiskelijatLkm
	,count(distinct case when f.opiskelijat = 1 then f.master_oid end) as opiskelijatLkm
	,count(distinct case when f.tutkinnot = 1 then f.master_oid end) as tutkinnonSuorittaneetLkm 
FROM (
	SELECT distinct
		tilastovuosi
		,d_kalenteri_id
		,d_organisaatioluokitus_oppilaitos_id
		,d_sukupuoli_id
		,d_kieli_aidinkieli_id
		,d_ika_id
		,d_maatjavaltiot2_kansalaisuus_id
		,master_oid
		,opiskelijat = 1
		,uudet_opiskelijat = uusi
		,tutkinnot = 0
	FROM ANTERO.dw.f_koski_amm_opiskelijat

	UNION ALL

	SELECT distinct
		tilastovuosi
		,d_kalenteri_id
		,d_organisaatioluokitus_oppilaitos_id
		,d_sukupuoli_id
		,d_kieli_aidinkieli_id
		,d_ika_id
		,d_maatjavaltiot2_kansalaisuus_id
		,master_oid
		,opiskelijat = 0
		,uudet_opiskelijat = 0
		,tutkinnot = 1
	FROM ANTERO.dw.f_koski_amm_tutkinnot ) f

LEFT JOIN ANTERO.dw.d_kalenteri d1 ON d1.id = f.d_kalenteri_id
LEFT JOIN ANTERO.dw.d_sukupuoli d2 ON d2.id = f.d_sukupuoli_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d3 ON d3.id = f.d_organisaatioluokitus_oppilaitos_id
LEFT JOIN ANTERO.dw.d_alueluokitus d4 ON d4.kunta_koodi = d3.kunta_koodi 
LEFT JOIN ANTERO.dw.d_kieli d5 ON d5.id = f.d_kieli_aidinkieli_id
LEFT JOIN ANTERO.dw.d_ika d6 ON d6.id = f.d_ika_id
LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d7 ON d7.id = f.d_maatjavaltiot2_kansalaisuus_id
GROUP BY 
	f.tilastovuosi,
	d1.kuukausi,
	COALESCE(d4.maakunta_fi, 'Tieto puuttuu'),
	COALESCE(d2.sukupuoli_fi, 'Tieto puuttuu'),
	d5.kieliryhma1_fi,
	d6.ika_fi,
	d6.ika_avain,
	CASE WHEN (d6.ika_avain BETWEEN 15 AND 70) OR d6.ika_avain = -1 THEN d6.ika_fi WHEN ika_avain < 15 then 'alle 15-vuotiaat' else 'yli 70-vuotiaat' END,
	CASE WHEN d7.maatjavaltiot2_koodi = '246' THEN d7.maatjavaltiot2_fi WHEN d7.maatjavaltiot2_koodi != '-1'  THEN 'Muu' ELSE 'Tieto puuttuu' END,
	d6.jarjestys_ika



GO


