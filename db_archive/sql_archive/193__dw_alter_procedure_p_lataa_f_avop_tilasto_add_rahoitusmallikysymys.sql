ALTER PROCEDURE dw.p_lataa_f_avop_tilasto AS

TRUNCATE TABLE dw.f_avop_tilasto

INSERT INTO dw.f_avop_tilasto (
  d_organisaatio_id,
  d_koulutusluokitus_id,
  d_kieli_id,
  d_alueluokitus_id,
  d_kalenteri_id,

  koulutusmuoto,
  kysymysryhma_fi, kysymysryhma_sv, kysymysryhma_en,
  kysely_fi, kysely_sv, kysely_en,
  kysymys_fi, kysymys_sv, kysymys_en,
  rahoitusmallikysymys,
  kyselykerta,
  vastaustyyppi,
  vaihtoehto,
  monivalintavaihtoehto,
  numerovalinta,
  taustakysymys_ika,
  taustakysymys_sukupuoli,
  taustakysymys_pohjakoulutus,

  vastaajaid,

  lukumaara,
  source
)
SELECT
  coalesce(d1.id,-1) AS d_organisaatio_id,
  coalesce(d2.id,-1) AS d_koulutusluokitus_id,
  coalesce(d3.id,-1) AS d_kieli_id,
  coalesce(d4.id,-1) AS d_alueluokitus_id,
  coalesce(d5.id,-1) AS d_kalenteri_id,

  f.koulutusmuoto,
  f.kysymysryhma_fi, f.kysymysryhma_sv, f.kysymysryhma_en,
  f.kysely_fi, f.kysely_sv, f.kysely_en,
  f.kysymys_fi, f.kysymys_sv, f.kysymys_en,
  0 as rahoitusmallikysymys, --TODO mappaa kysymyksiin!
  f.kyselykerta,
  f.vastaustyyppi,
  f.vaihtoehto,
  f.monivalintavaihtoehto,
  f.numerovalinta,
  f.taustakysymys_ika,
  f.taustakysymys_sukupuoli,
  f.taustakysymys_pohjakoulutus,

  f.vastaajaid,

  cast(1 as int) AS lukumaara,
  'ETL: p_lataa_f_avop_tilasto' AS source
FROM sa.sa_arvo_kaikki as f
LEFT JOIN dw.d_organisaatio d1 ON d1.organisaatio_avain like 'oppilaitosnumero_%' and d1.organisaatio_koodi = f.valmistavan_koulutuksen_oppilaitos
LEFT JOIN dw.d_koulutusluokitus d2 ON d2.koulutusluokitus_avain like 'koulutus_%' and d2.koulutusluokitus_koodi = f.tutkintotunnus
LEFT JOIN dw.d_kieli d3 ON d3.kieli_koodi=f.suorituskieli
LEFT JOIN dw.d_alueluokitus d4 ON d4.alueluokitus_avain like 'kunta_%' and d4.kunta_koodi = f.kunta
LEFT JOIN dw.d_kalenteri d5 ON d5.kalenteri_avain = f.vastausaika
WHERE f.valtakunnallinen = 1
AND f.kysymysryhma LIKE '%AVOP%'
