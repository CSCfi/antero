USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_virta_otp_55_tilasto]    Script Date: 29.11.2019 11:32:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_f_virta_otp_55_tilasto] AS

TRUNCATE TABLE dw.f_virta_otp_55_tilasto

INSERT INTO dw.f_virta_otp_55_tilasto (
   
     vuosi
	,henkilokoodi
	,lasna_aloituspvm
	,opoikeus_aloituspvm
	,d_sukupuoli_id
	,d_ika_id
	,d_organisaatio_id
	,d_koulutusluokitus_id
	,lasna_kevat
	,lasna_syksy
	,lasna_syksy_edellinen
	,uusi_opisk
	,uusi_opisk_kevat
	,opintopisteet_kevat
	,opintopisteet_syksy
	,suorittanut55
	,suorittanut55ilmanPankkia
	,suorittanut55pankinAvulla
	,suorittanut27
    ,source
) 
SELECT
  f.vuosi,
  opiskelijaAvain+opiskeluoikeusAvain+d1.organisaatio_koodi,
  CAST(DATEADD(ms, loAloituspvm / 86400000, (loAloituspvm / 86400000) + 25567) AS DATE),
  CAST(DATEADD(ms, ooAloituspvm / 86400000, (ooAloituspvm / 86400000) + 25567) AS DATE),
  coalesce(d3.id,-1) AS d_sukupuoli_id,
  coalesce(d4.id,-1) AS d_ika_id,
  coalesce(d1.id,-1) AS d_organisaatio_id,
  coalesce(d2.id,-1) AS d_koulutusluokitus_id,
  
  coalesce(olok,0),
  coalesce(olos,0),
  coalesce(edellinenSyysolo,0),

  coalesce(uusiOpisk,0),
  coalesce(uusiOpiskKevat,0),

  coalesce(kevat,0),
  coalesce(syys,0),
  
  sum(case when (f.suorittanut55ilmanPankkia = 1 or f.suorittanut55pankinAvulla = 1 or f.suorittanut27 = 1) Then 1 Else 0 end) as suorittanut55,
  sum(case when (f.suorittanut55ilmanPankkia = 1) Then 1 Else 0 end) as suorittanut55ilmanPankkia,
  sum(case when (f.suorittanut55pankinAvulla = 1) Then 1 Else 0 end) as suorittanut55pankinAvulla,
  sum(case when (f.suorittanut27 = 1) Then 1 Else 0 end) as suorittanut27,
  f.source

FROM sa.sa_virta_otp_viisviis_2016 as f
LEFT JOIN dw.d_organisaatioluokitus d1 ON d1.organisaatio_avain like 'oppilaitos_%' and d1.organisaatio_koodi = f.oppilaitostunnus
LEFT JOIN dw.d_koulutusluokitus d2 ON d2.koulutusluokitus_avain like 'koulutus_%' and d2.koulutusluokitus_koodi = f.tkoodi
LEFT JOIN dw.d_sukupuoli d3 on d3.sukupuoli_koodi = f.sukupuoli
LEFT JOIN dw.d_ika d4 on d4.ika_avain = f.ika

GROUP BY f.vuosi, loAloituspvm, ooAloituspvm, opiskelijaAvain+opiskeluoikeusAvain+d1.organisaatio_koodi, d1.id, d2.id, d3.id, d4.id, olok, olos, edellinenSyysolo, uusiOpisk, uusiOpiskKevat, kevat, syys, f.source

UNION ALL 

SELECT
  f.vuosi,
  opiskelijaAvain+opiskeluoikeusAvain+d1.organisaatio_koodi,
  CAST(DATEADD(ms, loAloituspvm / 86400000, (loAloituspvm / 86400000) + 25567) AS DATE),
  CAST(DATEADD(ms, ooAloituspvm / 86400000, (ooAloituspvm / 86400000) + 25567) AS DATE),
  coalesce(d3.id,-1) AS d_sukupuoli_id,
  coalesce(d4.id,-1) AS d_ika_id,
  coalesce(d1.id,-1) AS d_organisaatio_id,
  coalesce(d2.id,-1) AS d_koulutusluokitus_id,
  
  coalesce(olok,0),
  coalesce(olos,0),
  coalesce(edellinenSyysolo,0),

  coalesce(uusiOpisk,0),
  coalesce(uusiOpiskKevat,0),

  coalesce(kevat,0),
  coalesce(syys,0),
  
  sum(case when (f.suorittanut55ilmanPankkia = 1 or f.suorittanut55pankinAvulla = 1 or f.suorittanut27 = 1) Then 1 Else 0 end) as suorittanut55,
  sum(case when (f.suorittanut55ilmanPankkia = 1) Then 1 Else 0 end) as suorittanut55ilmanPankkia,
  sum(case when (f.suorittanut55pankinAvulla = 1) Then 1 Else 0 end) as suorittanut55pankinAvulla,
  sum(case when (f.suorittanut27 = 1) Then 1 Else 0 end) as suorittanut27,
  f.source

FROM sa.sa_virta_otp_viisviis_2017 as f
LEFT JOIN dw.d_organisaatioluokitus d1 ON d1.organisaatio_avain like 'oppilaitos_%' and d1.organisaatio_koodi = f.oppilaitostunnus
LEFT JOIN dw.d_koulutusluokitus d2 ON d2.koulutusluokitus_avain like 'koulutus_%' and d2.koulutusluokitus_koodi = f.tkoodi
LEFT JOIN dw.d_sukupuoli d3 on d3.sukupuoli_koodi = f.sukupuoli
LEFT JOIN dw.d_ika d4 on d4.ika_avain = f.ika

WHERE f.vuosi=(select max(vuosi) from sa.sa_virta_otp_viisviis_2017)
GROUP BY f.vuosi, loAloituspvm, ooAloituspvm, opiskelijaAvain+opiskeluoikeusAvain+d1.organisaatio_koodi, d1.id, d2.id, d3.id, d4.id, olok, olos, edellinenSyysolo, uusiOpisk, uusiOpiskKevat, kevat, syys, f.source

UNION ALL 

SELECT
  f.vuosi,
  opiskelijaAvain+opiskeluoikeusAvain+d1.organisaatio_koodi,
  CAST(DATEADD(ms, loAloituspvm / 86400000, (loAloituspvm / 86400000) + 25567) AS DATE),
  CAST(DATEADD(ms, ooAloituspvm / 86400000, (ooAloituspvm / 86400000) + 25567) AS DATE),
  coalesce(d3.id,-1) AS d_sukupuoli_id,
  coalesce(d4.id,-1) AS d_ika_id,
  coalesce(d1.id,-1) AS d_organisaatio_id,
  coalesce(d2.id,-1) AS d_koulutusluokitus_id,
  
  coalesce(olok,0),
  coalesce(olos,0),
  coalesce(edellinenSyysolo,0),

  coalesce(uusiOpisk,0),
  coalesce(uusiOpiskKevat,0),

  coalesce(kevat,0),
  coalesce(syys,0),
  
  sum(case when (f.suorittanut55ilmanPankkia = 1 or f.suorittanut55pankinAvulla = 1 or f.suorittanut27 = 1) Then 1 Else 0 end) as suorittanut55,
  sum(case when (f.suorittanut55ilmanPankkia = 1) Then 1 Else 0 end) as suorittanut55ilmanPankkia,
  sum(case when (f.suorittanut55pankinAvulla = 1) Then 1 Else 0 end) as suorittanut55pankinAvulla,
  sum(case when (f.suorittanut27 = 1) Then 1 Else 0 end) as suorittanut27,
  f.source

FROM sa.sa_virta_otp_viisviis_2018 as f
LEFT JOIN dw.d_organisaatioluokitus d1 ON d1.organisaatio_avain like 'oppilaitos_%' and d1.organisaatio_koodi = f.oppilaitostunnus
LEFT JOIN dw.d_koulutusluokitus d2 ON d2.koulutusluokitus_avain like 'koulutus_%' and d2.koulutusluokitus_koodi = f.tkoodi
LEFT JOIN dw.d_sukupuoli d3 on d3.sukupuoli_koodi = f.sukupuoli
LEFT JOIN dw.d_ika d4 on d4.ika_avain = f.ika

WHERE f.vuosi=(select max(vuosi) from sa.sa_virta_otp_viisviis_2018)
GROUP BY f.vuosi, loAloituspvm, ooAloituspvm, opiskelijaAvain+opiskeluoikeusAvain+d1.organisaatio_koodi, d1.id, d2.id, d3.id, d4.id, olok, olos, edellinenSyysolo, uusiOpisk, uusiOpiskKevat, kevat, syys, f.source

UNION ALL 

SELECT
  f.vuosi,
  opiskelijaAvain+opiskeluoikeusAvain+d1.organisaatio_koodi,
  CAST(DATEADD(ms, loAloituspvm / 86400000, (loAloituspvm / 86400000) + 25567) AS DATE),
  CAST(DATEADD(ms, ooAloituspvm / 86400000, (ooAloituspvm / 86400000) + 25567) AS DATE),
  coalesce(d3.id,-1) AS d_sukupuoli_id,
  coalesce(d4.id,-1) AS d_ika_id,
  coalesce(d1.id,-1) AS d_organisaatio_id,
  coalesce(d2.id,-1) AS d_koulutusluokitus_id,
  
  coalesce(olok,0),
  coalesce(olos,0),
  coalesce(edellinenSyysolo,0),

  coalesce(uusiOpisk,0),
  coalesce(uusiOpiskKevat,0),

  coalesce(kevat,0),
  coalesce(syys,0),
  
  sum(case when (f.suorittanut55ilmanPankkia = 1 or f.suorittanut55pankinAvulla = 1 or f.suorittanut27 = 1) Then 1 Else 0 end) as suorittanut55,
  sum(case when (f.suorittanut55ilmanPankkia = 1) Then 1 Else 0 end) as suorittanut55ilmanPankkia,
  sum(case when (f.suorittanut55pankinAvulla = 1) Then 1 Else 0 end) as suorittanut55pankinAvulla,
  sum(case when (f.suorittanut27 = 1) Then 1 Else 0 end) as suorittanut27,
  f.source

FROM sa.sa_virta_otp_viisviis_2019 as f
LEFT JOIN dw.d_organisaatioluokitus d1 ON d1.organisaatio_avain like 'oppilaitos_%' and d1.organisaatio_koodi = f.oppilaitostunnus
LEFT JOIN dw.d_koulutusluokitus d2 ON d2.koulutusluokitus_avain like 'koulutus_%' and d2.koulutusluokitus_koodi = f.tkoodi
LEFT JOIN dw.d_sukupuoli d3 on d3.sukupuoli_koodi = f.sukupuoli
LEFT JOIN dw.d_ika d4 on d4.ika_avain = f.ika

WHERE f.vuosi=(select max(vuosi) from sa.sa_virta_otp_viisviis_2019)
GROUP BY f.vuosi, loAloituspvm, ooAloituspvm, opiskelijaAvain+opiskeluoikeusAvain+d1.organisaatio_koodi, d1.id, d2.id, d3.id, d4.id, olok, olos, edellinenSyysolo, uusiOpisk, uusiOpiskKevat, kevat, syys, f.source
