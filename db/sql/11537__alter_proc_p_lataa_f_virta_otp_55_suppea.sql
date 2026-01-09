USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_virta_otp_55_suppea]    Script Date: 9.1.2026 8.44.12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_f_virta_otp_55_suppea] AS

TRUNCATE TABLE dw.f_virta_otp_55_suppea

INSERT INTO dw.f_virta_otp_55_suppea (
  d_organisaatio_id,
  d_koulutusluokitus_id,
  
  vuosi,
  
  suorittanut55,
  suorittanut55ilmanPankkia,
  suorittanut55pankinAvulla,
  suorittanut27,

  source
)
SELECT
  coalesce(d1.id,-1) AS d_organisaatio_id,
  coalesce(d2.id,-1) AS d_koulutusluokitus_id,
  
  f.vuosi,
  
  sum(case when (f.suorittanut55ilmanPankkia = 1 or f.suorittanut55pankinAvulla = 1 or f.suorittanut27 = 1) Then 1 Else 0 end) as suorittanut55,
  sum(case when (f.suorittanut55ilmanPankkia = 1) Then 1 Else 0 end) as suorittanut55ilmanPankkia,
  sum(case when (f.suorittanut55pankinAvulla = 1) Then 1 Else 0 end) as suorittanut55pankinAvulla,
  sum(case when (f.suorittanut27 = 1) Then 1 Else 0 end) as suorittanut27,
  f.source

FROM sa.sa_virta_otp_viisviis as f
LEFT JOIN dw.d_organisaatioluokitus d1 ON d1.organisaatio_koodi = f.oppilaitostunnus
LEFT JOIN dw.d_koulutusluokitus d2 ON d2.koulutusluokitus_avain like 'koulutus_%' and d2.koulutusluokitus_koodi = f.tkoodi

WHERE (f.suorittanut55ilmanPankkia = 1 or f.suorittanut55pankinAvulla = 1 or f.suorittanut27 = 1)
GROUP BY f.vuosi, d1.id, d2.id, f.source




GO