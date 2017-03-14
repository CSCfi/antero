-- Valos-näkymä, tehty Valos-tiimiltä K Korhosen kautta saadusta vuosittaisesta csv-aineistosta. Helmi-maaliskuussa vuosittain toimitetaan vuoden n-2 aineisto.
-- CSV importattu kantaan default-asetuksin, jonka jälkeen käsin korjattu y-tunnukset (liikaa nollia alussa) ja kuntakoodit (etunollat puuttuivat).

IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dw].[v_valos_koulutuksenkustannukset]'))
EXEC dbo.sp_executesql @statement = N'

create view dw.v_valos_koulutuksenkustannukset as

SELECT [vuosi] AS ''Tilastovuosi''
	  ,[rekno] AS ''Sektori Koodi''
	  ,d5.nimi AS ''Sektori''
      ,ytunnus AS ''Koulutuksen järjestäjä Koodi''
	  ,d1.organisaatio_fi AS ''Koulutuksen järjestäjä''
      ,[kala] AS ''Rahoituksen koulutusala Koodi''
	  ,d3.nimi AS ''Rahoituksen koulutusala''
      ,[koulumto] AS ''Koulutusmuoto Koodi''
	  ,d2.nimi AS ''Koulutusmuoto''
      ,[OMISTAJA] AS ''Omistajatyyppi Koodi''
	  ,d4.nimi AS ''Omistajatyyppi''
      ,[KUNTA] AS ''Koulutuksen kunta Koodi''
	  ,d9.kunta_fi AS ''Koulutuksen kunta''
	  ,d9.maakunta_koodi AS ''Koulutuksen maakunta Koodi''
	  ,d9.maakunta_fi AS ''Koulutuksen maakunta''
	  ,[VIRKUNTA] AS ''Koulutuksen järjestäjän kunta Koodi''
	  ,d8.kunta_fi AS ''Koulutuksen järjestäjän kunta''
	  ,d8.maakunta_koodi AS ''Koulutuksen järjestäjän maakunta Koodi''
	  ,d8.maakunta_fi AS ''Koulutuksen järjestäjän maakunta''
	  ,RIGHT(menolajitoiminto, 3) AS ''Menolaji Koodi''
	  ,d6.nimi AS ''Menolaji''
	  ,LEFT(menolajitoiminto, 4) AS ''Toiminto Koodi''
	  ,d7.nimi AS ''Toiminto''
      ,[suorite] AS ''Suorite''
FROM
	(SELECT [rekno],[vuosi],[ytunnus],[kala],[koulumto],[OMISTAJA],[KUNTA],[VIRKUNTA],[k010l01],[k010l02],[k010l03],[k020l01],[k020l02],[k020l03],[k030l01],[k030l02],[k030l03],[k040l01],[k040l02],[k040l03],[k060l01],[k060l02],[k060l03],[k070l01],[k070l02],[k070l03],[k080l01],[k080l02],[k080l03],[k090l02],[k090l03]
	  FROM [ANTERO].[sa].[sa_valos_2015]) p
UNPIVOT 
	([suorite] FOR [menolajitoiminto] IN
	  ([k010l01],[k010l02],[k010l03],[k020l01],[k020l02],[k020l03],[k030l01],[k030l02],[k030l03],[k040l01],[k040l02],[k040l03],[k060l01],[k060l02],[k060l03],[k070l01],[k070l02],[k070l03],[k080l01],[k080l02],[k080l03],[k090l02],[k090l03])) AS unpvt
	  LEFT JOIN dw.d_organisaatio d1 ON ytunnus=organisaatio_koodi
	  LEFT JOIN sa.sa_koodistot d2 ON d2.koodisto=''vipunenvaloskoulutusmuoto'' and d2.koodi=koulumto
	  LEFT JOIN sa.sa_koodistot d3 ON d3.koodisto=''vipunenvaloskoulutusala'' and d3.koodi=kala
	  LEFT JOIN sa.sa_koodistot d4 ON d4.koodisto=''vipunenvalosomistajatyyppi'' and d4.koodi=OMISTAJA
	  LEFT JOIN sa.sa_koodistot d5 ON d5.koodisto=''vipunenvalossektori'' and d5.koodi=rekno
	  LEFT JOIN sa.sa_koodistot d6 ON d6.koodisto=''vipunenvalosmenolaji'' and d6.koodi=RIGHT(menolajitoiminto,3)
	  LEFT JOIN sa.sa_koodistot d7 ON d7.koodisto=''vipunenvalostoiminto'' and d7.koodi=LEFT(menolajitoiminto,4)
	  LEFT JOIN dw.d_alueluokitus d8 ON d8.kunta_koodi=VIRKUNTA
	  LEFT JOIN dw.d_alueluokitus d9 ON d9.kunta_koodi=KUNTA

-- Perusopetuksen aamu- ja iltapäivätoiminta ja vammaisopetus, ei toimintoerittelyä
UNION ALL

SELECT [vuosi] AS ''Tilastovuosi''
	  ,[rekno] AS ''Sektori Koodi''
	  ,d5.nimi AS ''Sektori''
      ,ytunnus AS ''Koulutuksen järjestäjä Koodi''
	  ,d1.organisaatio_fi AS ''Koulutuksen järjestäjä''
      ,[kala] AS ''Rahoituksen koulutusala Koodi''
	  ,d3.nimi AS ''Rahoituksen koulutusala''
      ,[koulumto] AS ''Koulutusmuoto Koodi''
	  ,d2.nimi AS ''Koulutusmuoto''
      ,[OMISTAJA] AS ''Omistajatyyppi Koodi''
	  ,d4.nimi AS ''Omistajatyyppi''
      ,[KUNTA] AS ''Koulutuksen kunta Koodi''
	  ,d9.kunta_fi AS ''Koulutuksen kunta''
	  ,d9.maakunta_koodi AS ''Koulutuksen maakunta Koodi''
	  ,d9.maakunta_fi AS ''Koulutuksen maakunta''
	  ,[VIRKUNTA] AS ''Koulutuksen järjestäjän kunta Koodi''
	  ,d8.kunta_fi AS ''Koulutuksen järjestäjän kunta''
	  ,d8.maakunta_koodi AS ''Koulutuksen järjestäjän maakunta Koodi''
	  ,d8.maakunta_fi AS ''Koulutuksen järjestäjän maakunta''
	  ,RIGHT(menolajitoiminto, 3) AS ''Menolaji Koodi''
	  ,d6.nimi AS ''Menolaji''
	  ,LEFT(menolajitoiminto, 4) AS ''Toiminto Koodi''
	  ,d7.nimi AS ''Toiminto''
      ,[suorite] AS ''Suorite''
FROM
	(SELECT [rekno],[vuosi],[ytunnus],[kala],[koulumto],[OMISTAJA],[KUNTA],[VIRKUNTA],k100l01,k100l02,k100l03
	  FROM [ANTERO].[sa].[sa_valos_2015] WHERE rekno=55 OR koulumto=133 or koulumto=134 or koulumto=135) p
UNPIVOT 
	([suorite] FOR [menolajitoiminto] IN
	  (k100l01,k100l02,k100l03)) AS unpvt
	  LEFT JOIN dw.d_organisaatio d1 ON ytunnus=organisaatio_koodi
	  LEFT JOIN sa.sa_koodistot d2 ON d2.koodisto=''vipunenvaloskoulutusmuoto'' and d2.koodi=koulumto
	  LEFT JOIN sa.sa_koodistot d3 ON d3.koodisto=''vipunenvaloskoulutusala'' and d3.koodi=kala
	  LEFT JOIN sa.sa_koodistot d4 ON d4.koodisto=''vipunenvalosomistajatyyppi'' and d4.koodi=OMISTAJA
	  LEFT JOIN sa.sa_koodistot d5 ON d5.koodisto=''vipunenvalossektori'' and d5.koodi=rekno
	  LEFT JOIN sa.sa_koodistot d6 ON d6.koodisto=''vipunenvalosmenolaji'' and d6.koodi=RIGHT(menolajitoiminto,3)
	  LEFT JOIN sa.sa_koodistot d7 ON d7.koodisto=''vipunenvalostoiminto'' and d7.koodi=LEFT(menolajitoiminto,4)
	  LEFT JOIN dw.d_alueluokitus d8 ON d8.kunta_koodi=VIRKUNTA
	  LEFT JOIN dw.d_alueluokitus d9 ON d9.kunta_koodi=KUNTA

-- Kansalaisopistot ja kesäyliopistot, ei toiminto- eikä menolajierittelyä
UNION ALL 

SELECT [vuosi] AS ''Tilastovuosi''
	  ,[rekno] AS ''Sektori Koodi''
	  ,d5.nimi AS ''Sektori''
      ,ytunnus AS ''Koulutuksen järjestäjä Koodi''
	  ,d1.organisaatio_fi AS ''Koulutuksen järjestäjä''
      ,[kala] AS ''Rahoituksen koulutusala Koodi''
	  ,d3.nimi AS ''Rahoituksen koulutusala''
      ,[koulumto] AS ''Koulutusmuoto Koodi''
	  ,d2.nimi AS ''Koulutusmuoto''
      ,[OMISTAJA] AS ''Omistajatyyppi Koodi''
	  ,d4.nimi AS ''Omistajatyyppi''
      ,[KUNTA] AS ''Koulutuksen kunta Koodi''
	  ,d9.kunta_fi AS ''Koulutuksen kunta''
	  ,d9.maakunta_koodi AS ''Koulutuksen maakunta Koodi''
	  ,d9.maakunta_fi AS ''Koulutuksen maakunta''
	  ,[VIRKUNTA] AS ''Koulutuksen järjestäjän kunta Koodi''
	  ,d8.kunta_fi AS ''Koulutuksen järjestäjän kunta''
	  ,d8.maakunta_koodi AS ''Koulutuksen järjestäjän maakunta Koodi''
	  ,d8.maakunta_fi AS ''Koulutuksen järjestäjän maakunta''
	  ,RIGHT(menolajitoiminto, 3) AS ''Menolaji Koodi''
	  ,d6.nimi AS ''Menolaji''
	  ,LEFT(menolajitoiminto, 4) AS ''Toiminto Koodi''
	  ,d7.nimi AS ''Toiminto''
      ,[suorite] AS ''Suorite''
FROM
	(SELECT [rekno],[vuosi],[ytunnus],[kala],[koulumto],[OMISTAJA],[KUNTA],[VIRKUNTA],k100l09
	  FROM [ANTERO].[sa].[sa_valos_2015] WHERE rekno=9 OR rekno=18) p
UNPIVOT 
	([suorite] FOR [menolajitoiminto] IN
	  (k100l09)) AS unpvt
	  LEFT JOIN dw.d_organisaatio d1 ON ytunnus=organisaatio_koodi
	  LEFT JOIN sa.sa_koodistot d2 ON d2.koodisto=''vipunenvaloskoulutusmuoto'' and d2.koodi=koulumto
	  LEFT JOIN sa.sa_koodistot d3 ON d3.koodisto=''vipunenvaloskoulutusala'' and d3.koodi=kala
	  LEFT JOIN sa.sa_koodistot d4 ON d4.koodisto=''vipunenvalosomistajatyyppi'' and d4.koodi=OMISTAJA
	  LEFT JOIN sa.sa_koodistot d5 ON d5.koodisto=''vipunenvalossektori'' and d5.koodi=rekno
	  LEFT JOIN sa.sa_koodistot d6 ON d6.koodisto=''vipunenvalosmenolaji'' and d6.koodi=RIGHT(menolajitoiminto,3)
	  LEFT JOIN sa.sa_koodistot d7 ON d7.koodisto=''vipunenvalostoiminto'' and d7.koodi=LEFT(menolajitoiminto,4)
	  LEFT JOIN dw.d_alueluokitus d8 ON d8.kunta_koodi=VIRKUNTA
	  LEFT JOIN dw.d_alueluokitus d9 ON d9.kunta_koodi=KUNTA
	  

'
