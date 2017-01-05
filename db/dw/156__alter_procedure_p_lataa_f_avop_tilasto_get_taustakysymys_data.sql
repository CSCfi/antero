ALTER PROCEDURE dbo.p_lataa_f_avop_tilasto AS

TRUNCATE TABLE dbo.f_avop_tilasto

INSERT INTO dbo.f_avop_tilasto (
  d_organisaatio_id,
  d_koulutusluokitus_id,
  d_kieli_id,
  d_alueluokitus_id,
  d_kalenteri_id,
  d_arvokysymys_id,

  koulutusmuoto,
  kysely_fi, kysely_sv, kysely_en,
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
  coalesce(d6.id,-1) AS d_arvokysymys_id,

  f.koulutusmuoto,
  f.kysely_fi, f.kysely_sv, f.kysely_en,
  f.kyselykerta,
  f.vastaustyyppi,
  f.vaihtoehto,
  f.monivalintavaihtoehto,
  f.numerovalinta,
  (select b.monivalintavaihtoehto  from ANTERO_SA.dbo.sa_arvo_kaikki b
   where b.kyselyid=f.kyselyid and b.kyselykertaid=f.kyselykertaid and b.vastaajaid=f.vastaajaid
   and b.taustakysymykset=1 and b.kysymys_fi='Ikä'
  ) as taustakysymys_ika,
  (select b.monivalintavaihtoehto  from ANTERO_SA.dbo.sa_arvo_kaikki b
   where b.kyselyid=f.kyselyid and b.kyselykertaid=f.kyselykertaid and b.vastaajaid=f.vastaajaid
   and b.taustakysymykset=1 and b.kysymys_fi='Sukupuoli'
  ) as taustakysymys_sukupuoli,
  (select b.monivalintavaihtoehto  from ANTERO_SA.dbo.sa_arvo_kaikki b
   where b.kyselyid=f.kyselyid and b.kyselykertaid=f.kyselykertaid and b.vastaajaid=f.vastaajaid
   and b.taustakysymykset=1 and b.kysymys_fi='Pohjakoulutus'
  ) as taustakysymys_pohjakoulutus,

  f.vastaajaid,

  cast(1 as int) AS lukumaara,
  'ETL: p_lataa_f_avop_tilasto' AS source
FROM ANTERO_SA.dbo.sa_arvo_kaikki as f
LEFT JOIN dbo.d_organisaatio d1 ON d1.organisaatio_avain like 'oppilaitosnumero_%' and d1.organisaatio_koodi = f.valmistavan_koulutuksen_oppilaitos
LEFT JOIN dbo.d_koulutusluokitus d2 ON d2.koulutusluokitus_avain like 'koulutus_%' and d2.koulutusluokitus_koodi = f.tutkintotunnus
LEFT JOIN dbo.d_kieli d3 ON d3.kieli_koodi=f.suorituskieli
LEFT JOIN dbo.d_alueluokitus d4 ON d4.alueluokitus_avain like 'kunta_%' and d4.kunta_koodi = f.kunta
LEFT JOIN dbo.d_kalenteri d5 ON d5.kalenteri_avain = f.vastausaika
LEFT JOIN dbo.d_arvokysymys d6 ON d6.kysymysryhmaid = f.kysymysryhmaid AND d6.kysymysid = f.kysymysid
  AND d6.kysymysryhmajarjestys=f.kysymysryhmajarjestys AND d6.kysymysjarjestys=f.kysymysjarjestys
WHERE f.valtakunnallinen = 1
AND f.kysymysryhma LIKE '%AVOP%'
AND coalesce(f.taustakysymykset,0)=0
