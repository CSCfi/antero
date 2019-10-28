USE [ANTERO]
GO
/****** Object:  View [dw].[v_arvo_avop]    Script Date: 15.10.2019 15:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dw].[v_arvo_avop]'))
EXEC dbo.sp_executesql @statement = N'



CREATE VIEW [dw].[v_arvo_avop] AS

SELECT 

														--AIKAMUUTTUJAT
d5.vuosi									AS ''Kyselyvuosi''
, d3b.kuukausi_fi							AS ''Vastauskuukausi''

														--KYSELYMUUTTUJAT
, d4.kysymys_fi								AS ''Kysymys''
, d4.kysymysryhma_fi						AS ''Kysymysryhmä''
, COALESCE(NULLIF(d6.vastaus_fi,''Tieto puuttuu''),numerovalinta) AS ''Monivalintavaihtoehto'' --ei-monivalintakysymyksissä näytetään numerovalinta
, d4b.kytkin_fi								AS ''Rahoitusmallikysymys''
, d5.kyselypohja_tarkenne_fi				AS ''Kyselypohja''


														--OPPILAITOS
, d2.organisaatio_fi						AS ''Organisaatio''

														--KOULUTUs
,case 
	when d2.organisaatio_koodi = ''02557'' then ''Muiden hallinnonalojen alainen koulutus'' 
	else ''Opetushallinnon alainen koulutus'' 
end											AS ''Hallinnonala''
, d7.koulutusluokitus_fi					AS ''Koulutusnimike''		
, d7.koulutusastetaso1_fi					AS ''Koulutusaste, taso 1''
, d7.koulutusastetaso2_fi					AS ''Koulutusaste, taso 2''							
, d7.koulutusalataso1_fi					AS ''Koulutusala, taso 1''
, d7.koulutusalataso2_fi					AS ''Koulutusala, taso 2''
, d7.koulutusalataso3_fi					AS ''Koulutusala, taso 3''
, d7.okmohjauksenala_fi						AS ''OKM ohjauksen ala''
, d9.kieli_fi								AS ''Kieli''

														--HENKILÖMUUTTUJAT
, d8.vastaus_fi								AS ''Sukupuoli''	
, d11.vastaus_fi							AS ''Ikäryhmä''
, d10.vastaus_fi						AS ''Pohjakoulutus''



														--MUUT
, d5.kyselyid
, d5.kyselykertaid
, d4.kysymysid
, f.vastaajaid
, d6.koodi									AS ''vastauskoodi''
, d4.vastaustyyppi							AS ''vastaustyyppi''
, case 
	when d4.vastaustyyppi IN (''asteikko5_1'',''arvosana7'') then 1 
	else 0 
  end										AS ''vastaustyyppi_keskiarvo''
, f.numerovalinta


--Ruotsi
, d5.vuosi									AS ''Enkätår''
, d3b.kuukausi_sv							AS ''Svarsmånad''
, d4.kysymys_sv								AS ''Fråga''
, d4.kysymysryhma_sv						AS ''Frågegrupp''
, COALESCE(NULLIF(d6.vastaus_sv,''Information saknas''),numerovalinta) AS ''Flervalsalternativ''
, d4b.kytkin_sv								AS ''Finansieringsmodellsfråga''

, d2.organisaatio_sv						AS ''Organisation''

, d7.koulutusluokitus_sv					AS ''Utbildningsbenämning''	
, d7.koulutusastetaso1_sv					AS ''Utbildningsnivå, nivå 1''
, d7.koulutusastetaso2_sv					AS ''Utbildningsnivå, nivå 2''								
, d7.koulutusalataso1_sv					AS ''Utbildningsområde, nivå 1''
, d7.koulutusalataso2_sv					AS ''Utbildningsområde, nivå 2''
, d7.koulutusalataso3_sv					AS ''Utbildningsområde, nivå 3''
, d7.okmohjauksenala_sv						AS ''UKM-styrningsområde''
, d9.kieli_sv								AS ''Språk''

, d8.vastaus_sv								AS ''Kön''	
, d11.vastaus_sv							AS ''Åldersgrupp''
, d10.vastaus_sv							AS ''Grundutbildning''


--Englanti
, d5.vuosi									AS ''Survey year''
, d3b.kuukausi_en							AS ''Response month''
, d4.kysymys_en								AS ''Question''
, COALESCE(NULLIF(d6.vastaus_en,''Missing data''),numerovalinta) AS ''Multiple choice option''
, d4b.kytkin_en								AS ''Funding model question''

, d2.organisaatio_en						AS ''Organization''

, d7.koulutusluokitus_en					AS ''Name of education''
, d7.koulutusastetaso1_en					AS ''Level of education, tier 1''
, d7.koulutusastetaso2_en					AS ''Level of education, tier 2''									
, d7.koulutusalataso1_en					AS ''Field of education, tier 1''
, d7.koulutusalataso2_en					AS ''Field of education, tier 2''
, d7.koulutusalataso3_en					AS ''Field of education, tier 3''
, d7.okmohjauksenala_en						AS ''Field of education, HE steering''
, d9.kieli_en								AS ''Language''

, d8.vastaus_en								AS ''Gender''	
, d11.vastaus_en							AS ''Age group''
, d10.vastaus_en							AS ''Prior education''


														--KOODIMUUTTUJAT
, d7.koulutusluokitus_koodi					AS ''Koodit Koulutusnimike''
, d2.organisaatio_koodi						AS ''Koodit Organisaatio''
, d3.kuukausi								AS ''Koodit Tilastokuukausi''     
, d4b.kytkin_koodi							AS ''Koodit Rahoitusmallikysymys''


														--JÄRJESTYSMUUTTUJAT
, (select max(d.jarjestys_koodi)	
from dw.d_arvovastaus_taustakysymys d 
where d.vastaus_fi=d10.vastaus_fi)			AS ''Järjestys pohjakoulutus''
, d11.jarjestys_koodi						AS ''Järjestys ikäryhmä''
, (select max(d.jarjestys_koodi)	
from dw.d_arvovastaus_taustakysymys d 
where d.vastaus_fi=d8.vastaus_fi)			AS ''Järjestys sukupuoli''
, d7.jarjestys_koulutusastetaso1_koodi		AS ''Järjestys koulutusaste1''
, d7.jarjestys_koulutusastetaso2_koodi		AS ''Järjestys koulutusaste2''
, d7.jarjestys_koulutusalataso1_koodi		AS ''Järjestys koulutusala1''
, d7.jarjestys_koulutusalataso2_koodi		AS ''Järjestys koulutusala2''
, d7.jarjestys_koulutusalataso3_koodi		AS ''Järjestys koulutusala3''
, d7.jarjestys_okmohjauksenala_koodi		AS ''Järjestys okm ohjauksen ala''
, COALESCE(NULLIF(d6.koodi,-1),numerovalinta)
											AS ''Järjestys monivalintavaihtoehto''
, (select max(d.kysymysjarjestys)	
from dw.d_arvokysymys d 
where d.kysymys_fi=d4.kysymys_fi)			AS ''Järjestys kysymys''
, (select max(d.kysymysryhmajarjestys)	
from dw.d_arvokysymys d 
where d.kysymysryhma_fi=d4.kysymysryhma_fi)	AS ''Järjestys kysymysryhma''



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
LEFT JOIN dw.d_arvovastaus_taustakysymys d10 ON d10.id = f.d_arvovastaus_taustakysymys_pohjakoulutus_id
LEFT JOIN dw.d_arvovastaus_taustakysymys d11 ON d11.id = f.d_arvovastaus_taustakysymys_ika_id
LEFT JOIN dw.d_kieli d9 ON d9.id = f.d_kieli_suorituskieli_id
																							



		




' 
GO
/****** Object:  View [dw].[v_arvo_kandi]    Script Date: 15.10.2019 15:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dw].[v_arvo_kandi]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dw].[v_arvo_kandi] AS

SELECT 

														--AIKAMUUTTUJAT
d5.vuosi									AS ''Kyselyvuosi''
, d3b.kuukausi_fi							AS ''Vastauskuukausi''

														--KYSELYMUUTTUJAT
, d4.kysymys_fi								AS ''Kysymys''
, d4.kysymysryhma_fi						AS ''Kysymysryhmä''
, COALESCE(NULLIF(d6.vastaus_fi,''Tieto puuttuu''),numerovalinta) AS ''Monivalintavaihtoehto'' --ei-monivalintakysymyksissä näytetään numerovalinta
, d4b.kytkin_fi								AS ''Rahoitusmallikysymys''


														--OPPILAITOS
, o2.organisaatio_fi						AS ''Organisaatio''

														--KOULUTUs
, d7.koulutusluokitus_fi					AS ''Koulutusnimike''		
, d7.koulutusastetaso1_fi					AS ''Koulutusaste, taso 1''
, d7.koulutusastetaso2_fi					AS ''Koulutusaste, taso 2''							
, d7.koulutusalataso1_fi					AS ''Koulutusala, taso 1''
, d7.koulutusalataso2_fi					AS ''Koulutusala, taso 2''
, d7.koulutusalataso3_fi					AS ''Koulutusala, taso 3''
, d7.okmohjauksenala_fi						AS ''OKM ohjauksen ala''
, d9.kieli_fi								AS ''Kieli''

														--HENKILÖMUUTTUJAT
, d8.vastaus_fi								AS ''Sukupuoli''	
, d11.vastaus_fi							AS ''Ikäryhmä''
, d10.vastaus_fi							AS ''Pohjakoulutus''



														--MUUT
, d5.kyselyid
, d5.kyselykertaid
, d4.kysymysid
, f.vastaajaid
, d6.koodi									AS ''vastauskoodi''
, d4.vastaustyyppi							AS ''vastaustyyppi''
, case 
	when d4.vastaustyyppi IN (''asteikko5_1'',''arvosana7'') then 1 
	else 0 
  end										AS ''vastaustyyppi_keskiarvo''
, f.numerovalinta


--Ruotsi
, d5.vuosi									AS ''Enkätår''
, d3b.kuukausi_sv							AS ''Svarsmånad''
, d4.kysymys_sv								AS ''Fråga''
, d4.kysymysryhma_sv						AS ''Frågegrupp''
, COALESCE(NULLIF(d6.vastaus_sv,''Information saknas''),numerovalinta) AS ''Flervalsalternativ''
, d4b.kytkin_sv								AS ''Finansieringsmodellsfråga''

, o2.organisaatio_sv						AS ''Organisation''

, d7.koulutusluokitus_sv					AS ''Utbildningsbenämning''	
, d7.koulutusastetaso1_sv					AS ''Utbildningsnivå, nivå 1''
, d7.koulutusastetaso2_sv					AS ''Utbildningsnivå, nivå 2''								
, d7.koulutusalataso1_sv					AS ''Utbildningsområde, nivå 1''
, d7.koulutusalataso2_sv					AS ''Utbildningsområde, nivå 2''
, d7.koulutusalataso3_sv					AS ''Utbildningsområde, nivå 3''
, d7.okmohjauksenala_sv						AS ''UKM-styrningsområde''
, d9.kieli_sv								AS ''Språk''

, d8.vastaus_sv								AS ''Kön''	
, d11.vastaus_sv							AS ''Åldersgrupp''
, d10.vastaus_sv							AS ''Grundutbildning''


--Englanti
, d5.vuosi									AS ''Survey year''
, d3b.kuukausi_en							AS ''Response month''
, d4.kysymys_en								AS ''Question''
, COALESCE(NULLIF(d6.vastaus_en,''Missing data''),numerovalinta) AS ''Multiple choice option''
, d4b.kytkin_en								AS ''Funding model question''

, o2.organisaatio_en						AS ''Organization''

, d7.koulutusluokitus_en					AS ''Name of education''
, d7.koulutusastetaso1_en					AS ''Level of education, tier 1''
, d7.koulutusastetaso2_en					AS ''Level of education, tier 2''									
, d7.koulutusalataso1_en					AS ''Field of education, tier 1''
, d7.koulutusalataso2_en					AS ''Field of education, tier 2''
, d7.koulutusalataso3_en					AS ''Field of education, tier 3''
, d7.okmohjauksenala_en						AS ''Field of education, HE steering''
, d9.kieli_en								AS ''Language''

, d8.vastaus_en								AS ''Gender''	
, d11.vastaus_en							AS ''Age group''
, d10.vastaus_en							AS ''Prior education''


														--KOODIMUUTTUJAT
, d7.koulutusluokitus_koodi					AS ''Koodit Koulutusnimike''
, o2.organisaatio_koodi						AS ''Koodit Organisaatio''
, d3.kuukausi								AS ''Koodit Tilastokuukausi''     
, d4b.kytkin_koodi							AS ''Koodit Rahoitusmallikysymys''


														--JÄRJESTYSMUUTTUJAT
, (select max(d.jarjestys_koodi)	
from dw.d_arvovastaus_taustakysymys d 
where d.vastaus_fi=d10.vastaus_fi)			AS ''Järjestys pohjakoulutus''
, d11.jarjestys_koodi						AS ''Järjestys ikäryhmä''
, (select max(d.jarjestys_koodi)	
from dw.d_arvovastaus_taustakysymys d 
where d.vastaus_fi=d8.vastaus_fi)			AS ''Järjestys sukupuoli''
, d7.jarjestys_koulutusastetaso1_koodi		AS ''Järjestys koulutusaste1''
, d7.jarjestys_koulutusastetaso2_koodi		AS ''Järjestys koulutusaste2''
, d7.jarjestys_koulutusalataso1_koodi		AS ''Järjestys koulutusala1''
, d7.jarjestys_koulutusalataso2_koodi		AS ''Järjestys koulutusala2''
, d7.jarjestys_koulutusalataso3_koodi		AS ''Järjestys koulutusala3''
, d7.jarjestys_okmohjauksenala_koodi		AS ''Järjestys okm ohjauksen ala''
, COALESCE(NULLIF(d6.koodi,-1),numerovalinta)
											AS ''Järjestys monivalintavaihtoehto''
, (select max(d.kysymysjarjestys)	
from dw.d_arvokysymys d 
where d.kysymys_fi=d4.kysymys_fi)			AS ''Järjestys kysymys''
, (select max(d.kysymysryhmajarjestys)	
from dw.d_arvokysymys d 
where d.kysymysryhma_fi=d4.kysymysryhma_fi)	AS ''Järjestys kysymysryhma''



FROM dw.f_arvo_kandi AS f

LEFT JOIN dw.d_organisaatioluokitus d1 ON d1.id=f.d_organisaatio_koulutustoimija_id									
LEFT JOIN dw.d_alueluokitus d2 on d2.id=f.d_alueluokitus_koulutustoimija_id																
LEFT JOIN dw.d_organisaatioluokitus o2 ON f.d_organisaatio_oppilaitos_id = o2.id													
LEFT JOIN dw.d_alueluokitus a2 on   a2.id=f.d_alueluokitus_oppilaitos_id	
LEFT JOIN dw.d_kalenteri d3 ON f.d_kalenteri_tunnus_luotu_id=d3.id   
LEFT JOIN dw.d_kalenteri d3b ON f.d_kalenteri_vastaus_id = d3b.id
LEFT JOIN dw.d_arvokysymys d4 ON f.d_arvokysymys_id = d4.id
LEFT JOIN dw.d_kytkin d4b ON d4b.kytkin_koodi = cast(d4.rahoitusmallikysymys as int)
LEFT JOIN dw.d_arvokyselykerta d5 ON f.d_arvokyselykerta_id = d5.id
LEFT JOIN dw.d_arvovastaus_monivalinta d6 ON f.d_arvovastaus_monivalinta_id = d6.id
LEFT JOIN dw.d_koulutusluokitus d7 ON f.d_koulutusluokitus_id = d7.id
LEFT JOIN dw.d_arvovastaus_taustakysymys d8 ON d8.id = f.d_arvovastaus_taustakysymys_sukupuoli_id
LEFT JOIN dw.d_arvovastaus_taustakysymys d10 ON d10.id = f.d_arvovastaus_taustakysymys_pohjakoulutus_id
LEFT JOIN dw.d_arvovastaus_taustakysymys d11 ON d11.id = f.d_arvovastaus_taustakysymys_ika_id
LEFT JOIN dw.d_kieli d9 ON d9.id = f.d_kieli_suorituskieli_id
																							
																							



		




' 
