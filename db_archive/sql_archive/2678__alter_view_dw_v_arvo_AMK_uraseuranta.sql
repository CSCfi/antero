USE [ANTERO]
GO

/****** Object:  View [dw].[v_arvo_amk_uraseuranta]    Script Date: 5.12.2019 10:33:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dw].[v_arvo_amk_uraseuranta] AS

SELECT 
														--AIKAMUUTTUJAT
f.valmistumisvuosi							AS 'Valmistumisvuosi'			--virtatiedoista "valmistumisvuosi"
, f.tilastovuosi							AS 'Tilastovuosi'							
											--KYSELYMUUTTUJAT
, d4.kysymys_fi								AS 'Kysymys'
, d4.kysymysryhma_fi						AS 'Kysymysryhmä'
, COALESCE(																	--ei-monivalintakysymyksissä näytetään numerovalinta
  NULLIF(d6.vastaus_fi,'Tieto puuttuu') 
  ,numerovalinta)							AS 'Monivalintavaihtoehto'
, d4b.kytkin_fi								AS 'Rahoitusmallikysymys'
														
, o2.organisaatio_fi						AS 'Korkeakoulu'

, d7.koulutusluokitus_fi					AS 'Koulutusnimike'									
, d7.koulutusalataso1_fi					AS 'Koulutusala, taso 1'
, d7.koulutusalataso2_fi					AS 'Koulutusala, taso 2'
, d7.koulutusalataso3_fi					AS 'Koulutusala, taso 3'
, d7.koulutusastetaso1_fi					AS 'Koulutusaste, taso 1'
, d7.koulutusastetaso2_fi					AS 'Koulutusaste, taso 2'
, d7.okmohjauksenala_fi						AS 'OKM ohjauksen ala'
, d9b.kieli_fi		  						AS 'Suorituskieli'

--- kysymyksistä --> pohjakoulutus, työkokemus--> suodatetaan pois datasetistä
 

														--HENKILÖMUUTTUJAT
, d8.sukupuoli_fi							AS 'Sukupuoli'	
, d9.kieliryhma1_fi							AS 'Äidinkieli'
, vt.ikaryhma3_fi							AS 'Ikäryhmä'
, vt.ikaryhma2_fi							AS 'IkäryhmäII'
, d10.vastaus_fi							AS 'Pohjakoulutus'
, d11.vastaus_fi							AS 'Työkokemus'
														--MUUT
, d5.kyselyid
, d5.kyselykertaid
, d4.kysymysid
, f.vastaajaid
, d6.koodi									AS 'vastauskoodi'
, CONCAT(d5.kyselyid,d4.kysymysid,d6.koodi,f.vastaajaid)
											AS 'vastausavain'
, d4.vastaustyyppi							AS 'vastaustyyppi'
,case 
	when d4.vastaustyyppi IN ('asteikko5_1','arvosana6') OR rahoitusmallikysymys='1' then 1 
	else 0 
  end										AS 'vastaustyyppi_keskiarvo'

,case 
	when kysymysryhma_fi = 'OMAN OSAAMISEN JA TYÖN VASTAAVUUS (3/3)' then 1 / 6.0
	else 1.0
end											AS rahoituskysmys_paino

,Case when d4.kysymysid in (
7801,7833,7835,		--vuoden 2018 rahoitusmallikysymykset
8509, 8541, 8543)	--vuoden 2019 rahoitusmallikysymykset
then (f.numerovalinta+1) 
else f.numerovalinta END	AS 'numerovalinta' -- (Miten tyytyväinen olet kokonaisuudessaan vuonna 2013/2014 suorittamaasi tutkintoon työurasi kannalta?/Pystyn hyödyntämään ammattikorkeakoulussa hankkimaani osaamista nykyisessä työssäni hyvin./Työni vastaa tällä hetkellä vaativuustasoltaan hyvin ammattikorkeakoulutustani.

, f2.id										AS 'luodut_vastaajatunnukset_id'
													--KOODIMUUTTUJAT
, d7.koulutusluokitus_koodi					AS 'Koodit Tutkinto'
, o2.organisaatio_koodi						AS 'Koodit Oppilaitos'
, d1.organisaatio_koodi						AS 'Koodit Koulutuksen järjestäjä'
, d3.kuukausi								AS 'Koodit Tilastokuukausi'     
, d4b.kytkin_koodi							AS 'Koodit Rahoitusmallikysymys'

														--JÄRJESTYSMUUTTUJAT
, d9.jarjestys_kieliryhma1					AS 'Järjestys äidinkieli'
, vt.jarjestys_ikaryhma3					AS 'Järjestys ikäryhmä'
, d8.jarjestys_sukupuoli_koodi				AS 'Järjestys sukupuoli'
, d7.jarjestys_tutkintotyyppi_koodi			AS 'Järjestys tutkintotyyppi'
, d7.jarjestys_koulutusalataso1_koodi		AS 'Järjestys koulutusala1'
, d7.jarjestys_koulutusalataso2_koodi		AS 'Järjestys koulutusala2'
, d7.jarjestys_koulutusalataso3_koodi		AS 'Järjestys koulutusala3'
, d7.jarjestys_koulutusastetaso1_koodi		AS 'Jarjestys koulutusastetaso1'
, d7.jarjestys_koulutusastetaso2_koodi		AS 'Jarjestys koulutusastetaso2'
, d7.jarjestys_okmohjauksenala_koodi		AS 'Jarjestys okmohjauksenala'
, d9b.jarjestys_kieliryhma1					AS 'Jarjestys suorituskieli'
, d10.jarjestys_koodi						AS 'Järjestys pohjakoulutus'
, D11.koodi									AS 'Järjestys työkokemus'
, COALESCE(NULLIF(d6.koodi,-1),numerovalinta)
											AS 'Järjestys monivalintavaihtoehto'
, d4.kysymysjarjestys						AS 'Järjestys kysymys'
, (select max(d.kysymysryhmajarjestys)	
from dw.d_arvokysymys d 
where d.kysymysryhma_fi=d4.kysymysryhma_fi)	AS 'Järjestys kysymysryhma'



FROM dw.f_arvo_amk_uraseuranta AS f

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
LEFT JOIN dw.d_sukupuoli d8 ON d8.id = f.d_sukupuoli_id
LEFT JOIN dw.d_kieli d9 ON d9.id = f.d_aidinkieli_id
LEFT JOIN dw.d_kieli d9b ON d9b.id = f.d_suoritus_kieli_id
LEFT JOIN dw.d_ika vt ON vt.id = f.d_ika_id
LEFT JOIN dw.d_arvovastaus_taustakysymys d10 ON d10.id =f.d_arvovastaus_taustakysymys_pohjakoulutus_id		-- pohjakoulutus
LEFT JOIN dw.d_arvovastaus_taustakysymys d11 ON d11.id=f.d_arvovastaus_taustakysymys_tyokokemus_id					-- työkokemus
																			
LEFT JOIN dw.f_arvo_luodut_vastaajatunnukset f2 ON f2.kyselykertaid = d5.kyselykertaid and f2.oppilaitoskoodi = o2.organisaatio_koodi and f2.tutkintokoodi = d7.koulutusluokitus_koodi and YEAR(f2.kuukausi) = d3.vuosi and MONTH(f2.kuukausi) = d3.kuukausi


where d4.kysymysryhma_fi not in ('Lupa tietojen käsittelyyn','KIITOS VASTAUKSISTASI!')
and numerovalinta<>'-1' 
