USE [ANTERO]
GO

/****** Object:  View [dw].[v_arvo_uraseuranta]    Script Date: 19.5.2023 8:09:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dw].[v_arvo_uraseuranta] AS

SELECT --TOP 0
f.kysymysid
----henkil�muuttujat
, d7.ika_fi											AS 'Ik� (valmistuessa)'

,CASE WHEN d7.ika_fi in ('20','21','22','23','24') 
THEN '20�24-vuotiaat' ELSE d7.ikaryhma1_fi END		AS 'Ik�ryhm� (valmistuessa)'

,d8.sukupuoli_fi									AS 'Sukupuoli'
,d9.kieliryhma1_fi									AS '�idinkieli'
,d10.maatjavaltiot2_fi								AS 'Kansalaisuus'
,d10.maanosa_fi										AS 'Kansalaisuus (maanosa)'
,d11.kunta_fi										AS 'Asuinkunta'
,d11.maakunta_fi									AS 'Asuinmaakunta'
,laajuus											AS 'Laajuus'
,paaaine											AS 'P��aine'
,arvosana											AS 'Arvosana'
,asteikko											AS 'Asteikko'
,valintavuosi										AS 'Valintavuosi'
,valmistumisvuosi									AS 'Valmistumisvuosi'
,lasnaolo_lukukausia								AS 'L�sn�olo (lukukausia)'
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
,f.kysymysryhma										AS 'Kysymysryhm�'
,f.kysymys											AS 'Kysymys'
,CASE 
	WHEN f.kysymysid = 2922 THEN '1. Koulutus antoi riitt�v�t valmiudet ty�el�m��n.'
	WHEN f.kysymysid = 2924 THEN '2. Miten tyytyv�inen olet kokonaisuudessaan vuonna x suorittamaasi tutkintoon ty�urasi kannalta?'
	WHEN f.kysymysid = 2953 THEN '3. Pystyn hy�dynt�m��n yliopistossa oppimiani tietoja ja taitoja nykyisess� ty�ss�ni hyvin.'
	WHEN f.kysymysid = 2954 THEN '4. Ty�ni vastaa t�ll� hetkell� vaativuustasoltaan hyvin yliopistollista koulutustani.'
	WHEN f.kysymysid = 3060 THEN '1) analyyttiset, systemaattisen ajattelun taidot'
	WHEN f.kysymysid = 3061 THEN '2) tiedonhankintataidot'
	WHEN f.kysymysid = 3079 THEN '3) kyky oppia ja omaksua uutta'
	WHEN f.kysymysid = 3081 THEN '4) tieteidenv�lisyys/moniammatillisissa ryhmiss� toimiminen'
	WHEN f.kysymysid = 3084 THEN '5) itseohjautuvuus/oma-aloitteisuus'
	WHEN f.kysymysid = 3085 THEN '6) yritt�jyystaidot'
	ELSE NULL
END as 'Kysymys (rahoitusmalli)'
,CASE 
	WHEN f.kysymysid = 2922 THEN '1. Utbildningen gav tillr�ckliga f�rdigheter f�r arbetslivet.'
	WHEN f.kysymysid = 2924 THEN '2. Med tanke p� din karri�r, hur n�jd �r du med den examen du avlade �r x i sin helhet?'
	WHEN f.kysymysid = 2953 THEN '3. Jag kan i mitt nuvarande arbete utnyttja v�l de kunskaper och f�rdigheter som jag l�rt mig vid universitetet.'
	WHEN f.kysymysid = 2954 THEN '4. Kravniv�n p� mitt arbete motsvarar v�l min universitetsutbildning.'
	WHEN f.kysymysid = 3060 THEN '1) f�rdigheter f�r analytiskt och systematiskt t�nkande'
	WHEN f.kysymysid = 3061 THEN '2) f�rdigheter i informationss�kning'
	WHEN f.kysymysid = 3079 THEN '3) f�rm�ga att l�ra sig och till�gna sig nytt'
	WHEN f.kysymysid = 3081 THEN '4) tv�rvetenskaplighet/fungera i m�ngprofessionella grupper'
	WHEN f.kysymysid = 3084 THEN '5) sj�lvstyrande/eget initiativtagande'
	WHEN f.kysymysid = 3085 THEN '6) entrepren�rs-/f�retagarf�rm�ga'
	ELSE NULL
END as 'Fr�ga (finansieringsmodell)'
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
		THEN 'Kyll�' 
		ELSE 'Ei' END								AS 'Rahoitusmallikysymys'
,CASE WHEN 	f.kysymysid in (2922, 2924, 2953, 2954, 3060, 3061, 3079, 3081, 3084, 3085) 
		THEN 'Ja' 
		ELSE 'Nej' END								AS 'Finansieringsmodellfr�ga'
,CASE WHEN 	f.kysymysid in (2922, 2924, 2953, 2954, 3060, 3061, 3079, 3081, 3084, 3085) 
		THEN 'Yes' 
		ELSE 'No' END								AS 'Funding modell question'

,CASE WHEN f.kysymysryhma = 'VI  TY� JA OSAAMINEN (3/3)' 
		THEN 1 / 6.0 ELSE 1.0 END					AS rahoituskysymys_paino

,LOWER(coalesce(monivalintavaihtoehto_fi,CASE 

--- Muutettu Luokitteluun ---
WHEN (vapaateksti is null or vapaateksti='.') AND Kysymys='6.  Kuinka monen ty�nantajan palveluksessa olet ollut valmistumisesi j�lkeen (ml. nykyinen ty�nantajasi)?'	THEN 'Ei vastannut mit��n'
WHEN vapaateksti='0' AND Kysymys='6.  Kuinka monen ty�nantajan palveluksessa olet ollut valmistumisesi j�lkeen (ml. nykyinen ty�nantajasi)?'							THEN 'Ei yht��n'
WHEN (vapaateksti='1' OR  vapaateksti='1.0') AND Kysymys='6.  Kuinka monen ty�nantajan palveluksessa olet ollut valmistumisesi j�lkeen (ml. nykyinen ty�nantajasi)?'	THEN 'Yksi'
WHEN (vapaateksti='2'  OR  vapaateksti='2.0') AND Kysymys='6.  Kuinka monen ty�nantajan palveluksessa olet ollut valmistumisesi j�lkeen (ml. nykyinen ty�nantajasi)?'	THEN 'Kaksi'
WHEN (vapaateksti='3'  OR  vapaateksti='3.0') AND Kysymys='6.  Kuinka monen ty�nantajan palveluksessa olet ollut valmistumisesi j�lkeen (ml. nykyinen ty�nantajasi)?'	THEN 'Kolme'
WHEN (vapaateksti='4'  OR  vapaateksti='4.0') AND Kysymys='6.  Kuinka monen ty�nantajan palveluksessa olet ollut valmistumisesi j�lkeen (ml. nykyinen ty�nantajasi)?'	THEN 'Nelj�'
WHEN (vapaateksti<>'0'OR vapaateksti<>'1' OR  vapaateksti<>'1.0' OR vapaateksti<>'2' OR  vapaateksti<>'2.0' OR vapaateksti<>'3' OR  vapaateksti<>'3.0' OR vapaateksti<>'4' OR  vapaateksti<>'4.0') AND Kysymys='6.  Kuinka monen ty�nantajan palveluksessa olet ollut valmistumisesi j�lkeen (ml. nykyinen ty�nantajasi)?' THEN 'V�hint��n viisi'

WHEN (vapaateksti is null or vapaateksti='.') AND Kysymys='8.  Jos olet toiminut yritt�j�n�, kuinka monessa yrityksess� olet ollut perustajana/osakkaana valmistumisesi j�lkeen?' THEN 'Ei vastannut mit��n'
WHEN vapaateksti='0' AND Kysymys='8.  Jos olet toiminut yritt�j�n�, kuinka monessa yrityksess� olet ollut perustajana/osakkaana valmistumisesi j�lkeen?' THEN 'Ei yht��n'
WHEN vapaateksti='1' AND Kysymys='8.  Jos olet toiminut yritt�j�n�, kuinka monessa yrityksess� olet ollut perustajana/osakkaana valmistumisesi j�lkeen?' THEN 'Yksi'
WHEN vapaateksti='2' AND Kysymys='8.  Jos olet toiminut yritt�j�n�, kuinka monessa yrityksess� olet ollut perustajana/osakkaana valmistumisesi j�lkeen?' THEN 'Kaksi'
WHEN (vapaateksti<>'0'OR vapaateksti<>'1' OR vapaateksti<>'2') AND Kysymys='8.  Jos olet toiminut yritt�j�n�, kuinka monessa yrityksess� olet ollut perustajana/osakkaana valmistumisesi j�lkeen?' THEN 'V�hint��n kolme'

WHEN (vapaateksti is null or vapaateksti='.') AND Kysymys='Ent� kuinka monta henkil�� yrityksesi ovat yhteens� ty�llist�neet itsesi lis�ksi?' THEN 'Ei vastannut mit��n'
WHEN vapaateksti='0' AND Kysymys='Ent� kuinka monta henkil�� yrityksesi ovat yhteens� ty�llist�neet itsesi lis�ksi?' THEN 'Ei yht��n'
WHEN (vapaateksti='1' OR  vapaateksti='1.0' OR vapaateksti='0.5') AND Kysymys='Ent� kuinka monta henkil�� yrityksesi ovat yhteens� ty�llist�neet itsesi lis�ksi?' THEN 'Yksi'
WHEN (vapaateksti='2' OR  vapaateksti='2.0' OR vapaateksti='1.5') AND Kysymys='Ent� kuinka monta henkil�� yrityksesi ovat yhteens� ty�llist�neet itsesi lis�ksi?' THEN 'Kaksi'
WHEN (vapaateksti='3'  OR  vapaateksti='3.0') AND Kysymys='Ent� kuinka monta henkil�� yrityksesi ovat yhteens� ty�llist�neet itsesi lis�ksi?' THEN 'Kolme'
WHEN (vapaateksti='4' OR  vapaateksti='4.0') AND Kysymys='Ent� kuinka monta henkil�� yrityksesi ovat yhteens� ty�llist�neet itsesi lis�ksi?' THEN 'Nelj�'
WHEN (vapaateksti<>'0' OR vapaateksti<>'0.5' OR vapaateksti<>'1' OR vapaateksti<>'1.5' OR  vapaateksti<>'1.0' OR vapaateksti<>'2' OR  vapaateksti<>'2.0' OR vapaateksti<>'3' OR  vapaateksti<>'3.0' OR vapaateksti<>'4' OR  vapaateksti<>'4.0') AND Kysymys='Ent� kuinka monta henkil�� yrityksesi ovat yhteens� ty�llist�neet itsesi lis�ksi?' THEN 'V�hint��n viisi'


WHEN 	Vapaateksti='1'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten p��asiallisinta ty�teht�v��si.  Merkitse vain yhden vaihtoehdon numero.'	 THEN 	'1  tutkimus'
WHEN 	Vapaateksti='10'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten p��asiallisinta ty�teht�v��si.  Merkitse vain yhden vaihtoehdon numero.'	 THEN 	'10  taiteellinen ty�'
WHEN 	Vapaateksti='11'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten p��asiallisinta ty�teht�v��si.  Merkitse vain yhden vaihtoehdon numero.'	 THEN 	'11  lainopillinen ty�'
WHEN 	Vapaateksti='12'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten p��asiallisinta ty�teht�v��si.  Merkitse vain yhden vaihtoehdon numero.'	 THEN 	'12  kirkollinen ty�'
WHEN 	Vapaateksti='13'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten p��asiallisinta ty�teht�v��si.  Merkitse vain yhden vaihtoehdon numero.'	 THEN 	'13  rahoituksen ja taloushallinnon teht�v�t'
WHEN 	Vapaateksti='14'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten p��asiallisinta ty�teht�v��si.  Merkitse vain yhden vaihtoehdon numero.'	 THEN 	'14  muu'
WHEN 	Vapaateksti='2'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten p��asiallisinta ty�teht�v��si.  Merkitse vain yhden vaihtoehdon numero.'	 THEN 	'2  opetus tai kasvatus'
WHEN 	Vapaateksti='3'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten p��asiallisinta ty�teht�v��si.  Merkitse vain yhden vaihtoehdon numero.'	 THEN 	'3  johto- ja esimiesteht�v�t'
WHEN 	Vapaateksti='4'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten p��asiallisinta ty�teht�v��si.  Merkitse vain yhden vaihtoehdon numero.'	 THEN 	'4  konsultointi tai koulutus'
WHEN 	Vapaateksti='5'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten p��asiallisinta ty�teht�v��si.  Merkitse vain yhden vaihtoehdon numero.'	 THEN 	'5  asiakasty�/potilasty�'
WHEN 	Vapaateksti='6'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten p��asiallisinta ty�teht�v��si.  Merkitse vain yhden vaihtoehdon numero.'	 THEN 	'6  markkinointi ja myynti'
WHEN 	Vapaateksti='7'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten p��asiallisinta ty�teht�v��si.  Merkitse vain yhden vaihtoehdon numero.'	 THEN 	'7  suunnittelu-, kehitys- tai hallintoteht�v�t'
WHEN 	Vapaateksti='8'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten p��asiallisinta ty�teht�v��si.  Merkitse vain yhden vaihtoehdon numero.'	 THEN 	'8  viestint�- ja mediaty�'
WHEN 	Vapaateksti='9'	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten p��asiallisinta ty�teht�v��si.  Merkitse vain yhden vaihtoehdon numero.'	 THEN 	'9  toimistoteht�v�t'
WHEN 	(Vapaateksti='0' OR Vapaateksti='15' OR Vapaateksti=NULL)	 AND 	Kysymys='14.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten p��asiallisinta ty�teht�v��si.  Merkitse vain yhden vaihtoehdon numero.'	 THEN 	'Ei vastannut'

WHEN vaihtoehto=1 THEN 'Kyll�' 
when vaihtoehto=0 THEN 'Ei' 

WHEN f.kysymysryhma in ('VI  TY� JA OSAAMINEN (2/3)','VI  TY� JA OSAAMINEN (3/3)') and numerovalinta=1 THEN '1 = Ei lainkaan'
WHEN f.kysymysryhma in ('VI  TY� JA OSAAMINEN (2/3)','VI  TY� JA OSAAMINEN (3/3)') and numerovalinta=2 THEN '2 = Vain v�h�n'
WHEN f.kysymysryhma in ('VI  TY� JA OSAAMINEN (2/3)','VI  TY� JA OSAAMINEN (3/3)') and numerovalinta=3 THEN '3 = Jonkin verran'
WHEN f.kysymysryhma in ('VI  TY� JA OSAAMINEN (2/3)','VI  TY� JA OSAAMINEN (3/3)') and numerovalinta=4 THEN '4 = Melko paljon'
WHEN f.kysymysryhma in ('VI  TY� JA OSAAMINEN (2/3)','VI  TY� JA OSAAMINEN (3/3)') and numerovalinta=5 THEN '5 = Paljon'
WHEN f.kysymysryhma in ('VI  TY� JA OSAAMINEN (2/3)','VI  TY� JA OSAAMINEN (3/3)') and numerovalinta=6 THEN '6 = Eritt�in paljon'

--TOHTORIKYSYMYKSET
		WHEN (f.kysymysid =3108 and vapaateksti in ('1','1.0'))			THEN '1 - Suomen Akatemian/opetus- ja kulttuuriministeri�n rahoittaman paikallisen tutkijakoulutuspaikan kautta'
		WHEN (f.kysymysid =3108 and vapaateksti in('2','2.0'))			THEN '2 - muun paikallisen tutkijakoulutuspaikan kautta'
		WHEN (f.kysymysid =3108 and vapaateksti in('3','3.0','3.'))		THEN '3 - tutkimus- ja/tai opetusteht�viss� yliopistolla' 
		WHEN (f.kysymysid =3108 and vapaateksti='4')					THEN '4 - muu ty�suhde yliopistolla'
		WHEN (f.kysymysid =3108 and vapaateksti in ('5','5.0'))			THEN '5 - tutkimus- ja/tai opetusteht�viss� ammattikorkeakoulussa tai muussa tutkimuslaitoksessa kuin yliopistossa'
		WHEN (f.kysymysid =3108 and vapaateksti in ('6','6.0','6.'))	THEN '6 - ansioty�ss� yliopiston ulkopuolella'
		WHEN (f.kysymysid =3108 and vapaateksti in ('7','7.0'))			THEN '7 - rahoitus Akatemian projektin kautta'
		WHEN (f.kysymysid =3108 and vapaateksti in ('8','8.0','8.'))	THEN '8 - rahoitus muun kuin Akatemian projektin kautta'
		WHEN (f.kysymysid =3108 and vapaateksti in ('9','9.0','9.'))	THEN '9 - henkil�kohtainen apuraha'
		WHEN (f.kysymysid =3108 and vapaateksti in ('10','10.0'))		THEN '10 - opintotuki'
		WHEN (f.kysymysid =3108 and vapaateksti in ('11','11.0'))		THEN '11 - muu rahoitusl�hde'

		WHEN (f.kysymysid in(3208,3209) and vapaateksti in ('1','1.0', '1.'))	THEN '1 = vakituinen kokop�iv�ty�'
		WHEN (f.kysymysid in(3208,3209) and vapaateksti in('2','2.0', '2.'))	THEN '2 = m��r�aikainen kokop�iv�ty�'
		WHEN (f.kysymysid in(3208,3209) and vapaateksti in('3','3.0','3.'))		THEN '3 = vakituinen osa-aikaty�' 
		WHEN (f.kysymysid in(3208,3209) and vapaateksti in ('4','4.0'))			THEN '4 = m��r�aikainen osa-aikaty�'
		WHEN (f.kysymysid in(3208,3209) and vapaateksti in ('5','5.0'))			THEN '5 = itsen�inen yritt�j�, ammatinharjoittaja tai freelancer'
		WHEN (f.kysymysid in(3208,3209) and vapaateksti in ('6','6.0','6.'))	THEN '6 = apurahatutkija tai apurahataiteilija'
		WHEN (f.kysymysid in(3208,3209) and vapaateksti in ('7','7.0'))			THEN '7 = ty�llistetty tai ty�harjoittelija'
		WHEN (f.kysymysid in(3208,3209) and vapaateksti in ('8','8.0','8.'))	THEN '8 = ty�t�n ty�nhakija'
		WHEN (f.kysymysid in(3208,3209) and vapaateksti in ('9','9.0','9.2'))	THEN '9 = ty�voimakoulutus tai vastaava'
		WHEN (f.kysymysid in(3208,3209) and vapaateksti in ('10','10.0'))		THEN '10 = p��toiminen opiskelu (johtaa tutkintoon tai arvosanaan)'
		WHEN (f.kysymysid in(3208,3209) and vapaateksti in ('11','11.0'))		THEN '11 = perhevapaa(ei ty�suhdetta)'
		WHEN (f.kysymysid in(3208,3209) and vapaateksti in ('12','12.0'))		THEN '12 = perhevapaalla(ei ty�suhdetta)'
		WHEN (f.kysymysid in(3208,3209) and vapaateksti in ('13','13.0'))		THEN '13 = muu'

		WHEN f.kysymysid in (3087,3088,3089,3090,3091,3092,3093,3094,3095,3096,3097,3098,3099,3100) and numerovalinta=1 THEN '1 =  ei lainkaan'
		WHEN f.kysymysid in (3087,3088,3089,3090,3091,3092,3093,3094,3095,3096,3097,3098,3099,3100) and numerovalinta=2 THEN '2 =  vain v�h�n'
		WHEN f.kysymysid in (3087,3088,3089,3090,3091,3092,3093,3094,3095,3096,3097,3098,3099,3100) and numerovalinta=3 THEN '3 =  v�h�n'
		WHEN f.kysymysid in (3087,3088,3089,3090,3091,3092,3093,3094,3095,3096,3097,3098,3099,3100) and numerovalinta=4 THEN '4 =  jonkun verran'
		WHEN f.kysymysid in (3087,3088,3089,3090,3091,3092,3093,3094,3095,3096,3097,3098,3099,3100) and numerovalinta=5 THEN '5 =  paljon'
		WHEN f.kysymysid in (3087,3088,3089,3090,3091,3092,3093,3094,3095,3096,3097,3098,3099,3100) and numerovalinta=6 THEN '6 =  eritt�in paljon'

		WHEN f.kysymysid in (3124,3125,3126,3127,3128,3129,3130,3131,3132) and numerovalinta=1 THEN '1 = ei lainkaan'
		WHEN f.kysymysid in (3124,3125,3126,3127,3128,3129,3130,3131,3132) and numerovalinta=2 THEN '2 = vain v�h�n'
		WHEN f.kysymysid in (3124,3125,3126,3127,3128,3129,3130,3131,3132) and numerovalinta=3 THEN '3 = v�h�n'
		WHEN f.kysymysid in (3124,3125,3126,3127,3128,3129,3130,3131,3132) and numerovalinta=4 THEN '4 = jonkin verran'
		WHEN f.kysymysid in (3124,3125,3126,3127,3128,3129,3130,3131,3132) and numerovalinta=5 THEN '5 = paljon'
		WHEN f.kysymysid in (3124,3125,3126,3127,3128,3129,3130,3131,3132) and numerovalinta=6 THEN '6 = eritt�in paljon'

		WHEN (f.kysymysid = 3143 and vapaateksti='1')		THEN '1 tutkimus'
		WHEN (f.kysymysid = 3143 and vapaateksti='2')		THEN '2 opetus ja kasvatus'
		WHEN (f.kysymysid = 3143 and vapaateksti='3')		THEN '3 hallintoteht�v�t'
		WHEN (f.kysymysid = 3143 and vapaateksti='4')		THEN '4 johto- ja esimiesteht�v�t'
		WHEN (f.kysymysid = 3143 and vapaateksti='5')		THEN '5 konsultointi ja koulutus'
		WHEN (f.kysymysid = 3143 and vapaateksti='6')		THEN '6 asiakasty�/potilasty�'
		WHEN (f.kysymysid = 3143 and vapaateksti='7')		THEN '7 markkinointi ja myynti'
		WHEN (f.kysymysid = 3143 and vapaateksti='8')		THEN '8 suunnittelu ja kehitysteht�v�t'
		WHEN (f.kysymysid = 3143 and vapaateksti='9')		THEN '9 viestint�- ja mediaty�'
		WHEN (f.kysymysid = 3143 and vapaateksti='10')		THEN '10 toimistoteht�v�t'
		WHEN (f.kysymysid = 3143 and vapaateksti='11')		THEN '11 taiteellinen ty�'
		WHEN (f.kysymysid = 3143 and vapaateksti='12')		THEN '12 lainopillinen ty�'
		WHEN (f.kysymysid = 3143 and vapaateksti='13')		THEN '13 kirkollinen ty�'
		WHEN (f.kysymysid = 3143 and vapaateksti='14')		THEN '14 rahoituksen ja taloushallinnon teht�v�t'
		WHEN (f.kysymysid = 3143 and vapaateksti='15')		THEN '15 muu'

		WHEN f.kysymysid in (3144,3145,3146,3147,3148,3149,3150) and numerovalinta = 1 THEN '1 = ei lainkaan'
		WHEN f.kysymysid in (3144,3145,3146,3147,3148,3149,3150) and numerovalinta = 2 THEN '2 = vain v�h�n'
		WHEN f.kysymysid in (3144,3145,3146,3147,3148,3149,3150) and numerovalinta = 3 THEN '3 = v�h�n'
		WHEN f.kysymysid in (3144,3145,3146,3147,3148,3149,3150) and numerovalinta = 4 THEN '4 = jonkin verran'
		WHEN f.kysymysid in (3144,3145,3146,3147,3148,3149,3150) and numerovalinta = 5 THEN '5 = paljon'
		WHEN f.kysymysid in (3144,3145,3146,3147,3148,3149,3150) and numerovalinta = 6 THEN '6 = eritt�in paljon'

		WHEN f.kysymysid in (3160,3161,3162,3163,3164,3165,3166,3167,3168,3169,3170,3171,3172,3173,3174,3175,3176) and numerovalinta=1 THEN '1 = ei lainkaan'
		WHEN f.kysymysid in (3160,3161,3162,3163,3164,3165,3166,3167,3168,3169,3170,3171,3172,3173,3174,3175,3176) and numerovalinta=2 THEN '2 = vain v�h�n'
		WHEN f.kysymysid in (3160,3161,3162,3163,3164,3165,3166,3167,3168,3169,3170,3171,3172,3173,3174,3175,3176) and numerovalinta=3 THEN '3 = v�h�n'
		WHEN f.kysymysid in (3160,3161,3162,3163,3164,3165,3166,3167,3168,3169,3170,3171,3172,3173,3174,3175,3176) and numerovalinta=4 THEN '4 = jonkin verran'
		WHEN f.kysymysid in (3160,3161,3162,3163,3164,3165,3166,3167,3168,3169,3170,3171,3172,3173,3174,3175,3176) and numerovalinta=5 THEN '5 = paljon'
		WHEN f.kysymysid in (3160,3161,3162,3163,3164,3165,3166,3167,3168,3169,3170,3171,3172,3173,3174,3175,3176) and numerovalinta=6 THEN '6 = eritt�in paljon'


ELSE  convert(VARCHAR(3),numerovalinta) 

END,vapaateksti)) AS 'Monivalintavaihtoehto'

,CASE		--kysymykset joissa skaala 0-5 korotetaan skaalaan 1-6/tileinon
			WHEN f.kysymysid in (2922,2924,2953,2954,2914,2919,2920,2921,2923,2926,2929,2940,2942,2944,2946,2952,2955,2958,2959,2960,2961,
								2962,2963,2964,2965,2966,2967,3103,3104,3106,3109,3137,3141,3152,3153,3154,3156,3157,3158,
								3178,3179,3180,3181,3182,3186,3199,3200,3201,3202,3203,3204,3206)  
			THEN numerovalinta+1 ELSE numerovalinta END												AS 'numerovalinta'

,CASE	
			WHEN f.kysymysryhma in ('II  TYYTYV�ISYYS TUTKINTOON','V  TY�LLISTYMISEN LAATU') 
			THEN 'arvosana6' ELSE f.vastaustyyppi  END												AS 'vastaustyyppi'


,vaihtoehto
,valtakunnallinen
----organisaatiomuuttujat
,d_organisaatioluokitus.organisaatio_fi AS 'Korkeakoulu'

,vastaajaid
,lukumaara

--RUOTSI
, f.kyselyvuosi							AS 'Enk�t�r'
,CASE WHEN d7.ika_fi in ('20','21','22','23','24') 
THEN '20�24 �r' ELSE d7.ikaryhma1_sv END as '�ldersgrupp'
,d8.sukupuoli_sv						as 'K�n'
,d9.kieliryhma1_sv						as 'Modersm�l'
,d_organisaatioluokitus.organisaatio_sv AS 'H�gskola'
,d_kieli.kieli_sv						AS 'Utbildningens spr�k'
,d_alueluokitus.kunta_sv				AS 'Utbildningens kommun'
,d_alueluokitus.maakunta_sv				AS 'Utbildningens landskap'
,d_arvokyselykerta.kysely_sv
,d_arvokysymys.kysymysryhma_sv			AS 'Fr�gegrupp'
,d_arvokysymys.kysymys_sv				AS 'Fr�ga'

--,coalesce(monivalintavaihtoehto_sv,case when vaihtoehto=1 then 'Ja' when vaihtoehto=0 then 'Nej' end) as 'Flervalsalternativ'
,LOWER(coalesce(monivalintavaihtoehto_en,CASE 
WHEN f.kysymysryhma in ('VI  TY� JA OSAAMINEN (2/3)','VI  TY� JA OSAAMINEN (3/3)') and numerovalinta=1 THEN '1 = Inte alls'
WHEN f.kysymysryhma in ('VI  TY� JA OSAAMINEN (2/3)','VI  TY� JA OSAAMINEN (3/3)') and numerovalinta=2 THEN '2 = Bara lite'
WHEN f.kysymysryhma in ('VI  TY� JA OSAAMINEN (2/3)','VI  TY� JA OSAAMINEN (3/3)') and numerovalinta=3 THEN '3 = N�gra'
WHEN f.kysymysryhma in ('VI  TY� JA OSAAMINEN (2/3)','VI  TY� JA OSAAMINEN (3/3)') and numerovalinta=4 THEN '4 = Ganska mycket'
WHEN f.kysymysryhma in ('VI  TY� JA OSAAMINEN (2/3)','VI  TY� JA OSAAMINEN (3/3)') and numerovalinta=5 THEN '5 = Mycket'
WHEN f.kysymysryhma in ('VI  TY� JA OSAAMINEN (2/3)','VI  TY� JA OSAAMINEN (3/3)') and numerovalinta=6 THEN '6 = Verkligen mycket'
ELSE  convert(VARCHAR(3),numerovalinta) 

END,vapaateksti)) AS  'Flervalsalternativ'


,d_koulutusluokitus.koulutusastetaso1_sv	AS 'Utbildningsniv�, niv� 1'
,d_koulutusluokitus.koulutusastetaso2_sv	AS 'Utbildningsniv�, niv� 2'
,d_koulutusluokitus.koulutusalataso1_sv		AS 'Utbildningsomr�de, niv� 1'
,d_koulutusluokitus.koulutusalataso2_sv		AS 'Utbildningsomr�de, niv� 2'
,d_koulutusluokitus.koulutusalataso3_sv		AS 'Utbildningsomr�de, niv� 3'
,d_koulutusluokitus.okmohjauksenala_sv		AS 'UKM-styrningsomr�de'
,d_koulutusluokitus.koulutusluokitus_sv		AS 'Utbildningsben�mning'

--ENGLANTI
,f.kyselyvuosi								AS 'Survey year'
,CASE WHEN d7.ika_fi in ('20','21','22','23','24') 
THEN 'Aged 20�24' ELSE d7.ikaryhma1_en END as 'Age group'
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
WHEN f.kysymysryhma in ('VI  TY� JA OSAAMINEN (2/3)','VI  TY� JA OSAAMINEN (3/3)') and numerovalinta=1 THEN '1 = Not at all'
WHEN f.kysymysryhma in ('VI  TY� JA OSAAMINEN (2/3)','VI  TY� JA OSAAMINEN (3/3)') and numerovalinta=2 THEN '2 = Just a little'
WHEN f.kysymysryhma in ('VI  TY� JA OSAAMINEN (2/3)','VI  TY� JA OSAAMINEN (3/3)') and numerovalinta=3 THEN '3 = Some'
WHEN f.kysymysryhma in ('VI  TY� JA OSAAMINEN (2/3)','VI  TY� JA OSAAMINEN (3/3)') and numerovalinta=4 THEN '4 = Quite a lot'
WHEN f.kysymysryhma in ('VI  TY� JA OSAAMINEN (2/3)','VI  TY� JA OSAAMINEN (3/3)') and numerovalinta=5 THEN '5 = A lot'
WHEN f.kysymysryhma in ('VI  TY� JA OSAAMINEN (2/3)','VI  TY� JA OSAAMINEN (3/3)') and numerovalinta=6 THEN '6 = Very much'
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

--J�rjestys
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

,convert(int,	case when f.kysymysid in (2942,2946)							---VASTAUSTEN J�RJESTYSNUMEROT
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
('Kesto yhteens� (ilmoita kesto kuukausina)'
,'Kesto yhteens� (ilmoita kesto kuukausina):'
,'11.  Mik� on keskim��r�inen bruttopalkkasi tai kuukausitulosi (s��nn�lliset lis�t, luontoisetujen verotusarvot ja ylity�korvaukset mukaan lukien)?'
,'21. Mik� on keskim��r�inen bruttopalkkasi tai kuukausitulosi (s��nn�lliset lis�t, luontoisetujen verotusarvot ja ylity�korvaukset mukaan lukien)?'
,'Ty�tt�myysjaksojen lukum��r�'
,'Kesto kuukausina'
,'Kesto yhteens� kuukausina'
,'Jos vastasit osa-aikaisesti, niin paljonko v�it�skirjatutkimukseen / tohtorin opinn�ytteeseen ty�ajasta k�ytetty % -osuus oli:'
,'Kuinka monta kertaa?')
and f.kysymysid not in (3194,3190)																							--poistetaan tohtorikysymykset (c) Suorittamisvuosi, c)  Suorittamisvuosi)
and f.kysymysryhma <>'Ty�n kansainv�lisyys'																					--poistetaan kysymysryhm� "Ty�n kansainv�lisyys"
and coalesce(f.monivalintavaihtoehto_fi,convert(varchar(3),f.numerovalinta),convert(varchar(3),vapaateksti)) is not null	--poistetaan rivit joissa numerovalinta, monivalinta ja vapaateksti ovat tyhji� (=tyhj� vastaus)
--and f.kysymysid not in (3141, 3206,3106, 3108)  --aiheuttavat sen ett� monivalintanumeron j�rjestyslukua ei voi asettaa tabulaarissa
--and numerovalinta is not null
UNION ALL

SELECT  
		null as kysymysid
	  , [Ik� (valmistuessa)]
      ,CASE 
			WHEN [Ik�ryhm� (valmistuessa)] in ('20','21','22','23','24') Then '20�24-vuotiaat'
			ELSE [Ik�ryhm� (valmistuessa)]
	   END AS [Ik�ryhm� (valmistuessa)]
      ,[Sukupuoli]
      ,CASE 
			WHEN �idinkieli = 'suomi' OR �idinkieli = 'pohjoissaame' THEN 'suomi (sis. saame)'
			WHEN �idinkieli = 'ruotsi' THEN 'ruotsi'
			WHEN �idinkieli = 'Tieto puuttuu' THEN 'Tieto puuttuu'
			ELSE 'muut kielet' 
		END AS [�idinkieli]
      ,[Kansalaisuus]
      ,[Kansalaisuus (maanosa)]
      ,[Asuinkunta]
     ,[Asuinmaakunta]
     ,[Laajuus]
      ,[P��aine]
     ,[Arvosana]
      ,[Asteikko]
      ,[Valintavuosi]
      ,[Valmistumisvuosi]
      ,[L�sn�olo (lukukausia)]
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
     ,[Kysymysryhm�]
      ,[Kysymys]
	 , CASE 
		WHEN Rahoitusmallikysymys = 'Kyll�' THEN
		CASE
			WHEN Kysymys like '%Koulutus antoi riitt�v�t valmiudet ty�el�m��n%' THEN '1. Koulutus antoi riitt�v�t valmiudet ty�el�m��n.'
			WHEN Kysymys like '%Miten tyytyv�inen olet kokonaisuudessaan vuonna%' THEN '2. Miten tyytyv�inen olet kokonaisuudessaan vuonna x suorittamaasi tutkintoon ty�urasi kannalta?'
			WHEN Kysymys like '%Pystyn hy�dynt�m��n yliopistossa oppimiani tietoja ja taitoja nykyisess� ty�ss�ni hyvin%' THEN '3. Pystyn hy�dynt�m��n yliopistossa oppimiani tietoja ja taitoja nykyisess� ty�ss�ni hyvin.'
			WHEN Kysymys like '%Ty�ni vastaa vaativuustasoltaan hyvin yliopistollista koulutustani%' THEN '4. Ty�ni vastaa t�ll� hetkell� vaativuustasoltaan hyvin yliopistollista koulutustani.'
			WHEN Kysymys like '%analyyttiset%' THEN '1) analyyttiset, systemaattisen ajattelun taidot'
			WHEN Kysymys like '%tiedonhankinta%' THEN '2) tiedonhankintataidot'
			WHEN Kysymys like '%kyky oppia%' THEN '3) kyky oppia ja omaksua uutta'
			WHEN Kysymys like '%tieteiden%' THEN '4) tieteidenv�lisyys/moniammatillisissa ryhmiss� toimiminen'
			WHEN Kysymys like '%itseohjautuvuus%' THEN '5) itseohjautuvuus/oma-aloitteisuus'
			WHEN Kysymys like '%yritt�jyys%' THEN '6) yritt�jyystaidot'
			ELSE NULL
		END
		ELSE NULL
	END as 'Kysymys (rahoitusmalli)'
	,CASE 
		WHEN Rahoitusmallikysymys = 'Kyll�' THEN
		CASE 
			WHEN Kysymys like '%Koulutus antoi riitt�v�t valmiudet ty�el�m��n%' THEN '1. Utbildningen gav tillr�ckliga f�rdigheter f�r arbetslivet.'
			WHEN Kysymys like '%Miten tyytyv�inen olet kokonaisuudessaan vuonna%' THEN '2. Med tanke p� din karri�r, hur n�jd �r du med den examen du avlade �r x i sin helhet?'
			WHEN Kysymys like '%Pystyn hy�dynt�m��n yliopistossa oppimiani tietoja ja taitoja nykyisess� ty�ss�ni hyvin%' THEN '3. Jag kan i mitt nuvarande arbete utnyttja v�l de kunskaper och f�rdigheter som jag l�rt mig vid universitetet.'
			WHEN Kysymys like '%Ty�ni vastaa vaativuustasoltaan hyvin yliopistollista koulutustani%' THEN '4. Kravniv�n p� mitt arbete motsvarar v�l min universitetsutbildning.'
			WHEN Kysymys like '%analyyttiset%' THEN '1) f�rdigheter f�r analytiskt och systematiskt t�nkande'
			WHEN Kysymys like '%tiedonhankinta%' THEN '2) f�rdigheter i informationss�kning'
			WHEN Kysymys like '%kyky oppia%' THEN '3) f�rm�ga att l�ra sig och till�gna sig nytt'
			WHEN Kysymys like '%tieteiden%' THEN '4) tv�rvetenskaplighet/fungera i m�ngprofessionella grupper'
			WHEN Kysymys like '%itseohjautuvuus%' THEN '5) sj�lvstyrande/eget initiativtagande'
			WHEN Kysymys like '%yritt�jyys%' THEN '6) entrepren�rs-/f�retagarf�rm�ga'
			ELSE NULL
		END
		ELSE NULL
	END as 'Fr�ga (finansieringsmodell)'
	,CASE 
		WHEN Rahoitusmallikysymys = 'Kyll�' THEN
		CASE 
			WHEN Kysymys like '%Koulutus antoi riitt�v�t valmiudet ty�el�m��n%' THEN '1. The studies equipped me sufficiently for the working life.'
			WHEN Kysymys like '%Miten tyytyv�inen olet kokonaisuudessaan vuonna%' THEN '2. How satisfied are you overall with the degree you completed in year x in terms of your career?'
			WHEN Kysymys like '%Pystyn hy�dynt�m��n yliopistossa oppimiani tietoja ja taitoja nykyisess� ty�ss�ni hyvin%' THEN '3. The skills and knowledge I learned at the university can be applied well in my current job.'
			WHEN Kysymys like '%Ty�ni vastaa vaativuustasoltaan hyvin yliopistollista koulutustani%' THEN '4. The requirements of my current job correspond well with my academic qualifications.'
			WHEN Kysymys like '%analyyttiset%' THEN '1) analytical and systematic thinking skills'
			WHEN Kysymys like '%tiedonhankinta%' THEN '2) information retrieval skills'
			WHEN Kysymys like '%kyky oppia%' THEN '3) ability to learn and adopt new things'
			WHEN Kysymys like '%tieteiden%' THEN '4) interdisciplinary/multi-professional teamwork'
			WHEN Kysymys like '%itseohjautuvuus%' THEN '5) self-direction/initiative'
			WHEN Kysymys like '%yritt�jyys%' THEN '6) entrepreneurship skills'
			ELSE NULL
		END
		ELSE NULL
	END as 'Question (funding model)'
    , [Kyselypohja]
     ,[Kyselyvuosi]
	 ,[Kyselyvuosi] as 'Tilastovuosi'
      ,[Rahoitusmallikysymys]
	  ,CASE WHEN [Rahoitusmallikysymys] = 'Kyll�' THEN 'Ja' ELSE 'Nej' END 	AS 'Finansieringsmodellfr�ga'
	  ,CASE WHEN [Rahoitusmallikysymys] = 'Kyll�' THEN 'Yes' ELSE 'No' END  AS 'Funding modell question'
	  ,[Rahoituskysymys_paino]

	  -- CSCVIPUNEN-3471
      ,CASE 
		WHEN Kysymys = '5. Mik� seuraavista vaihtoehdoista kuvaa parhaiten t�h�nastisen ty�urasi kokonaisuutta?'  and Kyselyvuosi IN (2021, 2022) THEN 'Vastauksia ei ker�tty vuosina 2021 ja 2022'
		ELSE [Monivalintavaihtoehto]
	  END as Monivalintavaihtoehto
      ,CASE 
		WHEN Kysymys = '5. Mik� seuraavista vaihtoehdoista kuvaa parhaiten t�h�nastisen ty�urasi kokonaisuutta?'  and Kyselyvuosi IN (2021, 2022) THEN NULL
		ELSE numerovalinta
	  END as numerovalinta
      ,case when Kysymysryhm� in ('III  TOHTORIKOULUTUS JA SEN MERKITYS (4/4). Arvioi, miten seuraavat tekij�t ovat vaikuttaneet ty�llistymiseesi valmistumisen j�lkeen?', 'VI TY� JA OSAAMINEN (1/3). Arvioi, miten seuraavat tekij�t ovat vaikuttaneet ty�llistymiseesi valmitumisen j�lkeen?')
			then 'arvosana6'
			else [vastaustyyppi]
			end
		as 'vastaustyyppi'

      ,[vaihtoehto]
      ,[valtakunnallinen]
     ,[Korkeakoulu]
     ,[vastaajaid]
     ,[lukumaara]
    ,[Kyselyvuosi] as 'Enk�t�r'
	,CASE 
			WHEN [�ldersgrupp] in ('20','21','22','23','24') Then '20�24 �r'
			ELSE [�ldersgrupp]
	END AS [�ldersgrupp]
	,[K�n]
	,CASE 
			WHEN �idinkieli = 'suomi' OR �idinkieli = 'pohjoissaame' THEN 'finska (inkl. samiska)'
			WHEN �idinkieli = 'ruotsi' THEN 'svenska'
			WHEN �idinkieli = 'Tieto puuttuu' THEN 'Information saknas'
			ELSE '�vriga spr�k' 
		END AS [Modersm�l]
	  ,[H�gskola]
      ,[Utbildningens spr�k]
      ,[Utbildningens kommun]
      ,[Utbildningens landskap]
      ,[kysely_sv]
      ,[Fr�gegrupp]
      ,[Fr�ga]
	  -- CSCVIPUNEN-3471
      ,CASE 
		WHEN Kysymys = '5. Mik� seuraavista vaihtoehdoista kuvaa parhaiten t�h�nastisen ty�urasi kokonaisuutta?'  and Kyselyvuosi IN (2021, 2022) THEN 'Svar har inte samlats in �ren 2021 och 2022'
		ELSE [Flervalsalternativ]
	  END as Flervalsalternativ
      ,[Utbildningsniv�, niv� 1]
      ,[Utbildningsniv�, niv� 2]
      ,[Utbildningsomr�de, niv� 1]
      ,[Utbildningsomr�de, niv� 2]
      ,[Utbildningsomr�de, niv� 3]
      ,[UKM-styrningsomr�de]
      ,[Utbildningsben�mning]
     --ENGLANTI
	  ,[Kyselyvuosi] as 'Survey year'
	  ,CASE 
			WHEN [Age group] in ('20','21','22','23','24') Then 'Aged 20�24'
			ELSE [Age group] 
	  END AS [Age group]
	  ,[Gender] 
	  ,CASE 
			WHEN �idinkieli = 'suomi' OR �idinkieli = 'pohjoissaame' THEN 'Finnish (incl. S�mi)'
			WHEN �idinkieli = 'ruotsi' THEN 'Swedish'
			WHEN �idinkieli = 'Tieto puuttuu' THEN 'Missing data'
			ELSE 'other languages' 
		END AS [Native language]
	  ,[Higher education institution]
      ,[Language of education]
      ,[Municipality of education]
      ,[Region of education]
      ,[kysely_en]
      ,[Question group]
      ,[Question]
	  -- CSCVIPUNEN-3471
      ,CASE 
		WHEN Kysymys = '5. Mik� seuraavista vaihtoehdoista kuvaa parhaiten t�h�nastisen ty�urasi kokonaisuutta?'  and Kyselyvuosi IN (2021, 2022) THEN 'Answers were not collected in years 2021 and 2022'
		ELSE [Multiple choice option]
	  END as [Multiple choice option]
      ,[Level of education, tier 1]
      ,[Level of education, tier 2]
      ,[Field of education, tier 1]
      ,[Field of education, tier 2]
      ,[Field of education, tier 3]
      ,[Field of education, HE steering]
      ,[Name of education]
      ,CASE WHEN SUBSTRING(@@SERVERNAME,4,1) = 'T' THEN 1 WHEN [Kyselyvuosi] < YEAR(GETDATE())-1 THEN 1 ELSE 1 END AS vuosi_tilasto
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
	  ,CASE 
			WHEN �idinkieli = 'suomi' OR �idinkieli = 'pohjoissaame' THEN 1
			WHEN �idinkieli = 'ruotsi' THEN 2
			WHEN �idinkieli = 'Tieto puuttuu' THEN 99999
			ELSE 3 
		END AS [jarjestys_kieli]
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
		WHEN Kysymys = '5. Mik� seuraavista vaihtoehdoista kuvaa parhaiten t�h�nastisen ty�urasi kokonaisuutta?'  and Kyselyvuosi IN (2021, 2022) THEN 99
		WHEN [ANTERO].dw.f_arvo_yo_uraseuranta_2018.kysymys='8. Jos olet toiminut yritt�j�n�, a) kuinka monessa yrityksess� olet ollut perustajana/osakkaana valmistumisesi j�lkeen?'   AND numerovalinta > 2	THEN 3
		WHEN [ANTERO].dw.f_arvo_yo_uraseuranta_2018.kysymys='6. Kuinka monen ty�nantajan palveluksessa olet ollut valmistumisesi j�lkeen (ml. nykyinen ty�nantajasi)?'					AND numerovalinta>4		THEN 5
		WHEN [ANTERO].dw.f_arvo_yo_uraseuranta_2018.Kysymys='b) Kuinka monta henkil�� yrityksesi ovat yhteens� ty�llist�neet itsesi lis�ksi?'											AND numerovalinta >4	THEN 5 
		
		--kysymys 18.  Kuinka rahoitit tohtoriopintosi?(vuodet 2018&2019)
		
		WHEN [ANTERO].dw.f_arvo_yo_uraseuranta_2018.monivalintavaihtoehto ='1  v�it�skirjaty�h�n liittyv� ty�suhde yliopistolla (esim. tohtorikoulutettava, v�it�skirjatutkija, projektitutkija tms.)' then 1
		WHEN [ANTERO].dw.f_arvo_yo_uraseuranta_2018.monivalintavaihtoehto ='2  muu ty�suhde yliopistolla'	THEN 2
		WHEN [ANTERO].dw.f_arvo_yo_uraseuranta_2018.monivalintavaihtoehto ='3  ty�suhde tutkimuslaitoksessa' THEN 3
		WHEN [ANTERO].dw.f_arvo_yo_uraseuranta_2018.monivalintavaihtoehto ='4  tutkimus- ja/tai opetusteht�viss� ammattikorkeakoulussa' THEN 4
		WHEN [ANTERO].dw.f_arvo_yo_uraseuranta_2018.monivalintavaihtoehto ='5  henkil�kohtainen apuraha' THEN 5
		WHEN [ANTERO].dw.f_arvo_yo_uraseuranta_2018.monivalintavaihtoehto ='6  ansioty�ss� yliopiston ulkopuolella' THEN 6
		WHEN [ANTERO].dw.f_arvo_yo_uraseuranta_2018.monivalintavaihtoehto ='7  opintotuki' THEN 7
		WHEN [ANTERO].dw.f_arvo_yo_uraseuranta_2018.monivalintavaihtoehto ='8  muu rahoitusl�hde,' then 8
		
		--kysymys 20.  Suorititko tohtorin tutkinnon ensisijaisesti
		WHEN [ANTERO].dw.f_arvo_yo_uraseuranta_2018.monivalintavaihtoehto ='1  kokop�iv�isesti' then 1
		WHEN [ANTERO].dw.f_arvo_yo_uraseuranta_2018.monivalintavaihtoehto ='2  osa-aikaisesti' then 2
		WHEN [ANTERO].dw.f_arvo_yo_uraseuranta_2018.monivalintavaihtoehto ='3  vapaa-ajalla muun p��ty�n ohella' then 3

		--kysymys 13. Mitk� seuraavista kuvaavat parhaiten t�m�nhetkisten ty�teht�viesi luonnetta? (2018)

		WHEN [ANTERO].dw.f_arvo_yo_uraseuranta_2018.kysymys='13. Mitk� seuraavista kuvaavat parhaiten t�m�nhetkisten ty�teht�viesi luonnetta?' and [ANTERO].dw.f_arvo_yo_uraseuranta_2018.kyselyvuosi = 2018 THEN
			CASE WHEN SUBSTRING([ANTERO].dw.f_arvo_yo_uraseuranta_2018.monivalintavaihtoehto,1,2) not in ('10', '11', '12', '13', '14') THEN CAST(SUBSTRING([ANTERO].dw.f_arvo_yo_uraseuranta_2018.monivalintavaihtoehto,1,1) as int)
			ELSE CAST(SUBSTRING([ANTERO].dw.f_arvo_yo_uraseuranta_2018.monivalintavaihtoehto,1,2) as int) END

		ELSE [jarjestys_monivalinta]
		
		END  AS [jarjestys_monivalinta],
		CASE 
		WHEN Rahoitusmallikysymys = 'Kyll�' THEN
		CASE
			WHEN Kysymys like '%Koulutus antoi riitt�v�t valmiudet ty�el�m��n%' THEN 1
			WHEN Kysymys like '%Miten tyytyv�inen olet kokonaisuudessaan vuonna%' THEN 2
			WHEN Kysymys like '%Pystyn hy�dynt�m��n yliopistossa oppimiani tietoja ja taitoja nykyisess� ty�ss�ni hyvin%' THEN 3
			WHEN Kysymys like '%Ty�ni vastaa vaativuustasoltaan hyvin yliopistollista koulutustani%' THEN 4
			WHEN Kysymys like '%analyyttiset%' THEN 5
			WHEN Kysymys like '%tiedonhankinta%' THEN 6
			WHEN Kysymys like '%kyky oppia%' THEN 7
			WHEN Kysymys like '%tieteiden%' THEN 8
			WHEN Kysymys like '%itseohjautuvuus%' THEN 9
			WHEN Kysymys like '%yritt�jyys%' THEN 10
			ELSE NULL
		END
		ELSE NULL
	END as 'jarjestys_kysymys_rahoitusmalli'
FROM [ANTERO].dw.f_arvo_yo_uraseuranta_2018 

GO

USE [ANTERO]