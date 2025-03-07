USE [ANTERO]
GO

/****** Object:  View [dw].[v_arvo]    Script Date: 11.1.2018 17:32:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER VIEW [dw].[v_arvo] AS
SELECT
 d_kalenteri.vuosi AS "Tilastovuosi"
,d_organisaatio.organisaatio_koodi as 'Koodit Organisaatio'
,d_organisaatio.organisaatio_fi as 'Organisaatio'
,d_organisaatio.organisaatio_sv
,d_organisaatio.organisaatio_en
,d_koulutusluokitus.koulutusluokitus_koodi as 'Koodit Koulutus'
,d_koulutusluokitus.koulutusluokitus_fi as 'Koulutus'
,d_koulutusluokitus.koulutusluokitus_sv
,d_koulutusluokitus.koulutusluokitus_en

,d_koulutusluokitus.koulutusastetaso1_fi as 'Koulutusaste, taso 1'
,d_koulutusluokitus.koulutusastetaso2_fi as 'Koulutusaste, taso 2'
,d_koulutusluokitus.koulutusalataso1_fi as 'Koulutusala, taso 1'
,d_koulutusluokitus.koulutusalataso2_fi as 'Koulutusala, taso 2'
,d_koulutusluokitus.koulutusalataso3_fi as 'Koulutusala, taso 3'
,d_koulutusluokitus.okmohjauksenala_fi as 'OKM ohjauksen ala'
,d_koulutusluokitus.koulutusluokitus_fi as 'Koulutusnimike'

,d_kieli.kieli_koodi as 'Koodit Kieli'
,d_kieli.kieli_fi as 'Kieli'
,d_kieli.kieli_sv
,d_kieli.kieli_en

,d_alueluokitus.kunta_koodi as 'Koodit Kunta'
,d_alueluokitus.kunta_fi as 'Kunta'
,d_alueluokitus.kunta_sv
,d_alueluokitus.kunta_en
,d_alueluokitus.maakunta_koodi as 'Koodit Maakunta'
,d_alueluokitus.maakunta_fi as 'Maakunta'
,d_alueluokitus.maakunta_sv
,d_alueluokitus.maakunta_en

,d_kalenteri.kalenteri_avain as 'Koodit Kalenteri'
,d_kalenteri.vuosi as 'Vastausvuosi'
,d_kalenteri.kuukausi as 'Koodit Kuukausi'
,d_kalenteri.kuukausi_fi as 'Vastauskuukausi'
,d_kalenteri.kuukausi_sv
,d_kalenteri.kuukausi_en
,d_kalenteri.paiva as 'Vastauspäivä'

,d_arvokysymys.kysymys_fi as 'Kysymys'
,d_arvokysymys.kysymys_sv
,d_arvokysymys.kysymys_en

,case d_arvokysymys.rahoitusmallikysymys when 1 then 'Kyllä' when 0 then 'Ei' else 'Tieto puuttuu' end as rahoitusmallikysymys

,d_arvokyselykerta.kysely_fi as 'Kysely'
,d_arvokyselykerta.kysely_sv
,d_arvokyselykerta.kysely_en
,d_arvokyselykerta.kyselykerta

,koulutusmuoto
,d_arvokysymys.vastaustyyppi
,vaihtoehto
,case when monivalintavaihtoehto is null then case when vaihtoehto='1' then 'Kyllä' when vaihtoehto='0' then 'Ei' else NULL end else monivalintavaihtoehto end as monivalintavaihtoehto
,numerovalinta
,coalesce(taustakysymys_ika,'Tieto puuttuu') as 'taustakysymys_ika'
,case taustakysymys_ika when 'alle 25 vuotta' then 1 when '25-34 vuotta'  then 2 when '35-45 vuotta' then 3 when 'yli 45 vuotta' then 4 else 9 end as jarjestys_ika
,coalesce(taustakysymys_sukupuoli,'Tieto puuttuu') as 'taustakysymys_sukupuoli'
,case taustakysymys_sukupuoli when 'Mies' then 1 when 'Nainen' then 2 when 'Muu' then 3 when 'En halua vastata' then 4 else 9 end as jarjestys_sukupuoli
,coalesce(taustakysymys_pohjakoulutus,'Tieto puuttuu') as 'taustakysymys_pohjakoulutus'
,vastaajaid

,lukumaara

,d_arvokyselykerta.kyselypohja 
,d_arvokyselykerta.vuosi as 'Kyselyvuosi'
,valtakunnallinen
,case when kysymysryhma_fi = 'Taustatiedot' OR kysymysryhma_fi like 'Osa 1%' OR kysymysryhma_fi like 'Osa 2%' OR kysymysryhma_fi like 'Osa 3%' OR kysymysryhma_fi like 'Osa 4%' OR kysymysryhma_fi like 'Osa 5%'  then 1 else 0 end as 'kandikysymys'

,d_arvokysymys.kysymysjarjestys
,d_arvokysymys.kysymysryhma_fi as 'Kysymysryhmä'
,d_arvokysymys.kysymysryhma_sv
,d_arvokysymys.kysymysryhma_en
,d_arvokysymys.kysymysryhmajarjestys
,case when monivalintavaihtoehto is null then case when vaihtoehto='1' then 'Ky' when vaihtoehto='0' then 'Ei' else '99' end else left(monivalintavaihtoehto,2) end as jarjestys_monivalintavaihtoehto
,case taustakysymys_pohjakoulutus
	when 'Ylioppilastutkinto / IB-tutkinto' then 1
	when 'Ammatillinen perustutkinto/ammattitutkinto' then 2
	when 'Ylioppilastutkinto sekä ammatillinen perustutkinto/ammattitutkinto' then 3
	when 'Opistoasteen tai ammatillisen korkea-asteen tutkinto' then 4
	when 'Korkeakoulututkinto' then 5
	when 'Ulkomailla suoritettu tutkinto' then 6
	when 'Ei peruskoulun jälkeistä tutkintoa' then 7
	when 'Muu' then 8
	else 99
end as jarjestys_pohjakoulutus
,jarjestys_okmohjauksenala_koodi as jarjestys_ohjauksenala



FROM dw.f_arvo AS f
LEFT JOIN dw.d_organisaatio ON f.d_organisaatio_id=d_organisaatio.id
LEFT JOIN dw.d_koulutusluokitus ON f.d_koulutusluokitus_id=d_koulutusluokitus.id
LEFT JOIN dw.d_kieli ON f.d_kieli_id=d_kieli.id
LEFT JOIN dw.d_alueluokitus ON f.d_alueluokitus_id=d_alueluokitus.id
LEFT JOIN dw.d_kalenteri ON f.d_kalenteri_id=d_kalenteri.id
LEFT JOIN dw.d_arvokysymys ON f.d_arvokysymys_id=d_arvokysymys.id
LEFT JOIN dw.d_arvokyselykerta ON f.d_arvokyselykerta_id=d_arvokyselykerta.id

