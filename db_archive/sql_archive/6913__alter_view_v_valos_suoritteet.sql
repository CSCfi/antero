USE [ANTERO]
GO

/****** Object:  View [dw].[v_valos_suoritteet]    Script Date: 19.1.2023 23:11:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER VIEW [dw].[v_valos_suoritteet] AS

--ammatilliset haetaan ainakin tilapäisesti vanhasta 2017-taulusta, koska eivät mukana uudemmissa / jsyrjala 15.2.2021

--amm
SELECT vuosi AS 'Tilastovuosi'
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
    ,KUNTA AS 'Koulutuksen kunta Koodi'
	,d9.kunta_fi AS 'Koulutuksen kunta'
	,d9.maakunta_koodi AS 'Koulutuksen maakunta Koodi'
	,d9.maakunta_fi AS 'Koulutuksen maakunta'
	,d1.kunta_koodi AS 'Koulutuksen järjestäjän kunta Koodi'
	,d8.kunta_fi AS 'Koulutuksen järjestäjän kunta'
	,d8.maakunta_koodi AS 'Koulutuksen järjestäjän maakunta Koodi'
	,d8.maakunta_fi AS 'Koulutuksen järjestäjän maakunta'
    ,cast(replace(suorite,',','.') as float)  AS 'Suorite'
    ,cast(k100l09 as float) AS 'Summa'
FROM sa.sa_valos_2017 --amm
	  LEFT JOIN dw.d_organisaatioluokitus d1 ON coalesce(nullif(right(ytunnus,9),''),'-1')=organisaatio_koodi
	  LEFT JOIN sa.sa_koodistot d2 ON d2.koodisto='vipunenvaloskoulutusmuoto' and d2.koodi=koulumto
	  LEFT JOIN sa.sa_koodistot d3 ON d3.koodisto='vipunenvaloskoulutusala' and d3.koodi=kala
	  LEFT JOIN sa.sa_koodistot d4 ON d4.koodisto='vipunenvalosomistajatyyppi' and d4.koodi=OMISTAJA
	  LEFT JOIN sa.sa_koodistot d5 ON d5.koodisto='vipunenvalossektori' and d5.koodi=rekno
	  LEFT JOIN dw.d_alueluokitus d8 ON d8.kunta_koodi=d1.kunta_koodi
	  LEFT JOIN dw.d_alueluokitus d9 ON d9.kunta_koodi=RIGHT(CONCAT('000', KUNTA), 3)
	  WHERE rekno in ('2','3','13','14') and rekno not in (select distinct rekno from sa.sa_valos) --amm

UNION ALL

SELECT vuosi AS 'Tilastovuosi'
	  ,rekno AS 'Sektori Koodi'
	  ,d5.nimi AS 'Sektori'
    ,ytunnus AS 'Koulutuksen järjestäjä Koodi'
	  ,d1.organisaatio_fi AS 'Koulutuksen järjestäjä'
    ,kala AS 'Rahoituksen koulutusala Koodi'
	  ,d3.nimi AS 'Rahoituksen koulutusala'
    ,koulumto AS 'Koulutusmuoto Koodi'
	  ,case when koulumto = '133' then 'Perusopetus, muu pidennetyn oppivelvollisuuden opetus' when koulumto = '142' then 'Perusopetus, aikuisten perusopetus' else 
		d2.nimi end 
		AS 'Koulutusmuoto'
    ,OMISTAJA AS 'Omistajatyyppi Koodi'
	  ,d4.nimi AS 'Omistajatyyppi'
    ,KUNTA AS 'Koulutuksen kunta Koodi'
	  ,d9.kunta_fi AS 'Koulutuksen kunta'
	  ,d9.maakunta_koodi AS 'Koulutuksen maakunta Koodi'
	  ,d9.maakunta_fi AS 'Koulutuksen maakunta'
	  ,d1.kunta_koodi AS 'Koulutuksen järjestäjän kunta Koodi'
	  ,d8.kunta_fi AS 'Koulutuksen järjestäjän kunta'
	  ,d8.maakunta_koodi AS 'Koulutuksen järjestäjän maakunta Koodi'
	  ,d8.maakunta_fi AS 'Koulutuksen järjestäjän maakunta'
    ,cast(replace(suorite,',','.') as float)  AS 'Suorite'
    ,cast(k100l09 as float) AS 'Summa'
FROM sa.sa_valos
	  LEFT JOIN dw.d_organisaatioluokitus d1 ON coalesce(nullif(right(ytunnus,9),''),'-1')=organisaatio_koodi
	  LEFT JOIN sa.sa_koodistot d2 ON d2.koodisto='vipunenvaloskoulutusmuoto' and d2.koodi=koulumto
	  LEFT JOIN sa.sa_koodistot d3 ON d3.koodisto='vipunenvaloskoulutusala' and d3.koodi=kala
	  LEFT JOIN sa.sa_koodistot d4 ON d4.koodisto='vipunenvalosomistajatyyppi' and d4.koodi=OMISTAJA
	  LEFT JOIN sa.sa_koodistot d5 ON d5.koodisto='vipunenvalossektori' and d5.koodi=rekno
	  LEFT JOIN dw.d_alueluokitus d8 ON d8.kunta_koodi=d1.kunta_koodi
	  LEFT JOIN dw.d_alueluokitus d9 ON d9.kunta_koodi=RIGHT(CONCAT('000', KUNTA), 3)

GO


