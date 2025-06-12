USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dw].[v_arvo_amis_tep_cultures_pbi] AS

--Tässä versiossa mukana koodit_tyopaikka ( = koodit_yritys_yhteiso) pbi-laskentaa varten; muuttujaa ei saa julkaista tai viedä kuutioon. JS 4.2.2025

SELECT --top 1000 
												--YHTEISET
	 d3.rahoituskausi_amm						AS 'rahoituskausi'
	,CASE
		WHEN TRY_CONVERT(DATE,RIGHT(d3.rahoituskausi_amm,10),104) <= EOMONTH(DATEADD(MONTH,ca.viive*-1,GETDATE())) THEN d3.rahoituskausi_amm
		ELSE CONCAT(LEFT(d3.rahoituskausi_amm,13),TRY_CONVERT(VARCHAR,EOMONTH(DATEADD(MONTH,ca.viive*-1,GETDATE())),104))
	END											AS 'tilastokausi'
	,d3.vuosi									AS 'tilastovuosi'

--FI
												--AIKAMUUTTUJAT
	,d3.kuukausi_fi								AS 'tilastokuukausi_fi'

												--KYSELYMUUTTUJAT
	,d5.kyselypohja_tarkenne_fi					AS 'kysely_fi'
	,d5.kyselypohja_tarkenne_fi					AS 'kyselyn_kohderyhma_fi'
	,d4.kysymys_fi								AS 'kysymys_fi'
	,d4.kysymysryhma_fi							AS 'kysymysryhma_fi'
	--ei-monivalintakysymyksissa naytetaan numerovalinta
	,COALESCE(NULLIF(d6.vastaus_fi,'Tieto puuttuu'),cast(numerovalinta as varchar(10)),vaihtoehto) AS 'monivalintavaihtoehto_fi'
	,d4b.kytkin_fi								AS 'rahoitusmallikysymys_fi'
	,d15.vastaus_fi								AS 'vastaajan_tyotehtava_fi'

												---KOULUTUSTOIMIJA
	,d1.organisaatio_fi							AS 'koulutuksen_jarjestaja_fi'
	,d2.maakunta_fi								AS 'koulutuksen_jarjestajan_maakunta_fi'
	,d2.kunta_fi								AS 'koulutuksen_jarjestajan_kunta_fi'
	,d2.avi_fi									AS 'koulutuksen_jarjestajan_avi_fi'
	,d2.ely_fi									AS 'koulutuksen_jarjestajan_ely_fi'
	,coalesce(tk1.koulutuksen_jarjestajan_kieli,'Tieto puuttuu') AS 'koulutuksen_jarjestajan_kieli_fi'

												--OPPILAITOS
	,o2.organisaatio_fi							AS 'oppilaitos_fi'
	,a2.maakunta_fi								AS 'oppilaitoksen_maakunta_fi'
	,a2.kunta_fi								AS 'oppilaitoksen_kunta_fi'
	,a2.avi_fi									AS 'oppilaitoksen_avi_fi'
	,a2.ely_fi									AS 'oppilaitoksen_ely_fi'

												--KOULUTUSMUUTTUJAT
	,d7.koulutusluokitus_fi						AS 'tutkinto_fi'
	,d14.selite_fi								AS 'tutkinnon_osa_fi'
	,d7.tutkintotyyppi_fi						AS 'tutkintotyyppi_fi'
	,d7.koulutusalataso1_fi						AS 'koulutusala_taso_1_fi'
	,d7.koulutusalataso2_fi						AS 'koulutusala_taso_2_fi'
	,d7.koulutusalataso3_fi						AS 'koulutusala_taso_3_fi'
	,d10.kieli_fi								AS 'suorituskieli_fi'

												--TYÖSSÄKÄYNTIMUUTTUJAT
	,d8.kunta_fi								AS 'toimipaikan_kunta_fi' --toimipaikan -> tyopaikan
	,coalesce(d8.maakunta_fi,'Tieto puuttuu')	AS 'toimipaikan_maakunta_fi' --toimipaikan -> tyopaikan
	,d9.maatjavaltiot2_fi						AS 'toimipaikan_maa_fi' --toimipaikan -> tyopaikan
	--,coalesce(d13.taso_1_selite_fi,'Tieto puuttuu') AS 'tyopaikan_toimiala_fi'
	,coalesce(d13.toimiala_2008,'Tieto puuttuu') AS 'tyopaikan_toimiala_fi' --tyopaikan -> yrityksen_yhteison
	,coalesce(d11b.kunta_fi,'Tieto puuttuu')	AS 'yrityksen_yhteison_kunta_fi'
	,coalesce(d11b.maakunta_fi,'Tieto puuttuu')	AS 'yrityksen_yhteison_maakunta_fi'
	,d16.selite_fi								AS 'sopimustyyppi_fi'
	,d12.selite_fi								AS 'oppisopimuksen_perusta_fi'

--SV
												--AIKAMUUTTUJAT
	,d3.kuukausi_sv								AS 'tilastokuukausi_sv'

												--KYSELYMUUTTUJAT
	,d5.kyselypohja_tarkenne_sv					AS 'kysely_sv'
	,d5.kyselypohja_tarkenne_sv					AS 'kyselyn_kohderyhma_sv'
	,d4.kysymys_sv								AS 'kysymys_sv'
	,d4.kysymysryhma_sv							AS 'kysymysryhma_sv'
	--ei-monivalintakysymyksissa naytetaan numerovalinta
	,COALESCE(NULLIF(d6.vastaus_sv,'Information saknas'),cast(numerovalinta as varchar(10))) AS 'monivalintavaihtoehto_sv'
	,d4b.kytkin_sv								AS 'rahoitusmallikysymys_sv'
	,d15.vastaus_sv								AS 'vastaajan_tyotehtava_sv'

												---KOULUTUSTOIMIJA
	,d1.organisaatio_sv							AS 'koulutuksen_jarjestaja_sv'
	,d2.maakunta_sv								AS 'koulutuksen_jarjestajan_maakunta_sv'
	,d2.kunta_sv								AS 'koulutuksen_jarjestajan_kunta_sv'
	,d2.avi_sv									AS 'koulutuksen_jarjestajan_avi_sv'
	,d2.ely_sv									AS 'koulutuksen_jarjestajan_ely_sv'
	,coalesce(tk1.koulutuksen_jarjestajan_kieli_sv,'Information saknas') AS 'koulutuksen_jarjestajan_kieli_sv'

												--OPPILAITOS
	,o2.organisaatio_sv							AS 'oppilaitos_sv'
	,a2.maakunta_sv								AS 'oppilaitoksen_maakunta_sv'
	,a2.kunta_sv								AS 'oppilaitoksen_kunta_sv'
	,a2.avi_sv									AS 'oppilaitoksen_avi_sv'
	,a2.ely_sv									AS 'oppilaitoksen_ely_sv'

												--KOULUTUSMUUTTUJAT
	,d7.koulutusluokitus_sv						AS 'tutkinto_sv'
	,d14.selite_sv								AS 'tutkinnon_osa_sv'
	,d7.tutkintotyyppi_sv						AS 'tutkintotyyppi_sv'
	,d7.koulutusalataso1_sv						AS 'koulutusala_taso_1_sv'
	,d7.koulutusalataso2_sv						AS 'koulutusala_taso_2_sv'
	,d7.koulutusalataso3_sv						AS 'koulutusala_taso_3_sv'
	,d10.kieli_sv								AS 'suorituskieli_sv'

												--TYÖSSÄKÄYNTIMUUTTUJAT
	,d8.kunta_sv								AS 'toimipaikan_kunta_sv'
	,coalesce(d8.maakunta_sv,'Information saknas') AS 'toimipaikan_maakunta_sv'
	,d9.maatjavaltiot2_sv						AS 'toimipaikan_maa_sv'
	--,coalesce(d13.taso_1_selite_sv,'Information saknas') AS 'tyopaikan_toimiala_sv'
	,coalesce(d13.toimiala_2008_SV,'Information saknas') AS 'tyopaikan_toimiala_sv'
	,coalesce(d11b.kunta_sv,'Information saknas') AS 'yrityksen_yhteison_kunta_sv'
	,coalesce(d11b.maakunta_sv,'Information saknas') AS 'yrityksen_yhteison_maakunta_sv'
	,d16.selite_sv								AS 'sopimustyyppi_sv'
	,d12.selite_sv								AS 'oppisopimuksen_perusta_sv'

--EN
												--AIKAMUUTTUJAT
	,d3.kuukausi_en								AS 'tilastokuukausi_en'

												--KYSELYMUUTTUJAT
	,d5.kyselypohja_tarkenne_en					AS 'kysely_en'
	,d5.kyselypohja_tarkenne_en					AS 'kyselyn_kohderyhma_en'
	,d4.kysymys_en								AS 'kysymys_en'
	,d4.kysymysryhma_en							AS 'kysymysryhma_en'
	--ei-monivalintakysymyksissa naytetaan numerovalinta
	,COALESCE(NULLIF(d6.vastaus_en,'Missing data'),cast(numerovalinta as varchar(10))) AS 'monivalintavaihtoehto_en'
	,d4b.kytkin_en								AS 'rahoitusmallikysymys_en'
	,d15.vastaus_en								AS 'vastaajan_tyotehtava_en'

												---KOULUTUSTOIMIJA
	,d1.organisaatio_en							AS 'koulutuksen_jarjestaja_en'
	,d2.maakunta_en								AS 'koulutuksen_jarjestajan_maakunta_en'
	,d2.kunta_en								AS 'koulutuksen_jarjestajan_kunta_en'
	,d2.avi_en									AS 'koulutuksen_jarjestajan_avi_en'
	,d2.ely_en									AS 'koulutuksen_jarjestajan_ely_en'
	,coalesce(tk1.koulutuksen_jarjestajan_kieli_EN,'Missing data') AS 'koulutuksen_jarjestajan_kieli_en'

												--OPPILAITOS
	,o2.organisaatio_en							AS 'oppilaitos_en'
	,a2.maakunta_en								AS 'oppilaitoksen_maakunta_en'
	,a2.kunta_en								AS 'oppilaitoksen_kunta_en'
	,a2.avi_en									AS 'oppilaitoksen_avi_en'
	,a2.ely_en									AS 'oppilaitoksen_ely_en'

												--KOULUTUSMUUTTUJAT
	,d7.koulutusluokitus_en						AS 'tutkinto_en'
	,d14.selite_en								AS 'tutkinnon_osa_en'
	,d7.tutkintotyyppi_en						AS 'tutkintotyyppi_en'
	,d7.koulutusalataso1_en						AS 'koulutusala_taso_1_en'
	,d7.koulutusalataso2_en						AS 'koulutusala_taso_2_en'
	,d7.koulutusalataso3_en						AS 'koulutusala_taso_3_en'
	,d10.kieli_en								AS 'suorituskieli_en'

												--TYÖSSÄKÄYNTIMUUTTUJAT
	,d8.kunta_en								AS 'toimipaikan_kunta_en'
	,coalesce(d8.maakunta_en,'Missing data')	AS 'toimipaikan_maakunta_en'
	,d9.maatjavaltiot2_en						AS 'toimipaikan_maa_en'
	--,coalesce(d13.taso_1_selite_fi,'Missing data') AS 'tyopaikan_toimiala_en'
	,coalesce(d13.toimiala_2008_EN,'Missing data') AS 'tyopaikan_toimiala_en'
	,coalesce(d11b.kunta_en,'Missing data')		AS 'yrityksen_yhteison_kunta_en'
	,coalesce(d11b.maakunta_en,'Missing data')	AS 'yrityksen_yhteison_maakunta_en'
	,d16.selite_en								AS 'sopimustyyppi_en'
	,d12.selite_en								AS 'oppisopimuksen_perusta_en'

												--KOODIMUUTTUJAT
	,d7.koulutusluokitus_koodi					AS 'koodit_tutkinto'
	,o2.organisaatio_koodi						AS 'koodit_oppilaitos'
	,d1.organisaatio_koodi						AS 'koodit_koulutuksen_jarjestaja'
	,d3.kuukausi								AS 'koodit_tilastokuukausi'
	,cast(d4b.kytkin_koodi as int)				AS 'koodit_rahoitusmallikysymys'
	,d11.ytunnus								AS 'koodit_tyopaikka' --koodit_yritys_yhteiso (ei saa viedä kuutioon)

												--JÄRJESTYSMUUTTUJAT
	,coalesce(d8.jarjestys_maakunta_koodi,'99999') AS 'jarjestys_toimipaikan_maakunta'
	,coalesce(d11b.jarjestys_maakunta_koodi,'99999') AS 'jarjestys_yrityksen_yhteison_maakunta'
	,d2.jarjestys_avi_koodi						AS 'jarjestys_koulutuksen_jarjestajan_avi'
	,d2.jarjestys_ely_koodi						AS 'jarjestys_koulutuksen_jarjestajan_ely'
	,d2.jarjestys_maakunta_koodi				AS 'jarjestys_koulutuksen_jarjestajan_maakunta'
	,a2.jarjestys_avi_koodi						AS 'jarjestys_oppilaitoksen_avi'
	,a2.jarjestys_ely_koodi						AS 'jarjestys_oppilaitoksen_ely'
	,a2.jarjestys_maakunta_koodi				AS 'jarjestys_oppilaitoksen_maakunta'
	,d7.jarjestys_tutkintotyyppi_koodi			AS 'jarjestys_tutkintotyyppi'
	,d7.jarjestys_koulutusalataso1_koodi		AS 'jarjestys_koulutusala_taso_1'
	,d7.jarjestys_koulutusalataso2_koodi		AS 'jarjestys_koulutusala_taso_2'
	,d7.jarjestys_koulutusalataso3_koodi		AS 'jarjestys_koulutusala_taso_3'
	,COALESCE(NULLIF(d6.koodi,'-1'),numerovalinta)	AS 'jarjestys_monivalintavaihtoehto'
	,d4.kysymysjarjestys						AS 'jarjestys_kysymys'
	,(select max(d.kysymysryhmajarjestys) from dw.d_arvokysymys d where d.kysymysryhma_fi=d4.kysymysryhma_fi) AS 'jarjestys_kysymysryhma'
	,d9.jarjestys_maatjavaltiot2_koodi			AS 'jarjestys_toimipaikan_maa'
	,d12.jarjestys_koodi						AS 'jarjestys_oppisopimuksen_perusta'
	--,coalesce(d13.jarj_taso_1_v2,999999)		AS 'jarjestys_tyopaikan_toimiala'
	,coalesce(case when d13.toimiala_2008_avain not in ('X','-1') then d13.taso end, 999999) AS 'jarjestys_tyopaikan_toimiala'
	,d15.jarjestys_koodi						AS 'jarjestys_vastaajan_tyotehtava'
	,tk1.jarjestys_koulutuksen_jarjestajan_kieli AS 'jarjestys_koulutuksen_jarjestajan_kieli'
	,d3.kuukausi								AS 'jarjestys_kuukausi'

												--MUUT
	,f.vastaajaid								AS 'apusarake_vastaajaid'
	,f.vastaajatunnus							AS 'apusarake_vastaajatunnus'
	,f.tyopaikkakysely_vastaajaid				AS 'apusarake_tyopaikkakysely_vastaajaid'
	,f.tyopaikkakysely_vastaajatunnus			AS 'apusarake_tyopaikkakysely_vastaajatunnus'
	,f.tyopaikkakysely_liittyva_ohjaajatunnus	AS 'apusarake_tyopaikkakysely_liittyva_ohjaajatunnus'

	,d4.vastaustyyppi							AS 'apusarake_vastaustyyppi'
	,case
		when d4.vastaustyyppi IN ('asteikko5_1','arvosana7') then 1
		else 0
	  end										AS 'apusarake_vastaustyyppi_keskiarvo'
	,f.numerovalinta							AS 'apusarake_numerovalinta'
	,f.d_arvokyselykerta_id						AS 'apusarake_kyselykertaid'
	,f.tyopaikkajakson_kesto					AS 'apusarake_tyopaikkajakson_kesto'

	--rahoitusraportit nykyään eri kuutiosta, tämä mukana vanhojen mittariviittausten ja testiraporttien takia. JS 19.10.2023
	,case 
		when d1.organisaatio_koodi = '0244767-4' then 1 --Saamelaisalueen koulutuskeskus
		else 0 
	end											AS 'rahoitusraporteilta_poisrajattava_1_0'
	
	,f.osaamisalat_avain

FROM dw.f_arvo_amis_tep AS f
LEFT JOIN dw.d_organisaatioluokitus d1 ON d1.id = f.d_organisaatio_koulutustoimija_id
LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot tk1 on tk1.oppilaitos_avain = d1.organisaatio_koodi
LEFT JOIN dw.d_alueluokitus d2 ON d2.kunta_koodi = d1.kunta_koodi
LEFT JOIN dw.d_organisaatioluokitus o2 ON f.d_organisaatio_oppilaitos_id = o2.id
LEFT JOIN dw.d_alueluokitus a2 ON a2.id=f.d_alueluokitus_oppilaitos_id
LEFT JOIN dw.d_kalenteri d3 ON f.d_kalenteri_jakso_paattynyt_id = d3.id
--LEFT JOIN dw.d_kalenteri d3a ON f.d_kalenteri_tunnus_luotu_id = d3a.id
--LEFT JOIN dw.d_kalenteri d3b ON f.d_kalenteri_vastaus_id = d3b.id
LEFT JOIN dw.d_arvokysymys d4 ON f.d_arvokysymys_id = d4.id
LEFT JOIN dw.d_kytkin d4b ON d4b.kytkin_koodi = d4.rahoitusmallikysymys
LEFT JOIN dw.d_arvokyselykerta d5 ON f.d_arvokyselykerta_id = d5.id
LEFT JOIN dw.d_arvovastaus_monivalinta d6 ON f.d_arvovastaus_monivalinta_id = d6.id
LEFT JOIN dw.d_koulutusluokitus d7 ON f.d_koulutusluokitus_id = d7.id
LEFT JOIN dw.d_alueluokitus d8 ON d8.id = f.d_alueluokitus_toimipaikka_id
LEFT JOIN dw.d_maatjavaltiot2 d9 ON d9.id = f.d_maatjavaltiot2_toimipaikka_id
LEFT JOIN dw.d_kieli d10 ON d10.id = f.d_suoritus_kieli_id
LEFT JOIN dw.d_ytj_yritystiedot d11 ON d11.id = f.d_ytj_yritystiedot_tyonantaja_id
LEFT JOIN dw.d_alueluokitus d11b ON d11b.kunta_koodi = d11.kotipaikkakunta_koodi
LEFT JOIN dw.d_oppisopimuksen_perusta d12 ON d12.id = f.d_oppisopimuksen_perusta_id
--LEFT JOIN dw.d_toimialaluokitus2008 d13 ON d13.toimiala_koodi = d11.toimiala_koodi
LEFT JOIN VipunenTK.dbo.d_toimiala_2008 tk2 ON tk2.toimiala_2008_avain = d11.toimiala_koodi
LEFT JOIN VipunenTK.dbo.d_toimiala_2008 d13 ON d13.toimiala_2008_avain = tk2.taso1
LEFT JOIN dw.d_tutkinnon_osa d14 ON d14.id = f.d_tutkinnon_osa_id
LEFT JOIN dw.d_arvovastaus_taustakysymys d15 ON d15.id = f.d_arvovastaus_taustakysymys_tehtava_id
LEFT JOIN dw.d_osaamisen_hankkimistapa d16 ON d16.id = f.d_osaamisen_hankkimistapa_id
CROSS APPLY (
	SELECT
		viive =
			CASE
				WHEN d5.kyselypohja_tarkenne_fi = 'Työelämäpalaute: työpaikkakysely' THEN --maalis-/syyskuussa edellinen puolivuotisjakso
					CASE
						WHEN MONTH(GETDATE()) BETWEEN 3 AND 8 THEN MONTH(GETDATE()) 
						ELSE (MONTH(GETDATE())+6) % 12 
					END
				WHEN d5.kyselypohja_tarkenne_fi = 'Työelämäpalaute: työpaikkaohjaajan kysely' THEN 3
			END
) ca

WHERE d3.paivays between datefromparts(2021,7,1) and eomonth(dateadd(month, -1*viive, getdate()))

GO
