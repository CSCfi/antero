USE [ANTERO]
GO
/****** Object:  View [dw].[v_arvo_amis_spl]    Script Date: 23.10.2020 11:34:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dw].[v_arvo_amis_spl]'))
EXEC dbo.sp_executesql @statement = N'







CREATE VIEW [dw].[v_arvo_amis_spl] AS

SELECT 

														--AIKAMUUTTUJAT
  d3.vuosi									AS ''Tilastovuosi''
, d3.kuukausi_fi							AS ''Tilastokuukausi''
--, concat(''1.7.2018'','' - '',  convert(varchar, (DATEADD(MONTH, DATEDIFF(MONTH, -1, GETDATE())-3, -1)),104))
, case 
		when CONCAT(YEAR(Getdate()),''-06-30'')>d3.paivays --Jos päivämäärä on pienempi kuin viime kesäkuun loppu niin vakiopäivät
		
		 
		then CONCAT(''01.07.'',CASE WHEN d3.kuukausi < 7 THEN d3.vuosi - 1 ELSE d3.vuosi END,
		'' - '',''30.06.'', CASE WHEN d3.kuukausi > 6 THEN d3.vuosi + 1 ELSE d3.vuosi END)
		
		else											--Jos päivämäärä on suurempi kuin viime kesäkuun loppu niin viimeinen kuukausi muuttuu
		
		CONCAT(''01.07.''
		,CASE
		WHEN d3.kuukausi < 7 THEN d3.vuosi - 1 
		ELSE d3.vuosi END ,'' - '' ,CONVERT(varchar,EOMONTH(DATEADD(MONTH,-3,GETDATE())),104)) END

											AS ''Tilastokausi''
, d3.rahoituskausi_amm						AS ''Rahoituskausi''
											
											--KYSELYMUUTTUJAT
, d5.kyselypohja_tarkenne_amis_fi			AS ''Kysely''
, d5.kyselypohja_tarkenne_fi				AS ''Kyselyn kohderyhmä''  
, d4.kysymys_fi								AS ''Kysymys''
, d4.kysymysryhma_fi						AS ''Kysymysryhmä''
, COALESCE(NULLIF(d6.vastaus_fi,''Tieto puuttuu''),numerovalinta)	--ei-monivalintakysymyksissä näytetään numerovalinta
  											AS ''Monivalintavaihtoehto''
, d4b.kytkin_fi								AS ''Rahoitusmallikysymys''

, d4.kiusaamiskysymys						AS ''Kiusaamiskysymys''

														---KOULUTUSTOIMIJA
, d1.nimi_amos_spl							AS ''Koulutuksen järjestäjä''

, d2.maakunta_fi							AS ''Koul. järjestäjän maakunta''
, d2.kunta_fi								AS ''Koul. järjestäjän kunta''
, d2.avi_fi									AS ''Koul. järjestäjän AVI''
, d2.ely_fi									AS ''Koul. järjestäjän ELY''

														--OPPILAITOS
, o2.organisaatio_fi						AS ''Oppilaitos''
, a2.maakunta_fi							AS ''Oppilaitoksen maakunta''
, a2.kunta_fi								AS ''Oppilaitoksen kunta''
, a2.avi_fi									AS ''Oppilaitoksen AVI''
, a2.ely_fi									AS ''Oppilaitoksen ELY''

, d7.koulutusluokitus_fi					AS ''Tutkinto''									
, d7.tutkintotyyppi_fi						AS ''Tutkintotyyppi''
, d7.koulutusalataso1_fi					AS ''Koulutusala, taso 1''
, d7.koulutusalataso2_fi					AS ''Koulutusala, taso 2''
, d7.koulutusalataso3_fi					AS ''Koulutusala, taso 3''

														--HENKILÖMUUTTUJAT
, d8.vastaus_fi								AS ''Sukupuoli''	
, d9.vastaus_fi								AS ''Äidinkieli''
, av3.vastaus_fi							AS ''Ikäryhmä''
, p.koulutustausta_fi						AS ''Korkein aiempi koulutus''
, NULL /* av2.koulutustausta_fi */			AS ''Aiempi koulutus''
, av4.selite_fi								AS ''Oppisopimuskoulutus''
, av.vastaus_fi								AS ''Hakeutumisväylä''
, av5.vastaus_fi							AS ''Arvio tulevaisuudesta''


--Ruotsi
, d3.vuosi									AS ''Statistikår''
, d3.kuukausi_sv							AS ''Statistikmånad''
, concat(''1.7.2018'','' - '',  convert(varchar, (DATEADD(MONTH, DATEDIFF(MONTH, -1, GETDATE())-3, -1)),104))
											AS ''Statistikperiod''
, d3.rahoituskausi_amm						AS ''Finansieringsperiod''

, d5.kyselypohja_tarkenne_amis_sv			AS ''Frågeformulär''
, d5.kyselypohja_tarkenne_sv				AS ''Målgrupp för frågeformulär''  
, d4.kysymys_sv								AS ''Fråga''
, d4.kysymysryhma_sv						AS ''Frågegrupp''
, COALESCE(NULLIF(d6.vastaus_sv,''Information saknas''),numerovalinta)
											AS ''Flervalsalternativ''
, d4b.kytkin_sv								AS ''Finansieringsmodellsfråga''

, NULL /* d1.organisaatio_sv */				AS ''Utbildningsanordnare''
, d2.maakunta_sv							AS ''Utbildningsanordnarens landskap''
, d2.kunta_sv								AS ''Utbildningsanordnarens kommun''
, d2.avi_sv									AS ''Utbildningsanordnarens RFV-område''
, d2.ely_sv									AS ''Utbildningsanordnarens NMT-område''
, o2.organisaatio_sv						AS ''Läroanstalt''
, a2.maakunta_sv							AS ''Läroanstaltens landskap''
, a2.kunta_sv								AS ''Läroanstaltens kommun''
, a2.avi_sv									AS ''Läroanstaltens RFV-område''
, a2.ely_sv									AS ''Läroanstaltens NMT-område''

, d7.koulutusluokitus_sv					AS ''Examen''									
, d7.tutkintotyyppi_sv						AS ''Typ av examen''
, d7.koulutusalataso1_sv					AS ''Utbildningsområde, nivå 1''
, d7.koulutusalataso2_sv					AS ''Utbildningsområde, nivå 2''
, d7.koulutusalataso3_sv					AS ''Utbildningsområde, nivå 3''

, d8.vastaus_sv								AS ''Kön''	
, d9.vastaus_sv								AS ''Modersmål''
, av3.vastaus_sv							AS ''Åldersgrupp''
, p.koulutustausta_sv						AS ''Den högsta tidigare utbildningen''
, NULL /* av2.koulutustausta_sv	*/			AS ''Tidigare utbildning''
, av4.selite_sv								AS ''Läroavtalsutbildning''
, av.vastaus_sv								AS ''Ansökan''
, av5.vastaus_sv							AS ''Bedömning av situationen''

--Englanti
, d3.vuosi									AS ''Statistical year''
, d3.kuukausi_en							AS ''Statistical month''
, concat(''1.7.2018'','' - '',  convert(varchar, (DATEADD(MONTH, DATEDIFF(MONTH, -1, GETDATE())-3, -1)),104))
											AS ''Statistical period''
, d3.rahoituskausi_amm						AS ''Funding period''
, d5.kyselypohja_tarkenne_amis_en			AS ''Survey''
, d5.kyselypohja_tarkenne_en				AS ''Target group for survey''  
, d4.kysymys_en								AS ''Question''
, d4.kysymysryhma_en						AS ''Question group''
, COALESCE(NULLIF(d6.vastaus_en,''Missing data''),numerovalinta)
											AS ''Multiple choice option''
, d4b.kytkin_en								AS ''Funding model question''

, NULL /* d1.organisaatio_en */				AS ''Education provider''
, d2.maakunta_en							AS ''Region of the education provider''
, d2.kunta_en								AS ''Municipality of the education provider''
, d2.avi_en									AS ''AVI area of the education provider''
, d2.ely_en									AS ''ELY area of the education provider''
, o2.organisaatio_en						AS ''Educational institution''
, a2.maakunta_en							AS ''Region of the institution''
, a2.kunta_en								AS ''Municipality of the institution''
, a2.avi_en									AS ''AVI area of the institution''
, a2.ely_en									AS ''ELY area of the institution''

, d7.koulutusluokitus_en					AS ''Qualification''									
, d7.tutkintotyyppi_en						AS ''Qualification type''
, d7.koulutusalataso1_en					AS ''Field of education, tier 1''
, d7.koulutusalataso2_en					AS ''Field of education, tier 2''
, d7.koulutusalataso3_en					AS ''Field of education, tier 3''

, d8.vastaus_en								AS ''Gender''	
, d9.vastaus_en								AS ''Mother tongue''
, av3.vastaus_en							AS ''Age group''
, p.koulutustausta_en						AS ''The highest prior education''
, NULL /* av2.koulutustausta_en	*/			AS ''Prior education''
, av4.selite_en								AS ''Apprenticeship training''
, av.vastaus_en								AS ''Application route''
, av5.vastaus_en							AS ''Expectations for the future''

														--KOODIMUUTTUJAT
, d7.koulutusluokitus_koodi					AS ''Koodit Tutkinto''
, o2.organisaatio_koodi						AS ''Koodit Oppilaitos''
, d1.ytunnus_amos_spl						AS ''Koodit Koulutuksen järjestäjä''
, d3.kuukausi								AS ''Koodit Tilastokuukausi''     
, d4b.kytkin_koodi							AS ''Koodit Rahoitusmallikysymys''


														--JÄRJESTYSMUUTTUJAT
, NULL /* av2.priorisointi */				AS ''Järjestys aiempi koulutus''
, p.priorisointi							AS ''Järjestys korkein aiempi koulutus''
, d9.jarjestys_koodi						AS ''Järjestys äidinkieli''
, av3.jarjestys_koodi						AS ''Järjestys ikäryhmä''
, d8.jarjestys_koodi						AS ''Järjestys sukupuoli''
, av.jarjestys_koodi						AS ''Järjestys hakeutumisväylä''
, av5.jarjestys_koodi						AS ''Järjestys arvio tulevaisuudesta''
, d2.jarjestys_avi_koodi					AS ''Järjestys jarj avi''
, d2.jarjestys_ely_koodi					AS ''Järjestys jarj ely''
, d2.jarjestys_maakunta_koodi				AS ''Järjestys jarj maakunta''
, a2.jarjestys_avi_koodi					AS ''Järjestys opp avi''
, a2.jarjestys_ely_koodi					AS ''Järjestys opp ely''
, a2.jarjestys_maakunta_koodi				AS ''Järjestys opp maakunta''
, d7.jarjestys_tutkintotyyppi_koodi			AS ''Järjestys tutkintotyyppi''
, d7.jarjestys_koulutusalataso1_koodi		AS ''Järjestys koulutusala1''
, d7.jarjestys_koulutusalataso2_koodi		AS ''Järjestys koulutusala2''
, d7.jarjestys_koulutusalataso3_koodi		AS ''Järjestys koulutusala3''
, COALESCE(NULLIF(d6.koodi,-1),numerovalinta)
											AS ''Järjestys monivalintavaihtoehto''
, d4.kysymysjarjestys						AS ''Järjestys kysymys''
, (select max(d.kysymysryhmajarjestys)	
from dw.d_arvokysymys d 
where d.kysymysryhma_fi=d4.kysymysryhma_fi)	AS ''Järjestys kysymysryhma''


														--MUUT
, f.vastaajaid
, d4.vastaustyyppi							AS ''vastaustyyppi''
, case 
	when d4.vastaustyyppi IN (''asteikko5_1'',''arvosana7'') then 1 
	else 0 
  end										AS ''vastaustyyppi_keskiarvo''
, f.numerovalinta
, f2.id										AS ''luodut_vastaajatunnukset_id''
, NULL /*  av2.priorisointi_vastaajaid */	AS ''pohjakoulutus_priorisointi_vastaajaid''
,Case when d5.kyselypohja_tarkenne_fi =''Aloittaneet'' then f3.[Vastanneet (Aloitusvaiheenkysely)]
			when d5.kyselypohja_tarkenne_fi=''Koko tutkinnon suorittaneet'' then f3.[Vastanneet (Tutkinnon suorittaneiden päättövaiheen kysely)]
			when d5.kyselypohja_tarkenne_fi=''Tutkinnon osia suorittaneet'' then f3.[Vastanneet (Tutkinnon osan suorittaneiden päättövaiheen kysely)]
			ELSE NULL END as ''Vahvistetut vastanneet''
,Case when d5.kyselypohja_tarkenne_fi =''Aloittaneet'' then f3.[Kyselyn kohteena olleet  (Aloitusvaiheenkysely)]
			when d5.kyselypohja_tarkenne_fi=''Koko tutkinnon suorittaneet'' then f3.[Kyselyn kohteena olleet  (Tutkinnon suorittaneiden päättövaiheen kysely)]
			when d5.kyselypohja_tarkenne_fi=''Tutkinnon osia suorittaneet'' then f3.[Kyselyn kohteena olleet  (Tutkinnon osan suorittaneiden päättövaiheen kysely)]
			ELSE NULL END as ''Vahvistetut kyselyn kohteena olleet''

FROM dw.f_arvo_amis AS f

--LEFT JOIN dw.d_organisaatioluokitus d1 ON d1.id=f.d_organisaatio_koulutustoimija_id									
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d1 ON d1.id=f.d_amos_spl_jarjestaja_linkki_id
--LEFT JOIN dw.d_alueluokitus d2 on d2.id=f.d_alueluokitus_koulutustoimija_id																
LEFT JOIN dw.d_alueluokitus d2 on d2.kunta_koodi=COALESCE(d1.kunta_koodi,-1)
LEFT JOIN dw.d_organisaatioluokitus o2 ON f.d_organisaatio_oppilaitos_id = o2.id													
LEFT JOIN dw.d_alueluokitus a2 on   a2.id=f.d_alueluokitus_oppilaitos_id	
LEFT JOIN dw.d_kalenteri d3 ON f.d_kalenteri_tunnus_luotu_id=d3.id   
LEFT JOIN dw.d_kalenteri d3b ON f.d_kalenteri_vastaus_id = d3b.id
LEFT JOIN dw.d_arvokysymys d4 ON f.d_arvokysymys_id = d4.id
LEFT JOIN dw.d_kytkin d4b ON d4b.kytkin_koodi = d4.rahoitusmallikysymys
LEFT JOIN dw.d_arvokyselykerta d5 ON f.d_arvokyselykerta_id = d5.id
LEFT JOIN dw.d_arvovastaus_monivalinta d6 ON f.d_arvovastaus_monivalinta_id = d6.id
LEFT JOIN dw.d_koulutusluokitus d7 ON f.d_koulutusluokitus_id = d7.id
LEFT JOIN dw.d_arvovastaus_taustakysymys d8 ON d8.id = f.d_arvovastaus_taustakysymys_sukupuoli_id
LEFT JOIN dw.d_arvovastaus_taustakysymys d9 ON d9.id = f.d_arvovastaus_taustakysymys_aidinkieli_id
LEFT JOIN dw.d_arvovastaus_taustakysymys av ON av.id = f.d_arvovastaus_taustakysymys_hakeutumisvayla_id
--LEFT JOIN dw.d_arvovastaus_koulutustausta av2 ON av2.vastaajaid = f.vastaajaid
LEFT JOIN dw.d_arvovastaus_taustakysymys av3 ON av3.id = f.d_arvovastaus_taustakysymys_ika_id
LEFT JOIN dw.d_oppisopimuskoulutus av4 ON av4.id = f.d_oppisopimuskoulutus_id
LEFT JOIN dw.d_arvovastaus_taustakysymys av5 ON av5.id = f.d_arvovastaus_taustakysymys_arvio_tilanteesta_id
LEFT JOIN dw.d_arvovastaus_koulutustausta p ON p.vastaajaid = f.vastaajaid 
LEFT JOIN dw.f_arvo_luodut_vastaajatunnukset f2 ON f2.kyselykertaid = d5.kyselykertaid 
												and f2.oppilaitoskoodi = o2.organisaatio_koodi 
												and f2.tutkintokoodi = d7.koulutusluokitus_koodi 
												and YEAR(f2.kuukausi) = d3.vuosi and MONTH(f2.kuukausi) = d3.kuukausi
LEFT JOIN (

	SELECT 
		ytunnus = d.ytunnus_amos_spl
		,rahoituskausi
		,[Kyselyn kohteena olleet  (Aloitusvaiheenkysely)] = sum([Kyselyn kohteena olleet  (Aloitusvaiheenkysely)])
		,[Kyselyn kohteena olleet  (Tutkinnon suorittaneiden päättövaiheen kysely)] = sum([Kyselyn kohteena olleet  (Tutkinnon suorittaneiden päättövaiheen kysely)])
		,[Kyselyn kohteena olleet  (Tutkinnon osan suorittaneiden päättövaiheen kysely)] = sum([Kyselyn kohteena olleet  (Tutkinnon osan suorittaneiden päättövaiheen kysely)])
		,[Vastanneet (Aloitusvaiheenkysely)] = sum([Vastanneet (Aloitusvaiheenkysely)])
		,[Vastanneet (Tutkinnon suorittaneiden päättövaiheen kysely)] = sum([Vastanneet (Tutkinnon suorittaneiden päättövaiheen kysely)])
		,[Vastanneet (Tutkinnon osan suorittaneiden päättövaiheen kysely)] = sum([Vastanneet (Tutkinnon osan suorittaneiden päättövaiheen kysely)])
	FROM dw.f_amos_opiskelijapalaute_vastaajamäärä_vahvistettu f
	JOIN dw.d_amos_spl_jarjestaja_linkki d on d.ytunnus_avain = f.[Koulutuksen järjestäjän Y-tunnus]
	GROUP BY d.ytunnus_amos_spl,rahoituskausi

) f3 ON f3.rahoituskausi = d3.rahoituskausi_amm AND f3.ytunnus = d1.ytunnus_amos_spl

WHERE 1=1
AND d3.rahoituskausi_amm = ''01.07.2018 - 30.06.2019''
AND coalesce(p.priorisointi_vastaajaid,1) = 1
AND d1.sisaltyy_amos_spl = 1

' 
