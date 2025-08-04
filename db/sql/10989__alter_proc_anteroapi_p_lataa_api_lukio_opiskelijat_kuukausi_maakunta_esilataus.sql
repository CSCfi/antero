USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_lukio_opiskelijat_kuukausi_maakunta_esilataus]    Script Date: 4.8.2025 12.26.14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_api_lukio_opiskelijat_kuukausi_maakunta_esilataus] AS

TRUNCATE TABLE [dw].[api_lukio_opiskelijat_kuukausi_maakunta];

INSERT INTO [dw].[api_lukio_opiskelijat_kuukausi_maakunta]

SELECT 
	ROW_NUMBER() OVER(ORDER BY f.vuosi
							  ,f.kuukausi
							  ,COALESCE(d3.maakunta_fi, 'Tieto puuttuu')
							  ,COALESCE(d1.sukupuoli_fi, 'Tieto puuttuu')
							  ,d4.kieliryhma1_fi
							  ,CASE WHEN (d5.ika_avain BETWEEN 15 AND 70) OR d5.ika_avain = -1 THEN d5.jarjestys_ika WHEN d5.ika_avain < 15 then 14 else 71 END
							  ,CASE WHEN f.kansalaisuus = '246' THEN 'Suomi' WHEN f.kansalaisuus != '-1'  THEN 'Muu' ELSE 'Tieto puuttuu' END
							  ) as defaultorder
	,f.vuosi as tilastovuosi
	,f.kuukausi
	,COALESCE(d3.maakunta_fi, 'Tieto puuttuu') as oppilaitoksenMaakunta
	,COALESCE(d1.sukupuoli_fi, 'Tieto puuttuu') as sukupuoli
	,d4.kieliryhma1_fi as aidinkieli
	,CASE WHEN (d5.ika_avain BETWEEN 15 AND 70) OR d5.ika_avain = -1 THEN d5.ika_fi WHEN d5.ika_avain < 15 then 'alle 15-vuotiaat' else 'yli 70-vuotiaat' END as ika
	,CASE WHEN f.kansalaisuus = '246' THEN 'Suomi' WHEN f.kansalaisuus != '-1'  THEN 'Muu' ELSE 'Tieto puuttuu' END as kansalaisuus
	,count(distinct case when f.uusi_opiskelija = 1 then f.master_oid end) as uudetOpiskelijatLkm
	,count(distinct f.master_oid) as opiskelijatLkm
FROM ANTERO.dw.f_koski_lukio_opiskelijat_kuukausittain f

LEFT JOIN ANTERO.dw.d_sukupuoli AS d1 ON f.Sukupuoli = d1.sukupuoli_koodi
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d2 ON d2.organisaatio_oid = f.koulutustoimija_oid
LEFT JOIN ANTERO.dw.d_alueluokitus d3 ON d3.kunta_koodi = d2.kunta_koodi 
LEFT JOIN ANTERO.dw.d_kieli AS d4 ON f.aidinkieli = d4.kieli_koodi
LEFT JOIN ANTERO.dw.d_ika AS d5 ON f.Ika = d5.ika_avain

GROUP BY 
	f.vuosi,
	f.kuukausi,
	COALESCE(d3.maakunta_fi, 'Tieto puuttuu'),
	COALESCE(d1.sukupuoli_fi, 'Tieto puuttuu'), 
	d4.kieliryhma1_fi,
	d5.ika_fi,
	d5.ika_avain,
	CASE WHEN (d5.ika_avain BETWEEN 15 AND 70) OR d5.ika_avain = -1 THEN d5.ika_fi WHEN d5.ika_avain < 15 then 'alle 15-vuotiaat' else 'yli 70-vuotiaat' END,
	CASE WHEN f.kansalaisuus = '246' THEN 'Suomi' WHEN f.kansalaisuus != '-1'  THEN 'Muu' ELSE 'Tieto puuttuu' END,
	d5.jarjestys_ika

GO


