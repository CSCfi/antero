USE [ANTERO]
GO

/****** Object:  View [dw].[v_arvo_uraseuranta]    Script Date: 20.2.2025 12.36.17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER   VIEW [dw].[v_arvo_uraseuranta] AS

SELECT --TOP 0
f.kysymysid
----henkilömuuttujat
, d7.ika_fi											AS 'Ikä (valmistuessa)'

,CASE WHEN d7.ika_fi in ('20','21','22','23','24') 
THEN '20–24-vuotiaat' ELSE d7.ikaryhma1_fi END		AS 'Ikäryhmä (valmistuessa)'

,d8.sukupuoli_fi									AS 'Sukupuoli'
,d9.kieliryhma1_fi									AS 'Äidinkieli'
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
,CASE 
	WHEN f.kysymysid = 2922 THEN '1. Koulutus antoi riittävät valmiudet työelämään.'
	WHEN f.kysymysid = 2924 THEN '2. Miten tyytyväinen olet kokonaisuudessaan vuonna x suorittamaasi tutkintoon työurasi kannalta?'
	WHEN f.kysymysid = 2953 THEN '3. Pystyn hyödyntämään yliopistossa oppimiani tietoja ja taitoja nykyisessä työssäni hyvin.'
	WHEN f.kysymysid = 2954 THEN '4. Työni vastaa tällä hetkellä vaativuustasoltaan hyvin yliopistollista koulutustani.'
	WHEN f.kysymysid = 3060 THEN '1) analyyttiset, systemaattisen ajattelun taidot'
	WHEN f.kysymysid = 3061 THEN '2) tiedonhankintataidot'
	WHEN f.kysymysid = 3079 THEN '3) kyky oppia ja omaksua uutta'
	WHEN f.kysymysid = 3081 THEN '4) tieteidenvälisyys/moniammatillisissa ryhmissä toimiminen'
	WHEN f.kysymysid = 3084 THEN '5) itseohjautuvuus/oma-aloitteisuus'
	WHEN f.kysymysid = 3085 THEN '6) yrittäjyystaidot'
	ELSE NULL
END as 'Kysymys (rahoitusmalli)'
,CASE 
	WHEN f.kysymysid = 2922 THEN '1. Utbildningen gav tillräckliga färdigheter för arbetslivet.'
	WHEN f.kysymysid = 2924 THEN '2. Med tanke på din karriär, hur nöjd är du med den examen du avlade år x i sin helhet?'
	WHEN f.kysymysid = 2953 THEN '3. Jag kan i mitt nuvarande arbete utnyttja väl de kunskaper och färdigheter som jag lärt mig vid universitetet.'
	WHEN f.kysymysid = 2954 THEN '4. Kravnivån på mitt arbete motsvarar väl min universitetsutbildning.'
	WHEN f.kysymysid = 3060 THEN '1) färdigheter för analytiskt och systematiskt tänkande'
	WHEN f.kysymysid = 3061 THEN '2) färdigheter i informationssökning'
	WHEN f.kysymysid = 3079 THEN '3) förmåga att lära sig och tillägna sig nytt'
	WHEN f.kysymysid = 3081 THEN '4) tvärvetenskaplighet/fungera i mångprofessionella grupper'
	WHEN f.kysymysid = 3084 THEN '5) självstyrande/eget initiativtagande'
	WHEN f.kysymysid = 3085 THEN '6) entreprenörs-/företagarförmåga'
	ELSE NULL
END as 'Fråga (finansieringsmodell)'
,CASE 
	WHEN f.kysymysid = 2922 THEN '1. The studies equipped me sufficiently for the working life.'
	WHEN f.kysymysid = 2924 THEN '2. How satisfied are you overall with the degree you completed in year x in terms of your career?'
	WHEN f.kysymysid = 2953 THEN '3. The skills and knowledge I learned at the university can be applied well in my current job.'
	WHEN f.kysymysid = 2954 THEN '4. The requirements of my current job correspond well with my academic qualifications.'
	WHEN f.kysymysid = 3060 THEN '1) analytical and systematic thinking skills'
	WHEN f.kysymysid = 3061 THEN '2) information retrieval skills'
	WHEN f.kysymysid = 3079 THEN '3) ability to learn and adopt new things'
	WHEN f.kysymysid = 3081 THEN '4) interdisciplinary/multi-professional teamwork'
	WHEN f.kysymysid = 3084 THEN '5) self-direction/initiative'
	WHEN f.kysymysid = 3085 THEN '6) entrepreneurship skills'
	ELSE NULL
END as 'Question (funding model)'
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
,d8.sukupuoli_sv						as 'Kön'
,d9.kieliryhma1_sv						as 'Modersmål'
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
,d9.kieliryhma1_en								as 'Native language'
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
,1	AS vuosi_tilasto 
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
,d9.jarjestys_kieliryhma1			AS jarjestys_kieli
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

		
		ELSE numerovalinta END)													AS jarjestys_monivalinta,
		CASE 
			WHEN f.kysymysid = 2922 THEN 1
			WHEN f.kysymysid = 2924 THEN 2
			WHEN f.kysymysid = 2953 THEN 3
			WHEN f.kysymysid = 2954 THEN 4
			WHEN f.kysymysid = 3060 THEN 5
			WHEN f.kysymysid = 3061 THEN 6
			WHEN f.kysymysid = 3079 THEN 7
			WHEN f.kysymysid = 3081 THEN 8
			WHEN f.kysymysid = 3084 THEN 9
			WHEN f.kysymysid = 3085 THEN 10
			ELSE NULL
		END as 'jarjestys_kysymys_rahoitusmalli'

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

SELECT  
	d1.kysymysid,
	d2.ika_fi as [Ikä (valmistuessa)],
	CASE 
		WHEN d2.ika_fi in ('20','21','22','23','24') THEN '20–24-vuotiaat' 
		ELSE d2.ikaryhma1_fi 
	END as [Ikäryhmä (valmistuessa)],
	d3.sukupuoli_fi as Sukupuoli,
	d4.kieliryhma1_fi AS [Äidinkieli],
	d5.maatjavaltiot2_fi as [Kansalaisuus],
	d5.maanosa_fi [Kansalaisuus (maanosa)],
	'Ei tiedossa' as [Asuinkunta],
    'Ei tiedossa' as [Asuinmaakunta],
    null as [Laajuus],
    'Ei tiedossa' as [Pääaine],
    'Ei tiedossa' as [Arvosana],
    'Ei tiedossa' as [Asteikko],
    null as [Valintavuosi],
    null as [Valmistumisvuosi],
    'Ei tiedossa' as [Läsnäolo (lukukausia)],
    null as [Kirjoillaolo (kuukausia)],
	d6.koulutusastetaso1_fi as [Koulutusaste, taso 1],
	d6.koulutusastetaso2_fi as [Koulutusaste, taso 2],
	d6.koulutusalataso1_fi as [Koulutusaste, taso 1],
	d6.koulutusalataso2_fi as [Koulutusaste, taso 2],
	d6.koulutusalataso3_fi as [Koulutusaste, taso 3],
	d6.okmohjauksenala_fi as [OKM ohjauksen ala],
	d6.koulutusluokitus_fi as [Koulutusnimike],
	'Ei tiedossa' as [Koulutuksen kieli],
    'Ei tiedossa' as [Koulutuksen kunta],
    'Ei tiedossa' as [Koulutuksen maakunta],
    'Ei tiedossa' as [Kysely],
    'Ei tiedossa' as [Kyselykerta],
	CASE
		WHEN d1.kysymysryhma_fi ='III  TOHTORIKOULUTUS JA SEN MERKITYS (2/4)' THEN 'III  TOHTORIKOULUTUS JA SEN MERKITYS (2/4). Kuinka tärkeitä seuraavat tiedot ja taidot ovat työssäsi'	
		WHEN d1.kysymysryhma_fi ='III  TOHTORIKOULUTUS JA SEN MERKITYS (2/5)' THEN 'III  TOHTORIKOULUTUS JA SEN MERKITYS (2/5). Kuinka tärkeitä seuraavat tiedot ja taidot ovat työssäsi'	
		WHEN d1.kysymysryhma_fi ='III  TOHTORIKOULUTUS JA SEN MERKITYS (3/4)' THEN 'III  TOHTORIKOULUTUS JA SEN MERKITYS (3/4). Miten tohtorikoulutus kehitti kyseisiä valmiuksia?'
		WHEN d1.kysymysryhma_fi ='III  TOHTORIKOULUTUS JA SEN MERKITYS (3/5)' THEN 'III  TOHTORIKOULUTUS JA SEN MERKITYS (3/5). Miten tohtorikoulutus kehitti kyseisiä valmiuksia?'
		WHEN d1.kysymysryhma_fi ='III  TOHTORIKOULUTUS JA SEN MERKITYS (4/4)' THEN 'III  TOHTORIKOULUTUS JA SEN MERKITYS (4/4). Arvioi, miten seuraavat tekijät ovat vaikuttaneet työllistymiseesi valmistumisen jälkeen?'
		WHEN d1.kysymysryhma_fi ='III  TOHTORIKOULUTUS JA SEN MERKITYS (4/5)' THEN 'III  TOHTORIKOULUTUS JA SEN MERKITYS (4/5). Arvioi seuraavien taitokokonaisuuksien merkityksen kehittymistä seuraavan viiden vuoden aikana?'
		WHEN d1.kysymysryhma_fi ='III  TOHTORIKOULUTUS JA SEN MERKITYS (5/5)' THEN 'III  TOHTORIKOULUTUS JA SEN MERKITYS (5/5). Arvioi, miten seuraavat tekijät ovat vaikuttaneet työllistymiseesi valmistumisen jälkeen?'
		WHEN d1.kysymysryhma_fi ='VI TYÖ JA OSAAMINEN (1/3)' THEN 'VI TYÖ JA OSAAMINEN (1/3). Arvioi, miten seuraavat tekijät ovat vaikuttaneet työllistymiseesi valmitumisen jälkeen?'
		WHEN d1.kysymysryhma_fi ='VI TYÖ JA OSAAMINEN (2/3)' THEN 'VI TYÖ JA OSAAMINEN (2/3). Kuinka tärkeitä seuraavat tiedot ja taidot ovat työssäsi'	
		WHEN d1.kysymysryhma_fi ='VI TYÖ JA OSAAMINEN (3/3)' THEN 'VI TYÖ JA OSAAMINEN (3/3). Miten yliopisto-opiskelu kehitti kyseisiä valmiuksia?'	
		ELSE d1.kysymysryhma_fi 
	END	as [Kysymysryhmä],
	CASE 
		WHEN f.kyselypohja='URASEURANTA-TOHTORI' and f.Kyselyvuosi = 2021 THEN REPLACE(d1.kysymys_fi, '2019', '2018')
		WHEN f.kyselypohja='URASEURANTA-TOHTORI' and f.Kyselyvuosi = 2023 THEN REPLACE(d1.kysymys_fi, '2019', '2020')
		WHEN f.kyselypohja='URASEURANTA-TOHTORI' and f.Kyselyvuosi = 2024 THEN REPLACE(d1.kysymys_fi, '2019', '2021')
		WHEN f.kyselypohja='URASEURANTA-MAISTERI' and f.Kyselyvuosi = 2021 THEN REPLACE(d1.kysymys_fi, '2017', '2016')
		WHEN f.kyselypohja='URASEURANTA-MAISTERI' and f.Kyselyvuosi = 2023 THEN REPLACE(d1.kysymys_fi, '2017', '2018')
		WHEN f.kyselypohja='URASEURANTA-MAISTERI' and f.Kyselyvuosi = 2024 THEN REPLACE(d1.kysymys_fi, '2017', '2019')
		ELSE d1.kysymys_fi
	 END as Kysymys,
	CASE 
		WHEN f.rahoitusmallikysymys = 1 THEN
			CASE
				WHEN d1.kysymys_fi like '%Koulutus antoi riittävät valmiudet työelämään%' THEN '1. Koulutus antoi riittävät valmiudet työelämään.'
				WHEN d1.kysymys_fi like '%Miten tyytyväinen olet kokonaisuudessaan vuonna%' THEN '2. Miten tyytyväinen olet kokonaisuudessaan vuonna x suorittamaasi tutkintoon työurasi kannalta?'
				WHEN d1.kysymys_fi like '%Pystyn hyödyntämään yliopistossa oppimiani tietoja ja taitoja nykyisessä työssäni hyvin%' THEN '3. Pystyn hyödyntämään yliopistossa oppimiani tietoja ja taitoja nykyisessä työssäni hyvin.'
				WHEN d1.kysymys_fi like '%Työni vastaa vaativuustasoltaan hyvin yliopistollista koulutustani%' THEN '4. Työni vastaa tällä hetkellä vaativuustasoltaan hyvin yliopistollista koulutustani.'
				WHEN d1.kysymys_fi like '%analyyttiset%' THEN '1) analyyttiset, systemaattisen ajattelun taidot'
				WHEN d1.kysymys_fi like '%tiedonhankinta%' THEN '2) tiedonhankintataidot'
				WHEN d1.kysymys_fi like '%kyky oppia%' THEN '3) kyky oppia ja omaksua uutta'
				WHEN d1.kysymys_fi like '%tieteiden%' THEN '4) tieteidenvälisyys/moniammatillisissa ryhmissä toimiminen'
				WHEN d1.kysymys_fi like '%itseohjautuvuus%' THEN '5) itseohjautuvuus/oma-aloitteisuus'
				WHEN d1.kysymys_fi like '%yrittäjyys%' THEN '6) yrittäjyystaidot'
				ELSE NULL
			END
		ELSE NULL
	END as 'Kysymys (rahoitusmalli)',
	CASE 
		WHEN f.rahoitusmallikysymys = 1 THEN
			CASE 
				WHEN d1.kysymys_fi like '%Koulutus antoi riittävät valmiudet työelämään%' THEN '1. Utbildningen gav tillräckliga färdigheter för arbetslivet.'
				WHEN d1.kysymys_fi like '%Miten tyytyväinen olet kokonaisuudessaan vuonna%' THEN '2. Med tanke på din karriär, hur nöjd är du med den examen du avlade år x i sin helhet?'
				WHEN d1.kysymys_fi like '%Pystyn hyödyntämään yliopistossa oppimiani tietoja ja taitoja nykyisessä työssäni hyvin%' THEN '3. Jag kan i mitt nuvarande arbete utnyttja väl de kunskaper och färdigheter som jag lärt mig vid universitetet.'
				WHEN d1.kysymys_fi like '%Työni vastaa vaativuustasoltaan hyvin yliopistollista koulutustani%' THEN '4. Kravnivån på mitt arbete motsvarar väl min universitetsutbildning.'
				WHEN d1.kysymys_fi like '%analyyttiset%' THEN '1) färdigheter för analytiskt och systematiskt tänkande'
				WHEN d1.kysymys_fi like '%tiedonhankinta%' THEN '2) färdigheter i informationssökning'
				WHEN d1.kysymys_fi like '%kyky oppia%' THEN '3) förmåga att lära sig och tillägna sig nytt'
				WHEN d1.kysymys_fi like '%tieteiden%' THEN '4) tvärvetenskaplighet/fungera i mångprofessionella grupper'
				WHEN d1.kysymys_fi like '%itseohjautuvuus%' THEN '5) självstyrande/eget initiativtagande'
				WHEN d1.kysymys_fi like '%yrittäjyys%' THEN '6) entreprenörs-/företagarförmåga'
				ELSE NULL
			END
		ELSE NULL
	END as 'Fråga (finansieringsmodell)',
	CASE 
		WHEN f.rahoitusmallikysymys = 1 THEN
			CASE 
				WHEN d1.kysymys_fi like '%Koulutus antoi riittävät valmiudet työelämään%' THEN '1. The studies equipped me sufficiently for the working life.'
				WHEN d1.kysymys_fi like '%Miten tyytyväinen olet kokonaisuudessaan vuonna%' THEN '2. How satisfied are you overall with the degree you completed in year x in terms of your career?'
				WHEN d1.kysymys_fi like '%Pystyn hyödyntämään yliopistossa oppimiani tietoja ja taitoja nykyisessä työssäni hyvin%' THEN '3. The skills and knowledge I learned at the university can be applied well in my current job.'
				WHEN d1.kysymys_fi like '%Työni vastaa vaativuustasoltaan hyvin yliopistollista koulutustani%' THEN '4. The requirements of my current job correspond well with my academic qualifications.'
				WHEN d1.kysymys_fi like '%analyyttiset%' THEN '1) analytical and systematic thinking skills'
				WHEN d1.kysymys_fi like '%tiedonhankinta%' THEN '2) information retrieval skills'
				WHEN d1.kysymys_fi like '%kyky oppia%' THEN '3) ability to learn and adopt new things'
				WHEN d1.kysymys_fi like '%tieteiden%' THEN '4) interdisciplinary/multi-professional teamwork'
				WHEN d1.kysymys_fi like '%itseohjautuvuus%' THEN '5) self-direction/initiative'
				WHEN d1.kysymys_fi like '%yrittäjyys%' THEN '6) entrepreneurship skills'
				ELSE NULL
			END
		ELSE NULL
	END as 'Question (funding model)',
	[Kyselypohja],
	[Kyselyvuosi],
	[Kyselyvuosi] as 'Tilastovuosi',
	d8.kytkin_fi as [Rahoitusmallikysymys],
	d8.kytkin_sv as 'Finansieringsmodellfråga',
	d8.kytkin_en as 'Funding modell question',
	f.rahoituskysymys_paino as Rahoituskysymys_paino,

	-- CSCVIPUNEN-3471
	CASE 
		WHEN d1.kysymys_fi = '5. Mikä seuraavista vaihtoehdoista kuvaa parhaiten tähänastisen työurasi kokonaisuutta?' and Kyselyvuosi in (2021, 2022) THEN 'Vastauksia ei kerätty vuosina 2021 ja 2022'
		ELSE [Monivalintavaihtoehto]
	END as Monivalintavaihtoehto,
	CASE 
		WHEN d1.kysymys_fi = '5. Mikä seuraavista vaihtoehdoista kuvaa parhaiten tähänastisen työurasi kokonaisuutta?'  and Kyselyvuosi IN (2021, 2022) THEN NULL
		ELSE numerovalinta
	END as numerovalinta,
	CASE	
		WHEN d1.kysymysid in (6821,6805,6950, 8366, 8382) THEN 'arvosana6' 
		WHEN d1.kysymysryhma_fi like '%III  TOHTORIKOULUTUS JA SEN MERKITYS (4/4)%' or d1.kysymysryhma_fi like '%VI TYÖ JA OSAAMINEN (1/3)%' THEN 'arvosana6'
		ELSE d1.vastaustyyppi
	END as 'vastaustyyppi',

	NULL as [vaihtoehto],
	NULL as [valtakunnallinen],
	d7.organisaatio_fi as [Korkeakoulu],
	[vastaajaid],
	1 as [lukumaara],

	[Kyselyvuosi] as 'Enkätår',
	CASE 
		WHEN d2.ika_fi in ('20','21','22','23','24') THEN '20–24 år' 
		ELSE d2.ikaryhma1_sv
	END as [Åldersgrupp],
	d3.sukupuoli_sv as [Kön],
	d4.kieliryhma1_sv AS [Modersmål],
	d7.organisaatio_sv as [Högskola],
	'Information saknas' as [Utbildningens språk],
	'Information saknas' as [Utbildningens kommun],
	'Information saknas' as [Utbildningens landskap],
	'Information saknas' as [kysely_sv],
	d1.kysymysryhma_sv as [Frågegrupp],
	CASE 
		WHEN f.kyselypohja='URASEURANTA-TOHTORI' and f.Kyselyvuosi = 2021 THEN REPLACE(d1.kysymys_sv, '2019', '2018')
		WHEN f.kyselypohja='URASEURANTA-TOHTORI' and f.Kyselyvuosi = 2023 THEN REPLACE(d1.kysymys_sv, '2019', '2020')
		WHEN f.kyselypohja='URASEURANTA-TOHTORI' and f.Kyselyvuosi = 2024 THEN REPLACE(d1.kysymys_sv, '2019', '2021')
		WHEN f.kyselypohja='URASEURANTA-MAISTERI' and f.Kyselyvuosi = 2021 THEN REPLACE(d1.kysymys_sv, '2017', '2016')
		WHEN f.kyselypohja='URASEURANTA-MAISTERI' and f.Kyselyvuosi = 2023 THEN REPLACE(d1.kysymys_sv, '2017', '2018')
		WHEN f.kyselypohja='URASEURANTA-MAISTERI' and f.Kyselyvuosi = 2024 THEN REPLACE(d1.kysymys_sv, '2017', '2019')
		ELSE d1.kysymys_sv
	END as [Fråga],
	-- CSCVIPUNEN-3471
	CASE 
		WHEN d1.kysymys_fi = '5. Mikä seuraavista vaihtoehdoista kuvaa parhaiten tähänastisen työurasi kokonaisuutta?' and Kyselyvuosi IN (2021, 2022) THEN 'Svar har inte samlats in åren 2021 och 2022'
		ELSE [Flervalsalternativ]
	END as Flervalsalternativ,
	d6.koulutusastetaso1_sv as [Utbildningsnivå, nivå 1],
	d6.koulutusastetaso1_sv as [Utbildningsnivå, nivå 2],
	d6.koulutusalataso1_sv as [Utbildningsområde, nivå 1],
	d6.koulutusalataso2_sv as [Utbildningsområde, nivå 2],
	d6.koulutusalataso3_sv as [Utbildningsområde, nivå 3],
	d6.okmohjauksenala_sv as [UKM-styrningsområde],
	d6.koulutusluokitus_sv as [Utbildningsbenämning],
	--ENGLANTI
	[Kyselyvuosi] as 'Survey year',
	CASE 
		WHEN d2.ika_fi in ('20','21','22','23','24') THEN 'Aged 20–24' 
		ELSE d2.ikaryhma1_en
	END as [Age group],
	d3.sukupuoli_en as Gender,
	d4.kieliryhma1_en as [Native language],
	d7.organisaatio_en as [Higher education institution],
	'Missing data' as [Language of education],
	'Missing data' as [Municipality of education],
	'Missing data' as [Region of education],
	'Missing data' as [kysely_en],
	d1.kysymysryhma_en as [Question group],
	CASE 
		WHEN f.kyselypohja='URASEURANTA-TOHTORI' and f.Kyselyvuosi = 2021 THEN REPLACE(d1.kysymys_en, '2019', '2018')
		WHEN f.kyselypohja='URASEURANTA-TOHTORI' and f.Kyselyvuosi = 2023 THEN REPLACE(d1.kysymys_en, '2019', '2020')
		WHEN f.kyselypohja='URASEURANTA-TOHTORI' and f.Kyselyvuosi = 2024 THEN REPLACE(d1.kysymys_en, '2019', '2021')
		WHEN f.kyselypohja='URASEURANTA-MAISTERI' and f.Kyselyvuosi = 2021 THEN REPLACE(d1.kysymys_en, '2017', '2016')
		WHEN f.kyselypohja='URASEURANTA-MAISTERI' and f.Kyselyvuosi = 2023 THEN REPLACE(d1.kysymys_en, '2017', '2018')
		WHEN f.kyselypohja='URASEURANTA-MAISTERI' and f.Kyselyvuosi = 2024 THEN REPLACE(d1.kysymys_en, '2017', '2019')
		ELSE d1.kysymys_en
	END as [Question],
	-- CSCVIPUNEN-3471
	CASE 
		WHEN d1.kysymys_fi = '5. Mikä seuraavista vaihtoehdoista kuvaa parhaiten tähänastisen työurasi kokonaisuutta?'  and Kyselyvuosi IN (2021, 2022) THEN 'Answers were not collected in years 2021 and 2022'
		ELSE [multiple_choice_option]
	END as [Multiple choice option],
	d6.koulutusastetaso1_en as [Level of education, tier 1],
	d6.koulutusastetaso2_en as [Level of education, tier 2],
	d6.koulutusalataso1_en as [Field of education, tier 1],
	d6.koulutusalataso2_en as [Field of education, tier 2],
	d6.koulutusalataso3_en as [Field of education, tier 3],
	d6.okmohjauksenala_en as [Field of education, HE steering],
	d6.koulutusluokitus_en as [Name of education],
	CASE 
		WHEN SUBSTRING(@@SERVERNAME,4,1) = 'T' THEN 1 
		WHEN [Kyselyvuosi] < YEAR(GETDATE()) - 1 THEN 1 
		ELSE 0 -- Muutetaan manuaalisesti sen jälkeen kun on saatu julkaisulupa
	END AS vuosi_tilasto,
	0 as [ura_amk],
	0 as [ura_yamk],
	0 as [ura_kandi],
	[ura_maisteri],
	[ura_tohtori],
	d7.organisaatio_koodi as [Koodit Korkeakoulu],
	d6.koulutusluokitus_koodi as [Koodit Koulutus],
	NULL as [Koodit Koulutuksen kieli],
	NULL as [Koodit Koulutuksen kunta],
	NULL as [Koodit Koulutuksen maakunta],
	d2.jarjestys_ikaryhma1 as jarjestys_ika,
	d3.jarjestys_sukupuoli_koodi as jarjestys_sukupuoli,
	d4.jarjestys_kieliryhma1 as [jarjestys_kieli],
	d5.jarjestys_maatjavaltiot2_koodi as [jarjestys_kansalaisuus],
	NULL as [jarjestys_asuinmaakunta],
	CASE 
		WHEN d1.kysymysryhma_fi in ('I  TYÖMARKKINATILANNE','I  TYÖMARKKINATILANTEESI','I  TAUSTAKYSYMYKSET', 'I TYÖMARKKINATILANNE') THEN 1
		WHEN d1.kysymysryhma_fi in ('II  NYKYINEN TYÖSUHDE JA SEN LAATU','II TYYTYVÄISYYS TUTKINTOON') THEN 2
		WHEN d1.kysymysryhma_fi in ('III  TOHTORIKOULUTUS JA SEN MERKITYS (1/4)','III TYÖURAN KOKONAISUUS','III  TOHTORIKOULUTUS JA SEN MERKITYS (1/5)') THEN 3
		WHEN d1.kysymysryhma_fi in ('III  TOHTORIKOULUTUS JA SEN MERKITYS (2/4)','IV TYÖTILANNE','III  TOHTORIKOULUTUS JA SEN MERKITYS (2/5)') THEN 4
		WHEN d1.kysymysryhma_fi in ('III  TOHTORIKOULUTUS JA SEN MERKITYS (3/4)','V TYÖLLISTYMISEN LAATU','III  TOHTORIKOULUTUS JA SEN MERKITYS (3/5)') THEN 5
		WHEN d1.kysymysryhma_fi in ('III  TOHTORIKOULUTUS JA SEN MERKITYS (4/4)','VI TYÖ JA OSAAMINEN (1/3)','III  TOHTORIKOULUTUS JA SEN MERKITYS (4/5)') THEN 6
		WHEN d1.kysymysryhma_fi in ('III  TOHTORIKOULUTUS JA SEN MERKITYS (4/4)','VI TYÖ JA OSAAMINEN (1/3)','III  TOHTORIKOULUTUS JA SEN MERKITYS (5/5)') THEN 7
		WHEN d1.kysymysryhma_fi in ('IV  TOHTORIOPINTOJEN RAHOITUS','VI TYÖ JA OSAAMINEN (2/3)') THEN 8
		WHEN d1.kysymysryhma_fi in ('VI TYÖ JA OSAAMINEN (3/3)') THEN 9
		WHEN d1.kysymysryhma_fi in ('VII OSAAMISEN KEHITTÄMINEN') THEN 10
		WHEN d1.kysymysryhma_fi in ('Uraseurantakyselyn erityisteema 2020: Koronaviruspandemian vaikutukset') THEN 11
		ELSE 99 
	END	[jarjestys_kysymysryhma],
	d1.kysymysjarjestys as [jarjestys_kysymys],
	d6.jarjestys_okmohjauksenala_koodi as [jarjestys_ohjauksenala],
	d6.jarjestys_koulutusastetaso1_koodi as [jarjestys_koulutusaste1],
	d6.jarjestys_koulutusastetaso2_koodi as [jarjestys_koulutusaste2],
	d6.jarjestys_koulutusalataso1_koodi as [jarjestys_koulutusala1],
	d6.jarjestys_koulutusalataso2_koodi as [jarjestys_koulutusala2],
	d6.jarjestys_koulutusalataso3_koodi as [jarjestys_koulutusala3],
	CASE
		WHEN d1.kysymys_fi = '5. Mikä seuraavista vaihtoehdoista kuvaa parhaiten tähänastisen työurasi kokonaisuutta?'  and Kyselyvuosi IN (2021, 2022) THEN 99
		WHEN d1.kysymys_fi = '8. Jos olet toiminut yrittäjänä, a) kuinka monessa yrityksessä olet ollut perustajana/osakkaana valmistumisesi jälkeen?' and numerovalinta > 2 THEN 3
		WHEN d1.kysymys_fi = '6. Kuinka monen työnantajan palveluksessa olet ollut valmistumisesi jälkeen (ml. nykyinen työnantajasi)?' and numerovalinta > 4 THEN 5
		WHEN d1.kysymys_fi = 'b) Kuinka monta henkilöä yrityksesi ovat yhteensä työllistäneet itsesi lisäksi?' and numerovalinta > 4 THEN 5 
		
		--kysymys 18.  Kuinka rahoitit tohtoriopintosi?(vuodet 2018&2019)
		
		WHEN f.monivalintavaihtoehto = '1  väitöskirjatyöhön liittyvä työsuhde yliopistolla (esim. tohtorikoulutettava, väitöskirjatutkija, projektitutkija tms.)' then 1
		WHEN f.monivalintavaihtoehto = '2  muu työsuhde yliopistolla' THEN 2
		WHEN f.monivalintavaihtoehto = '3  työsuhde tutkimuslaitoksessa' THEN 3
		WHEN f.monivalintavaihtoehto = '4  tutkimus- ja/tai opetustehtävissä ammattikorkeakoulussa' THEN 4
		WHEN f.monivalintavaihtoehto = '5  henkilökohtainen apuraha' THEN 5
		WHEN f.monivalintavaihtoehto = '6  ansiotyössä yliopiston ulkopuolella' THEN 6
		WHEN f.monivalintavaihtoehto = '7  opintotuki' THEN 7
		WHEN f.monivalintavaihtoehto = '8  muu rahoituslähde,' THEN 8
		WHEN f.monivalintavaihtoehto = '8  muu rahoituslähde' THEN 8
		
		--kysymys 20.  Suorititko tohtorin tutkinnon ensisijaisesti
		WHEN f.monivalintavaihtoehto ='1  kokopäiväisesti' then 1
		WHEN f.monivalintavaihtoehto ='2  osa-aikaisesti' then 2
		WHEN f.monivalintavaihtoehto ='3  vapaa-ajalla muun päätyön ohella' then 3

		--kysymys 13. Mitkä seuraavista kuvaavat parhaiten tämänhetkisten työtehtäviesi luonnetta? (2018)

		WHEN d1.kysymys_fi = '13. Mitkä seuraavista kuvaavat parhaiten tämänhetkisten työtehtäviesi luonnetta?' and f.kyselyvuosi = 2018 THEN
			CASE 
				WHEN SUBSTRING(f.monivalintavaihtoehto,1,2) not in ('10', '11', '12', '13', '14') THEN CAST(SUBSTRING(f.monivalintavaihtoehto,1,1) as int)
				ELSE CAST(SUBSTRING(f.monivalintavaihtoehto,1,2) as int) 
			END
		ELSE  
			CASE
				WHEN f.Monivalintavaihtoehto is null THEN '99' 
				when f.Monivalintavaihtoehto ='a)  Olen osallistunut/suorittanut ammatillisen erikoistumiskoulutuksen, pätevöitymiskoulutuksen tms.' THEN 1
				when f.Monivalintavaihtoehto ='b)  Olen suorittanut muun tutkinnon.' THEN 2
				when f.Monivalintavaihtoehto ='c)  Olen suorittanut opintoja tähtäimessä toinen korkeakoulututkinto.' THEN 3
				when f.Monivalintavaihtoehto ='d)  Olen suorittanut tieteellisiä/taiteellisia jatko-opintoja.' THEN 4
				when f.Monivalintavaihtoehto ='e)  Olen suorittanut lyhyempiä koulutuksia tai kursseja.' THEN 5
				when f.Monivalintavaihtoehto ='f)  En ole osallistunut koulutukseen.' THEN 6
				when d1.kysymysid in  (8254, 6935, 6933, 8252) then substring(f.Monivalintavaihtoehto,1,2)
				else f.numerovalinta 
			END	
	END as [jarjestys_monivalinta],
	CASE 
		WHEN f.rahoitusmallikysymys = 1 THEN
			CASE
				WHEN d1.kysymys_fi like '%Koulutus antoi riittävät valmiudet työelämään%' THEN 1
				WHEN d1.kysymys_fi like '%Miten tyytyväinen olet kokonaisuudessaan vuonna%' THEN 2
				WHEN d1.kysymys_fi like '%Pystyn hyödyntämään yliopistossa oppimiani tietoja ja taitoja nykyisessä työssäni hyvin%' THEN 3
				WHEN d1.kysymys_fi like '%Työni vastaa vaativuustasoltaan hyvin yliopistollista koulutustani%' THEN 4
				WHEN d1.kysymys_fi like '%analyyttiset%' THEN 5
				WHEN d1.kysymys_fi like '%tiedonhankinta%' THEN 6
				WHEN d1.kysymys_fi like '%kyky oppia%' THEN 7
				WHEN d1.kysymys_fi like '%tieteiden%' THEN 8
				WHEN d1.kysymys_fi like '%itseohjautuvuus%' THEN 9
				WHEN d1.kysymys_fi like '%yrittäjyys%' THEN 10
				ELSE NULL
			END
		ELSE NULL
	END as 'jarjestys_kysymys_rahoitusmalli'
FROM [ANTERO].dw.f_arvo_yo_uraseuranta_2018 f
LEFT JOIN ANTERO.dw.d_arvokysymys d1 on d1.id = f.d_arvokysymys_id 
LEFT JOIN ANTERO.dw.d_ika d2 on d2.id = f.d_ika_id
LEFT JOIN ANTERO.dw.d_sukupuoli d3 on d3.id = f.d_sukupuoli_id
LEFT JOIN ANTERO.dw.d_kieli d4 on d4.id = f.d_kieli_aidinkieli_id
LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d5 on d5.id = f.d_maatjavaltiot2_kansalaisuus_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d6 on d6.id = f.d_koulutusluokitus_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d7 on d7.id = f.d_organisaatioluokitus_id
LEFT JOIN ANTERO.dw.d_kytkin d8 on d8.kytkin_koodi = f.rahoitusmallikysymys

GO

USE [ANTERO]