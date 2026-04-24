USE [ANTERO]
GO

/****** Object:  View [dw].[v_arvo_kandi_visualisointi]    Script Date: 23.4.2026 10.10.21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








CREATE OR ALTER VIEW [dw].[v_arvo_kandi_visualisointi] AS

SELECT
  f.kyselyvuosi AS 'Kyselyvuosi',
  d4.kysymys_fi as Kysymys,
  d4.kysymys_sv as 'Fråga',
  d4.kysymys_en as Question,
  d4.kysymysryhma_fi as 'Kysymysryhmä',
  d4.kysymysryhma_sv as 'Frågegrupp',
  d4.kysymysryhma_en as 'Question group',
  o2.organisaatio_fi as Organisaatio,
  o2.organisaatio_sv as Organisation,
  o2.organisaatio_en as Organization,
  o2.organisaatio_koodi as 'Koodit Organisaatio',
  d14.rahoituslahde_nimi_fi as 'Rahoituslähde',
  d14.rahoituslahde_nimi_sv as 'Finansieringskälla',
  d14.rahoituslahde_nimi_en as 'Source of funding',
  d7.okmohjauksenala_fi as 'OKM ohjauksen ala',
  d7.koulutusalataso2_fi as 'Koulutusala, taso 2',
  f.numerovalinta,
  f.vastaajaid
FROM dw.f_arvo_kandi AS f							
LEFT JOIN dw.d_organisaatioluokitus o2 ON f.d_organisaatio_oppilaitos_id = o2.id
LEFT JOIN dw.d_arvokysymys d4 ON f.d_arvokysymys_id = d4.id
LEFT JOIN dw.d_koulutusluokitus d7 ON f.d_koulutusluokitus_id = d7.id
LEFT JOIN dw.d_virta_rahoituslahde d14 on d14.id = f.d_virta_rahoituslahde_id
WHERE f.visualisointiin = 1 and CAST(CONCAT(f.kyselyvuosi+1,'-02-01') AS date) <= CAST(GETDATE() AS date)