USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_arvo]    Script Date: 20.2.2018 12:07:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dw].[p_lataa_f_arvo] AS

TRUNCATE TABLE dw.f_arvo

INSERT INTO dw.f_arvo (
  d_organisaatio_id,
  d_koulutusluokitus_id,
  d_kieli_id,
  d_alueluokitus_id,
  d_kalenteri_id,
  d_arvokysymys_id,
  d_arvokyselykerta_id,

  koulutusmuoto,
  vaihtoehto,
  monivalintavaihtoehto,
  numerovalinta,
  taustakysymys_ika,
  taustakysymys_sukupuoli,
  taustakysymys_pohjakoulutus,

  vastaajaid,
  valtakunnallinen,

  lukumaara,
  source
)
SELECT
  coalesce(d1a.id,d1b.id,-1) AS d_organisaatio_id,
  coalesce(d2.id,-1) AS d_koulutusluokitus_id,
  coalesce(d3.id,-1) AS d_kieli_id,
  coalesce(d4.id,-1) AS d_alueluokitus_id,
  coalesce(d5.id,-1) AS d_kalenteri_id,
  coalesce(d6.id,-1) AS d_arvokysymys_id,
  coalesce(d7.id,-1) AS d_arvokyselykerta_id,

  f.koulutusmuoto,
  f.vaihtoehto,
  f.monivalintavaihtoehto,
  f.numerovalinta,
  (select top 1 b.monivalintavaihtoehto  from sa.sa_arvo_kaikki b
   where b.kyselyid=f.kyselyid and b.kyselykertaid=f.kyselykertaid and b.vastaajaid=f.vastaajaid
   and b.taustakysymykset=1 and b.kysymys_fi='Ikä'
  ) as taustakysymys_ika,
  (select top 1 b.monivalintavaihtoehto  from sa.sa_arvo_kaikki b
   where b.kyselyid=f.kyselyid and b.kyselykertaid=f.kyselykertaid and b.vastaajaid=f.vastaajaid
   and b.taustakysymykset=1 and b.kysymys_fi='Sukupuoli'
  ) as taustakysymys_sukupuoli,
  (select top 1 b.monivalintavaihtoehto  from sa.sa_arvo_kaikki b
   where b.kyselyid=f.kyselyid and b.kyselykertaid=f.kyselykertaid and b.vastaajaid=f.vastaajaid
   and b.taustakysymykset=1 and b.kysymys_fi='Pohjakoulutus'
  ) as taustakysymys_pohjakoulutus,

  f.vastaajaid,
  f.valtakunnallinen,

  cast(1 as int) AS lukumaara,
  'ETL: p_lataa_f_arvo' AS source
FROM sa.sa_arvo_kaikki as f
LEFT JOIN dw.d_organisaatioluokitus d1a ON d1a.organisaatio_avain like 'oppilaitos_%' and d1a.organisaatio_koodi = f.valmistavan_koulutuksen_oppilaitos
LEFT JOIN dw.d_organisaatioluokitus d1b ON d1b.organisaatio_avain like 'koulutustoimija_%' and d1b.organisaatio_koodi = f.koulutustoimija
LEFT JOIN dw.d_koulutusluokitus d2 ON d2.koulutusluokitus_avain like 'koulutus_%' and d2.koulutusluokitus_koodi = f.tutkintotunnus
LEFT JOIN dw.d_kieli d3 ON d3.kieli_koodi=f.suorituskieli
LEFT JOIN dw.d_alueluokitus d4 ON d4.alueluokitus_avain like 'kunta_%' and d4.kunta_koodi = f.kunta
LEFT JOIN dw.d_kalenteri d5 ON d5.kalenteri_avain = f.vastausaika
LEFT JOIN dw.d_arvokysymys d6 ON d6.kysymysryhmaid = f.kysymysryhmaid AND d6.kysymysid = f.kysymysid AND d6.kysymysryhmajarjestys=f.kysymysryhmajarjestys AND d6.kysymysjarjestys=f.kysymysjarjestys
LEFT JOIN dw.d_arvokyselykerta d7 ON d7.kyselykertaid = f.kyselykertaid
WHERE coalesce(f.taustakysymykset,-1)=0

