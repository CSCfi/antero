USE [ANTERO]
GO

/****** Object:  View [dw].[v_arvo_avop]    Script Date: 3.4.2025 9.23.57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dw].[v_arvo_avop] AS

SELECT --TOP 100

														--AIKAMUUTTUJAT
d5.vuosi									AS 'Kyselyvuosi'
, d3b.kuukausi_fi							AS 'Vastauskuukausi'

														--KYSELYMUUTTUJAT
, d4.kysymys_fi								AS 'Kysymys'
, d4.kysymysryhma_fi						AS 'Kysymysryhmä'
, COALESCE(NULLIF(d6.vastaus_fi,'Tieto puuttuu'),numerovalinta) AS 'Monivalintavaihtoehto' --ei-monivalintakysymyksissä näytetään numerovalinta
, d4b.kytkin_fi								AS 'Rahoitusmallikysymys'
,CASE
	WHEN d4.kysymysryhma_fi like '%Opiskelutyytyväisyys%' THEN 'Kyllä'
	ELSE 'Ei'
END as Opiskelutyytyväisyyskysymys
, d5.kyselypohja_tarkenne_fi				AS 'Kyselypohja'


														--OPPILAITOS
, d2.organisaatio_fi						AS 'Organisaatio'

														--KOULUTUs
,case 
	when d12.kytkin_koodi = 0 then 'Muiden hallinnonalojen alainen koulutus' 
	else 'Opetushallinnon alainen koulutus' 
end											AS 'Hallinnonala'
, d7.koulutusluokitus_fi					AS 'Koulutusnimike'		
, d7.koulutusastetaso1_fi					AS 'Koulutusaste, taso 1'
, d7.koulutusastetaso2_fi					AS 'Koulutusaste, taso 2'							
, d7.koulutusalataso1_fi					AS 'Koulutusala, taso 1'
, d7.koulutusalataso2_fi					AS 'Koulutusala, taso 2'
, d7.koulutusalataso3_fi					AS 'Koulutusala, taso 3'
, d7.okmohjauksenala_fi						AS 'OKM ohjauksen ala'
, d9.kieli_fi								AS 'Koulutuskieli'
, d13.rahoituslahde_nimi_fi					AS 'Rahoituslähde'

														--HENKILÖMUUTTUJAT
, d8.vastaus_fi								AS 'Sukupuoli'	
, d11.vastaus_fi							AS 'Ikäryhmä'
, d10.vastaus_fi							AS 'Pohjakoulutus'



														--MUUT
, d5.kyselyid
, d5.kyselykertaid
, d4.kysymysid
, f.vastaajaid
, d6.koodi									AS 'vastauskoodi'
, d4.vastaustyyppi							AS 'vastaustyyppi'
, case 
	when d4.vastaustyyppi LIKE 'asteikko%' OR d4.vastaustyyppi LIKE 'arvosana%' then 1 
	else 0 
  end										AS 'vastaustyyppi_keskiarvo'
, f.numerovalinta							AS numerovalinta
, f2.id as vastaajatunnus_id
, f2.vastaajatunnukset_lkm
  


--Ruotsi
, d5.vuosi									AS 'Enkätår'
, d3b.kuukausi_sv							AS 'Svarsmånad'

, d5.kyselypohja_tarkenne_sv				AS 'Frågeformulär'
, d4.kysymys_sv								AS 'Fråga'
, d4.kysymysryhma_sv						AS 'Frågegrupp'
, COALESCE(NULLIF(d6.vastaus_sv,'Information saknas'),numerovalinta) AS 'Flervalsalternativ'
, d4b.kytkin_sv								AS 'Finansieringsmodellsfråga'

, d2.organisaatio_sv						AS 'Organisation'
,case 
	when d12.kytkin_koodi = 0 then 'Annan än utbildning som är underställd utbildningsförvaltningen' 
	else 'Utbildning som är underställd utbildningsförvaltningen' 
end											AS 'Förvaltningsområde'

, d7.koulutusluokitus_sv					AS 'Utbildningsbenämning'	
, d7.koulutusastetaso1_sv					AS 'Utbildningsnivå, nivå 1'
, d7.koulutusastetaso2_sv					AS 'Utbildningsnivå, nivå 2'								
, d7.koulutusalataso1_sv					AS 'Utbildningsområde, nivå 1'
, d7.koulutusalataso2_sv					AS 'Utbildningsområde, nivå 2'
, d7.koulutusalataso3_sv					AS 'Utbildningsområde, nivå 3'
, d7.okmohjauksenala_sv						AS 'UKM-styrningsområde'
, d9.kieli_sv								AS 'Utbildningens språk'
, d13.rahoituslahde_nimi_sv					AS 'Finansieringskälla'

, d8.vastaus_sv								AS 'Kön'	
, d11.vastaus_sv							AS 'Åldersgrupp'
, d10.vastaus_sv							AS 'Grundutbildning'


--Englanti
, d5.vuosi									AS 'Survey year'
, d3b.kuukausi_en							AS 'Response month'

, d5.kyselypohja_tarkenne_en				AS 'Survey format'
, d4.kysymys_en								AS 'Question'
, d4.kysymysryhma_en						AS 'Question group'
, COALESCE(NULLIF(d6.vastaus_en,'Missing data'),numerovalinta) AS 'Multiple choice option'
, d4b.kytkin_en								AS 'Funding model question'

, d2.organisaatio_en						AS 'Organization'
,case 
	when d12.kytkin_koodi = 0 then 'Oher than education under the education administration' 
	else 'Education under the education administration' 
end											AS 'Administrative sector'

, d7.koulutusluokitus_en					AS 'Name of education'
, d7.koulutusastetaso1_en					AS 'Level of education, tier 1'
, d7.koulutusastetaso2_en					AS 'Level of education, tier 2'									
, d7.koulutusalataso1_en					AS 'Field of education, tier 1'
, d7.koulutusalataso2_en					AS 'Field of education, tier 2'
, d7.koulutusalataso3_en					AS 'Field of education, tier 3'
, d7.okmohjauksenala_en						AS 'Field of education, HE steering'
, d9.kieli_en								AS 'Language of education'
, d13.rahoituslahde_nimi_en					AS 'Source of funding'

, d8.vastaus_en								AS 'Gender'	
, d11.vastaus_en							AS 'Age group'
, d10.vastaus_en							AS 'Prior education'


														--KOODIMUUTTUJAT
, d7.koulutusluokitus_koodi					AS 'Koodit Koulutusnimike'
, d2.organisaatio_koodi						AS 'Koodit Organisaatio'
, d3b.kuukausi								AS 'Koodit Vastauskuukausi'     
, d4b.kytkin_koodi							AS 'Koodit Rahoitusmallikysymys'


														--JÄRJESTYSMUUTTUJAT
, (select max(d.jarjestys_koodi)	
from dw.d_arvovastaus_taustakysymys d 
where d.vastaus_fi=d10.vastaus_fi)			AS 'Järjestys pohjakoulutus'
, d11.jarjestys_koodi						AS 'Järjestys ikäryhmä'
, (select max(d.jarjestys_koodi)	
from dw.d_arvovastaus_taustakysymys d 
where d.vastaus_fi=d8.vastaus_fi)			AS 'Järjestys sukupuoli'
, d7.jarjestys_koulutusastetaso1_koodi		AS 'Järjestys koulutusaste1'
, d7.jarjestys_koulutusastetaso2_koodi		AS 'Järjestys koulutusaste2'
, d7.jarjestys_koulutusalataso1_koodi		AS 'Järjestys koulutusala1'
, d7.jarjestys_koulutusalataso2_koodi		AS 'Järjestys koulutusala2'
, d7.jarjestys_koulutusalataso3_koodi		AS 'Järjestys koulutusala3'
, d7.jarjestys_okmohjauksenala_koodi		AS 'Järjestys okm ohjauksen ala'
, d13.jarjestys_rahoituslahde_koodi			AS 'Järjestys rahoituslähde'
, COALESCE(CAST(NULLIF(d6.koodi,'-1') as varchar(5)), f.numerovalinta) AS 'Järjestys monivalintavaihtoehto'
, (select max(d.kysymysjarjestys)	
from dw.d_arvokysymys d 
where d.kysymys_fi=d4.kysymys_fi)			AS 'Järjestys kysymys'
, (select max(d.kysymysryhmajarjestys)	
from dw.d_arvokysymys d 
where d.kysymysryhma_fi=d4.kysymysryhma_fi)	AS 'Järjestys kysymysryhma'

, CASE 
	WHEN d5.vuosi is null THEN 0
	WHEN f.vastaajaid is null THEN 0
	WHEN SUBSTRING(@@SERVERNAME,4,1) = 'T' THEN 1
	WHEN CAST(CONCAT(d5.vuosi+1,'-02-01') AS date) <= CAST(GETDATE() AS date) THEN 1
	ELSE 0
  END										AS 'vuosi_tilasto'

, f.partitio_id								AS 'partitioid'
-- CSCVIPUNEN-4414
, CASE 
	WHEN d4b.kytkin_fi = 'Kyllä' THEN 1
	WHEN d4.kysymysryhma_fi = 'Opiskelutyytyväisyys' and d5.kyselypohja_tarkenne_fi = 'AMK' THEN 1
	ELSE 0
END as keskiarvo_raportti

FROM dw.f_arvo_avop AS f

LEFT JOIN dw.d_organisaatioluokitus d1 ON d1.id=f.d_organisaatio_koulutustoimija_id									
LEFT JOIN dw.d_alueluokitus d1b on d1b.id=f.d_alueluokitus_koulutustoimija_id																
LEFT JOIN dw.d_organisaatioluokitus d2 ON d2.id=f.d_organisaatio_oppilaitos_id 
LEFT JOIN dw.d_alueluokitus d2b on d2b.id=f.d_alueluokitus_oppilaitos_id	
LEFT JOIN dw.d_kalenteri d3 ON f.d_kalenteri_tunnus_luotu_id=d3.id   
LEFT JOIN dw.d_kalenteri d3b ON f.d_kalenteri_vastaus_id = d3b.id
LEFT JOIN dw.d_arvokysymys d4 ON f.d_arvokysymys_id = d4.id
LEFT JOIN dw.d_kytkin d4b ON d4b.kytkin_koodi = cast(d4.rahoitusmallikysymys as int)
LEFT JOIN dw.d_arvokyselykerta d5 ON f.d_arvokyselykerta_id = d5.id
LEFT JOIN dw.d_arvovastaus_monivalinta d6 ON f.d_arvovastaus_monivalinta_id = d6.id
LEFT JOIN dw.d_koulutusluokitus d7 ON f.d_koulutusluokitus_id = d7.id
LEFT JOIN dw.d_arvovastaus_taustakysymys d8 ON d8.id = f.d_arvovastaus_taustakysymys_sukupuoli_id
LEFT JOIN dw.d_kieli d9 ON d9.id = f.d_kieli_koulutuskieli_id
LEFT JOIN dw.d_arvovastaus_taustakysymys d10 ON d10.id = f.d_arvovastaus_taustakysymys_pohjakoulutus_id
LEFT JOIN dw.d_arvovastaus_taustakysymys d11 ON d11.id = f.d_arvovastaus_taustakysymys_ika_id
LEFT JOIN dw.d_kytkin d12 ON d12.id = f.d_kytkin_opetushallinnon_alainen_koulutus_id
LEFT JOIN dw.d_virta_rahoituslahde d13 on d13.id = f.d_virta_rahoituslahde_id
LEFT JOIN dw.f_arvo_luodut_vastaajatunnukset f2 ON	f2.kyselykertaid = d5.kyselykertaid and
													f2.oppilaitoskoodi = d2.organisaatio_koodi and 
												    coalesce(f2.tutkintokoodi,'-1') = d7.koulutusluokitus_koodi and
												    YEAR(f2.kuukausi) = d3.vuosi and
													MONTH(f2.kuukausi) = d3.kuukausi
												   

WHERE d5.vuosi is not null

GO

USE [ANTERO]