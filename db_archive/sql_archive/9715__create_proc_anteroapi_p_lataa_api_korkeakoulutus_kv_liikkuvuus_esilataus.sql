USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_korkeakoulutus_kv_liikkuvuus_esilataus]    Script Date: 22.3.2024 12:32:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [dw].[p_lataa_api_korkeakoulutus_kv_liikkuvuus_esilataus] AS

TRUNCATE TABLE AnteroAPI.dw.[api_korkeakoulutus_kv_liikkuvuus];

INSERT INTO AnteroAPI.dw.[api_korkeakoulutus_kv_liikkuvuus]

SELECT 
	ROW_NUMBER() 
		OVER( ORDER BY 
			f.tilastovuosi ASC, 
			d1.organisaatio_koodi ASC,
			d3.koulutusluokitus_koodi ASC) as defaultorder,
	f.tilastovuosi,
	d3.koulutussektori_fi as sektori,
	d4.sukupuoli_fi as sukupuoli,
	d1.organisaatio_fi  as korkeakoulu,
	d3.koulutusluokitus_fi AS koulutusnimike,
	d3.koulutusastetaso1_fi as koulutusasteTaso1,
	case when d3.koulutusluokitus_koodi = '899999' and d3.koulutusastetaso2_fi like 'tohtori%' then 'Lisensiaatin tai tohtorin tutkinto' else d3.koulutusastetaso2_fi end as koulutusasteTaso2,
	d3.koulutusalataso1_fi as koulutusalaTaso1,
    d3.koulutusalataso2_fi as koulutusalaTaso2,
    d3.koulutusalataso3_fi as koulutusalaTaso3,
	d2.ohjauksenala_nimi_fi as okmOhjauksenAla,
    d10.liikkuvuudensuunta_fi as liikkuvuudenSuunta,
	d11.liikkuvuudenkesto_fi as liikkuvuudenKesto,
	CASE WHEN tilastovuosi < 2016 THEN SUM(f.lukumaara) ELSE COUNT(DISTINCT f.liikkuvuusjaksoavain) END as liikkuvuusjaksotLkm,
	d1.organisaatio_koodi as kooditKorkeakoulu,
	d3.koulutusluokitus_koodi as kooditKoulutusnimike
  FROM ANTERO.dw.f_virta_otp_kvliikkuvuus f
  LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 ON d1.id=f.d_organisaatio_id
  LEFT JOIN ANTERO.dw.d_ohjauksenala d2 ON d2.id=f.d_ohjauksenala_id
  LEFT JOIN ANTERO.dw.d_koulutusluokitus d3 ON d3.id=f.d_koulutusluokitus_id
  LEFT JOIN ANTERO.dw.d_sukupuoli d4 ON d4.id=f.d_sukupuoli_id
  LEFT JOIN ANTERO.dw.d_liikkuvuudentyyppi d5 ON d5.id=f.d_liikkuvuudentyyppi_id
  LEFT JOIN ANTERO.dw.d_liikkuvuusohjelma d9 ON d9.id=f.d_liikkuvuusohjelma_id
  LEFT JOIN ANTERO.dw.d_liikkuvuudensuunta d10 ON d10.id=f.d_liikkuvuudensuunta_id
  LEFT JOIN ANTERO.dw.d_liikkuvuudenkesto d11 ON d11.id = f.d_liikkuvuudenkesto_id
  WHERE cast((cast((f.tilastovuosi + 1) as varchar(4)) + '-03-15') as date) <= convert(date, getdate())
  GROUP BY f.tilastovuosi,d3.koulutussektori_fi,d4.sukupuoli_fi,d1.organisaatio_fi,d3.koulutusluokitus_fi,d3.koulutusastetaso1_fi,
  case when d3.koulutusluokitus_koodi = '899999' and d3.koulutusastetaso2_fi like 'tohtori%' then 'Lisensiaatin tai tohtorin tutkinto' else d3.koulutusastetaso2_fi end,
  d3.koulutusalataso1_fi,d3.koulutusalataso2_fi,d3.koulutusalataso3_fi,d2.ohjauksenala_nimi_fi,
  d10.liikkuvuudensuunta_fi,d11.liikkuvuudenkesto_fi,d1.organisaatio_koodi,d3.koulutusluokitus_koodi

GO

USE [ANTERO]