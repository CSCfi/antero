USE [AnteroAPI]
GO

DROP PROCEDURE IF EXISTS [dw].[p_lataa_api_koulutuksenkustannukset_esilataus]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_koulutuksenkustannukset_esilataus]    Script Date: 15.11.2021 8:44:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dw].[p_lataa_api_koulutuksenkustannukset_esilataus] AS

TRUNCATE TABLE [dw].[api_koulutuksenkustannukset]

INSERT INTO [dw].[api_koulutuksenkustannukset]

--mukaillen [dw].[v_valos_koulutuksenkustannukset] / 7.5.2021
--generoidaan oletusjärjestys apitaulussa
SELECT vuosi AS "Tilastovuosi"
    ,rekno AS "Sektori Koodi"
    ,d5.nimi AS "Sektori"
    ,right(ytunnus,9) AS "Koulutuksen järjestäjä Koodi"
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

  --oletusjärjestys sorttausta varten, 1000000000+ lajittelee alikyselyn tulokset
    --,/*1000000000+*/ ROW_NUMBER() OVER(order by ytunnus ASC, d1.organisaatio_fi ASC, d2.nimi ASC, d3.nimi ASC, d4.nimi ASC, d5.nimi ASC, d6.nimi ASC, d7.nimi asc, d8.kunta_koodi ASC, d9.maakunta_fi)   as defaultorder

FROM
  (SELECT rekno,vuosi,ytunnus,kala,koulumto,OMISTAJA,KUNTA,VIRKUNTA,suorite,k010l01,k010l02,k010l03,k020l01,k020l02,k020l03,k030l01,k030l02,k030l03,k040l01,k040l02,k040l03,k060l01,k060l02,k060l03,k070l01,k070l02,k070l03,k080l01,k080l02,k080l03,k090l02,k090l03
   FROM ANTERO.sa.sa_valos_2017 --amm
   WHERE rekno in ('2','3','13','14') and rekno not in (select distinct rekno from ANTERO.sa.sa_valos) --amm
   ) p
UNPIVOT
  (summa FOR menolajitoiminto IN
    (k010l01,k010l02,k010l03,k020l01,k020l02,k020l03,k030l01,k030l02,k030l03,k040l01,k040l02,k040l03,k060l01,k060l02,k060l03,k070l01,k070l02,k070l03,k080l01,k080l02,k080l03,k090l02,k090l03)) AS unpvt
    LEFT JOIN ANTERO.dw.d_organisaatio d1 ON RIGHT(coalesce(nullif(ytunnus,''),'-1'),9)=organisaatio_koodi
    LEFT JOIN ANTERO.sa.sa_koodistot d2 ON d2.koodisto='vipunenvaloskoulutusmuoto' and d2.koodi=koulumto
    LEFT JOIN ANTERO.sa.sa_koodistot d3 ON d3.koodisto='vipunenvaloskoulutusala' and d3.koodi=kala
    LEFT JOIN ANTERO.sa.sa_koodistot d4 ON d4.koodisto='vipunenvalosomistajatyyppi' and d4.koodi=OMISTAJA
    LEFT JOIN ANTERO.sa.sa_koodistot d5 ON d5.koodisto='vipunenvalossektori' and d5.koodi=rekno
    LEFT JOIN ANTERO.sa.sa_koodistot d6 ON d6.koodisto='vipunenvalosmenolaji' and d6.koodi=RIGHT(menolajitoiminto,3)
    LEFT JOIN ANTERO.sa.sa_koodistot d7 ON d7.koodisto='vipunenvalostoiminto' and d7.koodi=LEFT(menolajitoiminto,4)
    LEFT JOIN ANTERO.dw.d_alueluokitus d8 ON d8.kunta_koodi=RIGHT(CONCAT('000', VIRKUNTA), 3)
    LEFT JOIN ANTERO.dw.d_alueluokitus d9 ON d9.kunta_koodi=RIGHT(CONCAT('000', KUNTA), 3)

UNION ALL

SELECT vuosi AS "Tilastovuosi"
    ,rekno AS "Sektori Koodi"
    ,d5.nimi AS "Sektori"
    ,right(ytunnus,9) AS "Koulutuksen järjestäjä Koodi"
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

  --oletusjärjestys sorttausta varten, 1000000000+ lajittelee alikyselyn tulokset
    --,1000000000+ ROW_NUMBER() OVER(order by ytunnus ASC, d1.organisaatio_fi ASC, d2.nimi ASC, d3.nimi ASC, d4.nimi ASC, d5.nimi ASC, d6.nimi ASC, d7.nimi asc, d8.kunta_koodi ASC, d9.maakunta_fi)   as defaultorder

FROM
  (SELECT rekno,vuosi,ytunnus,kala,koulumto,OMISTAJA,KUNTA,VIRKUNTA,suorite,k010l01,k010l02,k010l03,k020l01,k020l02,k020l03,k030l01,k030l02,k030l03,k040l01,k040l02,k040l03,k060l01,k060l02,k060l03,k070l01,k070l02,k070l03,k080l01,k080l02,k080l03,k090l02,k090l03
   FROM ANTERO.sa.sa_valos) p
UNPIVOT
  (summa FOR menolajitoiminto IN
    (k010l01,k010l02,k010l03,k020l01,k020l02,k020l03,k030l01,k030l02,k030l03,k040l01,k040l02,k040l03,k060l01,k060l02,k060l03,k070l01,k070l02,k070l03,k080l01,k080l02,k080l03,k090l02,k090l03)) AS unpvt
    LEFT JOIN ANTERO.dw.d_organisaatio d1 ON RIGHT(ytunnus,9)=organisaatio_koodi
    LEFT JOIN ANTERO.sa.sa_koodistot d2 ON d2.koodisto='vipunenvaloskoulutusmuoto' and d2.koodi=koulumto
    LEFT JOIN ANTERO.sa.sa_koodistot d3 ON d3.koodisto='vipunenvaloskoulutusala' and d3.koodi=kala
    LEFT JOIN ANTERO.sa.sa_koodistot d4 ON d4.koodisto='vipunenvalosomistajatyyppi' and d4.koodi=OMISTAJA
    LEFT JOIN ANTERO.sa.sa_koodistot d5 ON d5.koodisto='vipunenvalossektori' and d5.koodi=rekno
    LEFT JOIN ANTERO.sa.sa_koodistot d6 ON d6.koodisto='vipunenvalosmenolaji' and d6.koodi=RIGHT(menolajitoiminto,3)
    LEFT JOIN ANTERO.sa.sa_koodistot d7 ON d7.koodisto='vipunenvalostoiminto' and d7.koodi=LEFT(menolajitoiminto,4)
    LEFT JOIN ANTERO.dw.d_alueluokitus d8 ON d8.kunta_koodi=RIGHT(CONCAT('000', VIRKUNTA), 3)
    LEFT JOIN ANTERO.dw.d_alueluokitus d9 ON d9.kunta_koodi=RIGHT(CONCAT('000', KUNTA), 3)

-- Perusopetuksen aamu- ja iltapäivätoiminta ja vammaisopetus, ei toimintoerittelyä
UNION ALL

SELECT vuosi AS 'Tilastovuosi'
    ,rekno AS 'Sektori Koodi'
    ,d5.nimi AS 'Sektori'
    ,right(ytunnus,9) AS 'Koulutuksen järjestäjä Koodi'
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

  --oletusjärjestys sorttausta varten, 1000000000+ lajittelee alikyselyn tulokset
    --,2000000000+ ROW_NUMBER() OVER(order by ytunnus ASC, d1.organisaatio_fi ASC, d2.nimi ASC, d3.nimi ASC, d4.nimi ASC, d5.nimi ASC, d6.nimi ASC, d7.nimi asc, d8.kunta_koodi ASC, d9.maakunta_fi)   as defaultorder

FROM
  (SELECT rekno,vuosi,ytunnus,kala,koulumto,OMISTAJA,KUNTA,VIRKUNTA,suorite,k100l01,k100l02,k100l03
	FROM ANTERO.sa.sa_valos WHERE rekno=55 OR koulumto=133 or koulumto=134 or koulumto=135) p
UNPIVOT
  (summa FOR menolajitoiminto IN
    (k100l01,k100l02,k100l03)) AS unpvt
    LEFT JOIN ANTERO.dw.d_organisaatio d1 ON RIGHT(ytunnus,9)=organisaatio_koodi
    LEFT JOIN ANTERO.sa.sa_koodistot d2 ON d2.koodisto='vipunenvaloskoulutusmuoto' and d2.koodi=koulumto
    LEFT JOIN ANTERO.sa.sa_koodistot d3 ON d3.koodisto='vipunenvaloskoulutusala' and d3.koodi=kala
    LEFT JOIN ANTERO.sa.sa_koodistot d4 ON d4.koodisto='vipunenvalosomistajatyyppi' and d4.koodi=OMISTAJA
    LEFT JOIN ANTERO.sa.sa_koodistot d5 ON d5.koodisto='vipunenvalossektori' and d5.koodi=rekno
    LEFT JOIN ANTERO.sa.sa_koodistot d6 ON d6.koodisto='vipunenvalosmenolaji' and d6.koodi=RIGHT(menolajitoiminto,3)
    LEFT JOIN ANTERO.sa.sa_koodistot d7 ON d7.koodisto='vipunenvalostoiminto' and d7.koodi=LEFT(menolajitoiminto,4)
    LEFT JOIN ANTERO.dw.d_alueluokitus d8 ON d8.kunta_koodi=RIGHT(CONCAT('000', VIRKUNTA), 3)
    LEFT JOIN ANTERO.dw.d_alueluokitus d9 ON d9.kunta_koodi=RIGHT(CONCAT('000', KUNTA), 3)

-- Kansalaisopistot ja kesäyliopistot, ei toiminto- eikä menolajierittelyä
UNION ALL

SELECT vuosi AS 'Tilastovuosi'
    ,rekno AS 'Sektori Koodi'
    ,d5.nimi AS 'Sektori'
    ,right(ytunnus,9) AS 'Koulutuksen järjestäjä Koodi'
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

  --oletusjärjestys sorttausta varten, 3000000000+ lajittelee alikyselyn tulokset
    --,3000000000+ ROW_NUMBER() OVER(order by ytunnus ASC, d1.organisaatio_fi ASC, d2.nimi ASC, d3.nimi ASC, d4.nimi ASC, d5.nimi ASC, d6.nimi ASC, d7.nimi asc, d8.kunta_koodi ASC, d9.maakunta_fi)   as defaultorder


FROM
  (SELECT rekno,vuosi,ytunnus,kala,koulumto,OMISTAJA,KUNTA,VIRKUNTA,suorite,k100l09
	FROM ANTERO.sa.sa_valos WHERE rekno=9 OR rekno=18) p
UNPIVOT
  (summa FOR menolajitoiminto IN
    (k100l09)) AS unpvt
    LEFT JOIN ANTERO.dw.d_organisaatio d1 ON RIGHT(ytunnus,9)=organisaatio_koodi
    LEFT JOIN ANTERO.sa.sa_koodistot d2 ON d2.koodisto='vipunenvaloskoulutusmuoto' and d2.koodi=koulumto
    LEFT JOIN ANTERO.sa.sa_koodistot d3 ON d3.koodisto='vipunenvaloskoulutusala' and d3.koodi=kala
    LEFT JOIN ANTERO.sa.sa_koodistot d4 ON d4.koodisto='vipunenvalosomistajatyyppi' and d4.koodi=OMISTAJA
    LEFT JOIN ANTERO.sa.sa_koodistot d5 ON d5.koodisto='vipunenvalossektori' and d5.koodi=rekno
    LEFT JOIN ANTERO.sa.sa_koodistot d6 ON d6.koodisto='vipunenvalosmenolaji' and d6.koodi=RIGHT(menolajitoiminto,3)
    LEFT JOIN ANTERO.sa.sa_koodistot d7 ON d7.koodisto='vipunenvalostoiminto' and d7.koodi=LEFT(menolajitoiminto,4)
    LEFT JOIN ANTERO.dw.d_alueluokitus d8 ON d8.kunta_koodi=RIGHT(CONCAT('000', VIRKUNTA), 3)
    LEFT JOIN ANTERO.dw.d_alueluokitus d9 ON d9.kunta_koodi=RIGHT(CONCAT('000', KUNTA), 3)


GO


