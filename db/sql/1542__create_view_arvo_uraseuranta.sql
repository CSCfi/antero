USE [ANTERO]
GO
/****** Object:  View [dw].[v_arvo_uraseuranta]    Script Date: 18.4.2018 15:04:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dw].[v_arvo_uraseuranta]'))
EXEC dbo.sp_executesql @statement = N'




CREATE VIEW [dw].[v_arvo_uraseuranta] AS


SELECT

d7.ika_fi as ''Ikä (valmistuessa)''
,d7.ikaryhma1_fi as ''Ikäryhmä (valmistuessa)''
,d8.sukupuoli_fi as ''Sukupuoli''
,d9.kieli_fi as ''Äidinkieli''
,d10.maatjavaltiot2_fi as ''Kansalaisuus''
,d10.maanosa_fi as ''Kansalaisuus (maanosa)''
,d11.kunta_fi as ''Asuinkunta''
,d11.maakunta_fi as ''Asuinmaakunta''
,laajuus as ''Laajuus''
,paaaine as ''Pääainen''
,arvosana as ''Arvosana''
,asteikko as ''Asteikko''
,valintavuosi as ''Valintavuosi''
,valmistumisvuosi as ''Valmistumisvuosi''
,lasnaolo_lukukausia as ''Läsnäolo (lukukausia)''
,kirjoilla_olo_kuukausia as ''Kirjoillaolo (kuukausia)''

,d_koulutusluokitus.koulutusastetaso1_fi as ''Koulutusaste, taso 1''
,d_koulutusluokitus.koulutusastetaso2_fi as ''Koulutusaste, taso 2''
,d_koulutusluokitus.koulutusalataso1_fi as ''Koulutusala, taso 1''
,d_koulutusluokitus.koulutusalataso2_fi as ''Koulutusala, taso 2''
,d_koulutusluokitus.koulutusalataso3_fi as ''Koulutusala, taso 3''
,d_koulutusluokitus.okmohjauksenala_fi as ''OKM ohjauksen ala''
,d_koulutusluokitus.koulutusluokitus_fi as ''Koulutusnimike''
,d_kieli.kieli_fi as ''Koulutuksen kieli''
,d_alueluokitus.kunta_fi as ''Koulutuksen kunta''
,d_alueluokitus.maakunta_fi as ''Koulutuksen maakunta''

,d_arvokyselykerta.kysely_fi as ''Kysely''
,d_arvokyselykerta.kyselykerta as ''Kyselykerta''
,d_arvokysymys.kysymysryhma_fi as ''Kysymysryhmä''
,d_arvokysymys.kysymys_fi as ''Kysymys''
,d_arvokyselykerta.kyselypohja as ''Kyselypohja''
,d_arvokyselykerta.vuosi as ''Kyselyvuosi''
,case 
	when d_arvokysymys.rahoitusmallikysymys = 1 then ''Kyllä'' 
	when d_arvokysymys.rahoitusmallikysymys = 0 then ''Ei'' 
	else ''Tieto puuttuu'' 
end 
as ''Rahoitusmallikysymys''
,coalesce(monivalintavaihtoehto_fi,case when vaihtoehto=1 then ''Kyllä'' when vaihtoehto=0 then ''Ei'' end) as ''Monivalintavaihtoehto''
,numerovalinta
,d_arvokysymys.vastaustyyppi
,vaihtoehto
,valtakunnallinen

,d_organisaatioluokitus.organisaatio_fi as ''Korkeakoulu''

,vastaajaid
,lukumaara


--ruotsi
,d_organisaatioluokitus.organisaatio_sv as ''Högskola''
,d_koulutusluokitus.koulutusluokitus_sv ''Utbildningsbenämning''
,d_kieli.kieli_sv as ''Utbildningens språk''
,d_alueluokitus.kunta_sv as ''Utbildningens kommun''
,d_alueluokitus.maakunta_sv as ''Utbildningens landskap''
,d_arvokyselykerta.kysely_sv
,d_arvokysymys.kysymysryhma_sv as ''Frågegrupp''
,d_arvokysymys.kysymys_sv as ''Fråga''
,monivalintavaihtoehto_sv as ''Flervalsalternativ''


--englanti
,d_organisaatioluokitus.organisaatio_en as ''Higher education institution''
,d_koulutusluokitus.koulutusluokitus_en as ''Name of education''
,d_kieli.kieli_en as ''Language of education''
,d_alueluokitus.kunta_en as ''Municipality of education''
,d_alueluokitus.maakunta_en as ''Region of education''
,d_arvokyselykerta.kysely_en
,d_arvokysymys.kysymysryhma_en as ''Question group''
,d_arvokysymys.kysymys_en as ''Question''
,monivalintavaihtoehto_en as ''MonivalintavaihtoehtoEN''


--apusarakkeet
,case when d_arvokyselykerta.vuosi < YEAR(GETDATE()) then 1 else 0 end as vuosi_tilasto
,case when kyselypohja = ''URASEURANTA-AMK'' then 1 else 0 end as ura_amk
,case when kyselypohja = ''URASEURANTA-YAMK'' then 1 else 0 end as ura_yamk
,case when kyselypohja = ''URASEURANTA-KANDI'' then 1 else 0 end as ura_kandi
,case when kyselypohja = ''URASEURANTA-MAISTERI'' then 1 else 0 end as ura_maisteri
,case when kyselypohja = ''URASEURANTA-TOHTORI'' then 1 else 0 end as ura_tohtori


--koodit
,d_organisaatioluokitus.organisaatio_koodi as ''Koodit Organisaatio''
,d_koulutusluokitus.koulutusluokitus_koodi as ''Koodit Koulutus''
,d_kieli.kieli_koodi as ''Koodit Koulutuksen kieli''
,d_alueluokitus.kunta_koodi as ''Koodit Koulutuksen kunta''
,d_alueluokitus.maakunta_koodi as ''Koodit Koulutuksen maakunta''


--järjestys
,d7.jarjestys_ikaryhma1 as jarjestys_ika
,d8.jarjestys_sukupuoli_koodi as jarjestys_sukupuoli
,d10.jarjestys_maatjavaltiot2_koodi as jarjestys_kansalaisuus
,d11.jarjestys_maakunta_koodi as jarjestys_asuinmaakunta
,d_arvokysymys.kysymysryhmajarjestys as jarjestys_kysymysryhma
,d_arvokysymys.kysymysjarjestys as jarjestys_kysymys
,jarjestys_okmohjauksenala_koodi as jarjestys_ohjauksenala
,jarjestys_koulutusastetaso1_koodi as jarjestys_koulutusaste1
,jarjestys_koulutusastetaso2_koodi as jarjestys_koulutusaste2
,jarjestys_koulutusalataso1_koodi as jarjestys_koulutusala1
,jarjestys_koulutusalataso2_koodi as jarjestys_koulutusala2
,jarjestys_koulutusalataso3_koodi as jarjestys_koulutusala3
,case when monivalintavaihtoehto_fi is null then 99 else numerovalinta end as jarjestys_monivalinta


FROM dw.f_arvo_uraseuranta AS f
LEFT JOIN dw.d_organisaatioluokitus ON f.d_organisaatio_id=d_organisaatioluokitus.id
LEFT JOIN dw.d_koulutusluokitus ON f.d_koulutusluokitus_id=d_koulutusluokitus.id
LEFT JOIN dw.d_kieli ON f.d_kieli_id=d_kieli.id
LEFT JOIN dw.d_alueluokitus ON f.d_alueluokitus_id=d_alueluokitus.id
LEFT JOIN dw.d_arvokysymys ON f.d_arvokysymys_id=d_arvokysymys.id
LEFT JOIN dw.d_arvokyselykerta ON f.d_arvokyselykerta_id=d_arvokyselykerta.id
LEFT JOIN dw.d_ika d7 ON d7.id=f.d_ika_valmistuessa_id
LEFT JOIN dw.d_sukupuoli d8 ON d8.id=f.d_sukupuoli_id
LEFT JOIN dw.d_kieli d9 ON d9.id=f.d_kieli_aidinkieli_id
LEFT JOIN dw.d_maatjavaltiot2 d10 ON d10.id=f.d_maatjavaltiot_kansalaisuus_id
LEFT JOIN dw.d_alueluokitus d11 ON d11.id=f.d_alueluokitus_asuinkunta_id
where vastaustyyppi<>''vapaateksti'' and kysymysryhmaid not in (''254'',''268'')--pois kysymysryhmät ''VII  Kiitos vastauksistasi!'' ja ''VII  Kiitos paljon vastauksistasi!''




' 
