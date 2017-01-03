ALTER VIEW dbo.v_f_avop_tilasto AS
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
,d_kalenteri.vuosi
,d_kalenteri.kuukausi as 'Koodit Kuukausi'
,d_kalenteri.kuukausi_fi as 'Kuukausi'
,d_kalenteri.kuukausi_sv
,d_kalenteri.kuukausi_en
,d_kalenteri.paiva

,d_avopkysymys.kysymys_fi as 'Kysymys'
,d_avopkysymys.kysymys_sv
,d_avopkysymys.kysymys_en

,d_avopkysymys.rahoitusmallikysymys

,kysely_fi as 'Kysely'
,kysely_sv
,kysely_en
,kyselykerta

,koulutusmuoto
,vastaustyyppi
,vaihtoehto
,monivalintavaihtoehto
,numerovalinta
,taustakysymys_ika
,taustakysymys_sukupuoli
,taustakysymys_pohjakoulutus
,vastaajaid

,lukumaara

FROM f_avop_tilasto AS f
LEFT JOIN d_organisaatio ON f.d_organisaatio_id=d_organisaatio.id
LEFT JOIN d_koulutusluokitus ON f.d_koulutusluokitus_id=d_koulutusluokitus.id
LEFT JOIN d_kieli ON f.d_kieli_id=d_kieli.id
LEFT JOIN d_alueluokitus ON f.d_alueluokitus_id=d_alueluokitus.id
LEFT JOIN d_kalenteri ON f.d_kalenteri_id=d_kalenteri.id
LEFT JOIN d_avopkysymys ON f.d_avopkysymys_id=d_avopkysymys.id
