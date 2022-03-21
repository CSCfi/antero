USE [ANTERO]
GO

/****** Object:  View [api].[suoritteet]    Script Date: 15.2.2021 16:10:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [api].[suoritteet] AS

--ammatilliset haetaan ainakin tilapäisesti vanhasta 2017-taulusta, koska eivät mukana uudemmissa / jsyrjala 15.2.2021

--amm
SELECT vuosi AS 'Tilastovuosi'
    ,rekno AS 'Sektori Koodi'
    ,d5.nimi AS 'Sektori'
    --,right(ytunnus,9) AS 'Koulutuksen järjestäjä Koodi'
    ,ytunnus AS 'Koulutuksen järjestäjä Koodi'
    ,d1.organisaatio_fi AS 'Koulutuksen järjestäjä'
    ,kala AS 'Rahoituksen koulutusala Koodi'
    ,d3.nimi AS 'Rahoituksen koulutusala'
    ,koulumto AS 'Koulutusmuoto Koodi'
    ,d2.nimi AS 'Koulutusmuoto'
    ,OMISTAJA AS 'Omistajatyyppi Koodi'
    ,d4.nimi AS 'Omistajatyyppi'
    ,KUNTA AS 'Koulutuksen kunta Koodi'
    ,d9.kunta_fi AS 'Koulutuksen kunta'
    ,d9.maakunta_koodi AS 'Koulutuksen maakunta Koodi'
    ,d9.maakunta_fi AS 'Koulutuksen maakunta'
    ,VIRKUNTA AS 'Koulutuksen järjestäjän kunta Koodi'
    ,d8.kunta_fi AS 'Koulutuksen järjestäjän kunta'
    ,d8.maakunta_koodi AS 'Koulutuksen järjestäjän maakunta Koodi'
    ,d8.maakunta_fi AS 'Koulutuksen järjestäjän maakunta'
    ,cast(replace(suorite,',','.') as float)  AS 'Suorite'
    ,cast(k100l09 as float) AS 'Summa'

  --oletusjärjestys sorttausta varten, 1000000000+ lajittelee alikyselyn tulokset
    ,/*1000000000+*/ ROW_NUMBER() OVER(ORDER BY d1.id ASC, d2.id ASC , d3.id ASC , d4.id ASC , d5.id ASC, d8.id ASC, d9.id ASC ) as defaultorder

FROM sa.sa_valos_2017 --amm
    LEFT JOIN dw.d_organisaatio d1 ON ytunnus=organisaatio_koodi
    LEFT JOIN sa.sa_koodistot d2 ON d2.koodisto='vipunenvaloskoulutusmuoto' and d2.koodi=koulumto
    LEFT JOIN sa.sa_koodistot d3 ON d3.koodisto='vipunenvaloskoulutusala' and d3.koodi=kala
    LEFT JOIN sa.sa_koodistot d4 ON d4.koodisto='vipunenvalosomistajatyyppi' and d4.koodi=OMISTAJA
    LEFT JOIN sa.sa_koodistot d5 ON d5.koodisto='vipunenvalossektori' and d5.koodi=rekno
    LEFT JOIN dw.d_alueluokitus d8 ON d8.kunta_koodi= VIRKUNTA
    LEFT JOIN dw.d_alueluokitus d9 ON d9.kunta_koodi= KUNTA
	WHERE rekno in ('2','3','13','14') and rekno not in (select distinct rekno from sa.sa_valos) --amm

UNION ALL

SELECT vuosi AS 'Tilastovuosi'
    ,rekno AS 'Sektori Koodi'
    ,d5.nimi AS 'Sektori'
    --,right(ytunnus,9) AS 'Koulutuksen järjestäjä Koodi'
    ,ytunnus AS 'Koulutuksen järjestäjä Koodi'
    ,d1.organisaatio_fi AS 'Koulutuksen järjestäjä'
    ,kala AS 'Rahoituksen koulutusala Koodi'
    ,d3.nimi AS 'Rahoituksen koulutusala'
    ,koulumto AS 'Koulutusmuoto Koodi'
    ,d2.nimi AS 'Koulutusmuoto'
    ,OMISTAJA AS 'Omistajatyyppi Koodi'
    ,d4.nimi AS 'Omistajatyyppi'
    ,KUNTA AS 'Koulutuksen kunta Koodi'
    ,d9.kunta_fi AS 'Koulutuksen kunta'
    ,d9.maakunta_koodi AS 'Koulutuksen maakunta Koodi'
    ,d9.maakunta_fi AS 'Koulutuksen maakunta'
    ,VIRKUNTA AS 'Koulutuksen järjestäjän kunta Koodi'
    ,d8.kunta_fi AS 'Koulutuksen järjestäjän kunta'
    ,d8.maakunta_koodi AS 'Koulutuksen järjestäjän maakunta Koodi'
    ,d8.maakunta_fi AS 'Koulutuksen järjestäjän maakunta'
    ,cast(replace(suorite,',','.') as float)  AS 'Suorite'
    ,cast(k100l09 as float) AS 'Summa'

  --oletusjärjestys sorttausta varten, 1000000000+ lajittelee alikyselyn tulokset
    ,1000000000+ ROW_NUMBER() OVER(ORDER BY d1.id ASC, d2.id ASC , d3.id ASC , d4.id ASC , d5.id ASC, d8.id ASC, d9.id ASC ) as defaultorder

FROM sa.sa_valos
    LEFT JOIN dw.d_organisaatio d1 ON ytunnus=organisaatio_koodi
    LEFT JOIN sa.sa_koodistot d2 ON d2.koodisto='vipunenvaloskoulutusmuoto' and d2.koodi=koulumto
    LEFT JOIN sa.sa_koodistot d3 ON d3.koodisto='vipunenvaloskoulutusala' and d3.koodi=kala
    LEFT JOIN sa.sa_koodistot d4 ON d4.koodisto='vipunenvalosomistajatyyppi' and d4.koodi=OMISTAJA
    LEFT JOIN sa.sa_koodistot d5 ON d5.koodisto='vipunenvalossektori' and d5.koodi=rekno
    LEFT JOIN dw.d_alueluokitus d8 ON d8.kunta_koodi= VIRKUNTA
    LEFT JOIN dw.d_alueluokitus d9 ON d9.kunta_koodi= KUNTA
