USE [ANTERO]
GO

/****** Object:  View [dw].[v_arvo_amk_uraseuranta]    Script Date: 31.5.2019 12:09:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








ALTER VIEW [dw].[v_arvo_amk_uraseuranta] AS

SELECT 
														--AIKAMUUTTUJAT
f.valmistumisvuosi							AS 'Valmistumisvuosi'			--virtatiedoista "valmistumisvuosi"
							
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
, d7.tutkintotyyppi_fi						AS 'Tutkinnon taso'
, d7.okmohjauksenala_fi						AS 'OKM ohjauksen ala'
, d9b.kieli_fi  							AS 'Suorituskieli'

--- kysymyksistä --> pohjakoulutus, työkokemus--> suodatetaan pois datasetistä
 

														--HENKILÖMUUTTUJAT
, d8.sukupuoli_fi							AS 'Sukupuoli'	
, d9.kieli_fi								AS 'Äidinkieli'
, vt.ikaryhma3_fi							AS 'Ikäryhmä'
, vt.ikaryhma2_fi							AS 'IkäryhmäII'
, d10.koulutustausta_fi						AS 'Pohjakoulutus'
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
, case 
  when d4.vastaustyyppi='arvosana6' then 1 
  else 0 
  end										AS 'vastaustyyppi_keskiarvo'

, Case	when f.numerovalinta  in ('Täysin samaa mieltä','erittäin tyytyväinen','erittäin paljon')				then 6
		when f.numerovalinta  in ('Samaa mieltä','tyytyväinen','paljon')										then 5
		when f.numerovalinta  in ('Hieman samaa mieltä','melko tyytyväinen','melko paljon')						then 4
		when f.numerovalinta  in ('Hieman eri mieltä','hieman tyytymätön','hieman eri mieltä','jonkin verran')	then 3
		when f.numerovalinta  in ('Eri mieltä','tyytymätön','eri mieltä','vain vähän')							then 2
		when f.numerovalinta  in ('Täysin eri mieltä','erittäin tyytymätön','täysin eri mieltä','ei lainkaan')	then 1
		
		ELSE f.numerovalinta END			AS 'numerovalinta'

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
, av.jarjestys_koodi						AS 'Järjestys hakeutumisväylä'
, av5.jarjestys_koodi						AS 'Järjestys arvio tulevaisuudesta'
, d7.jarjestys_tutkintotyyppi_koodi			AS 'Järjestys tutkintotyyppi'
, d7.jarjestys_koulutusalataso1_koodi		AS 'Järjestys koulutusala1'
, d7.jarjestys_koulutusalataso2_koodi		AS 'Järjestys koulutusala2'
, d7.jarjestys_koulutusalataso3_koodi		AS 'Järjestys koulutusala3'
, d7.jarjestys_koulutusastetaso1_koodi		AS 'Jarjestys koulutusastetaso1'
, d7.jarjestys_koulutusastetaso2_koodi		AS 'Jarjestys koulutusastetaso2'
, d7.jarjestys_tutkintotyyppi_koodi  		AS 'Jarjestys tutkinnontaso'
, d7.jarjestys_okmohjauksenala_koodi		AS 'Jarjestys okmohjauksenala'
, d9b.jarjestys_kieliryhma1					AS 'Jarjestys suorituskieli'
, d10.jarjestys_koulutustausta				AS 'Järjestys pohjakoulutus'
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
LEFT JOIN dw.d_sukupuoli d8 ON d8.id = f.d_virta_taustatiedot_sukupuoli_id
LEFT JOIN dw.d_kieli d9 ON d9.id = f.d_virta_taustatiedot_aidinkieli_id
LEFT JOIN dw.d_kieli d9b ON d9b.id = f.d_suoritus_kieli_id
LEFT JOIN dw.d_arvovastaus_taustakysymys av ON av.id = f.d_arvovastaus_taustakysymys_hakeutumisvayla_id
LEFT JOIN dw.d_ika vt ON vt.id = f.d_virta_taustatiedot_ika_id
LEFT JOIN dw.d_oppisopimuskoulutus av4 ON av4.id = f.d_oppisopimuskoulutus_id
LEFT JOIN dw.d_arvovastaus_taustakysymys av5 ON av5.id = f.d_arvovastaus_taustakysymys_arvio_tilanteesta_id	
LEFT JOIN dw.d_arvovastaus_koulutustausta d10 ON d10.vastaajaid =f.vastaajaid		-- pohjakoulutus
LEFT JOIN dw.d_arvovastaus_monivalinta d11 ON d11.id=f.d_tyokokemus_arvovastaus_id					-- työkokemus
																			
LEFT JOIN dw.f_arvo_luodut_vastaajatunnukset f2 ON f2.kyselykertaid = d5.kyselykertaid and f2.oppilaitoskoodi = o2.organisaatio_koodi and f2.tutkintokoodi = d7.koulutusluokitus_koodi and YEAR(f2.kuukausi) = d3.vuosi and MONTH(f2.kuukausi) = d3.kuukausi


where d4.kysymysryhma_fi not in ('Lupa tietojen käsittelyyn','KIITOS VASTAUKSISTASI!')


and numerovalinta<>'-1' 