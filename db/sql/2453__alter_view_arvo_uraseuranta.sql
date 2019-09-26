USE [ANTERO]
GO

/****** Object:  View [dw].[v_arvo_uraseuranta]    Script Date: 26.9.2019 8:46:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dw].[v_arvo_uraseuranta] AS

SELECT

--suomi
----henkilömuuttujat
d7.ika_fi as 'Ikä (valmistuessa)'
,case when d7.ika_fi in ('20','21','22','23','24') then '20–24-vuotiaat' else d7.ikaryhma1_fi end as 'Ikäryhmä (valmistuessa)'
,d8.sukupuoli_fi as 'Sukupuoli'
,d9.kieli_fi as 'Äidinkieli'
,d10.maatjavaltiot2_fi as 'Kansalaisuus'
,d10.maanosa_fi as 'Kansalaisuus (maanosa)'
,d11.kunta_fi as 'Asuinkunta'
,d11.maakunta_fi as 'Asuinmaakunta'
,laajuus as 'Laajuus'
,paaaine as 'Pääaine'
,arvosana as 'Arvosana'
,asteikko as 'Asteikko'
,valintavuosi as 'Valintavuosi'
,valmistumisvuosi as 'Valmistumisvuosi'
,lasnaolo_lukukausia as 'Läsnäolo (lukukausia)'
,kirjoilla_olo_kuukausia as 'Kirjoillaolo (kuukausia)'
----koulutusmuuttujat
,d_koulutusluokitus.koulutusastetaso1_fi as 'Koulutusaste, taso 1'
,d_koulutusluokitus.koulutusastetaso2_fi as 'Koulutusaste, taso 2'
,d_koulutusluokitus.koulutusalataso1_fi as 'Koulutusala, taso 1'
,d_koulutusluokitus.koulutusalataso2_fi as 'Koulutusala, taso 2'
,d_koulutusluokitus.koulutusalataso3_fi as 'Koulutusala, taso 3'
,d_koulutusluokitus.okmohjauksenala_fi as 'OKM ohjauksen ala'
,d_koulutusluokitus.koulutusluokitus_fi as 'Koulutusnimike'
,d_kieli.kieli_fi as 'Koulutuksen kieli'
,d_alueluokitus.kunta_fi as 'Koulutuksen kunta'
,d_alueluokitus.maakunta_fi as 'Koulutuksen maakunta'
----kyselymuuttujat
,d_arvokyselykerta.kysely_fi as 'Kysely'
,d_arvokyselykerta.kyselykerta as 'Kyselykerta'
,f.kysymysryhma as 'Kysymysryhmä'
,f.kysymys as 'Kysymys'
,f.kyselypohja as 'Kyselypohja'
,f.kyselyvuosi as 'Kyselyvuosi'
,case when 
	f.d_arvokysymys_id in (2922, 2924, 2953, 2954, 3058, 3060, 3061, 3079, 3081, 3084, 3085) then 'Kyllä' 
	--when d_arvokysymys.rahoitusmallikysymys = 1 then 'Kyllä' 
	--when d_arvokysymys.rahoitusmallikysymys = 0 then 'Ei' 
	else 'Tieto puuttuu' 
end 
as 'Rahoitusmallikysymys'
,coalesce(monivalintavaihtoehto_fi,case 

--- Muutettu Luokitteluun ---
when vapaateksti=NULL AND Kysymys='6.  Kuinka monen työnantajan palveluksessa olet ollut valmistumisesi jälkeen (ml. nykyinen työnantajasi)?' Then 'Ei vastannut mitään'
when vapaateksti='0' AND Kysymys='6.  Kuinka monen työnantajan palveluksessa olet ollut valmistumisesi jälkeen (ml. nykyinen työnantajasi)?' Then 'Ei yhtään'
when (vapaateksti='1' OR  vapaateksti='1.0') AND Kysymys='6.  Kuinka monen työnantajan palveluksessa olet ollut valmistumisesi jälkeen (ml. nykyinen työnantajasi)?' Then 'Yksi'
when (vapaateksti='2'  OR  vapaateksti='2.0') AND Kysymys='6.  Kuinka monen työnantajan palveluksessa olet ollut valmistumisesi jälkeen (ml. nykyinen työnantajasi)?' Then 'Kaksi'
when (vapaateksti='3'  OR  vapaateksti='3.0') AND Kysymys='6.  Kuinka monen työnantajan palveluksessa olet ollut valmistumisesi jälkeen (ml. nykyinen työnantajasi)?' Then 'Kolme'
when (vapaateksti='4'  OR  vapaateksti='4.0') AND Kysymys='6.  Kuinka monen työnantajan palveluksessa olet ollut valmistumisesi jälkeen (ml. nykyinen työnantajasi)?' Then 'Neljä'
when (vapaateksti<>'0'OR vapaateksti<>'1' OR  vapaateksti<>'1.0' OR vapaateksti<>'2' OR  vapaateksti<>'2.0' OR vapaateksti<>'3' OR  vapaateksti<>'3.0' OR vapaateksti<>'4' OR  vapaateksti<>'4.0') AND Kysymys='6.  Kuinka monen työnantajan palveluksessa olet ollut valmistumisesi jälkeen (ml. nykyinen työnantajasi)?' Then 'Vähintään viisi'

when vapaateksti=NULL AND Kysymys='8.  Jos olet toiminut yrittäjänä, kuinka monessa yrityksessä olet ollut perustajana/osakkaana valmistumisesi jälkeen?' Then 'Ei vastannut mitään'
when vapaateksti='0' AND Kysymys='8.  Jos olet toiminut yrittäjänä, kuinka monessa yrityksessä olet ollut perustajana/osakkaana valmistumisesi jälkeen?' Then 'Ei yhtään'
when vapaateksti='1' AND Kysymys='8.  Jos olet toiminut yrittäjänä, kuinka monessa yrityksessä olet ollut perustajana/osakkaana valmistumisesi jälkeen?' Then 'Yksi'
when vapaateksti='2' AND Kysymys='8.  Jos olet toiminut yrittäjänä, kuinka monessa yrityksessä olet ollut perustajana/osakkaana valmistumisesi jälkeen?' Then 'Kaksi'
when (vapaateksti<>'0'OR vapaateksti<>'1' OR vapaateksti<>'2') AND Kysymys='8.  Jos olet toiminut yrittäjänä, kuinka monessa yrityksessä olet ollut perustajana/osakkaana valmistumisesi jälkeen?' Then 'Vähintään kolme'

when vapaateksti=NULL AND Kysymys='Entä kuinka monta henkilöä yrityksesi ovat yhteensä työllistäneet itsesi lisäksi?' Then 'Ei vastannut mitään'
when vapaateksti='0' AND Kysymys='Entä kuinka monta henkilöä yrityksesi ovat yhteensä työllistäneet itsesi lisäksi?' Then 'Ei yhtään'
when (vapaateksti='1' OR  vapaateksti='1.0' OR vapaateksti='0.5') AND Kysymys='Entä kuinka monta henkilöä yrityksesi ovat yhteensä työllistäneet itsesi lisäksi?' Then 'Yksi'
when (vapaateksti='2' OR  vapaateksti='2.0' OR vapaateksti='1.5') AND Kysymys='Entä kuinka monta henkilöä yrityksesi ovat yhteensä työllistäneet itsesi lisäksi?' Then 'Kaksi'
when (vapaateksti='3'  OR  vapaateksti='3.0') AND Kysymys='Entä kuinka monta henkilöä yrityksesi ovat yhteensä työllistäneet itsesi lisäksi?' Then 'Kolme'
when (vapaateksti='4' OR  vapaateksti='4.0') AND Kysymys='Entä kuinka monta henkilöä yrityksesi ovat yhteensä työllistäneet itsesi lisäksi?' Then 'Neljä'
when (vapaateksti<>'0' OR vapaateksti<>'0.5' OR vapaateksti<>'1' OR vapaateksti<>'1.5' OR  vapaateksti<>'1.0' OR vapaateksti<>'2' OR  vapaateksti<>'2.0' OR vapaateksti<>'3' OR  vapaateksti<>'3.0' OR vapaateksti<>'4' OR  vapaateksti<>'4.0') AND Kysymys='Entä kuinka monta henkilöä yrityksesi ovat yhteensä työllistäneet itsesi lisäksi?' Then 'Vähintään viisi'


When 	Vapaateksti='1'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten pääasiallisinta työtehtävääsi.  Merkitse vain yhden vaihtoehdon numero.'	 then 	'1  tutkimus'
When 	Vapaateksti='10'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten pääasiallisinta työtehtävääsi.  Merkitse vain yhden vaihtoehdon numero.'	 then 	'10  taiteellinen työ'
When 	Vapaateksti='11'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten pääasiallisinta työtehtävääsi.  Merkitse vain yhden vaihtoehdon numero.'	 then 	'11  lainopillinen työ'
When 	Vapaateksti='12'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten pääasiallisinta työtehtävääsi.  Merkitse vain yhden vaihtoehdon numero.'	 then 	'12  kirkollinen työ'
When 	Vapaateksti='13'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten pääasiallisinta työtehtävääsi.  Merkitse vain yhden vaihtoehdon numero.'	 then 	'13  rahoituksen ja taloushallinnon tehtävät'
When 	Vapaateksti='14'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten pääasiallisinta työtehtävääsi.  Merkitse vain yhden vaihtoehdon numero.'	 then 	'14  muu'
When 	Vapaateksti='2'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten pääasiallisinta työtehtävääsi.  Merkitse vain yhden vaihtoehdon numero.'	 then 	'2  opetus tai kasvatus'
When 	Vapaateksti='3'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten pääasiallisinta työtehtävääsi.  Merkitse vain yhden vaihtoehdon numero.'	 then 	'3  johto- ja esimiestehtävät'
When 	Vapaateksti='4'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten pääasiallisinta työtehtävääsi.  Merkitse vain yhden vaihtoehdon numero.'	 then 	'4  konsultointi tai koulutus'
When 	Vapaateksti='5'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten pääasiallisinta työtehtävääsi.  Merkitse vain yhden vaihtoehdon numero.'	 then 	'5  asiakastyö/potilastyö'
When 	Vapaateksti='6'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten pääasiallisinta työtehtävääsi.  Merkitse vain yhden vaihtoehdon numero.'	 then 	'6  markkinointi ja myynti'
When 	Vapaateksti='7'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten pääasiallisinta työtehtävääsi.  Merkitse vain yhden vaihtoehdon numero.'	 then 	'7  suunnittelu-, kehitys- tai hallintotehtävät'
When 	Vapaateksti='8'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten pääasiallisinta työtehtävääsi.  Merkitse vain yhden vaihtoehdon numero.'	 then 	'8  viestintä- ja mediatyö'
When 	Vapaateksti='9'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten pääasiallisinta työtehtävääsi.  Merkitse vain yhden vaihtoehdon numero.'	 then 	'9  toimistotehtävät'
When 	(Vapaateksti='0' OR Vapaateksti='15' OR Vapaateksti=NULL)	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten pääasiallisinta työtehtävääsi.  Merkitse vain yhden vaihtoehdon numero.'	 then 	'Ei vastannut'



when vaihtoehto=1 then 'Kyllä' 
when vaihtoehto=0 then 'Ei' 



end,vapaateksti) as 'Monivalintavaihtoehto'
,numerovalinta
,f.vastaustyyppi
,vaihtoehto
,valtakunnallinen
----organisaatiomuuttujat
,d_organisaatioluokitus.organisaatio_fi as 'Korkeakoulu'

,vastaajaid
,lukumaara


--ruotsi
,d_organisaatioluokitus.organisaatio_sv as 'Högskola'
,d_kieli.kieli_sv as 'Utbildningens språk'
,d_alueluokitus.kunta_sv as 'Utbildningens kommun'
,d_alueluokitus.maakunta_sv as 'Utbildningens landskap'
,d_arvokyselykerta.kysely_sv
,d_arvokysymys.kysymysryhma_sv as 'Frågegrupp'
,d_arvokysymys.kysymys_sv as 'Fråga'
,coalesce(monivalintavaihtoehto_sv,case when vaihtoehto=1 then 'Ja' when vaihtoehto=0 then 'Nej' end) as 'Flervalsalternativ'
,d_koulutusluokitus.koulutusastetaso1_sv as 'Utbildningsnivå, nivå 1'
,d_koulutusluokitus.koulutusastetaso2_sv as 'Utbildningsnivå, nivå 2'
,d_koulutusluokitus.koulutusalataso1_sv as 'Utbildningsområde, nivå 1'
,d_koulutusluokitus.koulutusalataso2_sv as 'Utbildningsområde, nivå 2'
,d_koulutusluokitus.koulutusalataso3_sv as 'Utbildningsområde, nivå 3'
,d_koulutusluokitus.okmohjauksenala_sv as 'UKM-styrningsområde'
,d_koulutusluokitus.koulutusluokitus_sv as 'Utbildningsbenämning'

--englanti
,d_organisaatioluokitus.organisaatio_en as 'Higher education institution'
,d_kieli.kieli_en as 'Language of education'
,d_alueluokitus.kunta_en as 'Municipality of education'
,d_alueluokitus.maakunta_en as 'Region of education'
,d_arvokyselykerta.kysely_en
,d_arvokysymys.kysymysryhma_en as 'Question group'
,d_arvokysymys.kysymys_en as 'Question'
,coalesce(monivalintavaihtoehto_en,case when vaihtoehto=1 then 'Yes' when vaihtoehto=0 then 'No' end) as 'Multiple choice option'
,d_koulutusluokitus.koulutusastetaso1_en as 'Level of education, tier 1'
,d_koulutusluokitus.koulutusastetaso2_en as 'Level of education, tier 2'
,d_koulutusluokitus.koulutusalataso1_en as 'Field of education, tier 1'
,d_koulutusluokitus.koulutusalataso2_en as 'Field of education, tier 2'
,d_koulutusluokitus.koulutusalataso3_en as 'Field of education, tier 3'
,d_koulutusluokitus.okmohjauksenala_en as 'Field of education, HE steering'
,d_koulutusluokitus.koulutusluokitus_en as 'Name of education'


--apusarakkeet
,case when d_arvokyselykerta.vuosi < YEAR(GETDATE()) then 1 else 1 end as vuosi_tilasto --Muutettu 1, jotta raportit toimii
,case when f.kyselypohja = 'URASEURANTA-AMK' then 1 else 0 end as ura_amk
,case when f.kyselypohja = 'URASEURANTA-YAMK' then 1 else 0 end as ura_yamk
,case when f.kyselypohja = 'URASEURANTA-KANDI' then 1 else 0 end as ura_kandi
,case when f.kyselypohja = 'URASEURANTA-MAISTERI' then 1 else 0 end as ura_maisteri
,case when f.kyselypohja = 'URASEURANTA-TOHTORI' then 1 else 0 end as ura_tohtori


--koodit
,d_organisaatioluokitus.organisaatio_koodi as 'Koodit Korkeakoulu'
,d_koulutusluokitus.koulutusluokitus_koodi as 'Koodit Koulutus'
,d_kieli.kieli_koodi as 'Koodit Koulutuksen kieli'
,d_alueluokitus.kunta_koodi as 'Koodit Koulutuksen kunta'
,d_alueluokitus.maakunta_koodi as 'Koodit Koulutuksen maakunta'


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

FROM [ANTERO].dw.f_arvo_yo_uraseuranta AS f
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

where 1=1
--and kysymysryhmaid not in ('254','268') --pois kysymysryhmät 'VII  Kiitos vastauksistasi!' ja 'VII  Kiitos paljon vastauksistasi!'
and f.kysymysryhma not like '%vastauksistasi!%'
and not (kysymysid between 2958 and 2967 and f.kyselypohja='URASEURANTA-MAISTERI')

union all

SELECT  [Ikä (valmistuessa)]
      ,[Ikäryhmä (valmistuessa)]
      ,[Sukupuoli]
      ,[Äidinkieli]
      ,[Kansalaisuus]
      ,[Kansalaisuus (maanosa)]
      ,[Asuinkunta]
     ,[Asuinmaakunta]
     ,[Laajuus]
      ,[Pääaine]
     ,[Arvosana]
      ,[Asteikko]
      ,[Valintavuosi]
      ,[Valmistumisvuosi]
      ,[Läsnäolo (lukukausia)]
     ,[Kirjoillaolo (kuukausia)]
     ,[Koulutusaste, taso 1]
     ,[Koulutusaste, taso 2]
      ,[Koulutusala, taso 1]
      ,[Koulutusala, taso 2]
      ,[Koulutusala, taso 3]
      ,[OKM ohjauksen ala]
      ,[Koulutusnimike]
      ,[Koulutuksen kieli]
      ,[Koulutuksen kunta]
      ,[Koulutuksen maakunta]
      ,[Kysely]
     ,[Kyselykerta]
     ,[Kysymysryhmä]
      ,[Kysymys]
    ,[Kyselypohja]
     ,[Kyselyvuosi]
      ,[Rahoitusmallikysymys]
      ,[Monivalintavaihtoehto]
      ,[numerovalinta]
      ,[vastaustyyppi]
      ,[vaihtoehto]
      ,[valtakunnallinen]
     ,[Korkeakoulu]
     ,[vastaajaid]
      ,[lukumaara]
      ,[Högskola]
      ,[Utbildningens språk]
      ,[Utbildningens kommun]
      ,[Utbildningens landskap]
      ,[kysely_sv]
      ,[Frågegrupp]
      ,[Fråga]
     ,[Flervalsalternativ]
      ,[Utbildningsnivå, nivå 1]
      ,[Utbildningsnivå, nivå 2]
      ,[Utbildningsområde, nivå 1]
      ,[Utbildningsområde, nivå 2]
      ,[Utbildningsområde, nivå 3]
      ,[UKM-styrningsområde]
      ,[Utbildningsbenämning]
     ,[Higher education institution]
      ,[Language of education]
      ,[Municipality of education]
      ,[Region of education]
      ,[kysely_en]
      ,[Question group]
      ,[Question]
      ,[Multiple choice option]
      ,[Level of education, tier 1]
      ,[Level of education, tier 2]
      ,[Field of education, tier 1]
      ,[Field of education, tier 2]
      ,[Field of education, tier 3]
      ,[Field of education, HE steering]
      ,[Name of education]
      ,[vuosi_tilasto]
      ,[ura_amk]
      ,[ura_yamk]
      ,[ura_kandi]
      ,[ura_maisteri]
     ,[ura_tohtori]
     ,[Koodit Korkeakoulu]
      ,[Koodit Koulutus]
      ,[Koodit Koulutuksen kieli]
      ,[Koodit Koulutuksen kunta]
      ,[Koodit Koulutuksen maakunta]
      ,[jarjestys_ika]
      ,[jarjestys_sukupuoli]
      ,[jarjestys_kansalaisuus]
      ,[jarjestys_asuinmaakunta]
      ,[jarjestys_kysymysryhma]
      ,[jarjestys_kysymys]
      ,[jarjestys_ohjauksenala]
      ,[jarjestys_koulutusaste1]
      ,[jarjestys_koulutusaste2]
      ,[jarjestys_koulutusala1]
      ,[jarjestys_koulutusala2]
      ,[jarjestys_koulutusala3]
      ,[jarjestys_monivalinta]
FROM [ANTERO].dw.f_arvo_yo_uraseuranta_2018



