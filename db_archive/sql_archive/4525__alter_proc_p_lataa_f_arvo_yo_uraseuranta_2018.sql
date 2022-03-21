USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_arvo_yo_uraseuranta_2018]    Script Date: 8.4.2021 15:22:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









ALTER PROCEDURE [dw].[p_lataa_f_arvo_yo_uraseuranta_2018] AS

TRUNCATE TABLE dw.f_arvo_yo_uraseuranta_2018

INSERT INTO dw.f_arvo_yo_uraseuranta_2018 (
	[Ikä (valmistuessa)]
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
	  ,[Rahoituskysymys_paino]
      ,[Monivalintavaihtoehto]
      ,[numerovalinta]
      ,[vastaustyyppi]
      ,[vaihtoehto]
      ,[valtakunnallinen]
      ,[Korkeakoulu]
      ,[vastaajaid]
      ,[lukumaara]
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
      ,[Gender]
	  ,[Age group]
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
      ,[jarjestys_monivalinta]

)


SELECT  
	   case when cast(d_ika.ika_fi as varchar) = '-1'
			 then 'Tieto puuttuu'
			 else d_ika.ika_fi
			 end 															as [Ikä (valmistuessa)]
      ,coalesce(d_ika.ikaryhma1_fi,'Tieto puuttuu')							as [Ikäryhmä (valmistuessa)]
      ,coalesce(d_sukupuoli.sukupuoli_fi,'Tieto puuttuu')					as [Sukupuoli]
      ,coalesce(d_kieli.kieli_fi,'Tieto puuttuu')							as [Äidinkieli]
      ,coalesce(d_maatjavaltiot2.maatjavaltiot2_fi,'Tieto puuttuu')			as [Kansalaisuus]
      ,coalesce(d_maatjavaltiot2.maanosa_fi,'Tieto puuttuu')				as [Kansalaisuus (maanosa)]
      , 'Ei tiedossa'														as [Asuinkunta]
      , 'Ei tiedossa'														as [Asuinmaakunta]
      , null																as [Laajuus]
      , 'Ei tiedossa' 	 													as [Pääaine]
      , 'Ei tiedossa'														as [Arvosana]
      , 'Ei tiedossa'														as [Asteikko]
      , null																as [Valintavuosi]
      , null																as [Valmistumisvuosi]
      , 'Ei tiedossa'														as [Läsnäolo (lukukausia)]
      , null																as [Kirjoillaolo (kuukausia)]
      , coalesce(dw.d_koulutusluokitus.koulutusastetaso1_fi,'Tieto puuttuu') as [Koulutusaste, taso 1]
      , coalesce(dw.d_koulutusluokitus.koulutusastetaso2_fi,'Tieto puuttuu') as [Koulutusaste, taso 2]
      , coalesce(dw.d_koulutusluokitus.koulutusalataso1_fi,'Tieto puuttuu')	 as [Koulutusala, taso 1]
      , coalesce(dw.d_koulutusluokitus.koulutusalataso2_fi,'Tieto puuttuu')	 as [Koulutusala, taso 2]
      , coalesce(dw.d_koulutusluokitus.koulutusalataso3_fi,'Tieto puuttuu')	 as [Koulutusala, taso 3]
      , coalesce(dw.d_koulutusluokitus.okmohjauksenala_fi,'Tieto puuttuu')	 as [OKM ohjauksen ala]
      , coalesce(dw.d_koulutusluokitus.koulutusluokitus_fi,'Tieto puuttuu')	 as [Koulutusnimike]
      , 'Ei tiedossa'														 as [Koulutuksen kieli]
      , 'Ei tiedossa'														 as [Koulutuksen kunta]
      , 'Ei tiedossa'														 as [Koulutuksen maakunta]
      , 'Ei tiedossa' 														 as [Kysely] --> dw.d_arvokyselykerta
      , 'Ei tiedossa' 														 as [Kyselykerta]
      ,CASE		-- LISÄTÄÄN MONIVALINTAKYSYMYSTEN KYSYMYSRYHMÄÄN KYSYMYKSEN ALIOTSIKKO
			WHEN kysymykset.kysymysryhma_fi='III  TOHTORIKOULUTUS JA SEN MERKITYS (2/4)'	THEN 'III  TOHTORIKOULUTUS JA SEN MERKITYS (2/4). Kuinka tärkeitä seuraavat tiedot ja taidot ovat työssäsi'	
			WHEN kysymykset.kysymysryhma_fi='III  TOHTORIKOULUTUS JA SEN MERKITYS (3/4)'	THEN 'III  TOHTORIKOULUTUS JA SEN MERKITYS (3/4). Miten tohtorikoulutus kehitti kyseisiä valmiuksia?'
			WHEN kysymykset.kysymysryhma_fi='III  TOHTORIKOULUTUS JA SEN MERKITYS (4/4)'	THEN 'III  TOHTORIKOULUTUS JA SEN MERKITYS (4/4). Arvioi, miten seuraavat tekijät ovat vaikuttaneet työllistymiseesi valmistumisen jälkeen?'
			WHEN kysymykset.kysymysryhma_fi='VI TYÖ JA OSAAMINEN (1/3)'						THEN 'VI TYÖ JA OSAAMINEN (1/3). Arvioi, miten seuraavat tekijät ovat vaikuttaneet työllistymiseesi valmitumisen jälkeen?'
			WHEN kysymykset.kysymysryhma_fi='VI TYÖ JA OSAAMINEN (2/3)'						THEN 'VI TYÖ JA OSAAMINEN (2/3). Kuinka tärkeitä seuraavat tiedot ja taidot ovat työssäsi'	
			WHEN kysymykset.kysymysryhma_fi='VI TYÖ JA OSAAMINEN (3/3)'						THEN 'VI TYÖ JA OSAAMINEN (3/3). Miten yliopisto-opiskelu kehitti kyseisiä valmiuksia?'	
			ELSE kysymykset.kysymysryhma_fi END								as [Kysymysryhmä]
      ,kysymykset.kysymys_fi												as [Kysymys]
      ,f1.kyselypohja														as [Kyselypohja]
      ,f1.kyselyvuosi														as [Kyselyvuosi]
      , case when f1.kysymysnumero in 
	  ( 6803, 6805,6836,6837,6889,6890,6908,6910,6913,6914						--vuoden 2018 kysymykset
	  ,8364, 8366, 8397, 8398, 8447, 8450, 8451, 8469, 8471, 8474, 8475         -- vuoden 2019 kysymykset
	  ,10228, 10227, 10224, 10222, 10204, 10203, 10151, 10150, 10119, 10117)    -- vuoden 2019 kysymykset		
		THEN 'Kyllä' Else 'Ei' End 											as [Rahoitusmallikysymys]
		,case					
			when kysymysryhma_fi = 'VI TYÖ JA OSAAMINEN (3/3)' then 1 / 6.0
			else 1.0
		end			as rahoituskysymys_paino									
      , f1.vastaus_arvo														as [Monivalintavaihtoehto]
      , f1.Vastaus_alkuperäinen												as [numerovalinta]
      ,CASE 
			WHEN kysymykset.kysymysid in (6821,6805,6950, 8366, 8382)
			THEN 'arvosana6' 
			ELSE kysymykset.vastaustyyppi END								as [vastaustyyppi]
      , null 																as [vaihtoehto]
      , null																as [valtakunnallinen]
      , dw.d_organisaatioluokitus.organisaatio_fi							as [Korkeakoulu]
      , f1.Index_vastaajaid												    as [vastaajaid]
      , 1																	as [lukumaara]
      --RUOTSINKIELISET KENTÄT
	  , coalesce(d_ika.ikaryhma1_sv,'Information saknas')					as [Åldersgrupp]
	  , coalesce(d_sukupuoli.sukupuoli_sv,'Information saknas')				as [Kön]
	  , coalesce(d_kieli.kieli_sv,'Information saknas')						as [Modersmål]
	  ,	dw.d_organisaatioluokitus.organisaatio_sv							as [Högskola]
      ,'Tieto puuttuu' as [Utbildningens språk]
      ,'Tieto puuttuu' as [Utbildningens kommun]
      ,'Tieto puuttuu' as [Utbildningens landskap]
      ,'Tieto puuttuu' as [kysely_sv]
      , kysymykset.kysymysryhma_sv											as [Frågegrupp]
      , kysymykset.kysymys_sv												as [Fråga]
      , f1.vastaus_sv														as [Flervalsalternativ]
      , dw.d_koulutusluokitus.koulutusastetaso1_sv							as [Utbildningsnivå, nivå 1]
      , dw.d_koulutusluokitus.koulutusastetaso2_sv							as [Utbildningsnivå, nivå 2]
      , dw.d_koulutusluokitus.koulutusalataso1_sv							as [Utbildningsområde, nivå 1]
      , dw.d_koulutusluokitus.koulutusalataso2_sv							as [Utbildningsområde, nivå 2]
      , dw.d_koulutusluokitus.koulutusalataso3_sv							as [Utbildningsområde, nivå 3]
      ,	dw.d_koulutusluokitus.okmohjauksenala_sv							as [UKM-styrningsområde] 
      , dw.d_koulutusluokitus.koulutusluokitus_sv							as [Utbildningsbenämning]
      
	  --ENGLANNIN KIELISET KENTÄT
	  ,coalesce(d_sukupuoli.sukupuoli_en,'Missing data')					as [Gender]
	  ,coalesce(d_ika.ikaryhma1_en,'Missing data')							as [Age group]	
	  ,coalesce(d_kieli.kieli_en,'Missing data')							as [Native language]
	  ,dw.d_organisaatioluokitus.organisaatio_en							as [Higher education institution]
      ,'Missing data'														as [Language of education]
      ,'Missing data'														as [Municipality of education]
      ,'Missing data'														as [Region of education]
      ,'Missing data'														as [kysely_en]
      ,kysymykset.kysymysryhma_en											as [Question group]
      ,kysymykset.kysymys_en												as [Question]
      ,f1.vastaus_en														as  [Multiple choice option]    ---HUOM!!!!
      ,coalesce(dw.d_koulutusluokitus.koulutusastetaso1_en,'Missing data')	as [Level of education, tier 1]
      ,coalesce(dw.d_koulutusluokitus.koulutusastetaso2_en,'Missing data')	as [Level of education, tier 2]
      ,coalesce(dw.d_koulutusluokitus.koulutusalataso1_en,'Missing data')	as [Field of education, tier 1]
      ,coalesce(dw.d_koulutusluokitus.koulutusalataso2_en,'Missing data')	as [Field of education, tier 2]
      ,coalesce(dw.d_koulutusluokitus.koulutusalataso2_en,'Missing data')	as [Field of education, tier 3]
      ,coalesce(dw.d_koulutusluokitus.okmohjauksenala_en,'Missing data')	as [Field of education, HE steering]
      ,coalesce(dw.d_koulutusluokitus.koulutusluokitus_sv,'Missing data')	as [Name of education]
      
	  --KOODIT
	  ,1											 							as [vuosi_tilasto] -- arvo tarvitaan mittareissa
      ,0											 							as [ura_amk]
      ,0											 							as [ura_yamk]
      ,0											 							as [ura_kandi]
      ,CASE WHEN f1.kyselypohja='URASEURANTA-MAISTERI' THEN 1 ELSE 0 END	 	as [ura_maisteri]
      ,CASE WHEN f1.kyselypohja='URASEURANTA-TOHTORI' THEN  1 ELSE 0 END	 	as [ura_tohtori]
      ,CASE WHEN len(d8.Oppilaitoskoodi) < 5 THEN '0' + d8.Oppilaitoskoodi ELSE d8.Oppilaitoskoodi END as [Koodit Korkeakoulu]
      ,cast(left(f2.koulutusalakoodi, 6) as int) as [Koodit Koulutus]
      ,'N/A' as [Koodit Koulutuksen kieli]
      ,null as [Koodit Koulutuksen kunta]
      ,null as [Koodit Koulutuksen maakunta]

	  --JÄRJESTYKSET
      ,coalesce(nullif(d_ika.jarjestys_ika, -1),9999)							as [jarjestys_ika]
      
	  ,case 
		when f2.sukupuoli is null then 999 
		else d_sukupuoli.jarjestys_sukupuoli_koodi	end							as [jarjestys_sukupuoli]
	  
	  ,d_maatjavaltiot2.jarjestys_maatjavaltiot2_koodi							as [jarjestys_kansalaisuus]
      ,null as [jarjestys_asuinmaakunta]
      ,CASE WHEN kysymykset.kysymysryhma_fi in ('I  TYÖMARKKINATILANNE','I  TYÖMARKKINATILANTEESI','I  TAUSTAKYSYMYKSET')	then 1
			WHEN kysymykset.kysymysryhma_fi in ('II  NYKYINEN TYÖSUHDE JA SEN LAATU','II TYYTYVÄISYYS TUTKINTOON')			then 2
			WHEN kysymykset.kysymysryhma_fi in ('III  TOHTORIKOULUTUS JA SEN MERKITYS (1/4)','III TYÖURAN KOKONAISUUS')		then 3
			WHEN kysymykset.kysymysryhma_fi in ('III  TOHTORIKOULUTUS JA SEN MERKITYS (2/4)','IV TYÖTILANNE')				then 4
			WHEN kysymykset.kysymysryhma_fi in ('III  TOHTORIKOULUTUS JA SEN MERKITYS (3/4)','V TYÖLLISTYMISEN LAATU')		then 5
			WHEN kysymykset.kysymysryhma_fi in ('III  TOHTORIKOULUTUS JA SEN MERKITYS (4/4)','VI TYÖ JA OSAAMINEN (1/3)')	then 6
			WHEN kysymykset.kysymysryhma_fi in ('IV  TOHTORIOPINTOJEN RAHOITUS','VI TYÖ JA OSAAMINEN (2/3)')				then 7
			WHEN kysymykset.kysymysryhma_fi in ('VI TYÖ JA OSAAMINEN (3/3)')												then 8
			WHEN kysymykset.kysymysryhma_fi in ('Uraseurantakyselyn erityisteema 2020: Koronaviruspandemian vaikutukset')	then 9
			else 99 END											as [jarjestys_kysymysryhma]
      ,kysymykset.kysymysjarjestys								as [jarjestys_kysymys]
      ,coalesce(dw.d_koulutusluokitus.jarjestys_okmohjauksenala_koodi,9999)		as [jarjestys_ohjauksenala]
      ,coalesce(dw.d_koulutusluokitus.jarjestys_koulutusastetaso1_koodi,9999)	as [jarjestys_koulutusaste1]
      ,coalesce(dw.d_koulutusluokitus.jarjestys_koulutusastetaso2_koodi,9999)	as [jarjestys_koulutusaste2]
      ,coalesce(dw.d_koulutusluokitus.jarjestys_koulutusalataso1_koodi,9999)	as [jarjestys_koulutusala1]
      ,coalesce(dw.d_koulutusluokitus.jarjestys_koulutusalataso2_koodi,9999)	as [jarjestys_koulutusala2]
      ,coalesce(dw.d_koulutusluokitus.jarjestys_koulutusalataso3_koodi,99999)	as [jarjestys_koulutusala3]
	   
	  ,case when f1.vastaus_arvo is null then '99' 
			when f1.vastaus_arvo ='a)  Olen osallistunut/suorittanut ammatillisen erikoistumiskoulutuksen, pätevöitymiskoulutuksen tms.' 	then '1'
			when f1.vastaus_arvo ='b)  Olen suorittanut muun tutkinnon.' 																	then '2'
			when f1.vastaus_arvo ='c)  Olen suorittanut opintoja tähtäimessä toinen korkeakoulututkinto.' 									then '3'
			when f1.vastaus_arvo ='d)  Olen suorittanut tieteellisiä/taiteellisia jatko-opintoja.' 											then '4'
			when f1.vastaus_arvo ='e)  Olen suorittanut lyhyempiä koulutuksia tai kursseja.' 												then '5'
			when f1.vastaus_arvo ='f)  En ole osallistunut koulutukseen.' 																	then '6'
			when f1.Kysymysnumero in  (8254, 6935, 6933, 8252)     																		    then substring(f1.Vastaus_arvo,1,2)
			else f1.Vastaus_alkuperäinen END					as [jarjestys_monivalinta]
        
  from [ANTERO].SA.sa_arvo_yo_uraseuranta_tohtorit_ja_maisterit f1
  LEFT JOIN [ANTERO].sa.sa_arvo_yo_uraseuranta_taustatiedot f2 on f2.tunnus=f1.Vastaajatunnus
  LEFT JOIN dw.d_ika on d_ika.ika_avain=coalesce(round(f2.ika_valmistuessa,0),-1)							---IKÄ
  LEFT JOIN dw.d_sukupuoli on d_sukupuoli.sukupuoli_koodi=round(f2.sukupuoli,0)								-- SUKUPUOLI
  LEFT JOIN dw.d_kieli on d_kieli.kieli_koodi=f2.aidinkieli													-- KIELI
  LEFT JOIN dw.d_maatjavaltiot2 on d_maatjavaltiot2.maatjavaltiot2_koodi=round(f2.kansalaisuus,0)			-- KANSALAISUUS
  LEFT JOIN dw.d_koulutusluokitus on d_koulutusluokitus.koulutusluokitus_koodi= round(f2.koulutusalakoodi,0)-- KOULUTUSLUOKITUS
  LEFT JOIN dw.d_organisaatioluokitus on d_organisaatioluokitus.organisaatio_koodi=RIGHT('00000'+isnull(f1.organisaatio_koodi,''),5) --ORGANISAATIO, osassa arvoja ei ole etunollia

  LEFT JOIN dw.d_arvokysymys kysymykset on kysymykset.kysymysid=f1.kysymysnumero
 -- LEFT JOIN Arvo_sa.sa.sa_arvo_kysely_kysymysryhma kysymysryhma on kysymysryhma.kysymysryhmaid=kysymykset.kysymysryhmaid
  LEFT JOIN (SELECT DISTINCT * FROM [ANTERO].[sa].[sa_arvo_yo_uraseuranta_oppilaitoskoodit]) d8 on d8.Vastaajatunnus = f1.Vastaajatunnus

WHERE
 kysymykset.kysymysryhma_fi not in 
('VII Kiitos paljon vastauksistasi!',
'V  Kiitos paljon vastauksistasi!'
,'V  Kiitos paljon vastauksistasi!'
,'VII Kiitos paljon vastauksistasi!') 
and kysymykset.vastaustyyppi not in ('vapaateksti', 'luku') OR f1.Kysymysnumero in (8240, 8242, 8254, 6923, 6921, 6935, 10255, 10257, 10269,  10255, 10253, 10269, 10257)
and f1.vastaus_arvo not in ('0 - vaihtoehto ei koske minua')
and f1.Kysymys_arvo in (
 '1. B)  Mikä seuraavista kuvaa parhaiten tilannettasi 6 kk tutkinnon tohtorintutkinnon suorittamisen JÄLKEEN?'
,'1. B)  Mikä edellisistä vaihtoehdoista (kysymys 1A) kuvaa parhaiten tilannettasi 6 kk tutkinnon tohtorintutkinnon suorittamisen JÄLKEEN?'
,'1. C)  Mikä seuraavista kuvaa parhaiten tilannettasi tällä hetkellä?'
,'1. C)  Mikä edellisistä vaihtoehdoista (kysymys 1A) kuvaa parhaiten tilannettasi tällä hetkellä?'
,'8.  Mikä seuraavista kuvaa parhaiten pääasiallisinta työtehtävääsi?'
,'8.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten pääasiallisinta työtehtävääsi. Merkitse vain yhden vaihtoehdon numero.'
,'8.  Valitse edellisen kysymyksen vaihtoehdoista se, joka kuvaa parhaiten pääasiallisinta työtehtävääsi.'
)
/*not in 
('Kesto yhteensä (ilmoita kesto kuukausina)'
,'Kesto yhteensä (ilmoita kesto kuukausina):'
,'11.  Mikä on keskimääräinen bruttopalkkasi tai kuukausitulosi (säännölliset lisät, luontoisetujen verotusarvot ja ylityökorvaukset mukaan lukien)?'
,'21. Mikä on keskimääräinen bruttopalkkasi tai kuukausitulosi (säännölliset lisät, luontoisetujen verotusarvot ja ylityökorvaukset mukaan lukien)?'
,'Työttömyysjaksojen lukumäärä',
'Kesto kuukausina',
'Kesto yhteensä kuukausina',
'Jos vastasit osa-aikaisesti, niin paljonko väitöskirjatutkimukseen / tohtorin opinnäytteeseen työajasta käytetty % -osuus oli:')*/










GO


