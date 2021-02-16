USE [ANTERO]
GO

/****** Object:  View [dw].[v_valos_koulutuksenkustannukset]    Script Date: 15.2.2021 16:10:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dw].[v_valos_koulutuksenkustannukset] AS

--ammatilliset haetaan ainakin tilapäisesti vanhasta 2017-taulusta, koska eivät mukana uudemmissa / jsyrjala 15.2.2021

--amm
SELECT 
       --Suomi
	   vuosi AS "Tilastovuosi"
	  ,rekno AS "Sektori Koodi"
	  ,d5.nimi AS "Sektori"
      ,ytunnus AS "Koulutuksen järjestäjä Koodi"
	  ,d1.organisaatio_fi AS "Koulutuksen järjestäjä"
      ,kala AS "Rahoituksen koulutusala Koodi"
	  ,d3.nimi AS "Rahoituksen koulutusala"
      ,koulumto AS "Koulutusmuoto Koodi"
	  ,d2.nimi AS "Koulutusmuoto"
      ,OMISTAJA AS "Omistajatyyppi Koodi"
	  ,d4.nimi AS "Omistajatyyppi"
      ,d9.kunta_koodi AS "Koulutuksen kunta Koodi"
	  ,d9.kunta_fi AS "Koulutuksen kunta"
	  ,d9.maakunta_koodi AS "Koulutuksen maakunta Koodi"
	  ,d9.maakunta_fi AS "Koulutuksen maakunta"
	  ,d8.kunta_koodi AS "Koulutuksen järjestäjän kunta Koodi"
	  ,d8.kunta_fi AS "Koulutuksen järjestäjän kunta"
	  ,d8.maakunta_koodi AS "Koulutuksen järjestäjän maakunta Koodi"
	  ,d8.maakunta_fi AS "Koulutuksen järjestäjän maakunta"
	  ,RIGHT(menolajitoiminto, 3) AS "Menolaji Koodi"
	  ,d6.nimi AS "Menolaji"
	  ,LEFT(menolajitoiminto, 4) AS "Toiminto Koodi"
	  ,d7.nimi AS "Toiminto"
	  ,cast(replace(summa,',','.') as float) AS "Summa"

	  --English
	  ,vuosi as 'Statistical year'
	  ,rekno AS "Sector Code"
	  ,d5.nimi_en AS "Sector"
      ,ytunnus AS "Education provider Code"
	  ,d1.organisaatio_en AS "Education provider"
      ,kala AS "Source of funding field of education Code"
	  ,d3.nimi_en AS "Source of funding field of education"
      ,koulumto AS "Form of education Code"
	  ,d2.nimi_en AS "Form of education"
      ,OMISTAJA AS "Type of owner Code"
	  ,d4.nimi_en AS "Type of owner"
      ,d9.kunta_koodi AS "Municipality of Education Code"
	  ,d9.kunta_en AS "Municipality of Education"
	  ,d9.maakunta_koodi AS "Region of Education Code"
	  ,d9.maakunta_en AS "Region of Education"
	  ,d8.kunta_koodi AS "Municipality of the education provider Code"
	  ,d8.kunta_en AS "Municipality of the education provider "
	  ,d8.maakunta_koodi AS "Region of the education provider Code"
	  ,d8.maakunta_en AS "Region of the education provider"
	  ,RIGHT(menolajitoiminto, 3) AS "Category of expenditure Code"
	  ,d6.nimi_en AS "Category of expenditure"
	  ,LEFT(menolajitoiminto, 4) AS "Activity Code"
	  ,d7.nimi_en AS "Activity"
	  ,cast(replace(summa,',','.') as float) AS "Sum"
	  
	  --Swedish
	  ,vuosi as 'Statistikår'
	  ,rekno AS "Sektor Kod"
	  ,d5.nimi_sv AS "Sektor"
      ,ytunnus AS "Utbildningsanordnare Kod"
	  ,d1.organisaatio_sv AS "Utbildningsanordnare"
      ,kala AS "Finansieringskälla av utbildningsområde Kod"
	  ,d3.nimi_sv AS "Finansieringskälla av utbildningsområde"
      ,koulumto AS "Form av utbildning Kod"
	  ,d2.nimi_sv AS "Form av utbildning"
      ,OMISTAJA AS "Typ av Ägare  Kod" -- What do here?
	  ,d4.nimi_sv AS "Typ av Ägare" -- What do here as well?
      ,d9.kunta_koodi AS "Utbildnings kommun Kod"
	  ,d9.kunta_fi AS "Utbildnings kommun"
	  ,d9.maakunta_koodi AS "Utbildningens landskap Kod"
	  ,d9.maakunta_sv AS "Utbildningens landskap"
	  ,d8.kunta_koodi AS "Utbildningsanordnarens kommun Kod"
	  ,d8.kunta_sv AS "Utbildningsanordnarens kommun"
	  ,d8.maakunta_koodi AS "Utbildningsanordnarens landskap Kod"
	  ,d8.maakunta_sv AS "Utbildningsanordnarens landskap"
	  ,RIGHT(menolajitoiminto, 3) AS "Utgiftsslag Kod"
	  ,d6.nimi_sv AS "Utgiftsslag"
	  ,LEFT(menolajitoiminto, 4) AS "Funktion Kod"
	  ,d7.nimi_sv AS "Funktion"
--	  ,cast(replace(summa,',','.') as float) AS "Summa"  -- Käytetään suomenkielessä määriteltyä summa-kenttää, nimi sama ruotsiksi

FROM
	(SELECT rekno,vuosi,ytunnus,kala,koulumto,OMISTAJA,KUNTA,VIRKUNTA,suorite,k010l01,k010l02,k010l03,k020l01,k020l02,k020l03,k030l01,k030l02,k030l03,k040l01,k040l02,k040l03,k060l01,k060l02,k060l03,k070l01,k070l02,k070l03,k080l01,k080l02,k080l03,k090l02,k090l03
	  FROM sa.sa_valos_2017 --amm
	  WHERE rekno in ('2','3','13','14') and rekno not in (select distinct rekno from sa.sa_valos) --amm
	)p
UNPIVOT
	(summa FOR menolajitoiminto IN
	  (k010l01,k010l02,k010l03,k020l01,k020l02,k020l03,k030l01,k030l02,k030l03,k040l01,k040l02,k040l03,k060l01,k060l02,k060l03,k070l01,k070l02,k070l03,k080l01,k080l02,k080l03,k090l02,k090l03)) AS unpvt
	  LEFT JOIN dw.d_organisaatio d1 ON coalesce(nullif(ytunnus,''),'-1')=organisaatio_koodi
	  LEFT JOIN sa.sa_koodistot d2 ON d2.koodisto='vipunenvaloskoulutusmuoto' and d2.koodi=koulumto
	  LEFT JOIN sa.sa_koodistot d3 ON d3.koodisto='vipunenvaloskoulutusala' and d3.koodi=kala
	  LEFT JOIN sa.sa_koodistot d4 ON d4.koodisto='vipunenvalosomistajatyyppi' and d4.koodi=OMISTAJA
	  LEFT JOIN sa.sa_koodistot d5 ON d5.koodisto='vipunenvalossektori' and d5.koodi=rekno
	  LEFT JOIN sa.sa_koodistot d6 ON d6.koodisto='vipunenvalosmenolaji' and d6.koodi=RIGHT(menolajitoiminto,3)
	  LEFT JOIN sa.sa_koodistot d7 ON d7.koodisto='vipunenvalostoiminto' and d7.koodi=LEFT(menolajitoiminto,4)
	  LEFT JOIN dw.d_alueluokitus d8 ON d8.kunta_koodi=VIRKUNTA
	  LEFT JOIN dw.d_alueluokitus d9 ON d9.kunta_koodi=KUNTA

UNION ALL

SELECT 
       --Suomi
	   vuosi AS "Tilastovuosi"
	  ,rekno AS "Sektori Koodi"
	  ,d5.nimi AS "Sektori"
      ,ytunnus AS "Koulutuksen järjestäjä Koodi"
	  ,d1.organisaatio_fi AS "Koulutuksen järjestäjä"
      ,kala AS "Rahoituksen koulutusala Koodi"
	  ,d3.nimi AS "Rahoituksen koulutusala"
      ,koulumto AS "Koulutusmuoto Koodi"
	  ,d2.nimi AS "Koulutusmuoto"
      ,OMISTAJA AS "Omistajatyyppi Koodi"
	  ,d4.nimi AS "Omistajatyyppi"
      ,d9.kunta_koodi AS "Koulutuksen kunta Koodi"
	  ,d9.kunta_fi AS "Koulutuksen kunta"
	  ,d9.maakunta_koodi AS "Koulutuksen maakunta Koodi"
	  ,d9.maakunta_fi AS "Koulutuksen maakunta"
	  ,d8.kunta_koodi AS "Koulutuksen järjestäjän kunta Koodi"
	  ,d8.kunta_fi AS "Koulutuksen järjestäjän kunta"
	  ,d8.maakunta_koodi AS "Koulutuksen järjestäjän maakunta Koodi"
	  ,d8.maakunta_fi AS "Koulutuksen järjestäjän maakunta"
	  ,RIGHT(menolajitoiminto, 3) AS "Menolaji Koodi"
	  ,d6.nimi AS "Menolaji"
	  ,LEFT(menolajitoiminto, 4) AS "Toiminto Koodi"
	  ,d7.nimi AS "Toiminto"
	  ,cast(replace(summa,',','.') as float) AS "Summa"

	  --English
	  ,vuosi as 'Statistical year'
	  ,rekno AS "Sector Code"
	  ,d5.nimi_en AS "Sector"
      ,ytunnus AS "Education provider Code"
	  ,d1.organisaatio_en AS "Education provider"
      ,kala AS "Source of funding field of education Code"
	  ,d3.nimi_en AS "Source of funding field of education"
      ,koulumto AS "Form of education Code"
	  ,d2.nimi_en AS "Form of education"
      ,OMISTAJA AS "Type of owner Code"
	  ,d4.nimi_en AS "Type of owner"
      ,d9.kunta_koodi AS "Municipality of Education Code"
	  ,d9.kunta_en AS "Municipality of Education"
	  ,d9.maakunta_koodi AS "Region of Education Code"
	  ,d9.maakunta_en AS "Region of Education"
	  ,d8.kunta_koodi AS "Municipality of the education provider Code"
	  ,d8.kunta_en AS "Municipality of the education provider "
	  ,d8.maakunta_koodi AS "Region of the education provider Code"
	  ,d8.maakunta_en AS "Region of the education provider"
	  ,RIGHT(menolajitoiminto, 3) AS "Category of expenditure Code"
	  ,d6.nimi_en AS "Category of expenditure"
	  ,LEFT(menolajitoiminto, 4) AS "Activity Code"
	  ,d7.nimi_en AS "Activity"
	  ,cast(replace(summa,',','.') as float) AS "Sum"
	  
	  --Swedish
	  ,vuosi as 'Statistikår'
	  ,rekno AS "Sektor Kod"
	  ,d5.nimi_sv AS "Sektor"
      ,ytunnus AS "Utbildningsanordnare Kod"
	  ,d1.organisaatio_sv AS "Utbildningsanordnare"
      ,kala AS "Finansieringskälla av utbildningsområde Kod"
	  ,d3.nimi_sv AS "Finansieringskälla av utbildningsområde"
      ,koulumto AS "Form av utbildning Kod"
	  ,d2.nimi_sv AS "Form av utbildning"
      ,OMISTAJA AS "Typ av Ägare  Kod" -- What do here?
	  ,d4.nimi_sv AS "Typ av Ägare" -- What do here as well?
      ,d9.kunta_koodi AS "Utbildnings kommun Kod"
	  ,d9.kunta_fi AS "Utbildnings kommun"
	  ,d9.maakunta_koodi AS "Utbildningens landskap Kod"
	  ,d9.maakunta_sv AS "Utbildningens landskap"
	  ,d8.kunta_koodi AS "Utbildningsanordnarens kommun Kod"
	  ,d8.kunta_sv AS "Utbildningsanordnarens kommun"
	  ,d8.maakunta_koodi AS "Utbildningsanordnarens landskap Kod"
	  ,d8.maakunta_sv AS "Utbildningsanordnarens landskap"
	  ,RIGHT(menolajitoiminto, 3) AS "Utgiftsslag Kod"
	  ,d6.nimi_sv AS "Utgiftsslag"
	  ,LEFT(menolajitoiminto, 4) AS "Funktion Kod"
	  ,d7.nimi_sv AS "Funktion"
--	  ,cast(replace(summa,',','.') as float) AS "Summa"  -- Käytetään suomenkielessä määriteltyä summa-kenttää, nimi sama ruotsiksi

FROM
	(SELECT rekno,vuosi,ytunnus,kala,koulumto,OMISTAJA,KUNTA,VIRKUNTA,suorite,k010l01,k010l02,k010l03,k020l01,k020l02,k020l03,k030l01,k030l02,k030l03,k040l01,k040l02,k040l03,k060l01,k060l02,k060l03,k070l01,k070l02,k070l03,k080l01,k080l02,k080l03,k090l02,k090l03
	  FROM sa.sa_valos) p
UNPIVOT
	(summa FOR menolajitoiminto IN
	  (k010l01,k010l02,k010l03,k020l01,k020l02,k020l03,k030l01,k030l02,k030l03,k040l01,k040l02,k040l03,k060l01,k060l02,k060l03,k070l01,k070l02,k070l03,k080l01,k080l02,k080l03,k090l02,k090l03)) AS unpvt
	  LEFT JOIN dw.d_organisaatioluokitus d1 ON ytunnus=organisaatio_koodi
	  LEFT JOIN sa.sa_koodistot d2 ON d2.koodisto='vipunenvaloskoulutusmuoto' and d2.koodi=koulumto
	  LEFT JOIN sa.sa_koodistot d3 ON d3.koodisto='vipunenvaloskoulutusala' and d3.koodi=kala
	  LEFT JOIN sa.sa_koodistot d4 ON d4.koodisto='vipunenvalosomistajatyyppi' and d4.koodi=OMISTAJA
	  LEFT JOIN sa.sa_koodistot d5 ON d5.koodisto='vipunenvalossektori' and d5.koodi=rekno
	  LEFT JOIN sa.sa_koodistot d6 ON d6.koodisto='vipunenvalosmenolaji' and d6.koodi=RIGHT(menolajitoiminto,3)
	  LEFT JOIN sa.sa_koodistot d7 ON d7.koodisto='vipunenvalostoiminto' and d7.koodi=LEFT(menolajitoiminto,4)
	  LEFT JOIN dw.d_alueluokitus d8 ON d8.kunta_koodi=VIRKUNTA
	  LEFT JOIN dw.d_alueluokitus d9 ON d9.kunta_koodi=KUNTA

-- Perusopetuksen aamu- ja iltapäivätoiminta ja vammaisopetus, ei toimintoerittelyä
UNION ALL

SELECT 
       --Suomi
       vuosi AS 'Tilastovuosi'
	  ,rekno AS 'Sektori Koodi'
	  ,d5.nimi AS 'Sektori'
      ,ytunnus AS 'Koulutuksen järjestäjä Koodi'
	  ,d1.organisaatio_fi AS 'Koulutuksen järjestäjä'
      ,kala AS 'Rahoituksen koulutusala Koodi'
	  ,d3.nimi AS 'Rahoituksen koulutusala'
      ,koulumto AS 'Koulutusmuoto Koodi'
	  ,d2.nimi AS 'Koulutusmuoto'
      ,OMISTAJA AS 'Omistajatyyppi Koodi'
	  ,d4.nimi AS 'Omistajatyyppi'
      ,d9.kunta_koodi AS 'Koulutuksen kunta Koodi'
	  ,d9.kunta_fi AS 'Koulutuksen kunta'
	  ,d9.maakunta_koodi AS 'Koulutuksen maakunta Koodi'
	  ,d9.maakunta_fi AS 'Koulutuksen maakunta'
	  ,d8.kunta_koodi AS 'Koulutuksen järjestäjän kunta Koodi'
	  ,d8.kunta_fi AS 'Koulutuksen järjestäjän kunta'
	  ,d8.maakunta_koodi AS 'Koulutuksen järjestäjän maakunta Koodi'
	  ,d8.maakunta_fi AS 'Koulutuksen järjestäjän maakunta'
	  ,RIGHT(menolajitoiminto, 3) AS 'Menolaji Koodi'
	  ,d6.nimi AS 'Menolaji'
	  ,LEFT(menolajitoiminto, 4) AS 'Toiminto Koodi'
	  ,d7.nimi AS 'Toiminto'
 	  ,cast(replace(summa,',','.') as float) AS "Summa"

	  --English
	  ,vuosi as 'Statistical year'
	  ,rekno AS "Sector Code"
	  ,d5.nimi_en AS "Sector"
      ,ytunnus AS "Education provider Code"
	  ,d1.organisaatio_en AS "Education provider"
      ,kala AS "Source of funding field of education Code"
	  ,d3.nimi_en AS "Source of funding field of education"
      ,koulumto AS "Form of education Code"
	  ,d2.nimi_en AS "Form of education"
      ,OMISTAJA AS "Type of owner Code"
	  ,d4.nimi_en AS "Type of owner"
      ,d9.kunta_koodi AS "Municipality of Education Code"
	  ,d9.kunta_en AS "Municipality of Education"
	  ,d9.maakunta_koodi AS "Region of Education Code"
	  ,d9.maakunta_en AS "Region of Education"
	  ,d8.kunta_koodi AS "Municipality of the education provider Code"
	  ,d8.kunta_en AS "Municipality of the education provider "
	  ,d8.maakunta_koodi AS "Region of the education provider Code"
	  ,d8.maakunta_en AS "Region of the education provider"
	  ,RIGHT(menolajitoiminto, 3) AS "Category of expenditure Code"
	  ,d6.nimi_en AS "Category of expenditure"
	  ,LEFT(menolajitoiminto, 4) AS "Activity Code"
	  ,d7.nimi_en AS "Activity"
	  ,cast(replace(summa,',','.') as float) AS "Sum"
	  
	  --Swedish
	  ,vuosi as 'Statistikår'
	  ,rekno AS "Sektor Kod"
	  ,d5.nimi_sv AS "Sektor"
      ,ytunnus AS "Utbildningsanordnare Kod"
	  ,d1.organisaatio_sv AS "Utbildningsanordnare"
      ,kala AS "Finansieringskälla av utbildningsområde Kod"
	  ,d3.nimi_sv AS "Finansieringskälla av utbildningsområde"
      ,koulumto AS "Form av utbildning Kod"
	  ,d2.nimi_sv AS "Form av utbildning"
      ,OMISTAJA AS "Typ av Ägare  Kod" -- What do here?
	  ,d4.nimi_sv AS "Typ av Ägare " -- What do here as well?
      ,d9.kunta_koodi AS "Utbildnings kommun Kod"
	  ,d9.kunta_fi AS "Utbildnings kommun"
	  ,d9.maakunta_koodi AS "Utbildningens landskap Kod"
	  ,d9.maakunta_sv AS "Utbildningens landskap"
	  ,d8.kunta_koodi AS "Utbildningsanordnarens kommun Kod"
	  ,d8.kunta_sv AS "Utbildningsanordnarens kommun"
	  ,d8.maakunta_koodi AS "Utbildningsanordnarens landskap Kod"
	  ,d8.maakunta_sv AS "Utbildningsanordnarens landskap"
	  ,RIGHT(menolajitoiminto, 3) AS "Utgiftsslag Kod"
	  ,d6.nimi_sv AS "Utgiftsslag"
	  ,LEFT(menolajitoiminto, 4) AS "Funktion Kod"
	  ,d7.nimi_sv AS "Funktion"
--	  ,cast(replace(summa,',','.') as float) AS "Summa"  -- Käytetään suomenkielessä määriteltyä summa-kenttää, nimi sama ruotsiksi

FROM
	(SELECT rekno,vuosi,ytunnus,kala,koulumto,OMISTAJA,KUNTA,VIRKUNTA,suorite,k100l01,k100l02,k100l03
	  FROM sa.sa_valos WHERE rekno=55 OR koulumto=133 or koulumto=134 or koulumto=135) p
UNPIVOT
	(summa FOR menolajitoiminto IN
	  (k100l01,k100l02,k100l03)) AS unpvt
	  LEFT JOIN dw.d_organisaatioluokitus d1 ON ytunnus=organisaatio_koodi
	  LEFT JOIN sa.sa_koodistot d2 ON d2.koodisto='vipunenvaloskoulutusmuoto' and d2.koodi=koulumto
	  LEFT JOIN sa.sa_koodistot d3 ON d3.koodisto='vipunenvaloskoulutusala' and d3.koodi=kala
	  LEFT JOIN sa.sa_koodistot d4 ON d4.koodisto='vipunenvalosomistajatyyppi' and d4.koodi=OMISTAJA
	  LEFT JOIN sa.sa_koodistot d5 ON d5.koodisto='vipunenvalossektori' and d5.koodi=rekno
	  LEFT JOIN sa.sa_koodistot d6 ON d6.koodisto='vipunenvalosmenolaji' and d6.koodi=RIGHT(menolajitoiminto,3)
	  LEFT JOIN sa.sa_koodistot d7 ON d7.koodisto='vipunenvalostoiminto' and d7.koodi=LEFT(menolajitoiminto,4)
	  LEFT JOIN dw.d_alueluokitus d8 ON d8.kunta_koodi= VIRKUNTA
	  LEFT JOIN dw.d_alueluokitus d9 ON d9.kunta_koodi= KUNTA

-- Kansalaisopistot ja kesäyliopistot, ei toiminto- eikä menolajierittelyä
UNION ALL

SELECT 
       --Suomi
       vuosi AS 'Tilastovuosi'
	  ,rekno AS 'Sektori Koodi'
	  ,d5.nimi AS 'Sektori'
      ,ytunnus AS 'Koulutuksen järjestäjä Koodi'
	  ,d1.organisaatio_fi AS 'Koulutuksen järjestäjä'
      ,kala AS 'Rahoituksen koulutusala Koodi'
	  ,d3.nimi AS 'Rahoituksen koulutusala'
      ,koulumto AS 'Koulutusmuoto Koodi'
	  ,d2.nimi AS 'Koulutusmuoto'
      ,OMISTAJA AS 'Omistajatyyppi Koodi'
	  ,d4.nimi AS 'Omistajatyyppi'
      ,d9.kunta_koodi AS 'Koulutuksen kunta Koodi'
	  ,d9.kunta_fi AS 'Koulutuksen kunta'
	  ,d9.maakunta_koodi AS 'Koulutuksen maakunta Koodi'
	  ,d9.maakunta_fi AS 'Koulutuksen maakunta'
	  ,d8.kunta_koodi AS 'Koulutuksen järjestäjän kunta Koodi'
	  ,d8.kunta_fi AS 'Koulutuksen järjestäjän kunta'
	  ,d8.maakunta_koodi AS 'Koulutuksen järjestäjän maakunta Koodi'
	  ,d8.maakunta_fi AS 'Koulutuksen järjestäjän maakunta'
	  ,RIGHT(menolajitoiminto, 3) AS 'Menolaji Koodi'
	  ,d6.nimi AS 'Menolaji'
	  ,LEFT(menolajitoiminto, 4) AS 'Toiminto Koodi'
	  ,d7.nimi AS 'Toiminto'
	  ,cast(replace(summa,',','.') as float) AS "Summa"

	  --English
	  ,vuosi as 'Statistical year'
	  ,rekno AS "Sector Code"
	  ,d5.nimi_en AS "Sector"
      ,ytunnus AS "Education provider Code"
	  ,d1.organisaatio_en AS "Education provider"
      ,kala AS "Source of funding field of education Code"
	  ,d3.nimi_en AS "Source of funding field of education"
      ,koulumto AS "Form of education Code"
	  ,d2.nimi_en AS "Form of education"
      ,OMISTAJA AS "Type of owner Code"
	  ,d4.nimi_en AS "Type of owner"
      ,d9.kunta_koodi AS "Municipality of Education Code"
	  ,d9.kunta_en AS "Municipality of Education"
	  ,d9.maakunta_koodi AS "Region of Education Code"
	  ,d9.maakunta_en AS "Region of Education"
	  ,d8.kunta_koodi AS "Municipality of the education provider Code"
	  ,d8.kunta_en AS "Municipality of the education provider "
	  ,d8.maakunta_koodi AS "Region of the education provider Code"
	  ,d8.maakunta_en AS "Region of the education provider"
	  ,RIGHT(menolajitoiminto, 3) AS "Category of expenditure Code"
	  ,d6.nimi_en AS "Category of expenditure"
	  ,LEFT(menolajitoiminto, 4) AS "Activity Code"
	  ,d7.nimi_en AS "Activity"
	  ,cast(replace(summa,',','.') as float) AS "Sum"
	  
	  --Swedish
	  ,vuosi as 'Statistikår'
	  ,rekno AS "Sektor Kod"
	  ,d5.nimi_sv AS "Sektor"
      ,ytunnus AS "Utbildningsanordnare Kod"
	  ,d1.organisaatio_sv AS "Utbildningsanordnare"
      ,kala AS "Finansieringskälla av utbildningsområde Kod"
	  ,d3.nimi_sv AS "Finansieringskälla av utbildningsområde"
      ,koulumto AS "Form av utbildning Kod"
	  ,d2.nimi_sv AS "Form av utbildning"
      ,OMISTAJA AS "Typ av Ägare Kod" -- What do here?
	  ,d4.nimi_sv AS "Typ av Ägare" -- What do here as well?
      ,d9.kunta_koodi AS "Utbildnings kommun Kod"
	  ,d9.kunta_fi AS "Utbildnings kommun"
	  ,d9.maakunta_koodi AS "Utbildningens landskap Kod"
	  ,d9.maakunta_sv AS "Utbildningens landskap"
	  ,d8.kunta_koodi AS "Utbildningsanordnarens kommun Kod"
	  ,d8.kunta_sv AS "Utbildningsanordnarens kommun"
	  ,d8.maakunta_koodi AS "Utbildningsanordnarens landskap Kod"
	  ,d8.maakunta_sv AS "Utbildningsanordnarens landskap"
	  ,RIGHT(menolajitoiminto, 3) AS "Utgiftsslag Kod"
	  ,d6.nimi_sv AS "Utgiftsslag"
	  ,LEFT(menolajitoiminto, 4) AS "Funktion Kod"
	  ,d7.nimi_sv AS "Funktion"
--	  ,cast(replace(summa,',','.') as float) AS "Summa"  -- Käytetään suomenkielessä määriteltyä summa-kenttää, nimi sama ruotsiksi

FROM
	(SELECT rekno,vuosi,ytunnus,kala,koulumto,OMISTAJA,KUNTA,VIRKUNTA,suorite,k100l09
	  FROM sa.sa_valos WHERE rekno=9 OR rekno=18) p
UNPIVOT
	(summa FOR menolajitoiminto IN
	  (k100l09)) AS unpvt
	  LEFT JOIN dw.d_organisaatioluokitus d1 ON ytunnus=organisaatio_koodi
	  LEFT JOIN sa.sa_koodistot d2 ON d2.koodisto='vipunenvaloskoulutusmuoto' and d2.koodi=koulumto
	  LEFT JOIN sa.sa_koodistot d3 ON d3.koodisto='vipunenvaloskoulutusala' and d3.koodi=kala
	  LEFT JOIN sa.sa_koodistot d4 ON d4.koodisto='vipunenvalosomistajatyyppi' and d4.koodi=OMISTAJA
	  LEFT JOIN sa.sa_koodistot d5 ON d5.koodisto='vipunenvalossektori' and d5.koodi=rekno
	  LEFT JOIN sa.sa_koodistot d6 ON d6.koodisto='vipunenvalosmenolaji' and d6.koodi=RIGHT(menolajitoiminto,3)
	  LEFT JOIN sa.sa_koodistot d7 ON d7.koodisto='vipunenvalostoiminto' and d7.koodi=LEFT(menolajitoiminto,4)
	  LEFT JOIN dw.d_alueluokitus d8 ON d8.kunta_koodi= VIRKUNTA
	  LEFT JOIN dw.d_alueluokitus d9 ON d9.kunta_koodi= KUNTA

