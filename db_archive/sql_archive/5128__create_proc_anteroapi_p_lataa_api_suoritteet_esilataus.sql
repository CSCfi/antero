USE ANTEROAPI
DROP PROCEDURE IF EXISTS [dw].[p_lataa_api_suoritteet_esilataus]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dw].[p_lataa_api_suoritteet_esilataus] AS

TRUNCATE TABLE [dw].[api_suoritteet]

INSERT INTO [dw].[api_suoritteet]


--amm
SELECT
     ROW_NUMBER() OVER(ORDER BY d1.id ASC, d2.id ASC , d3.id ASC , d4.id ASC , d5.id ASC, d8.id ASC, d9.id ASC ) AS defaultorder
	,vuosi AS 'Tilastovuosi'
    ,rekno AS 'Sektori Koodi'
    ,d5.nimi AS 'Sektori'
    ,right(ytunnus,9) AS 'Koulutuksen järjestäjä Koodi'
    --,ytunnus AS 'Koulutuksen järjestäjä Koodi'
    ,d1.organisaatio_fi AS 'Koulutuksen järjestäjä'
    ,kala AS 'Rahoituksen koulutusala Koodi'
    ,d3.nimi AS 'Rahoituksen koulutusala'
    ,koulumto AS 'Koulutusmuoto Koodi'
    ,d2.nimi AS 'Koulutusmuoto'
    ,OMISTAJA AS 'Omistajatyyppi Koodi'
    ,d4.nimi AS 'Omistajatyyppi'
    ,KUNTA AS 'Koulutuksen kunta Koodi'
    ,RTRIM(d9.kunta_fi) AS 'Koulutuksen kunta'
    ,d9.maakunta_koodi AS 'Koulutuksen maakunta Koodi'
    ,d9.maakunta_fi AS 'Koulutuksen maakunta'
    ,VIRKUNTA AS 'Koulutuksen järjestäjän kunta Koodi'
    ,d8.kunta_fi AS 'Koulutuksen järjestäjän kunta'
    ,d8.maakunta_koodi AS 'Koulutuksen järjestäjän maakunta Koodi'
    ,d8.maakunta_fi AS 'Koulutuksen järjestäjän maakunta'
    ,cast(replace(suorite,',','.') AS float)  AS 'Suorite'
    ,cast(k100l09 AS float) AS 'Summa'


FROM antero.sa.sa_valos_2017 --amm
    LEFT JOIN antero.dw.d_organisaatio d1 ON coalesce(nullif(ytunnus,''),'-1')=organisaatio_koodi
    LEFT JOIN antero.sa.sa_koodistot d2 ON d2.koodisto='vipunenvaloskoulutusmuoto' AND d2.koodi=koulumto
    LEFT JOIN antero.sa.sa_koodistot d3 ON d3.koodisto='vipunenvaloskoulutusala' AND d3.koodi=kala
    LEFT JOIN antero.sa.sa_koodistot d4 ON d4.koodisto='vipunenvalosomistajatyyppi' AND d4.koodi=OMISTAJA
    LEFT JOIN antero.sa.sa_koodistot d5 ON d5.koodisto='vipunenvalossektori' AND d5.koodi=rekno
    LEFT JOIN antero.dw.d_alueluokitus d8 ON d8.kunta_koodi= VIRKUNTA
    LEFT JOIN antero.dw.d_alueluokitus d9 ON d9.kunta_koodi= KUNTA
	WHERE rekno IN ('2','3','13','14') AND rekno NOT IN (SELECT DISTINCT rekno FROM antero.sa.sa_valos) --amm

UNION ALL

SELECT
     1000000000+ ROW_NUMBER() OVER(ORDER BY d1.id ASC, d2.id ASC , d3.id ASC , d4.id ASC , d5.id ASC, d8.id ASC, d9.id ASC ) AS defaultorder
	  ,vuosi AS 'Tilastovuosi'
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
    ,RTRIM(d9.kunta_fi)AS 'Koulutuksen kunta'
    ,d9.maakunta_koodi AS 'Koulutuksen maakunta Koodi'
    ,d9.maakunta_fi AS 'Koulutuksen maakunta'
    ,VIRKUNTA AS 'Koulutuksen järjestäjän kunta Koodi'
    ,d8.kunta_fi AS 'Koulutuksen järjestäjän kunta'
    ,d8.maakunta_koodi AS 'Koulutuksen järjestäjän maakunta Koodi'
    ,d8.maakunta_fi AS 'Koulutuksen järjestäjän maakunta'
    ,cast(replace(suorite,',','.') AS float)  AS 'Suorite'
    ,cast(k100l09 AS float) AS 'Summa'

FROM antero.sa.sa_valos
    LEFT JOIN antero.dw.d_organisaatio d1 ON ytunnus=organisaatio_koodi
    LEFT JOIN antero.sa.sa_koodistot d2 ON d2.koodisto='vipunenvaloskoulutusmuoto' AND d2.koodi=koulumto
    LEFT JOIN antero.sa.sa_koodistot d3 ON d3.koodisto='vipunenvaloskoulutusala' AND d3.koodi=kala
    LEFT JOIN antero.sa.sa_koodistot d4 ON d4.koodisto='vipunenvalosomistajatyyppi' AND d4.koodi=OMISTAJA
    LEFT JOIN antero.sa.sa_koodistot d5 ON d5.koodisto='vipunenvalossektori' AND d5.koodi=rekno
    LEFT JOIN antero.dw.d_alueluokitus d8 ON d8.kunta_koodi= VIRKUNTA
    LEFT JOIN antero.dw.d_alueluokitus d9 ON d9.kunta_koodi= KUNTA


GO
