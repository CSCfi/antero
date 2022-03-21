USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


DROP view if exists [dw].[v_arvo_digikyvykkyys] 
GO

CREATE VIEW [dw].[v_arvo_digikyvykkyys] AS

SELECT

														--AIKAMUUTTUJAT
  d5.vuosi									AS 'Kyselyvuosi'
, d3b.kuukausi_fi							AS 'Vastauskuukausi'

														--KYSELYMUUTTUJAT
, d4.kysymys_fi								AS 'Kysymys'
, d4.kysymysryhma_fi						AS 'Kysymysryhmä'
, COALESCE(NULLIF(d6.vastaus_fi,'Tieto puuttuu'),numerovalinta) AS 'Monivalintavaihtoehto' --ei-monivalintakysymyksissä näytetään numerovalinta
, d5.kysely_fi								AS 'Kysely'

														--MUUT
, d5.kyselyid
, d5.kyselykertaid
, d4.kysymysid
, f.vastaajaid
, d6.koodi									AS 'vastauskoodi'
, d4.vastaustyyppi							AS 'vastaustyyppi'
, d1.organisaatio_fi						AS 'Organisaatio'
, d2.maakunta_fi							AS 'Maakunta'
, d1.koulutuksen_jarjestajan_yritysmuoto    AS 'Yritysmuoto'
, d1.organisaatio_koodi						AS 'Y-tunnus'
									
, f.numerovalinta

														--KOODIMUUTTUJAT

, d3b.kuukausi								AS 'Koodit Vastauskuukausi'     



														--JÄRJESTYSMUUTTUJAT


, COALESCE(NULLIF(d6.koodi,-1),numerovalinta)
											AS 'Järjestys monivalintavaihtoehto'
, (select max(d.kysymysjarjestys)
 from dw.d_arvokysymys d 
 where d.kysymys_fi=d4.kysymys_fi)			AS 'Järjestys kysymys' -- Varsinainen järjestys lasketulla sarakkeella
, (select max(d.kysymysryhmajarjestys)	
from dw.d_arvokysymys d 
where d.kysymysryhma_fi=d4.kysymysryhma_fi)	AS 'Järjestys kysymysryhma'
, d3b.kuukausi								AS 'Järjestys vastauskuukausi'

FROM dw.f_arvo_digikyvykkyys AS f

LEFT JOIN dw.d_organisaatioluokitus d1 ON d1.id=f.d_organisaatio_koulutustoimija_id									
LEFT JOIN dw.d_alueluokitus d2 on d2.id=f.d_alueluokitus_koulutustoimija_id																 
LEFT JOIN dw.d_kalenteri d3b ON f.d_kalenteri_vastaus_id = d3b.id
LEFT JOIN dw.d_arvokysymys d4 ON f.d_arvokysymys_id = d4.id
LEFT JOIN dw.d_arvokyselykerta d5 ON f.d_arvokyselykerta_id = d5.id
LEFT JOIN dw.d_arvovastaus_monivalinta d6 ON f.d_arvovastaus_monivalinta_id = d6.id
																				




GO


