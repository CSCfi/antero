IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'api.valos_suoritteet'))
EXEC dbo.sp_executesql @statement = N'create view api.valos_suoritteet as select 1 as a'
GO

ALTER VIEW api.valos_suoritteet AS
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
      ,KUNTA AS 'Koulutuksen kunta Koodi'
    ,d9.kunta_fi AS 'Koulutuksen kunta'
    ,d9.maakunta_koodi AS 'Koulutuksen maakunta Koodi'
    ,d9.maakunta_fi AS 'Koulutuksen maakunta'
    ,VIRKUNTA AS 'Koulutuksen järjestäjän kunta Koodi'
    ,d8.kunta_fi AS 'Koulutuksen järjestäjän kunta'
    ,d8.maakunta_koodi AS 'Koulutuksen järjestäjän maakunta Koodi'
    ,d8.maakunta_fi AS 'Koulutuksen järjestäjän maakunta'
      ,cast(replace(suorite,',','.') as float) AS 'Suorite'
      ,cast(replace(k100l09,',','.') as float) AS 'Summa'
FROM sa.sa_valos_2015
    LEFT JOIN dw.d_organisaatio d1 ON right(ytunnus,9)=organisaatio_koodi
    LEFT JOIN sa.sa_koodistot d2 ON d2.koodisto='vipunenvaloskoulutusmuoto' and d2.koodi=koulumto
    LEFT JOIN sa.sa_koodistot d3 ON d3.koodisto='vipunenvaloskoulutusala' and d3.koodi=kala
    LEFT JOIN sa.sa_koodistot d4 ON d4.koodisto='vipunenvalosomistajatyyppi' and d4.koodi=OMISTAJA
    LEFT JOIN sa.sa_koodistot d5 ON d5.koodisto='vipunenvalossektori' and d5.koodi=rekno
    LEFT JOIN dw.d_alueluokitus d8 ON d8.kunta_koodi=RIGHT(CONCAT('000', VIRKUNTA), 3)
    LEFT JOIN dw.d_alueluokitus d9 ON d9.kunta_koodi=RIGHT(CONCAT('000', KUNTA), 3)
