USE [ANTERO]
GO

/****** Object:  View [dw].[v_arvo]    Script Date: 24.7.2017 14:25:29 ******/
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

,case d_arvokysymys.rahoitusmallikysymys when 1 then 'Kyllä' when 0 then 'Ei' else 'Tieto puuttuu' end as 'Rahoitusmallikysymys'

,d_arvokyselykerta.kysely_fi as 'Kysely'
,d_arvokyselykerta.kysely_sv
,d_arvokyselykerta.kysely_en
,d_arvokyselykerta.kyselykerta

,koulutusmuoto
,d_arvokysymys.vastaustyyppi
,vaihtoehto
,monivalintavaihtoehto
,numerovalinta
,taustakysymys_ika
,taustakysymys_sukupuoli
,taustakysymys_pohjakoulutus
,vastaajaid

,lukumaara

,d_arvokyselykerta.kyselypohja 
,d_arvokyselykerta.vuosi as 'Kyselyvuosi'
,valtakunnallinen

,d_arvokysymys.kysymysjarjestys
,d_arvokysymys.kysymysryhma_fi as 'Kysymysryhmä'
,d_arvokysymys.kysymysryhma_sv
,d_arvokysymys.kysymysryhma_en
,d_arvokysymys.kysymysryhmajarjestys


FROM dw.f_arvo AS f
LEFT JOIN dw.d_organisaatio ON f.d_organisaatio_id=d_organisaatio.id
LEFT JOIN dw.d_koulutusluokitus ON f.d_koulutusluokitus_id=d_koulutusluokitus.id
LEFT JOIN dw.d_kieli ON f.d_kieli_id=d_kieli.id
LEFT JOIN dw.d_alueluokitus ON f.d_alueluokitus_id=d_alueluokitus.id
LEFT JOIN dw.d_kalenteri ON f.d_kalenteri_id=d_kalenteri.id
LEFT JOIN dw.d_arvokysymys ON f.d_arvokysymys_id=d_arvokysymys.id
LEFT JOIN dw.d_arvokyselykerta ON f.d_arvokyselykerta_id=d_arvokyselykerta.id


GO


