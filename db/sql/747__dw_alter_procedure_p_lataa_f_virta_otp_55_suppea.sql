ALTER PROCEDURE dw.p_lataa_f_virta_otp_55_suppea AS

TRUNCATE TABLE dw.f_virta_otp_55_suppea

INSERT INTO dw.f_virta_otp_55_suppea (
  d_organisaatio_id,
  d_koulutusluokitus_id,
  
  vuosi,
  
  suorittanut55,
  
  source
)
SELECT
  coalesce(d1.id,-1) AS d_organisaatio_id,
  coalesce(d2.id,-1) AS d_koulutusluokitus_id,
  
  f.vuosi,
  
  count(*) as suorittanut55,
  
  f.source

FROM sa.sa_virta_otp_viisviis as f
LEFT JOIN dw.d_organisaatio d1 ON d1.organisaatio_avain like 'oppilaitosnumero_%' and d1.organisaatio_koodi = f.oppilaitostunnus
LEFT JOIN dw.d_koulutusluokitus d2 ON d2.koulutusluokitus_avain like 'koulutus_%' and d2.koulutusluokitus_koodi = f.tkoodi

WHERE (f.suorittanut55ilmanPankkia = 1 or f.suorittanut55pankinAvulla = 1 or f.suorittanut27 = 1)
GROUP BY f.vuosi, d1.id, d2.id, f.source
