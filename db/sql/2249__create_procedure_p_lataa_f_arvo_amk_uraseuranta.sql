USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_arvo_amk_uraseuranta]    Script Date: 9.5.2019 16:04:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_arvo_amk_uraseuranta]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_arvo_amk_uraseuranta] AS' 
END
GO


ALTER PROCEDURE [dw].[p_lataa_f_arvo_amk_uraseuranta] AS

TRUNCATE TABLE dw.f_arvo_amk_uraseuranta

INSERT INTO dw.f_arvo_amk_uraseuranta (
	 d_organisaatio_oppilaitos_id
	,d_organisaatio_koulutustoimija_id
	,d_alueluokitus_oppilaitos_id
	,d_alueluokitus_koulutustoimija_id
	,d_koulutusluokitus_id
	,d_virta_taustatiedot_sukupuoli_id 
	,d_virta_taustatiedot_aidinkieli_id 
	,d_virta_taustatiedot_ika_id
	,d_arvovastaus_taustakysymys_hakeutumisvayla_id 
	,d_oppisopimuskoulutus_id
	,d_arvovastaus_taustakysymys_arvio_tilanteesta_id
	,d_alueluokitus_henkilon_kotikunta_id
	,d_kalenteri_tunnus_luotu_id
	,d_kalenteri_vastaus_id
	,d_arvokysymys_id
	,d_arvokyselykerta_id
	,d_arvovastaus_monivalinta_id
	,numerovalinta
	,vastaajaid
	,d_suoritus_kieli_id
	,d_pohjakoulutus_vastaus_monivalinta_id
	,d_tyokokemus_arvovastaus_id
	,valmistumisvuosi
	,source
)

SELECT 
     coalesce(d1a.id,-1)			AS d_organisaatio_oppilaitos_id
	,coalesce(d1b.id,-1)			AS d_organisaatio_koulutustoimija_id
	,coalesce(d2a.id,-1)			AS d_alueluokitus_oppilaitos_id
	,coalesce(d2b.id,-1)			AS d_alueluokitus_koulutustoimija_id
	,coalesce(d3.id,-1)				AS d_koulutusluokitus_id
	,coalesce(vt.sukupuoli,-1)		AS d_virta_taustatiedot_sukupuoli_id						
	,coalesce(d8.id,-1)				AS d_virta_taustatiedot_aidinkieli_id							
	,coalesce(d9.ika_avain, -1) 	AS d_virta_taustatiedot_ika_valmistuessa_id					
	,-1								AS d_arvovastaus_taustakysymys_hakeutumisvayla_id
	,-1								AS d_oppisopimuskoulutus_id
	,-1								AS d_arvovastaus_taustakysymys_arvio_tilanteesta_id
	,coalesce(d4.id,-1)				AS d_alueluokitus_henkilon_kotikunta_id						
	,coalesce(d5.id,-1)				AS d_kalenteri_tunnus_luotu_id
	,coalesce(d5b.id,-1)			AS d_kalenteri_vastaus_id									
	,coalesce(d11.id,-1)			AS d_arvokysymys_id												--> puljaamista org --> LEFT JOIN dw.d_arvokysymys d6 ON d6.kysymysryhmaid = MAIN_QUERY.kysymysryhmaid AND d6.kysymysid = MAIN_QUERY.kysymysid AND d6.kysymysryhmajarjestys = MAIN_QUERY.kysymysryhmajarjestys
	, coalesce(f2.kyselykertaid,-1) AS d_arvokyselykerta_id
	,coalesce(d15.id,-1) AS d_arvovastaus_monivalinta_id			
	,f2.numerovalinta								
	,f.vastaajaid
	,coalesce(d10.id, -1)			AS d_suoritus_kieli_id												
	,coalesce(pk.id, -1)			AS d_pohjakoulutus_arvovastaus_vastaus_id
	,coalesce(tk.id, -1)			AS d_tyokokemus_arvovastaus_id
	, vtt.valmistumisvuosi			AS valmistumisvuosi
	,'ETL: p_lataa_f_arvo_amk_uraseuranta' as source

	from 
	
	Arvo_SA.sa.sa_arvo_vastaajat f 
	LEFT JOIN Arvo_SA.sa.sa_arvo_vastaukset f2 ON f2.vastaajatunnusid=f.vastaajatunnusid
	LEFT JOIN Arvo_SA.sa.sa_arvo_kysymykset f3 on f3.kysymysid=f2.kysymysid
	LEFT JOIN Arvo_SA.sa.sa_arvo_kyselykerrat f4 on f4.kyselykertaid=f2.kyselykertaid
	--LEFT JOIN ARVO_SA.sa.sa_arvo_kysely_kysymysryhma f5 on f5.kysymysryhmaid=f3.kysymysryhmaid
	LEFT JOIN ARVO_SA.sa.sa_virta_taustatiedot vtt on vtt.vastaajaid=f.vastaajaid
	
	LEFT JOIN dw.d_organisaatioluokitus d1a ON d1a.organisaatio_avain like 'oppilaitos_%' and d1a.organisaatio_koodi = f.oppilaitoskoodi
	LEFT JOIN dw.d_organisaatioluokitus d1b ON d1b.organisaatio_avain like 'koulutustoimija_%' and d1b.organisaatio_koodi = f2.koulutustoimija
	LEFT JOIN dw.d_alueluokitus d2a ON d2a.kunta_koodi = d1a.kunta_koodi
	LEFT JOIN dw.d_alueluokitus d2b ON d2b.kunta_koodi = d1b.kunta_koodi
	LEFT JOIN dw.d_koulutusluokitus d3 ON d3.koulutusluokitus_avain like 'koulutus_%' and d3.koulutusluokitus_koodi = f.tutkintokoodi
	LEFT JOIN dw.d_alueluokitus d4 ON d4.alueluokitus_avain like 'kunta_%' and d4.kunta_koodi = f.kuntakoodi
	LEFT JOIN dw.d_kalenteri d5 ON d5.kalenteri_avain = f.vastaajatunnus_alkupvm
	LEFT JOIN dw.d_kalenteri d5b ON d5b.kalenteri_avain = f2.vastausaika
	LEFT JOIN Arvo_SA.sa.sa_virta_taustatiedot vt  on vt.vastaajatunnusid=f.vastaajatunnusid							--sukupuoli, aidinkieli, ika valmistuessa
	LEFT JOIN dw.d_kieli d8 on d8.kieli_koodi=vt.aidinkieli
	LEFT JOIN dw.d_ika d9 on d9.ika_avain=vt.ika_valmistuessa
	LEFT JOIN dw.d_kieli d10 on d10.kieli_koodi=f.suorituskieli
	LEFT JOIN dw.d_arvokysymys d11 on d11.kysymysid=f3.kysymysid  --and  d11.kysymysryhmaid=f3.kysymysryhmaid and d11.kysymysryhmajarjestys=f5.jarjestys
	LEFT JOIN dw.d_arvovastaus_monivalinta d15 ON d15.koodi = f2.numerovalinta and d15.kysymysid = f2.kysymysid

		LEFT JOIN (select distinct								--POHJAKOULUTUS kysymyksestä --> 'Mikä oli korkein suorittamasi tutkinto ennen vuonna 2013 suorittamaasi tutkintoa?'			    
			     arvovastaus.id as id		
			   , kyselykertaid
			   , vastausid
			   , vastaajaid
			   , arvovastaus.vastaus_fi as pohjakoulutus
			   ,a.kysymysid
			   from Arvo_SA.sa.sa_arvo_vastaukset a 
			   inner join Arvo_SA.sa.sa_arvo_kysymykset b on b.kysymysid=a.kysymysid and b.taustakysymyksen_tyyppi='pohjakoulutus'
			   left join dw.d_arvovastaus_monivalinta arvovastaus on arvovastaus.vastaus_fi = a.monivalintavaihtoehto_fi and arvovastaus.kysymysid=a.kysymysid)
			   AS pk ON pk.vastaajaid = f2.vastaajaid AND pk.kyselykertaid = f2.kyselykertaid 	
	
	LEFT JOIN (select distinct								--TYÖKOKEMUS kysymyksestä--> 'Mikä oli korkein suorittamasi tutkinto ennen vuonna 2013 suorittamaasi tutkintoa?'			    
			     arvovastaus.id as id		
			   , kyselykertaid
			   , vastausid
			   , vastaajaid
			   , arvovastaus.vastaus_fi as pohjakoulutus
			   ,a.kysymysid
			   from Arvo_SA.sa.sa_arvo_vastaukset a 
			   inner join Arvo_SA.sa.sa_arvo_kysymykset b on b.kysymysid=a.kysymysid and b.taustakysymyksen_tyyppi='tyokokemus'
			   left join dw.d_arvovastaus_monivalinta arvovastaus on arvovastaus.vastaus_fi = a.monivalintavaihtoehto_fi and arvovastaus.kysymysid=a.kysymysid)
			   AS tk ON tk.vastaajaid = f2.vastaajaid AND tk.kyselykertaid = f2.kyselykertaid 	


--haetaan normaaleista kysymyksistä ja pohjakoulutus ja työkokemus -kysymykset suodatetaan faktalatauksesta pois. 
	where f4.kysely_fi like '%amk uraseuranta%' 
	and f3.valtakunnallinen = 1 
	AND f3.taustakysymyksen_tyyppi is null
	AND f3.vastaustyyppi != 'vapaateksti'

	

