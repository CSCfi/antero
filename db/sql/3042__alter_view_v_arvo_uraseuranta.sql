USE [ANTERO]
GO

/****** Object:  View [dw].[v_arvo_uraseuranta]    Script Date: 6.5.2020 8:56:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dw].[v_arvo_uraseuranta] AS

SELECT-- TOP 0
f.kysymysid
----henkilömuuttujat
, d7.ika_fi											AS 'Ikä (valmistuessa)'

,CASE WHEN d7.ika_fi in ('20','21','22','23','24') 
THEN '20–24-vuotiaat' ELSE d7.ikaryhma1_fi END		AS 'Ikäryhmä (valmistuessa)'

,d8.sukupuoli_fi									AS 'Sukupuoli'
,d9.kieli_fi										AS 'Äidinkieli'
,d10.maatjavaltiot2_fi								AS 'Kansalaisuus'
,d10.maanosa_fi										AS 'Kansalaisuus (maanosa)'
,d11.kunta_fi										AS 'Asuinkunta'
,d11.maakunta_fi									AS 'Asuinmaakunta'
,laajuus											AS 'Laajuus'
,paaaine											AS 'Pääaine'
,arvosana											AS 'Arvosana'
,asteikko											AS 'Asteikko'
,valintavuosi										AS 'Valintavuosi'
,valmistumisvuosi									AS 'Valmistumisvuosi'
,lasnaolo_lukukausia								AS 'Läsnäolo (lukukausia)'
,kirjoilla_olo_kuukausia							AS 'Kirjoillaolo (kuukausia)'
----koulutusmuuttujat
,d_koulutusluokitus.koulutusastetaso1_fi			AS 'Koulutusaste, taso 1'
,d_koulutusluokitus.koulutusastetaso2_fi			AS 'Koulutusaste, taso 2'
,d_koulutusluokitus.koulutusalataso1_fi				AS 'Koulutusala, taso 1'
,d_koulutusluokitus.koulutusalataso2_fi				AS 'Koulutusala, taso 2'
,d_koulutusluokitus.koulutusalataso3_fi				AS 'Koulutusala, taso 3'
,d_koulutusluokitus.okmohjauksenala_fi				AS 'OKM ohjauksen ala'
,d_koulutusluokitus.koulutusluokitus_fi				AS 'Koulutusnimike'
,d_kieli.kieli_fi									AS 'Koulutuksen kieli'
,d_alueluokitus.kunta_fi							AS 'Koulutuksen kunta'
,d_alueluokitus.maakunta_fi							AS 'Koulutuksen maakunta'
----kyselymuuttujat
,d_arvokyselykerta.kysely_fi						AS 'Kysely'
,d_arvokyselykerta.kyselykerta						AS 'Kyselykerta'
,f.kysymysryhma										AS 'Kysymysryhmä'
,f.kysymys											AS 'Kysymys'
,f.kyselypohja										AS 'Kyselypohja'
,f.kyselyvuosi										AS 'Kyselyvuosi'
,f.kyselyvuosi										AS 'Tilastovuosi'


,CASE WHEN 	f.kysymysid in (2922, 2924, 2953, 2954, 3060, 3061, 3079, 3081, 3084, 3085) 
		THEN 'Kyllä' 
		ELSE 'Ei' END								AS 'Rahoitusmallikysymys'
,CASE WHEN 	f.kysymysid in (2922, 2924, 2953, 2954, 3060, 3061, 3079, 3081, 3084, 3085) 
		THEN 'Ja' 
		ELSE 'Nej' END								AS 'Finansieringsmodellfråga'
,CASE WHEN 	f.kysymysid in (2922, 2924, 2953, 2954, 3060, 3061, 3079, 3081, 3084, 3085) 
		THEN 'Yes' 
		ELSE 'No' END								AS 'Funding modell question'

,CASE WHEN f.kysymysryhma = 'VI  TYÖ JA OSAAMINEN (3/3)' 
		THEN 1 / 6.0 ELSE 1.0 END					AS rahoituskysymys_paino

,LOWER(coalesce(monivalintavaihtoehto_fi,CASE 

--- Muutettu Luokitteluun ---
WHEN (vapaateksti is null or vapaateksti='.') AND Kysymys='6.  Kuinka monen työnantajan palveluksessa olet ollut valmistumisesi jälkeen (ml. nykyinen työnantajasi)?'	THEN 'Ei vastannut mitään'
WHEN vapaateksti='0' AND Kysymys='6.  Kuinka monen työnantajan palveluksessa olet ollut valmistumisesi jälkeen (ml. nykyinen työnantajasi)?'							THEN 'Ei yhtään'
WHEN (vapaateksti='1' OR  vapaateksti='1.0') AND Kysymys='6.  Kuinka monen työnantajan palveluksessa olet ollut valmistumisesi jälkeen (ml. nykyinen työnantajasi)?'	THEN 'Yksi'
WHEN (vapaateksti='2'  OR  vapaateksti='2.0') AND Kysymys='6.  Kuinka monen työnantajan palveluksessa olet ollut valmistumisesi jälkeen (ml. nykyinen työnantajasi)?'	THEN 'Kaksi'
WHEN (vapaateksti='3'  OR  vapaateksti='3.0') AND Kysymys='6.  Kuinka monen työnantajan palveluksessa olet ollut valmistumisesi jälkeen (ml. nykyinen työnantajasi)?'	THEN 'Kolme'
WHEN (vapaateksti='4'  OR  vapaateksti='4.0') AND Kysymys='6.  Kuinka monen työnantajan palveluksessa olet ollut valmistumisesi jälkeen (ml. nykyinen työnantajasi)?'	THEN 'Neljä'
WHEN (vapaateksti<>'0'OR vapaateksti<>'1' OR  vapaateksti<>'1.0' OR vapaateksti<>'2' OR  vapaateksti<>'2.0' OR vapaateksti<>'3' OR  vapaateksti<>'3.0' OR vapaateksti<>'4' OR  vapaateksti<>'4.0') AND Kysymys='6.  Kuinka monen työnantajan palveluksessa olet ollut valmistumisesi jälkeen (ml. nykyinen työnantajasi)?' THEN 'Vähintään viisi'

WHEN (vapaateksti is null or vapaateksti='.') AND Kysymys='8.  Jos olet toiminut yrittäjänä, kuinka monessa yrityksessä olet ollut perustajana/osakkaana valmistumisesi jälkeen?' THEN 'Ei vastannut mitään'
WHEN vapaateksti='0' AND Kysymys='8.  Jos olet toiminut yrittäjänä, kuinka monessa yrityksessä olet ollut perustajana/osakkaana valmistumisesi jälkeen?' THEN 'Ei yhtään'
WHEN vapaateksti='1' AND Kysymys='8.  Jos olet toiminut yrittäjänä, kuinka monessa yrityksessä olet ollut perustajana/osakkaana valmistumisesi jälkeen?' THEN 'Yksi'
WHEN vapaateksti='2' AND Kysymys='8.  Jos olet toiminut yrittäjänä, kuinka monessa yrityksessä olet ollut perustajana/osakkaana valmistumisesi jälkeen?' THEN 'Kaksi'
WHEN (vapaateksti<>'0'OR vapaateksti<>'1' OR vapaateksti<>'2') AND Kysymys='8.  Jos olet toiminut yrittäjänä, kuinka monessa yrityksessä olet ollut perustajana/osakkaana valmistumisesi jälkeen?' THEN 'Vähintään kolme'

WHEN (vapaateksti is null or vapaateksti='.') AND Kysymys='Entä kuinka monta henkilöä yrityksesi ovat yhteensä työllistäneet itsesi lisäksi?' THEN 'Ei vastannut mitään'
WHEN vapaateksti='0' AND Kysymys='Entä kuinka monta henkilöä yrityksesi ovat yhteensä työllistäneet itsesi lisäksi?' THEN 'Ei yhtään'
WHEN (vapaateksti='1' OR  vapaateksti='1.0' OR vapaateksti='0.5') AND Kysymys='Entä kuinka monta henkilöä yrityksesi ovat yhteensä työllistäneet itsesi lisäksi?' THEN 'Yksi'
WHEN (vapaateksti='2' OR  vapaateksti='2.0' OR vapaateksti='1.5') AND Kysymys='Entä kuinka monta henkilöä yrityksesi ovat yhteensä työllistäneet itsesi lisäksi?' THEN 'Kaksi'
WHEN (vapaateksti='3'  OR  vapaateksti='3.0') AND Kysymys='Entä kuinka monta henkilöä yrityksesi ovat yhteensä työllistäneet itsesi lisäksi?' THEN 'Kolme'
WHEN (vapaateksti='4' OR  vapaateksti='4.0') AND Kysymys='Entä kuinka monta henkilöä yrityksesi ovat yhteensä työllistäneet itsesi lisäksi?' THEN 'Neljä'
WHEN (vapaateksti<>'0' OR vapaateksti<>'0.5' OR vapaateksti<>'1' OR vapaateksti<>'1.5' OR  vapaateksti<>'1.0' OR vapaateksti<>'2' OR  vapaateksti<>'2.0' OR vapaateksti<>'3' OR  vapaateksti<>'3.0' OR vapaateksti<>'4' OR  vapaateksti<>'4.0') AND Kysymys='Entä kuinka monta henkilöä yrityksesi ovat yhteensä työllistäneet itsesi lisäksi?' THEN 'Vähintään viisi'


WHEN 	Vapaateksti='1'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten pääasiallisinta työtehtävääsi.  Merkitse vain yhden vaihtoehdon numero.'	 THEN 	'1  tutkimus'
WHEN 	Vapaateksti='10'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten pääasiallisinta työtehtävääsi.  Merkitse vain yhden vaihtoehdon numero.'	 THEN 	'10  taiteellinen työ'
WHEN 	Vapaateksti='11'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten pääasiallisinta työtehtävääsi.  Merkitse vain yhden vaihtoehdon numero.'	 THEN 	'11  lainopillinen työ'
WHEN 	Vapaateksti='12'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten pääasiallisinta työtehtävääsi.  Merkitse vain yhden vaihtoehdon numero.'	 THEN 	'12  kirkollinen työ'
WHEN 	Vapaateksti='13'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten pääasiallisinta työtehtävääsi.  Merkitse vain yhden vaihtoehdon numero.'	 THEN 	'13  rahoituksen ja taloushallinnon tehtävät'
WHEN 	Vapaateksti='14'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten pääasiallisinta työtehtävääsi.  Merkitse vain yhden vaihtoehdon numero.'	 THEN 	'14  muu'
WHEN 	Vapaateksti='2'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten pääasiallisinta työtehtävääsi.  Merkitse vain yhden vaihtoehdon numero.'	 THEN 	'2  opetus tai kasvatus'
WHEN 	Vapaateksti='3'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten pääasiallisinta työtehtävääsi.  Merkitse vain yhden vaihtoehdon numero.'	 THEN 	'3  johto- ja esimiestehtävät'
WHEN 	Vapaateksti='4'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten pääasiallisinta työtehtävääsi.  Merkitse vain yhden vaihtoehdon numero.'	 THEN 	'4  konsultointi tai koulutus'
WHEN 	Vapaateksti='5'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten pääasiallisinta työtehtävääsi.  Merkitse vain yhden vaihtoehdon numero.'	 THEN 	'5  asiakastyö/potilastyö'
WHEN 	Vapaateksti='6'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten pääasiallisinta työtehtävääsi.  Merkitse vain yhden vaihtoehdon numero.'	 THEN 	'6  markkinointi ja myynti'
WHEN 	Vapaateksti='7'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten pääasiallisinta työtehtävääsi.  Merkitse vain yhden vaihtoehdon numero.'	 THEN 	'7  suunnittelu-, kehitys- tai hallintotehtävät'
WHEN 	Vapaateksti='8'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten pääasiallisinta työtehtävääsi.  Merkitse vain yhden vaihtoehdon numero.'	 THEN 	'8  viestintä- ja mediatyö'
WHEN 	Vapaateksti='9'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten pääasiallisinta työtehtävääsi.  Merkitse vain yhden vaihtoehdon numero.'	 THEN 	'9  toimistotehtävät'
WHEN 	(Vapaateksti='0' OR Vapaateksti='15' OR Vapaateksti=NULL)	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten pääasiallisinta työtehtävääsi.  Merkitse vain yhden vaihtoehdon numero.'	 THEN 	'Ei vastannut'

WHEN vaihtoehto=1 THEN 'Kyllä' 
when vaihtoehto=0 THEN 'Ei' 

WHEN f.kysymysryhma in ('VI  TYÖ JA OSAAMINEN (2/3)','VI  TYÖ JA OSAAMINEN (3/3)') and numerovalinta=1 THEN '1 = Ei lainkaan'
WHEN f.kysymysryhma in ('VI  TYÖ JA OSAAMINEN (2/3)','VI  TYÖ JA OSAAMINEN (3/3)') and numerovalinta=2 THEN '2 = Vain vähän'
WHEN f.kysymysryhma in ('VI  TYÖ JA OSAAMINEN (2/3)','VI  TYÖ JA OSAAMINEN (3/3)') and numerovalinta=3 THEN '3 = Jonkin verran'
WHEN f.kysymysryhma in ('VI  TYÖ JA OSAAMINEN (2/3)','VI  TYÖ JA OSAAMINEN (3/3)') and numerovalinta=4 THEN '4 = Melko paljon'
WHEN f.kysymysryhma in ('VI  TYÖ JA OSAAMINEN (2/3)','VI  TYÖ JA OSAAMINEN (3/3)') and numerovalinta=5 THEN '5 = Paljon'
WHEN f.kysymysryhma in ('VI  TYÖ JA OSAAMINEN (2/3)','VI  TYÖ JA OSAAMINEN (3/3)') and numerovalinta=6 THEN '6 = Erittäin paljon'

--TOHTORIKYSYMYKSET
		WHEN (f.kysymysid =3108 and vapaateksti in ('1','1.0'))			THEN '1 - Suomen Akatemian/opetus- ja kulttuuriministeriön rahoittaman paikallisen tutkijakoulutuspaikan kautta'
		WHEN (f.kysymysid =3108 and vapaateksti in('2','2.0'))			THEN '2 - muun paikallisen tutkijakoulutuspaikan kautta'
		WHEN (f.kysymysid =3108 and vapaateksti in('3','3.0','3.'))		THEN '3 - tutkimus- ja/tai opetustehtävissä yliopistolla' 
		WHEN (f.kysymysid =3108 and vapaateksti='4')					THEN '4 - muu työsuhde yliopistolla'
		WHEN (f.kysymysid =3108 and vapaateksti in ('5','5.0'))			THEN '5 - tutkimus- ja/tai opetustehtävissä ammattikorkeakoulussa tai muussa tutkimuslaitoksessa kuin yliopistossa'
		WHEN (f.kysymysid =3108 and vapaateksti in ('6','6.0','6.'))	THEN '6 - ansiotyössä yliopiston ulkopuolella'
		WHEN (f.kysymysid =3108 and vapaateksti in ('7','7.0'))			THEN '7 - rahoitus Akatemian projektin kautta'
		WHEN (f.kysymysid =3108 and vapaateksti in ('8','8.0','8.'))	THEN '8 - rahoitus muun kuin Akatemian projektin kautta'
		WHEN (f.kysymysid =3108 and vapaateksti in ('9','9.0','9.'))	THEN '9 - henkilökohtainen apuraha'
		WHEN (f.kysymysid =3108 and vapaateksti in ('10','10.0'))		THEN '10 - opintotuki'
		WHEN (f.kysymysid =3108 and vapaateksti in ('11','11.0'))		THEN '11 - muu rahoituslähde'

		WHEN (f.kysymysid in(3208,3209) and vapaateksti in ('1','1.0', '1.'))	THEN '1 = vakituinen kokopäivätyö'
		WHEN (f.kysymysid in(3208,3209) and vapaateksti in('2','2.0', '2.'))	THEN '2 = määräaikainen kokopäivätyö'
		WHEN (f.kysymysid in(3208,3209) and vapaateksti in('3','3.0','3.'))		THEN '3 = vakituinen osa-aikatyö' 
		WHEN (f.kysymysid in(3208,3209) and vapaateksti in ('4','4.0'))			THEN '4 = määräaikainen osa-aikatyö'
		WHEN (f.kysymysid in(3208,3209) and vapaateksti in ('5','5.0'))			THEN '5 = itsenäinen yrittäjä, ammatinharjoittaja tai freelancer'
		WHEN (f.kysymysid in(3208,3209) and vapaateksti in ('6','6.0','6.'))	THEN '6 = apurahatutkija tai apurahataiteilija'
		WHEN (f.kysymysid in(3208,3209) and vapaateksti in ('7','7.0'))			THEN '7 = työllistetty tai työharjoittelija'
		WHEN (f.kysymysid in(3208,3209) and vapaateksti in ('8','8.0','8.'))	THEN '8 = työtön työnhakija'
		WHEN (f.kysymysid in(3208,3209) and vapaateksti in ('9','9.0','9.2'))	THEN '9 = työvoimakoulutus tai vastaava'
		WHEN (f.kysymysid in(3208,3209) and vapaateksti in ('10','10.0'))		THEN '10 = päätoiminen opiskelu (johtaa tutkintoon tai arvosanaan)'
		WHEN (f.kysymysid in(3208,3209) and vapaateksti in ('11','11.0'))		THEN '11 = perhevapaa(ei työsuhdetta)'
		WHEN (f.kysymysid in(3208,3209) and vapaateksti in ('12','12.0'))		THEN '12 = perhevapaalla(ei työsuhdetta)'
		WHEN (f.kysymysid in(3208,3209) and vapaateksti in ('13','13.0'))		THEN '13 = muu'

		WHEN f.kysymysid in (3087,3088,3089,3090,3091,3092,3093,3094,3095,3096,3097,3098,3099,3100) and numerovalinta=1 THEN '1 =  ei lainkaan'
		WHEN f.kysymysid in (3087,3088,3089,3090,3091,3092,3093,3094,3095,3096,3097,3098,3099,3100) and numerovalinta=2 THEN '2 =  vain vähän'
		WHEN f.kysymysid in (3087,3088,3089,3090,3091,3092,3093,3094,3095,3096,3097,3098,3099,3100) and numerovalinta=3 THEN '3 =  vähän'
		WHEN f.kysymysid in (3087,3088,3089,3090,3091,3092,3093,3094,3095,3096,3097,3098,3099,3100) and numerovalinta=4 THEN '4 =  jonkun verran'
		WHEN f.kysymysid in (3087,3088,3089,3090,3091,3092,3093,3094,3095,3096,3097,3098,3099,3100) and numerovalinta=5 THEN '5 =  paljon'
		WHEN f.kysymysid in (3087,3088,3089,3090,3091,3092,3093,3094,3095,3096,3097,3098,3099,3100) and numerovalinta=6 THEN '6 =  erittäin paljon'

		WHEN f.kysymysid in (3124,3125,3126,3127,3128,3129,3130,3131,3132) and numerovalinta=1 THEN '1 = ei lainkaan'
		WHEN f.kysymysid in (3124,3125,3126,3127,3128,3129,3130,3131,3132) and numerovalinta=2 THEN '2 = vain vähän'
		WHEN f.kysymysid in (3124,3125,3126,3127,3128,3129,3130,3131,3132) and numerovalinta=3 THEN '3 = vähän'
		WHEN f.kysymysid in (3124,3125,3126,3127,3128,3129,3130,3131,3132) and numerovalinta=4 THEN '4 = jonkin verran'
		WHEN f.kysymysid in (3124,3125,3126,3127,3128,3129,3130,3131,3132) and numerovalinta=5 THEN '5 = paljon'
		WHEN f.kysymysid in (3124,3125,3126,3127,3128,3129,3130,3131,3132) and numerovalinta=6 THEN '6 = erittäin paljon'

		WHEN (f.kysymysid = 3143 and vapaateksti='1')		THEN '1 tutkimus'
		WHEN (f.kysymysid = 3143 and vapaateksti='2')		THEN '2 opetus ja kasvatus'
		WHEN (f.kysymysid = 3143 and vapaateksti='3')		THEN '3 hallintotehtävät'
		WHEN (f.kysymysid = 3143 and vapaateksti='4')		THEN '4 johto- ja esimiestehtävät'
		WHEN (f.kysymysid = 3143 and vapaateksti='5')		THEN '5 konsultointi ja koulutus'
		WHEN (f.kysymysid = 3143 and vapaateksti='6')		THEN '6 asiakastyö/potilastyö'
		WHEN (f.kysymysid = 3143 and vapaateksti='7')		THEN '7 markkinointi ja myynti'
		WHEN (f.kysymysid = 3143 and vapaateksti='8')		THEN '8 suunnittelu ja kehitystehtävät'
		WHEN (f.kysymysid = 3143 and vapaateksti='9')		THEN '9 viestintä- ja mediatyö'
		WHEN (f.kysymysid = 3143 and vapaateksti='10')		THEN '10 toimistotehtävät'
		WHEN (f.kysymysid = 3143 and vapaateksti='11')		THEN '11 taiteellinen työ'
		WHEN (f.kysymysid = 3143 and vapaateksti='12')		THEN '12 lainopillinen työ'
		WHEN (f.kysymysid = 3143 and vapaateksti='13')		THEN '13 kirkollinen työ'
		WHEN (f.kysymysid = 3143 and vapaateksti='14')		THEN '14 rahoituksen ja taloushallinnon tehtävät'
		WHEN (f.kysymysid = 3143 and vapaateksti='15')		THEN '15 muu'

		WHEN f.kysymysid in (3144,3145,3146,3147,3148,3149,3150) and numerovalinta = 1 THEN '1 = ei lainkaan'
		WHEN f.kysymysid in (3144,3145,3146,3147,3148,3149,3150) and numerovalinta = 2 THEN '2 = vain vähän'
		WHEN f.kysymysid in (3144,3145,3146,3147,3148,3149,3150) and numerovalinta = 3 THEN '3 = vähän'
		WHEN f.kysymysid in (3144,3145,3146,3147,3148,3149,3150) and numerovalinta = 4 THEN '4 = jonkin verran'
		WHEN f.kysymysid in (3144,3145,3146,3147,3148,3149,3150) and numerovalinta = 5 THEN '5 = paljon'
		WHEN f.kysymysid in (3144,3145,3146,3147,3148,3149,3150) and numerovalinta = 6 THEN '6 = erittäin paljon'

		WHEN f.kysymysid in (3160,3161,3162,3163,3164,3165,3166,3167,3168,3169,3170,3171,3172,3173,3174,3175,3176) and numerovalinta=1 THEN '1 = ei lainkaan'
		WHEN f.kysymysid in (3160,3161,3162,3163,3164,3165,3166,3167,3168,3169,3170,3171,3172,3173,3174,3175,3176) and numerovalinta=2 THEN '2 = vain vähän'
		WHEN f.kysymysid in (3160,3161,3162,3163,3164,3165,3166,3167,3168,3169,3170,3171,3172,3173,3174,3175,3176) and numerovalinta=3 THEN '3 = vähän'
		WHEN f.kysymysid in (3160,3161,3162,3163,3164,3165,3166,3167,3168,3169,3170,3171,3172,3173,3174,3175,3176) and numerovalinta=4 THEN '4 = jonkin verran'
		WHEN f.kysymysid in (3160,3161,3162,3163,3164,3165,3166,3167,3168,3169,3170,3171,3172,3173,3174,3175,3176) and numerovalinta=5 THEN '5 = paljon'
		WHEN f.kysymysid in (3160,3161,3162,3163,3164,3165,3166,3167,3168,3169,3170,3171,3172,3173,3174,3175,3176) and numerovalinta=6 THEN '6 = erittäin paljon'


ELSE  convert(VARCHAR(3),numerovalinta) 

END,vapaateksti)) AS 'Monivalintavaihtoehto'

,CASE		--kysymykset joissa skaala 0-5 korotetaan skaalaan 1-6/tileinon
			WHEN f.kysymysid in (2922,2924,2953,2954,2914,2919,2920,2921,2923,2926,2929,2940,2942,2944,2946,2952,2955,2958,2959,2960,2961,
								2962,2963,2964,2965,2966,2967,3103,3104,3106,3109,3137,3141,3152,3153,3154,3156,3157,3158,
								3178,3179,3180,3181,3182,3186,3199,3200,3201,3202,3203,3204,3206)  
			THEN numerovalinta+1 ELSE numerovalinta END												AS 'numerovalinta'

,CASE	
			WHEN f.kysymysryhma in ('II  TYYTYVÄISYYS TUTKINTOON','V  TYÖLLISTYMISEN LAATU') 
			THEN 'arvosana6' ELSE f.vastaustyyppi  END												AS 'vastaustyyppi'


,vaihtoehto
,valtakunnallinen
----organisaatiomuuttujat
,d_organisaatioluokitus.organisaatio_fi AS 'Korkeakoulu'

,vastaajaid
,lukumaara

--RUOTSI
, f.kyselyvuosi							AS 'Enkätår'
,CASE WHEN d7.ika_fi in ('20','21','22','23','24') 
THEN '20–24 år' ELSE d7.ikaryhma1_sv END as 'Åldersgrupp'
,d8.sukupuoli_sv as 'Kön'
,d9.kieli_sv as 'Modersmål'
,d_organisaatioluokitus.organisaatio_sv AS 'Högskola'
,d_kieli.kieli_sv						AS 'Utbildningens språk'
,d_alueluokitus.kunta_sv				AS 'Utbildningens kommun'
,d_alueluokitus.maakunta_sv				AS 'Utbildningens landskap'
,d_arvokyselykerta.kysely_sv
,d_arvokysymys.kysymysryhma_sv			AS 'Frågegrupp'
,d_arvokysymys.kysymys_sv				AS 'Fråga'

--,coalesce(monivalintavaihtoehto_sv,case when vaihtoehto=1 then 'Ja' when vaihtoehto=0 then 'Nej' end) as 'Flervalsalternativ'
,LOWER(coalesce(monivalintavaihtoehto_en,CASE 
WHEN f.kysymysryhma in ('VI  TYÖ JA OSAAMINEN (2/3)','VI  TYÖ JA OSAAMINEN (3/3)') and numerovalinta=1 THEN '1 = Inte alls'
WHEN f.kysymysryhma in ('VI  TYÖ JA OSAAMINEN (2/3)','VI  TYÖ JA OSAAMINEN (3/3)') and numerovalinta=2 THEN '2 = Bara lite'
WHEN f.kysymysryhma in ('VI  TYÖ JA OSAAMINEN (2/3)','VI  TYÖ JA OSAAMINEN (3/3)') and numerovalinta=3 THEN '3 = Några'
WHEN f.kysymysryhma in ('VI  TYÖ JA OSAAMINEN (2/3)','VI  TYÖ JA OSAAMINEN (3/3)') and numerovalinta=4 THEN '4 = Ganska mycket'
WHEN f.kysymysryhma in ('VI  TYÖ JA OSAAMINEN (2/3)','VI  TYÖ JA OSAAMINEN (3/3)') and numerovalinta=5 THEN '5 = Mycket'
WHEN f.kysymysryhma in ('VI  TYÖ JA OSAAMINEN (2/3)','VI  TYÖ JA OSAAMINEN (3/3)') and numerovalinta=6 THEN '6 = Verkligen mycket'
ELSE  convert(VARCHAR(3),numerovalinta) 

END,vapaateksti)) AS  'Flervalsalternativ'


,d_koulutusluokitus.koulutusastetaso1_sv	AS 'Utbildningsnivå, nivå 1'
,d_koulutusluokitus.koulutusastetaso2_sv	AS 'Utbildningsnivå, nivå 2'
,d_koulutusluokitus.koulutusalataso1_sv		AS 'Utbildningsområde, nivå 1'
,d_koulutusluokitus.koulutusalataso2_sv		AS 'Utbildningsområde, nivå 2'
,d_koulutusluokitus.koulutusalataso3_sv		AS 'Utbildningsområde, nivå 3'
,d_koulutusluokitus.okmohjauksenala_sv		AS 'UKM-styrningsområde'
,d_koulutusluokitus.koulutusluokitus_sv		AS 'Utbildningsbenämning'

--ENGLANTI
,f.kyselyvuosi								AS 'Survey year'
,CASE WHEN d7.ika_fi in ('20','21','22','23','24') 
THEN 'Aged 20–24' ELSE d7.ikaryhma1_en END as 'Age group'
,d8.sukupuoli_en								as 'Gender'
,d9.kieli_en								as 'Native language'
,d_organisaatioluokitus.organisaatio_en		AS 'Higher education institution'
,d_kieli.kieli_en							AS 'Language of education'
,d_alueluokitus.kunta_en					AS 'Municipality of education'
,d_alueluokitus.maakunta_en					AS 'Region of education'
,d_arvokyselykerta.kysely_en
,d_arvokysymys.kysymysryhma_en				AS 'Question group'
,d_arvokysymys.kysymys_en					AS 'Question'

--,coalesce(monivalintavaihtoehto_en,CASE WHEN vaihtoehto=1 THEN 'Yes' WHEN vaihtoehto=0 THEN 'No' END) AS 'Multiple choice option'
,LOWER(coalesce(monivalintavaihtoehto_en,CASE 
WHEN f.kysymysryhma in ('VI  TYÖ JA OSAAMINEN (2/3)','VI  TYÖ JA OSAAMINEN (3/3)') and numerovalinta=1 THEN '1 = Not at all'
WHEN f.kysymysryhma in ('VI  TYÖ JA OSAAMINEN (2/3)','VI  TYÖ JA OSAAMINEN (3/3)') and numerovalinta=2 THEN '2 = Just a little'
WHEN f.kysymysryhma in ('VI  TYÖ JA OSAAMINEN (2/3)','VI  TYÖ JA OSAAMINEN (3/3)') and numerovalinta=3 THEN '3 = Some'
WHEN f.kysymysryhma in ('VI  TYÖ JA OSAAMINEN (2/3)','VI  TYÖ JA OSAAMINEN (3/3)') and numerovalinta=4 THEN '4 = Quite a lot'
WHEN f.kysymysryhma in ('VI  TYÖ JA OSAAMINEN (2/3)','VI  TYÖ JA OSAAMINEN (3/3)') and numerovalinta=5 THEN '5 = A lot'
WHEN f.kysymysryhma in ('VI  TYÖ JA OSAAMINEN (2/3)','VI  TYÖ JA OSAAMINEN (3/3)') and numerovalinta=6 THEN '6 = Very much'
ELSE  convert(VARCHAR(3),numerovalinta) 

END,vapaateksti)) AS 'Multiple choice option'


,d_koulutusluokitus.koulutusastetaso1_en	AS 'Level of education, tier 1'
,d_koulutusluokitus.koulutusastetaso2_en	AS 'Level of education, tier 2'
,d_koulutusluokitus.koulutusalataso1_en		AS 'Field of education, tier 1'
,d_koulutusluokitus.koulutusalataso2_en		AS 'Field of education, tier 2'
,d_koulutusluokitus.koulutusalataso3_en		AS 'Field of education, tier 3'
,d_koulutusluokitus.okmohjauksenala_en		AS 'Field of education, HE steering'
,d_koulutusluokitus.koulutusluokitus_en		AS 'Name of education'


--Apusarakkeet
,CASE WHEN d_arvokyselykerta.vuosi < YEAR(GETDATE())	THEN 1 ELSE 1 END	AS vuosi_tilasto --Muutettu 1, jotta raportit toimii
,CASE WHEN f.kyselypohja = 'URASEURANTA-AMK'			THEN 1 ELSE 0 END	AS ura_amk
,CASE WHEN f.kyselypohja = 'URASEURANTA-YAMK'			THEN 1 ELSE 0 END	AS ura_yamk
,CASE WHEN f.kyselypohja = 'URASEURANTA-KANDI'			THEN 1 ELSE 0 END	AS ura_kandi
,CASE WHEN f.kyselypohja = 'URASEURANTA-MAISTERI'		THEN 1 ELSE 0 END	AS ura_maisteri
,CASE WHEN f.kyselypohja = 'URASEURANTA-TOHTORI'		THEN 1 ELSE 0 END	AS ura_tohtori

--Koodit
,d_organisaatioluokitus.organisaatio_koodi	AS 'Koodit Korkeakoulu'
,d_koulutusluokitus.koulutusluokitus_koodi	AS 'Koodit Koulutus'
,d_kieli.kieli_koodi						AS 'Koodit Koulutuksen kieli'
,d_alueluokitus.kunta_koodi					AS 'Koodit Koulutuksen kunta'
,d_alueluokitus.maakunta_koodi				AS 'Koodit Koulutuksen maakunta'

--Järjestys
,d7.jarjestys_ikaryhma1				AS jarjestys_ika
,d8.jarjestys_sukupuoli_koodi		AS jarjestys_sukupuoli
,d10.jarjestys_maatjavaltiot2_koodi AS jarjestys_kansalaisuus
,d11.jarjestys_maakunta_koodi		AS jarjestys_asuinmaakunta
,CASE	WHEN kyselyvuosi=2017 
		THEN (d_arvokysymys.kysymysryhmajarjestys+1) 
		ELSE d_arvokysymys.kysymysryhmajarjestys  
		END							AS jarjestys_kysymysryhma
,d_arvokysymys.kysymysjarjestys		AS jarjestys_kysymys
,jarjestys_okmohjauksenala_koodi	AS jarjestys_ohjauksenala
,jarjestys_koulutusastetaso1_koodi	AS jarjestys_koulutusaste1
,jarjestys_koulutusastetaso2_koodi	AS jarjestys_koulutusaste2
,jarjestys_koulutusalataso1_koodi	AS jarjestys_koulutusala1
,jarjestys_koulutusalataso2_koodi	AS jarjestys_koulutusala2
,jarjestys_koulutusalataso3_koodi	AS jarjestys_koulutusala3

,convert(int,	case when f.kysymysid in (2942,2946)							---VASTAUSTEN JÄRJESTYSNUMEROT
				then (numerovalinta+1)

		WHEN (f.kysymysid =3108 and vapaateksti in ('1','1.0'))					THEN 1
		WHEN (f.kysymysid =3108 and vapaateksti in('2','2.0'))					THEN 2
		WHEN (f.kysymysid =3108 and vapaateksti in('3','3.0','3.'))				THEN 3
		WHEN (f.kysymysid =3108 and vapaateksti='4')							THEN 4
		WHEN (f.kysymysid =3108 and vapaateksti in ('5','5.0'))					THEN 5
		WHEN (f.kysymysid =3108 and vapaateksti in ('6','6.0','6.'))			THEN 6
		WHEN (f.kysymysid =3108 and vapaateksti in ('7','7.0'))					THEN 7
		WHEN (f.kysymysid =3108 and vapaateksti in ('8','8.0','8.'))			THEN 8
		WHEN (f.kysymysid =3108 and vapaateksti in ('9','9.0','9.0'))			THEN 9
		WHEN (f.kysymysid =3108 and vapaateksti in ('10','10.0'))				THEN 10
		WHEN (f.kysymysid =3108 and vapaateksti in ('11','11.0'))				THEN 11
		WHEN (f.kysymysid =3108 and vapaateksti =' ')							THEN 12

		WHEN (f.kysymysid in(3208,3209) and vapaateksti in ('1','1.0', '1.'))	THEN 1
		WHEN (f.kysymysid in(3208,3209) and vapaateksti in('2','2.0', '2.'))	THEN 2
		WHEN (f.kysymysid in(3208,3209) and vapaateksti in('3','3.0','3.'))		THEN 3 
		WHEN (f.kysymysid in(3208,3209) and vapaateksti in ('4','4.0'))			THEN 4
		WHEN (f.kysymysid in(3208,3209) and vapaateksti in ('5','5.0'))			THEN 5
		WHEN (f.kysymysid in(3208,3209) and vapaateksti in ('6','6.0','6.'))	THEN 6
		WHEN (f.kysymysid in(3208,3209) and vapaateksti in ('7','7.0'))			THEN 7
		WHEN (f.kysymysid in(3208,3209) and vapaateksti in ('8','8.0','8.'))	THEN 8
		WHEN (f.kysymysid in(3208,3209) and vapaateksti in ('9','9.0','9.2'))	THEN 9
		WHEN (f.kysymysid in(3208,3209) and vapaateksti in ('10','10.0'))		THEN 10
		WHEN (f.kysymysid in(3208,3209) and vapaateksti in ('11','11.0'))		THEN 11
		WHEN (f.kysymysid in(3208,3209) and vapaateksti in ('12','12.0'))		THEN 12
		WHEN (f.kysymysid in(3208,3209) and vapaateksti in ('13','13.0'))		THEN 13
		WHEN (f.kysymysid in(3208,3209) and vapaateksti is null)				THEN 14

		WHEN (f.kysymysid in (3143,2948) and vapaateksti='1')							THEN 1
		WHEN (f.kysymysid in (3143,2948) and vapaateksti='2')							THEN 2
		WHEN (f.kysymysid in (3143,2948) and vapaateksti='3')							THEN 3
		WHEN (f.kysymysid in (3143,2948) and vapaateksti='4')							THEN 4
		WHEN (f.kysymysid in (3143,2948) and vapaateksti='5')							THEN 5
		WHEN (f.kysymysid in (3143,2948) and vapaateksti='6')							THEN 6
		WHEN (f.kysymysid in (3143,2948) and vapaateksti='7')							THEN 7
		WHEN (f.kysymysid in (3143,2948) and vapaateksti='8')							THEN 8
		WHEN (f.kysymysid in (3143,2948) and vapaateksti='9')							THEN 9
		WHEN (f.kysymysid in (3143,2948) and vapaateksti='10')							THEN 10
		WHEN (f.kysymysid in (3143,2948) and vapaateksti='11')							THEN 11
		WHEN (f.kysymysid in (3143,2948) and vapaateksti='12')							THEN 12
		WHEN (f.kysymysid in (3143,2948) and vapaateksti='13')							THEN 13
		WHEN (f.kysymysid in (3143,2948) and vapaateksti='14')							THEN 14
		WHEN (f.kysymysid in (3143,2948) and (Vapaateksti='0' OR Vapaateksti='15' OR Vapaateksti = NULL))	THEN 15

		
		ELSE numerovalinta END)													AS jarjestys_monivalinta

FROM [ANTERO].dw.f_arvo_yo_uraseuranta AS f
LEFT JOIN dw.d_organisaatioluokitus ON f.d_organisaatio_id=d_organisaatioluokitus.id
LEFT JOIN dw.d_koulutusluokitus		ON f.d_koulutusluokitus_id=d_koulutusluokitus.id
LEFT JOIN dw.d_kieli				ON f.d_kieli_id=d_kieli.id
LEFT JOIN dw.d_alueluokitus			ON f.d_alueluokitus_id=d_alueluokitus.id
LEFT JOIN dw.d_arvokysymys			ON f.d_arvokysymys_id=d_arvokysymys.id				
LEFT JOIN dw.d_arvokyselykerta		ON f.d_arvokyselykerta_id=d_arvokyselykerta.id
LEFT JOIN dw.d_ika d7				ON d7.id=f.d_ika_valmistuessa_id
LEFT JOIN dw.d_sukupuoli d8			ON d8.id=f.d_sukupuoli_id
LEFT JOIN dw.d_kieli d9				ON d9.id=f.d_kieli_aidinkieli_id
LEFT JOIN dw.d_maatjavaltiot2 d10	ON d10.id=f.d_maatjavaltiot_kansalaisuus_id
LEFT JOIN dw.d_alueluokitus d11		ON d11.id=f.d_alueluokitus_asuinkunta_id

where 1=1
and f.kysymysryhma not like '%vastauksistasi!%'
and f.kysymys not in																										--poistetaan seuraavat kysymykset
('Kesto yhteensä (ilmoita kesto kuukausina)'
,'Kesto yhteensä (ilmoita kesto kuukausina):'
,'11.  Mikä on keskimääräinen bruttopalkkasi tai kuukausitulosi (säännölliset lisät, luontoisetujen verotusarvot ja ylityökorvaukset mukaan lukien)?'
,'21. Mikä on keskimääräinen bruttopalkkasi tai kuukausitulosi (säännölliset lisät, luontoisetujen verotusarvot ja ylityökorvaukset mukaan lukien)?'
,'Työttömyysjaksojen lukumäärä'
,'Kesto kuukausina'
,'Kesto yhteensä kuukausina'
,'Jos vastasit osa-aikaisesti, niin paljonko väitöskirjatutkimukseen / tohtorin opinnäytteeseen työajasta käytetty % -osuus oli:'
,'Kuinka monta kertaa?')
and f.kysymysid not in (3194,3190)																							--poistetaan tohtorikysymykset (c) Suorittamisvuosi, c)  Suorittamisvuosi)
and f.kysymysryhma <>'Työn kansainvälisyys'																					--poistetaan kysymysryhmä "Työn kansainvälisyys"
and coalesce(f.monivalintavaihtoehto_fi,convert(varchar(3),f.numerovalinta),convert(varchar(3),vapaateksti)) is not null	--poistetaan rivit joissa numerovalinta, monivalinta ja vapaateksti ovat tyhjiä (=tyhjä vastaus)
--and f.kysymysid not in (3141, 3206,3106, 3108)  --aiheuttavat sen että monivalintanumeron järjestyslukua ei voi asettaa tabulaarissa
--and numerovalinta is not null
UNION ALL

SELECT  --TOP 1
		null as kysymysid
	  , [Ikä (valmistuessa)]
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
    , [Kyselypohja]
     ,[Kyselyvuosi]
	 ,[Kyselyvuosi] as 'Tilastovuosi'
      ,[Rahoitusmallikysymys]
	  ,CASE WHEN [Rahoitusmallikysymys] = 'Kyllä' THEN 'Ja' ELSE 'Nej' END 	AS 'Finansieringsmodellfråga'
	  ,CASE WHEN [Rahoitusmallikysymys] = 'Kyllä' THEN 'Yes' ELSE 'No' END  AS 'Funding modell question'
	  ,[Rahoituskysymys_paino]
      ,[Monivalintavaihtoehto]
      ,[numerovalinta]
      ,case when Kysymysryhmä in ('III  TOHTORIKOULUTUS JA SEN MERKITYS (4/4). Arvioi, miten seuraavat tekijät ovat vaikuttaneet työllistymiseesi valmistumisen jälkeen?', 'VI TYÖ JA OSAAMINEN (1/3). Arvioi, miten seuraavat tekijät ovat vaikuttaneet työllistymiseesi valmitumisen jälkeen?')
			then 'arvosana6'
			else [vastaustyyppi]
			end
		as 'vastaustyyppi'

      ,[vaihtoehto]
      ,[valtakunnallinen]
     ,[Korkeakoulu]
     ,[vastaajaid]
     ,[lukumaara]
    ,[Kyselyvuosi] as 'Enkätår'
	,[Åldersgrupp]
	,[Kön]
	,[Modersmål]

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
     --ENGLANTI
	  ,[Kyselyvuosi] as 'Survey year'
	  ,[Age group] 
	  ,[Gender] 
	  ,[Native language]
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
      , CASE 
		WHEN [ANTERO].dw.f_arvo_yo_uraseuranta_2018.kysymys='8. Jos olet toiminut yrittäjänä, a) kuinka monessa yrityksessä olet ollut perustajana/osakkaana valmistumisesi jälkeen?'   AND numerovalinta > 2	THEN 3
		WHEN [ANTERO].dw.f_arvo_yo_uraseuranta_2018.kysymys='6. Kuinka monen työnantajan palveluksessa olet ollut valmistumisesi jälkeen (ml. nykyinen työnantajasi)?'					AND numerovalinta>4		THEN 5
		WHEN [ANTERO].dw.f_arvo_yo_uraseuranta_2018.Kysymys='b) Kuinka monta henkilöä yrityksesi ovat yhteensä työllistäneet itsesi lisäksi?'											AND numerovalinta >4	THEN 5 
		
		--kysymys 18.  Kuinka rahoitit tohtoriopintosi?(vuodet 2018&2019)
		
		WHEN [ANTERO].dw.f_arvo_yo_uraseuranta_2018.monivalintavaihtoehto ='1  väitöskirjatyöhön liittyvä työsuhde yliopistolla (esim. tohtorikoulutettava, väitöskirjatutkija, projektitutkija tms.)' then 1
		WHEN [ANTERO].dw.f_arvo_yo_uraseuranta_2018.monivalintavaihtoehto ='2  muu työsuhde yliopistolla'	THEN 2
		WHEN [ANTERO].dw.f_arvo_yo_uraseuranta_2018.monivalintavaihtoehto ='3  työsuhde tutkimuslaitoksessa' THEN 3
		WHEN [ANTERO].dw.f_arvo_yo_uraseuranta_2018.monivalintavaihtoehto ='4  tutkimus- ja/tai opetustehtävissä ammattikorkeakoulussa' THEN 4
		WHEN [ANTERO].dw.f_arvo_yo_uraseuranta_2018.monivalintavaihtoehto ='5  henkilökohtainen apuraha' THEN 5
		WHEN [ANTERO].dw.f_arvo_yo_uraseuranta_2018.monivalintavaihtoehto ='6  ansiotyössä yliopiston ulkopuolella' THEN 6
		WHEN [ANTERO].dw.f_arvo_yo_uraseuranta_2018.monivalintavaihtoehto ='8  muu rahoituslähde,' then 8
		
		--kysymys 20.  Suorititko tohtorin tutkinnon ensisijaisesti
		WHEN [ANTERO].dw.f_arvo_yo_uraseuranta_2018.monivalintavaihtoehto ='1  kokopäiväisesti' then 1
		WHEN [ANTERO].dw.f_arvo_yo_uraseuranta_2018.monivalintavaihtoehto ='2  osa-aikaisesti' then 2
		WHEN [ANTERO].dw.f_arvo_yo_uraseuranta_2018.monivalintavaihtoehto ='3  vapaa-ajalla muun päätyön ohella' then 3

		ELSE [jarjestys_monivalinta]
		
		END  AS [jarjestys_monivalinta]
FROM [ANTERO].dw.f_arvo_yo_uraseuranta_2018 
--where Kyselyvuosi=2020 






GO


