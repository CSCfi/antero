USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_arvo_amk_uraseuranta]    Script Date: 7.11.2025 15.09.52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_f_arvo_amk_uraseuranta] AS

DROP TABLE IF EXISTS ANTERO.sa.temp_amk_uraseuranta_taustatiedot

SELECT
	vastaajaid
	,MAX(CASE WHEN tk.id is not null THEN tk.id ELSE NULL END) as id_tyokokemus
	,MAX(CASE WHEN pk.id is not null THEN pk.id ELSE NULL END) as id_pohjakoulutus
INTO ANTERO.sa.temp_amk_uraseuranta_taustatiedot
FROM Arvo_SA.sa.sa_arvo_vastaukset_amk_uraseuranta a 
inner join Arvo_SA.sa.sa_arvo_kysymykset b on b.kysymysid = a.kysymysid and b.kysymysversio = a.kysymysversio and b.taustakysymyksen_tyyppi in ('pohjakoulutus','tyokokemus')
left join dw.d_arvovastaus_taustakysymys pk on pk.vastaus_fi = a.monivalintavaihtoehto_fi and pk.kysymysid = a.kysymysid and pk.kysymysversio = a.kysymysversio and b.taustakysymyksen_tyyppi = 'pohjakoulutus'
left join dw.d_arvovastaus_taustakysymys tk on tk.vastaus_fi = a.monivalintavaihtoehto_fi and tk.kysymysid = a.kysymysid and tk.kysymysversio = a.kysymysversio and b.taustakysymyksen_tyyppi = 'tyokokemus'
GROUP BY vastaajaid

TRUNCATE TABLE dw.f_arvo_amk_uraseuranta

INSERT INTO dw.f_arvo_amk_uraseuranta (
	 d_organisaatio_oppilaitos_id
	,d_organisaatio_koulutustoimija_id
	,d_alueluokitus_oppilaitos_id
	,d_alueluokitus_koulutustoimija_id
	,d_koulutusluokitus_id
	,d_sukupuoli_id 
	,d_aidinkieli_id 
	,d_ika_id
	,d_virta_rahoituslahde_id
	,d_alueluokitus_henkilon_kotikunta_id
	,d_kalenteri_tunnus_luotu_id
	,d_kalenteri_vastaus_id
	,d_arvokysymys_id
	,d_arvokyselykerta_id
	,d_arvovastaus_monivalinta_id
	,numerovalinta
	,rahoituskysymys_paino
	,vastaajaid
	,d_suoritus_kieli_id
	,d_arvovastaus_taustakysymys_pohjakoulutus_id
	,d_arvovastaus_taustakysymys_tyokokemus_id
	,d_kylla_ei_valinta_id
	,valmistumisvuosi
	,source
	,tilastovuosi
)

SELECT DISTINCT
     coalesce(d1a.id,-1)		    AS d_organisaatio_oppilaitos_id
	,coalesce(d1b.id,-1)			AS d_organisaatio_koulutustoimija_id
	,coalesce(d2a.id,-1)			AS d_alueluokitus_oppilaitos_id
	,coalesce(d2b.id,-1)			AS d_alueluokitus_koulutustoimija_id
	,coalesce(d3.id,-1)				AS d_koulutusluokitus_id
	,coalesce(d6.id, -1)			AS d_sukupuoli_id						
	,coalesce(d8.id,-1)				AS d_aidinkieli_id							
	,coalesce(d9.id, -1) 			AS d_ika_valmistuessa_id	
	,coalesce(d13.id, -1)			AS d_virta_rahoituslahde_id
	,coalesce(d4.id,-1)				AS d_alueluokitus_henkilon_kotikunta_id						
	,coalesce(d5.id,-1)				AS d_kalenteri_tunnus_luotu_id
	,coalesce(d5b.id,-1)			AS d_kalenteri_vastaus_id									
	,coalesce(d11.id,-1)			AS d_arvokysymys_id
	,coalesce(d12.id,-1)			AS d_arvokyselykerta_id
	,coalesce(d15.id,-1)			AS d_arvovastaus_monivalinta_id			
	,numerovalinta = 
		case 
			when f3.kysymysid in (
					7801,7833,7835,						--vuoden 2018 rahoitusmallikysymykset
					8509, 8541, 8543,					--vuoden 2019 rahoitusmallikysymykset
					9980, 9982, 10733,					--vuoden 2020 rahoitusmallikysymykset					
					8542, 7834, 8540, 7832, 8516, 7808, 
					9979, 9980, 9981, 9982, 10733, 10867
				) --muut kysymykset asteikolla 0-5
				then (f2.numerovalinta+1) 
			else f2.numerovalinta 
		end						
	,rahoituskysymys_paino = 
		case 
			when d11.rahoitusmallikysymys = 1 then
				case
					when d11.kysymysryhma_fi = 'OMAN OSAAMISEN JA TYÖN VASTAAVUUS (3/3)' then 1 / 6.0
					else 1.0
				end
			else 0
		end	
	,f2.vastaajaid
	,coalesce(d10.id, -1)			AS d_suoritus_kieli_id												
	,coalesce(tt.id_pohjakoulutus, -1)			AS d_pohjakoulutus_arvovastaus_vastaus_id
	,coalesce(tt.id_tyokokemus, -1)			AS d_tyokokemus_arvovastaus_id
	,d_kylla_ei_valinta_id = 
		case
			when f3.vastaustyyppi = 'kylla_ei_valinta' and f2.vaihtoehto = 'kylla' then 1
			when f3.vastaustyyppi = 'kylla_ei_valinta' and f2.vaihtoehto = 'ei' then 2
			else -1
		end
	,f.valmistumisvuosi AS valmistumisvuosi
	,'ETL: p_lataa_f_arvo_amk_uraseuranta' as source
	,f4.kyselykerta_vuosi			AS tilastovuosi
	
FROM Arvo_SA.sa.sa_arvo_kohteet_taustatiedot f 
LEFT JOIN Arvo_SA.sa.sa_arvo_vastaukset_amk_uraseuranta f2 ON f2.vastaajatunnusid = f.vastaajatunnusid
LEFT JOIN Arvo_SA.sa.sa_arvo_kysymykset f3 on f3.kysymysid = f2.kysymysid and f3.kysymysversio = f2.kysymysversio
INNER JOIN Arvo_SA.sa.sa_arvo_kysely_kysymysryhma f5 on f5.kyselyid = f2.kyselyid and f5.kysymysryhmaid = f3.kysymysryhmaid --inner, koska ed. liitoksessa osalla voi tulla useampia ryhmiä (amm. palautteissa on jo). JS 17.7.2023
LEFT JOIN Arvo_SA.sa.sa_arvo_kyselykerrat f4 on f4.kyselyid = f5.kyselyid
LEFT JOIN Arvo_SA.sa.sa_arvo_kohteet k on k.vastaajatunnusid = f.vastaajatunnusid
LEFT JOIN dw.d_organisaatioluokitus d1a ON d1a.organisaatio_avain like 'oppilaitos_%' and d1a.organisaatio_koodi = k.oppilaitoskoodi
LEFT JOIN dw.d_organisaatioluokitus d1b ON d1b.organisaatio_avain like 'koulutustoimija_%' and d1b.organisaatio_koodi = f2.koulutustoimija
--
LEFT JOIN dw.d_alueluokitus d2a ON d2a.kunta_koodi = d1a.kunta_koodi
LEFT JOIN dw.d_alueluokitus d2b ON d2b.kunta_koodi = d1b.kunta_koodi
LEFT JOIN dw.d_koulutusluokitus d3 ON d3.koulutusluokitus_avain like 'koulutus_%' and d3.koulutusluokitus_koodi = f.tutkinto
LEFT JOIN dw.d_alueluokitus d4 ON d4.alueluokitus_avain like 'kunta_%' and d4.kunta_koodi = f.kunta
LEFT JOIN dw.d_kalenteri d5 ON d5.kalenteri_avain = k.vastaajatunnus_alkupvm
LEFT JOIN dw.d_kalenteri d5b ON d5b.kalenteri_avain = f2.vastausaika
LEFT JOIN Arvo_SA.sa.sa_virta_taustatiedot vt  on vt.vastaajatunnusid = f.vastaajatunnusid --sukupuoli, aidinkieli, ika valmistuessa
LEFT JOIN dw.d_sukupuoli d6 ON d6.sukupuoli_koodi=vt.sukupuoli
LEFT JOIN dw.d_kieli d8 on d8.kieli_koodi=vt.aidinkieli
LEFT JOIN dw.d_ika d9 on d9.ika_avain=vt.ika_valmistuessa
LEFT JOIN dw.d_kieli d10 on d10.kieli_koodi=k.suorituskieli
LEFT JOIN dw.d_arvokysymys d11 on d11.kysymysid = f3.kysymysid and d11.kysymysversio = f3.kysymysversio and d11.kysymysryhmaid = f5.kysymysryhmaid and d11.kysymysryhmajarjestys = f5.jarjestys
LEFT JOIN dw.d_arvovastaus_monivalinta d15 ON d15.koodi = f2.numerovalinta and d15.kysymysid = f2.kysymysid and d15.kysymysversio = f2.kysymysversio
LEFT JOIN dw.d_arvokyselykerta d12 on d12.kyselyid = f4.kyselyid
LEFT JOIN dw.d_virta_rahoituslahde d13 on d13.rahoituslahde_koodi = f.rahoituslahde
--pohjakoulutus ja työkokemus temp-taulusta
LEFT JOIN sa.temp_amk_uraseuranta_taustatiedot tt ON tt.vastaajaid = f2.vastaajaid 
--haetaan normaaleista kysymyksistä ja pohjakoulutus ja työkokemus -kysymykset suodatetaan faktalatauksesta pois. 
where f4.tyyppi = 'amk-uraseuranta'
and f3.valtakunnallinen = 1 
and coalesce(f3.taustakysymyksen_tyyppi,'') not in ('pohjakoulutus','tyokokemus')
and f3.vastaustyyppi != 'vapaateksti'
and f4.kyselykerta_vuosi > 2017
-- Ei missä maassa kysymyksiä
and f3.kysymysid not in (18653,18654)

-- Tallennetaan kyselykerta + koulutusluokitusparit temp-tauluun
DROP TABLE IF EXISTS ANTERO.dbo.arvo_amk_uraseuranta_temp
SELECT DISTINCT concat(d_arvokyselykerta_id,'_',d_koulutusluokitus_id) as avain 
INTO ANTERO.dbo.arvo_amk_uraseuranta_temp
FROM ANTERO.dw.f_arvo_amk_uraseuranta


-- Generoidaan niiden kyselykertojen tiedot joilta ei ole vastaajia
INSERT INTO dw.f_arvo_amk_uraseuranta (
	 d_organisaatio_oppilaitos_id
	,d_organisaatio_koulutustoimija_id
	,d_alueluokitus_oppilaitos_id
	,d_alueluokitus_koulutustoimija_id
	,d_koulutusluokitus_id
	,d_sukupuoli_id 
	,d_aidinkieli_id 
	,d_ika_id
	,d_virta_rahoituslahde_id
	,d_alueluokitus_henkilon_kotikunta_id
	,d_kalenteri_tunnus_luotu_id
	,d_kalenteri_vastaus_id
	,d_arvokysymys_id
	,d_arvokyselykerta_id
	,d_arvovastaus_monivalinta_id
	,numerovalinta
	,rahoituskysymys_paino
	,vastaajaid
	,d_suoritus_kieli_id
	,d_arvovastaus_taustakysymys_pohjakoulutus_id
	,d_arvovastaus_taustakysymys_tyokokemus_id
	,d_kylla_ei_valinta_id
	,valmistumisvuosi
	,source
	,tilastovuosi
)
	
SELECT DISTINCT
	coalesce(d1a.id, '-1') as d_organisaatio_oppilaitos_id
	,coalesce(d1b.id, '-1') as d_organisaatio_koulutustoimija_id
	,coalesce(d2a.id, '-1') as d_alueluokitus_oppilaitos_id
	,coalesce(d2b.id, '-1') as d_alueluokitus_koulutustoimija_id
	,coalesce(d3.id, '-1') as d_koulutusluokitus_id
	,'-1' as d_sukupuoli_id 
	,'-1' as d_aidinkieli_id 
	,'-1' as d_ika_id
	,'-1' as d_virta_rahoituslahde_id
	,'-1' as d_alueluokitus_henkilon_kotikunta_id
	,coalesce(d5.id, '-1') as d_kalenteri_tunnus_luotu_id
	,'-1' as d_kalenteri_vastaus_id
	,'-1' as d_arvokysymys_id
	,coalesce(d4.id, '-1') as d_arvokyselykerta_id
	,'-1' as d_arvovastaus_monivalinta_id
	,NULL as numerovalinta
	,NULL as rahoituskysymys_paino
	,NULL as vastaajaid
	,'-1' as d_suoritus_kieli_id
	,'-1' as d_arvovastaus_taustakysymys_pohjakoulutus_id
	,'-1' as d_arvovastaus_taustakysymys_tyokokemus_id
	,'-1' as d_kylla_ei_valinta_id
	,YEAR(vt.vastaajatunnus_alkupvm) - 5 as valmistumisvuosi
	,'ETL: p_lataa_f_arvo_amk_uraseuranta' as source
	,YEAR(vt.vastaajatunnus_alkupvm) as tilastovuosi
	
FROM [Arvo_SA].[sa].[sa_arvo_kohteet] vt
INNER JOIN Arvo_SA.sa.sa_arvo_kyselykerrat kk on kk.kyselyid = vt.kyselyid
LEFT JOIN dw.d_organisaatioluokitus d1a ON d1a.organisaatio_avain like 'oppilaitos_%' and d1a.organisaatio_koodi = vt.oppilaitoskoodi
LEFT JOIN dw.d_organisaatioluokitus d1b ON d1b.organisaatio_avain like 'koulutustoimija_%' and d1b.organisaatio_oid = d1a.ylaorganisaatio_oid
LEFT JOIN dw.d_alueluokitus d2a ON d2a.kunta_koodi = d1a.kunta_koodi
LEFT JOIN dw.d_alueluokitus d2b ON d2b.kunta_koodi = d1b.kunta_koodi
LEFT JOIN dw.d_koulutusluokitus d3 ON d3.koulutusluokitus_koodi = vt.tutkintokoodi
LEFT JOIN dw.d_arvokyselykerta d4 on d4.kyselyid = vt.kyselyid
LEFT JOIN dw.d_kalenteri d5 on d5.kalenteri_avain = vt.vastaajatunnus_alkupvm

WHERE oppilaitoskoodi is not null 
and kk.tyyppi = 'amk-uraseuranta' 
and kk.kyselykerta_vuosi is not null 
and YEAR(vt.vastaajatunnus_alkupvm) > 2017
and concat(d4.id, '_', d3.id) not in (SELECT avain FROM ANTERO.dbo.arvo_amk_uraseuranta_temp)


DROP TABLE IF EXISTS ANTERO.dbo.arvo_amk_uraseuranta_temp
DROP TABLE IF EXISTS ANTERO.sa.temp_amk_uraseuranta_taustatiedot

GO


