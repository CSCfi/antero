USE [ANTERO]
GO

/****** Object:  View [dw].[v_arvo_kandi]    Script Date: 9.2.2026 14.28.09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dw].[v_arvo_kandi] AS

SELECT

														--AIKAMUUTTUJAT
  d5.vuosi									AS 'Kyselyvuosi'
, d5.kysely_fi
, d5.kyselykerta
, d3b.kuukausi_fi							AS 'Vastauskuukausi'

														--KYSELYMUUTTUJAT
, d4.kysymys_fi								AS 'Kysymys'
, d4.kysymysryhma_fi						AS 'Kysymysryhmä'
, d4c.kysymys_fi							AS 'Kysymys (rahoitusmalli)'
, d4c.kysymysryhma_fi						AS 'Kysymysryhmä (rahoitusmalli)'
, COALESCE(NULLIF(COALESCE(d13.vastaus_fi, d6.vastaus_fi),'Tieto puuttuu'), f.numerovalinta) AS 'Monivalintavaihtoehto' --ei-monivalintakysymyksissä näytetään numerovalinta
, d4b.kytkin_fi								AS 'Rahoitusmallikysymys'
, d12.teema_fi								AS 'Teema'

														--OPPILAITOS
, o2.organisaatio_fi						AS 'Organisaatio'

														--KOULUTUs
, d7.koulutusluokitus_fi					AS 'Koulutusnimike'		
, d7.koulutusastetaso1_fi					AS 'Koulutusaste, taso 1'
, d7.koulutusastetaso2_fi					AS 'Koulutusaste, taso 2'							
, d7.koulutusalataso1_fi					AS 'Koulutusala, taso 1'
, d7.koulutusalataso2_fi					AS 'Koulutusala, taso 2'
, d7.koulutusalataso3_fi					AS 'Koulutusala, taso 3'
, d7.okmohjauksenala_fi						AS 'OKM ohjauksen ala'
, d9.kieli_fi								AS 'Kieli'
, d14.rahoituslahde_nimi_fi					AS 'Rahoituslähde'

														--HENKILÖMUUTTUJAT
, d8.vastaus_fi								AS 'Sukupuoli'	
, d11.vastaus_fi							AS 'Ikäryhmä'
, d10.vastaus_fi							AS 'Pohjakoulutus'
, d15.maanosa6_fi							AS 'Kansalaisuus'

														--MUUT
, d5.kyselyid
, d5.kyselykertaid
, d4.kysymysid
, f.vastaajaid
, d6.koodi									AS 'vastauskoodi'
, d4c.vastaustyyppi							AS 'vastaustyyppi'
, case 
	when d4c.vastaustyyppi = 'arvosana6_ja_eos' and f.numerovalinta = 6 then 0
	when d4c.vastaustyyppi = 'arvosana4_ja_eos' and f.numerovalinta = 1 then 0
	when d4c.vastaustyyppi like '%arvosana%'  then 1
	else 0 
  end										AS 'vastaustyyppi_keskiarvo'

,f2.id as vastaajatunnus_id
,f2.vastaajatunnukset_lkm
, coalesce(d13.numerovalinta, f.numerovalinta) as numerovalinta

--Ruotsi
, d5.vuosi									AS 'Enkätår'
, d3b.kuukausi_sv							AS 'Svarsmånad'
, d4.kysymys_sv								AS 'Fråga'
, d4.kysymysryhma_sv						AS 'Frågegrupp'
, d4c.kysymys_sv							AS 'Fråga (finansieringsmodell)'
, d4c.kysymysryhma_sv						AS 'Frågegrupp (finansieringsmodell)'
, COALESCE(NULLIF(COALESCE(d13.vastaus_sv, d6.vastaus_sv),'Information saknas'), f.numerovalinta) AS 'Flervalsalternativ'
, d4b.kytkin_sv								AS 'Finansieringsmodellsfråga'
, d12.teema_sv								AS 'Tema'

, o2.organisaatio_sv						AS 'Organisation'

, d7.koulutusluokitus_sv					AS 'Utbildningsbenämning'	
, d7.koulutusastetaso1_sv					AS 'Utbildningsnivå, nivå 1'
, d7.koulutusastetaso2_sv					AS 'Utbildningsnivå, nivå 2'								
, d7.koulutusalataso1_sv					AS 'Utbildningsområde, nivå 1'
, d7.koulutusalataso2_sv					AS 'Utbildningsområde, nivå 2'
, d7.koulutusalataso3_sv					AS 'Utbildningsområde, nivå 3'
, d7.okmohjauksenala_sv						AS 'UKM-styrningsområde'
, d9.kieli_sv								AS 'Språk'
, d14.rahoituslahde_nimi_sv					AS 'Finansieringskälla'

, d8.vastaus_sv								AS 'Kön'	
, d11.vastaus_sv							AS 'Åldersgrupp'
, d10.vastaus_sv							AS 'Grundutbildning'
, d15.maanosa6_sv							AS 'Medborgarskap'

--Englanti
, d5.vuosi									AS 'Survey year'
, d3b.kuukausi_en							AS 'Response month'
, d4.kysymys_en								AS 'Question'
, d4.kysymysryhma_en						AS 'Question group'
, d4c.kysymys_en							AS 'Question (funding model)'
, d4c.kysymysryhma_en						AS 'Question group (funding model)'
, COALESCE(NULLIF(COALESCE(d13.vastaus_en, d6.vastaus_en),'Missing data'), f.numerovalinta) AS 'Multiple choice option'
, d4b.kytkin_en								AS 'Funding model question'
, d12.teema_en								AS 'Theme'

, o2.organisaatio_en						AS 'Organization'

, d7.koulutusluokitus_en					AS 'Name of education'
, d7.koulutusastetaso1_en					AS 'Level of education, tier 1'
, d7.koulutusastetaso2_en					AS 'Level of education, tier 2'									
, d7.koulutusalataso1_en					AS 'Field of education, tier 1'
, d7.koulutusalataso2_en					AS 'Field of education, tier 2'
, d7.koulutusalataso3_en					AS 'Field of education, tier 3'
, d7.okmohjauksenala_en						AS 'Field of education, HE steering'
, d9.kieli_en								AS 'Language'
, d14.rahoituslahde_nimi_en					AS 'Source of funding'

, d8.vastaus_en								AS 'Gender'	
, d11.vastaus_en							AS 'Age group'
, d10.vastaus_en							AS 'Prior education'
, d15.maanosa6_en							AS 'Nationality'

														--KOODIMUUTTUJAT
, d7.koulutusluokitus_koodi					AS 'Koodit Koulutusnimike'
, o2.organisaatio_koodi						AS 'Koodit Organisaatio'
, d3b.kuukausi								AS 'Koodit Vastauskuukausi'     
, d4b.kytkin_koodi							AS 'Koodit Rahoitusmallikysymys'
, d12.koodi									AS 'Koodit Teema'

														--JÄRJESTYSMUUTTUJAT
, (select max(d.jarjestys_koodi)	
from dw.d_arvovastaus_taustakysymys d 
where d.vastaus_fi=d10.vastaus_fi)			AS 'Järjestys pohjakoulutus'
, d11.jarjestys_koodi						AS 'Järjestys ikäryhmä'
, d15.jarjestys_maanosa6_koodi				AS 'Järjestys kansalaisuus'
, (select max(d.jarjestys_koodi)	
from dw.d_arvovastaus_taustakysymys d 
where d.vastaus_fi=d8.vastaus_fi)			AS 'Järjestys sukupuoli'
, d7.jarjestys_koulutusastetaso1_koodi		AS 'Järjestys koulutusaste1'
, d7.jarjestys_koulutusastetaso2_koodi		AS 'Järjestys koulutusaste2'
, d7.jarjestys_koulutusalataso1_koodi		AS 'Järjestys koulutusala1'
, d7.jarjestys_koulutusalataso2_koodi		AS 'Järjestys koulutusala2'
, d7.jarjestys_koulutusalataso3_koodi		AS 'Järjestys koulutusala3'
, d7.jarjestys_okmohjauksenala_koodi		AS 'Järjestys okm ohjauksen ala'
, d14.jarjestys_rahoituslahde_koodi			AS 'Järjestys rahoituslähde'
, COALESCE(NULLIF(COALESCE(d13.numerovalinta ,d6.koodi),-1), f.numerovalinta)
											AS 'Järjestys monivalintavaihtoehto'
, (select max(d.kysymysjarjestys)
 from dw.d_arvokysymys d 
 where d.kysymys_fi=d4.kysymys_fi)			AS 'Järjestys kysymys' -- Varsinainen järjestys lasketulla sarakkeella
, (select max(d.kysymysryhmajarjestys)	
from dw.d_arvokysymys d 
where d.kysymysryhma_fi=d4.kysymysryhma_fi)	AS 'Järjestys kysymysryhma'
, (select max(d.kysymysjarjestys)
 from dw.d_arvokysymys d 
 where d.kysymys_fi=d4c.kysymys_fi)			AS 'Järjestys kysymys rahoitusmalli' -- Varsinainen järjestys lasketulla sarakkeella
, (select max(d.kysymysryhmajarjestys)	
from dw.d_arvokysymys d 
where d.kysymysryhma_fi=d4c.kysymysryhma_fi)	AS 'Järjestys kysymysryhma rahoitusmalli'
, (select max(d.kysymysjarjestys)
 from dw.d_arvokysymys d 
 where d.kysymys_sv=d4c.kysymys_sv)			AS 'Järjestys kysymys rahoitusmalli sv' -- Varsinainen järjestys lasketulla sarakkeella
, (select max(d.kysymysryhmajarjestys)	
from dw.d_arvokysymys d 
where d.kysymysryhma_sv=d4c.kysymysryhma_sv)	AS 'Järjestys kysymysryhma rahoitusmalli sv'
, (select max(d.kysymysjarjestys)
 from dw.d_arvokysymys d 
 where d.kysymys_en=d4c.kysymys_en)			AS 'Järjestys kysymys rahoitusmalli en' -- Varsinainen järjestys lasketulla sarakkeella
, (select max(d.kysymysryhmajarjestys)	
from dw.d_arvokysymys d 
where d.kysymysryhma_en=d4c.kysymysryhma_en)	AS 'Järjestys kysymysryhma rahoitusmalli en'
, d3b.kuukausi								AS 'Järjestys vastauskuukausi'

, CASE 
	WHEN d5.vuosi is null THEN 0
	WHEN f.vastaajaid is null THEN 0
	WHEN SUBSTRING(@@SERVERNAME,4,1) = 'T' THEN 1
	WHEN CAST(CONCAT(d5.vuosi+1,'-02-01') AS date) <= CAST(GETDATE() AS date) THEN 1
	ELSE 0
  END										AS 'vuosi_tilasto'

FROM dw.f_arvo_kandi AS f

LEFT JOIN dw.d_organisaatioluokitus d1 ON d1.id=f.d_organisaatio_koulutustoimija_id									
LEFT JOIN dw.d_alueluokitus d2 on d2.id=f.d_alueluokitus_koulutustoimija_id																
LEFT JOIN dw.d_organisaatioluokitus o2 ON f.d_organisaatio_oppilaitos_id = o2.id													
LEFT JOIN dw.d_alueluokitus a2 on   a2.id=f.d_alueluokitus_oppilaitos_id	
LEFT JOIN dw.d_kalenteri d3 ON f.d_kalenteri_tunnus_luotu_id=d3.id   
LEFT JOIN dw.d_kalenteri d3b ON f.d_kalenteri_vastaus_id = d3b.id
LEFT JOIN dw.d_arvokysymys d4 ON f.d_arvokysymys_id = d4.id
LEFT JOIN dw.d_kytkin d4b ON d4b.kytkin_koodi = cast(d4.rahoitusmallikysymys as int)
LEFT JOIN dw.d_arvokysymys d4c ON f.d_arvokysymys_vanha_id = d4c.id
LEFT JOIN dw.d_arvokyselykerta d5 ON f.d_arvokyselykerta_id = d5.id
LEFT JOIN dw.d_arvovastaus_monivalinta d6 ON f.d_arvovastaus_monivalinta_id = d6.id
LEFT JOIN dw.d_koulutusluokitus d7 ON f.d_koulutusluokitus_id = d7.id
LEFT JOIN dw.d_arvovastaus_taustakysymys d8 ON d8.id = f.d_arvovastaus_taustakysymys_sukupuoli_id
LEFT JOIN dw.d_arvovastaus_taustakysymys d10 ON d10.id = f.d_arvovastaus_taustakysymys_pohjakoulutus_id
LEFT JOIN dw.d_arvovastaus_taustakysymys d11 ON d11.id = f.d_arvovastaus_taustakysymys_ika_id
LEFT JOIN dw.d_kieli d9 ON d9.id = f.d_kieli_suorituskieli_id
LEFT JOIN dw.d_arvo_teema d12 ON d12.id = f.d_arvoteema_id
LEFT JOIN dw.d_arvovaihtoehto d13 ON d13.id = f.d_arvovaihtoehto_id
LEFT JOIN dw.d_virta_rahoituslahde d14 on d14.id = f.d_virta_rahoituslahde_id
LEFT JOIN dw.d_maatjavaltiot2 d15 on d15.id = f.d_maatjavaltiot2_kansalaisuus_id
LEFT JOIN dw.f_arvo_luodut_vastaajatunnukset f2 ON	f2.kyselykertaid = d5.kyselykertaid and
													f2.oppilaitoskoodi = o2.organisaatio_koodi and 
												   coalesce(f2.tutkintokoodi,'-1') = d7.koulutusluokitus_koodi and
												   MONTH(f2.kuukausi) = MONTH(d3.kalenteri_avain) and
												   YEAR(f2.kuukausi) = YEAR(d3.kalenteri_avain)

WHERE d5.vuosi is not null and d4.vastaustyyppi <> 'NPS'