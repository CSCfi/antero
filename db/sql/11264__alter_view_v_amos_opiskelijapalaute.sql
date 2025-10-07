USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dw].[v_amos_opiskelijapalaute] AS

SELECT 

											--AIKAMUUTTUJAT
--d3.vuosi									AS 'Tilastovuosi'
--, d3.kuukausi_fi							AS 'Tilastokuukausi'
  f.rahoituskausi_amm						AS 'Rahoituskausi'
											
											--KYSELYMUUTTUJAT
, f.kyselypohja_tarkenne_amis_fi			AS 'Kysely'
, f.kyselypohja_tarkenne_fi					AS 'Kyselyn kohderyhmä'  
, d4.kysymys_fi								AS 'Kysymys'
, d4.kysymysryhma_fi						AS 'Kysymysryhmä'

											---KOULUTUSTOIMIJA
, nimi_amos_spl /*d2.organisaatio_fi*/		AS 'Koulutuksen järjestäjä'

, d2b.maakunta_fi							AS 'Koul. järjestäjän maakunta'
, d2b.kunta_fi								AS 'Koul. järjestäjän kunta'
, d2b.avi_fi								AS 'Koul. järjestäjän AVI'
, d2b.ely_fi								AS 'Koul. järjestäjän ELY'

											--OPPILAITOS
--, o2.organisaatio_fi						AS 'Oppilaitos'
--, a2.maakunta_fi							AS 'Oppilaitoksen maakunta'
--, a2.kunta_fi								AS 'Oppilaitoksen kunta'
--, a2.avi_fi									AS 'Oppilaitoksen AVI'
--, a2.ely_fi									AS 'Oppilaitoksen ELY'


--Ruotsi
--, d3.vuosi									AS 'Statistikår'
--, d3.kuukausi_sv							AS 'Statistikmånad'
--, concat('1.7.2018',' - ',  convert(varchar, (DATEADD(MONTH, DATEDIFF(MONTH, -1, GETDATE())-3, -1)),104))								AS 'Statistikperiod'
--, d3.rahoituskausi_amm						AS 'Finansieringsperiod'

--, d5.kyselypohja_tarkenne_amis_sv			AS 'Frågeformulär'
--, d5.kyselypohja_tarkenne_sv				AS 'Målgrupp för frågeformulär'  
--, d4.kysymys_sv								AS 'Fråga'
--, d4.kysymysryhma_sv						AS 'Frågegrupp'

--, d1.nimi_amos_spl							AS 'Utbildningsanordnare'
--, d2.maakunta_sv							AS 'Utbildningsanordnarens landskap'
--, d2.kunta_sv								AS 'Utbildningsanordnarens kommun'
--, d2.avi_sv									AS 'Utbildningsanordnarens RFV-område'
--, d2.ely_sv									AS 'Utbildningsanordnarens NMT-område'
--, o2.organisaatio_sv						AS 'Läroanstalt'
--, a2.maakunta_sv							AS 'Läroanstaltens landskap'
--, a2.kunta_sv								AS 'Läroanstaltens kommun'
--, a2.avi_sv									AS 'Läroanstaltens RFV-område'
--, a2.ely_sv									AS 'Läroanstaltens NMT-område'


----Englanti
----, d3.vuosi									AS 'Statistical year'
----, d3.kuukausi_en							AS 'Statistical month'
----, concat('1.7.2018',' - ',  convert(varchar, (DATEADD(MONTH, DATEDIFF(MONTH, -1, GETDATE())-3, -1)),104))					AS 'Statistical period'
--, d3.rahoituskausi_amm						AS 'Funding period'
--, d5.kyselypohja_tarkenne_amis_en			AS 'Survey'
--, d5.kyselypohja_tarkenne_en				AS 'Target group for survey'  
--, d4.kysymys_en								AS 'Question'
--, d4.kysymysryhma_en						AS 'Question group'
----, COALESCE(NULLIF(d6.vastaus_en,'Missing data'),numerovalinta)						AS 'Multiple choice option'

--, d1.nimi_amos_spl							AS 'Education provider'
--, d2.maakunta_en							AS 'Region of the education provider'
--, d2.kunta_en								AS 'Municipality of the education provider'
--, d2.avi_en									AS 'AVI area of the education provider'
--, d2.ely_en									AS 'ELY area of the education provider'
--, o2.organisaatio_en						AS 'Educational institution'
--, a2.maakunta_en							AS 'Region of the institution'
--, a2.kunta_en								AS 'Municipality of the institution'
--, a2.avi_en									AS 'AVI area of the institution'
--, a2.ely_en									AS 'ELY area of the institution'

														--KOODIMUUTTUJAT
--, d7.koulutusluokitus_koodi					AS 'Koodit Tutkinto'
--, o2.organisaatio_koodi						AS 'Koodit Oppilaitos'
, f.ytunnus_amos_spl /*f.org_koodi*/		AS 'Koodit Koulutuksen järjestäjä'
--, d3.kuukausi								AS 'Koodit Tilastokuukausi'     


														--JÄRJESTYSMUUTTUJAT
, d2b.jarjestys_avi_koodi					AS 'Järjestys jarj avi'
, d2b.jarjestys_ely_koodi					AS 'Järjestys jarj ely'
, d2b.jarjestys_maakunta_koodi				AS 'Järjestys jarj maakunta'
--, a2.jarjestys_avi_koodi					AS 'Järjestys opp avi'
--, a2.jarjestys_ely_koodi					AS 'Järjestys opp ely'
--, a2.jarjestys_maakunta_koodi				AS 'Järjestys opp maakunta'
--, COALESCE(NULLIF(d6.koodi,-1),numerovalinta)						AS 'Järjestys monivalintavaihtoehto'
, (select max(d.kysymysjarjestys) from dw.d_arvokysymys d where d.kysymys_fi=d4.kysymys_fi)
											AS 'Järjestys kysymys'
, (select max(d.kysymysryhmajarjestys) from dw.d_arvokysymys d where d.kysymysryhma_fi=d4.kysymysryhma_fi)
											AS 'Järjestys kysymysryhma'


														--MUUT
, f.numerovalinta_summa
, keskiarvo = f.numerovalinta_ka
, keskihajonta = f.numerovalinta_kh
--, f3.kyselyn_kohteet_arvo
--, f3.kyselyn_kohteet_vahvistettu
--, f3.vastanneet_arvo
--, f3.vastanneet_vahvistettu
--, f3.vastanneet_rahoitus
--, f3.vastausosuus_rahoitus
--, f3.vastaajamaaran_lahde
--, f3.katokorjauskerroin_rahoitus
--, f3.katokorjauskerroin_arvo
, vastausosuudet_kertoimet_avain = f3.avain

FROM (

	SELECT
		d1.ytunnus_amos_spl
		,d1.nimi_amos_spl
		--,f.d_organisaatio_koulutustoimija_id
		--,d_organisaatio_oppilaitos_id
		--,d_alueluokitus_oppilaitos_id
		,d3.rahoituskausi_amm
		,d_arvokysymys_id
		,d2.kyselypohja_tarkenne_fi
		,d2.kyselypohja_tarkenne_amis_fi
		,numerovalinta_summa = sum(cast(numerovalinta as int))
		,numerovalinta_ka = avg(cast(numerovalinta as int) * 1.0)
		,numerovalinta_kh = stdevp(cast(numerovalinta as int))
	FROM dw.f_arvo_amis f
	LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d1 ON d1.id = f.d_amos_spl_jarjestaja_linkki_id
	LEFT JOIN dw.d_arvokyselykerta d2 ON d2.id = f.d_arvokyselykerta_id
	LEFT JOIN dw.d_kalenteri d3 ON d3.id = f.d_kalenteri_tunnus_luotu_id
	LEFT JOIN dw.d_arvokysymys d4 ON d4.id = f.d_arvokysymys_id
	/*CROSS APPLY (
		SELECT 
			org_koodi = case when dateadd(year, -1, d1.voimaan_alkaen) < convert(date, right(d3.rahoituskausi_amm,10), 103) then d1.ytunnus_amos_spl else d1.ytunnus_avain end
	) ca*/
	WHERE 1=1
	and numerovalinta is not null
	and d1.sisaltyy_amos_spl = 1 
	and d_kalenteri_tunnus_luotu_id != '-1' 
	and d4.rahoitusmallikysymys = 1
	and datediff(month,d3.paivays,getdate()) >= 3 
	GROUP BY 
		--ca.org_koodi
		d1.ytunnus_amos_spl
		,d1.nimi_amos_spl
		,d3.rahoituskausi_amm
		,d_arvokysymys_id
		,d2.kyselypohja_tarkenne_fi
		,d2.kyselypohja_tarkenne_amis_fi
	HAVING sum(cast(numerovalinta as int)) is not null
	
) AS f

--LEFT JOIN dw.d_organisaatioluokitus d1 ON d1.id=f.d_organisaatio_koulutustoimija_id									
--LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d1 ON d1.id=f.d_amos_spl_jarjestaja_linkki_id
LEFT JOIN dw.d_organisaatioluokitus d2 on d2.organisaatio_koodi=f.ytunnus_amos_spl
LEFT JOIN dw.d_alueluokitus d2b on d2b.kunta_koodi=coalesce(d2.kunta_koodi,-1)
--LEFT JOIN dw.d_organisaatioluokitus o2 ON f.d_organisaatio_oppilaitos_id = o2.id													
--LEFT JOIN dw.d_alueluokitus a2 on a2.id=f.d_alueluokitus_oppilaitos_id	
--LEFT JOIN dw.d_kalenteri d3 ON f.d_kalenteri_tunnus_luotu_id=d3.id   
--LEFT JOIN dw.d_kalenteri d3b ON f.d_kalenteri_vastaus_id = d3b.id
LEFT JOIN dw.d_arvokysymys d4 ON f.d_arvokysymys_id = d4.id
--LEFT JOIN dw.d_arvokyselykerta d5 ON f.d_arvokyselykerta_id = d5.id
--LEFT JOIN dw.d_arvovastaus_monivalinta d6 ON f.d_arvovastaus_monivalinta_id = d6.id
--LEFT JOIN dw.d_koulutusluokitus d7 ON f.d_koulutusluokitus_id = d7.id
--LEFT JOIN dw.d_arvovastaus_taustakysymys d8 ON d8.id = f.d_arvovastaus_taustakysymys_sukupuoli_id
--LEFT JOIN dw.d_arvovastaus_taustakysymys d9 ON d9.id = f.d_arvovastaus_taustakysymys_aidinkieli_id
--LEFT JOIN dw.d_arvovastaus_taustakysymys av ON av.id = f.d_arvovastaus_taustakysymys_hakeutumisvayla_id
--LEFT JOIN dw.d_arvovastaus_koulutustausta av2 ON av2.vastaajaid = f.vastaajaid
--LEFT JOIN dw.d_arvovastaus_taustakysymys av3 ON av3.id = f.d_arvovastaus_taustakysymys_ika_id
--LEFT JOIN dw.d_oppisopimuskoulutus av4 ON av4.id = f.d_oppisopimuskoulutus_id
--LEFT JOIN dw.d_arvovastaus_taustakysymys av5 ON av5.id = f.d_arvovastaus_taustakysymys_arvio_tilanteesta_id
--LEFT JOIN dw.d_arvovastaus_koulutustausta p ON p.vastaajaid = f.vastaajaid 
--LEFT JOIN dw.f_arvo_luodut_vastaajatunnukset f2 ON f2.kyselykertaid = d5.kyselykertaid 
--												and f2.oppilaitoskoodi = o2.organisaatio_koodi 
--												and f2.tutkintokoodi = d7.koulutusluokitus_koodi 
--												and YEAR(f2.kuukausi) = d3.vuosi and MONTH(f2.kuukausi) = d3.kuukausi
LEFT JOIN dw.f_amos_opiskelijapalaute_vastausosuudet_kertoimet f3 
	ON f3.rahoituskausi = f.rahoituskausi_amm 
	AND f3.ytunnus = f.ytunnus_amos_spl 
	AND f3.kysely_tarkenne = f.kyselypohja_tarkenne_fi
	AND f3.generoitu = 0

WHERE 1=1
--and d4.rahoitusmallikysymys=1

GO
