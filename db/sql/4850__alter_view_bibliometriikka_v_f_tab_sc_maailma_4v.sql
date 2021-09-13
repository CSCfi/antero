USE [Bibliometriikka]
GO

/****** Object:  View [dbo].[v_f_tab_sc_maailma_4v]    Script Date: 13.9.2021 13:40:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



/****** Script for SelectTopNRows command from SSMS  ******/
ALTER VIEW [dbo].[v_f_tab_sc_maailma_4v]
AS

SELECT distinct     [Vuosikoodi] = dv.ScVuosikoodi4
, [Nelivuotiskausi] = dv.[Nelivuotisjakso]
, [Vuosi] = null
--, [Maakoodi] = '1'
, [Maajärjestys] = 
case 
	when dm.REL=0 then '999' 
	else dm.[ABC-koodi]
end
, [IDkoodi] = f.[ID_KEY]
, [Maa] =  
	case 
		when dm.REL=0 then 'Muu' 
		else dm.Maa
	end
, [Manner] = dmanner.Manner
, [Mannerkoodi] = dmanner.Mannerkoodi
, [EU15-maat] = deu15.[EU15-maa]
, [EU15-maat jarjestys] = deu15.[Esitys]
, [EU-maat] = deu.[EU-maa]
, [EU-maat jarjestys] = deu.[Esitys]
, [IC-maat] = dic.[IC-maa]
, [OECD-maat] = doecd.[OECD-maa]
, [OECD-maat jarjestys] = doecd.[Esitys]
, [Pohjoismaat] = dpm.[Pohjoismaa]
, [Pohjoismaat jarjestys] = dpm.[Esitys]
, [Maaryhmä] = dmr.[Maaryhmä]
	--case 
	--	when ScKuutio2016.DimMaat2014.Maa='Suomi' then 'Suomi' 
	--	else ScKuutio2016.DimMaaryhmät.[Maaryhmä]
	--end
, [Maaryhmä Järjestys] = dmr.[OrderId]
, [Yhteistyö] = null 
, [Päätieteenala koodi] = dpta.ScAlakoodi1
, [Päätieteenala] = dpta.Päätieteenala 
, [Tieteenala koodi] = dbta.ScAlakoodi2A
, [Tieteenala] = dbta.[Bibliometrinen ala]
, [Tieteenalaryhma koodi] = dtar.ScAlakoodi2B
, [Tieteenalaryhmä] = dtar.Tieteenalaryhmä
, [Tieteenalaryhmä jarjestys] = dtar.Esitys
, [Scopus tieteenala koodi] = dta.ScAlakoodi3
, [Scopus tieteenala] = dta.[Scopus-tieteenala]
, [Organisaatio] = null
, [Organisaatio jarjestys] = null
, [Organisaatiotyyppi] = null
, [Organisaatiotyyppi koodi] = null
, [Kansainvälinen yhteistyö] = dkvy.[Kansainvälinen yhteistyö]
, [Kansainvälinen yhteistyö jarjestys] = dkvy.[Esitys]
, [Kansallinen Yhteistyö] = null
, [Kansallinen Yhteistyö jarjestys] = null
, [Kansallinen Yliopistoyhteistyö] = null
, [Kansallinen Yliopistoyhteistyö jarjestys] = null
, [Kansallinen Yritysyhteistyö] = null  
, [Kansallinen Yritysyhteistyö jarjestys] = null 
, [Julkaisut Maailma 4 vuotta] = f.Julkaisut
, [Top10 Julkaisut (Maailma 4v Ositettu)] = f.[Top10-julkaisut]
, [Analyysijulkaisut Maailma 4 vuotta] = f.Analyysijulkaisut
, [TOP 10 Julkaisut Maailma 4 vuotta] = f.JulkaisutT10
, [TOP 5 Julkaisut Maailma 4 vuotta] = f.JulkaisutT5
, [TOP 1 Julkaisut Maailma 4 vuotta] = f.JulkaisutT1
, [Sisäinen kattavuus Maailma 4 vuotta] = f.[Sisäinen kattavuus]
, [Sitaatiot Maailma 4 vuotta] = f.Sitaatiot
, [TOP 10 Indeksi Maailma 4 vuotta] = f.Top10
, [TOP 5 Indeksi Maailma 4 vuotta] = f.Top5
, [TOP 1 Indeksi Maailma 4 vuotta] = f.Top1
, [Julkaisut Suomi 4 vuotta] = null
, [Analyysijulkaisut Suomi 4 vuotta] = null
, [Julkaisut Suomi 1 vuotta] = null
, [TOP 10 Julkaisut Suomi 4 vuotta] = null
, [TOP 5 Julkaisut Suomi 4 vuotta] = null
, [TOP 1 Julkaisut Suomi 4 vuotta] = null
, [Sisäinen kattavuus Suomi 4 vuotta] = null
, [Sitaatiot Suomi 4 vuotta] = null
, [TOP 10 Indeksi Suomi 4 vuotta] = null 
, [TOP 5 Indeksi Suomi 4 vuotta] = null
, [TOP 1 Indeksi Suomi 4 vuotta] = null
, [TOP 10 Julkaisut Suomi 1 vuosi] = null
, [TOP 5 Julkaisut Suomi 1 vuosi] = null
, [TOP 1 Julkaisut Suomi 1 vuosi] = null
, [Sisäinen kattavuus Suomi 1 vuosi] = null
, [Sitaatiot Suomi 1 vuosi] = null
, [TOP 10 Indeksi Suomi 1 vuosi] = null 
, [TOP 5 Indeksi Suomi 1 vuosi] = null
, [TOP 1 Indeksi Suomi 1 vuosi] = null
, [PID] = null

FROM ScKuutio2021.FactMaailma4vuotta as f 
INNER JOIN ScKuutio2021.Dim4Vuosi as dv ON f.ScVuosikoodi4 = dv.ScVuosikoodi4 
INNER JOIN ScKuutio2021.DimMaat as dm ON f.Maanumero = dm.Maakoodi 
INNER JOIN ScKuutio2021.DimManner as dmanner ON dm.Mannerkoodi = dmanner.Mannerkoodi
INNER JOIN ScKuutio2021.DimEU15 as deu15 ON dm.[EU15-koodi] = deu15.[EU15-koodi]
INNER JOIN ScKuutio2021.DimEU as deu ON dm.[EU-koodi] = deu.[EU-koodi]
INNER JOIN ScKuutio2021.DimOECD as doecd ON dm.[OECD-koodi] = doecd.[OECD-koodi]
INNER JOIN ScKuutio2021.DimIC as dic ON dm.[IC-koodi] = dic.[IC-koodi]
INNER JOIN ScKuutio2021.DimPohjoismaat as dpm ON dm.Pohjoismaakoodi = dpm.Pohjoismaakoodi
INNER JOIN ScKuutio2021.DimScTieteenala as dta ON f.ScAlakoodi3 = dta.ScAlakoodi3 
INNER JOIN ScKuutio2021.DimTieteenalaryhmät as dtar ON dta.ScAlakoodi2b = dtar.ScAlakoodi2B
INNER JOIN ScKuutio2021.DimBibliometrisetTieteenalat as dbta ON dta.ScAlakoodi2A = dbta.ScAlakoodi2A 
INNER JOIN ScKuutio2021.DimPäätieteenala as dpta ON dta.ScAlakoodi1 = dpta.ScAlakoodi1 
INNER JOIN ScKuutio2021.DimKansainvälinenYhteistyö as dkvy ON f.Kansainvälinen_yt_tunnus = dkvy.Kansainvälinen_yt_tunnus 
INNER JOIN ScKuutio2021.DimMaaryhmät as dmr ON dm.[Pohjoismaakoodi] = dmr.Pohjoismaakoodi
OR dm.[EU15-koodi] = dmr.[EU15-Koodi] 
OR dm.[OECD-koodi] = dmr.[OECD-koodi]
OR dm.[IC-koodi] = dmr.[IC-koodi]
OR dm.[Muutkoodi] = dmr.Muutkoodi
OR dm.[Maakoodi] = dmr.Maakoodi
WHERE dv.[ScVuosikoodi4] < '18'

-----------------------------------

UNION ALL

SELECT distinct [Vuosikoodi] = dv.ScVuosikoodi4
, [Nelivuotiskausi] = dv.[Nelivuotisjakso]
, [Vuosi] = null
--, [Maakoodi] = '1'
, [Maajärjestys] = '167'
, [IDkoodi] = null
, [Maa] = 'Suomi'
, [Manner] = 'Eurooppa'
, [Mannerkoodi] = '1'
, [EU15 Maat] = 'EU15-maat'
, [EU15-maat jarjestys] = 1
, [EU Maat] = 'EU-maat'
, [EU-maat jarjestys] = 1
, [IC Maat] = null
, [OECD Maat] = 'OECD-maat'
, [OECD-maat jarjestys] = 1
, [Pohjoismaat] = 'Pohjoismaat'
, [Pohjoismaat jarjestys] = 1
, [Maaryhmä] = 'Suomi'
, [Maaryhmä järjestys] = '1'
, [Yhteistyö] = 
	case 
		when f.Kansainvälinen_yt_tunnus=1 then 'Kansainvälinen yhteisjulkaisu' 
		when f.Kansainvälinen_yt_tunnus=0 and (f.Kotim_yliop_yt_tunnus=1 OR f.Kotim_yr_yt_tunnus=1 OR f.Kotim_yt_tunnus=1) then 'Kansallinen yhteisjulkaisu' 
		else 'Yhden organisaation julkaisu'
	end
, [Päätieteenala koodi] = dpta.ScAlakoodi1
, [Päätieteenala] = dpta.Päätieteenala
, [Tieteenala koodi] = dbta.ScAlakoodi2A
, [Tieteenala] = dbta.[Bibliometrinen ala]
, [Tieteenalaryhma koodi] = dtar.ScAlakoodi2B
, [Tieteenalaryhmä] = dtar.Tieteenalaryhmä
, [Tieteenalaryhmä jarjestys] = dtar.Esitys
, [Scopus tieteenala koodi] = dta.ScAlakoodi3
, [Scopus tieteenala] = dta.[Scopus-tieteenala]
, [Organisaatio] = do.[Organisaationimi_suomi]
, [Organisaatio jarjestys] = do.[Esitysjärjestys]
, [Organisaation tyyppi] = dot.[Organisaatiotyyppinimi_suomi]
, [Organisaatiotyyppi koodi] = dot.Organisaatiotyyppinumero
, [Kansainvälinen yhteistyö] = dkvy.[Kansainvälinen yhteistyö]
, [Kansainvälinen yhteistyö jarjestys] = dkvy.[Esitys]
, [Kansallinen Yhteistyö] = dky.[Kotimainen yhteistyö]
, [Kansallinen Yhteistyö jarjestys] = dky.[Esitys]
, [Kansallinen Yliopistoyhteistyö] = dkyly.[Kotimainen yliopistoyhteistyö]
, [Kansallinen Yliopistoyhteistyö jarjestys] = dkyly.[Esitys]
, [Kansallinen Yritysyhteistyö] = dkyry.[Kotimainen yhteistyö yritysten kanssa]
, [Kansallinen Yritysyhteistyö jarjestys] = dkyry.[Esitys]
, [Julkaisut Maailma 4 vuotta] = null
, [Top10 Julkaisut (Maailma 4v Ositettu)] = null
, [Analyysijulkaisut Maailma 4 vuotta] = null
, [TOP 10 Julkaisut Maailma 4 vuotta] = null
, [TOP 5 Julkaisut Maailma 4 vuotta] = null
, [TOP 1 Julkaisut Maailma 4 vuotta] = null
, [Sisäinen kattavuus Maailma 4 vuotta] = null
, [Sitaatiot Maailma 4 vuotta] = null
, [TOP 10 Indeksi Maailma 4 vuotta] = null
, [TOP 5 Indeksi Maailma 4 vuotta] = null
, [TOP 1 Indeksi Maailma 4 vuotta] = null
, [Julkaisut Suomi 4 vuotta] = f.[Julkaisut]
, [Analyysijulkaisut Suomi 4 vuotta] = f.Analyysijulkaisut
, [Julkaisut Suomi 1 vuotta] = null
, [TOP 10 Julkaisut Suomi 4 vuotta] = f.[JulkaisutT10]
, [TOP 5 Julkaisut Suomi 4 vuotta] = f.[JulkaisutT5]
, [TOP 1 Julkaisut Suomi 4 vuotta] = f.[JulkaisutT1]
, [Sisäinen kattavuus Suomi 4 vuotta] = f.[Sisäinen kattavuus]
, [Sitaatiot Suomi 4 vuotta] = f.[Sitaatiot]
, [TOP 10 Indeksi Suomi 4 vuotta] = f.[Top10]
, [TOP 5 Indeksi Suomi 4 vuotta] = f.[Top5]
, [TOP 1 Indeksi Suomi 4 vuotta] = f.[Top1]
, [TOP 10 Julkaisut Suomi 1 vuosi] = null
, [TOP 5 Julkaisut Suomi 1 vuosi] = null
, [TOP 1 Julkaisut Suomi 1 vuosi] = null
, [Sisäinen kattavuus Suomi 1 vuosi] = null
, [Sitaatiot Suomi 1 vuosi] = null
, [TOP 10 Indeksi Suomi 1 vuosi] = null 
, [TOP 5 Indeksi Suomi 1 vuosi] = null
, [TOP 1 Indeksi Suomi 1 vuosi] = null
, [PID] = null
FROM   ScKuutio2021.FactSuomi4vuotta as f    
INNER JOIN ScKuutio2021.Dim4Vuosi as dv ON f.ScVuosikoodi4 = dv.ScVuosikoodi4
INNER JOIN ScKuutio2021.DimOrg as do ON f.Organisaationumero = do.Organisaationumero 
INNER JOIN ScKuutio2021.DimOrgTyyppi as dot ON do.Organisaatiotyyppi = dot.Organisaatiotyyppinumero 
INNER JOIN ScKuutio2021.DimScTieteenala as dta ON f.ScAlakoodi3 = dta.ScAlakoodi3
INNER JOIN ScKuutio2021.DimTieteenalaryhmät as dtar ON dta.ScAlakoodi2b = dtar.ScAlakoodi2B
INNER JOIN ScKuutio2021.DimBibliometrisetTieteenalat as dbta ON dta.ScAlakoodi2A = dbta.ScAlakoodi2A 
INNER JOIN ScKuutio2021.DimPäätieteenala as dpta ON dta.ScAlakoodi1 = dpta.ScAlakoodi1 
INNER JOIN ScKuutio2021.DimKansainvälinenYhteistyö as dkvy ON f.Kansainvälinen_yt_tunnus = dkvy.Kansainvälinen_yt_tunnus  
INNER JOIN ScKuutio2021.DimKansallinenYhteistyö as dky ON f.kotim_yt_tunnus = dky.Kotim_yt_tunnus 
INNER JOIN ScKuutio2021.DimKansallinenYliopistoyhteistyö as dkyly ON f.Kotim_yliop_yt_tunnus = dkyly.Kotim_yliop_yt_tunnus 
INNER JOIN ScKuutio2021.DimKansallinenYritysYhteistyö as dkyry ON f.Kotim_yr_yt_tunnus = dkyry.Kotim_yr_yt_tunnus
WHERE dv.ScVuosikoodi4 < '18'

UNION ALL

--------------------

SELECT distinct [Vuosikoodi] = dv.ScVuosikoodi1
, [Nelivuotiskausi] =  null
, [Vuosi] = dv.[Vuosi]
--, [Maakoodi] = '1'
, [Maajärjestys] = '167'
, [IDkoodi] = null
, [Maa] = 'Suomi'
, [Manner] = 'Eurooppa'
, [Mannerkoodi] = '1'
, [EU15 Maat] = 'EU15-maat'
, [EU15-maat jarjestys] = 1
, [EU Maat] = 'EU-maat'
, [EU-maat jarjestys] = 1
, [IC Maat] = null
, [OECD Maat] = 'OECD-maat'
, [OECD-maat jarjestys] = 1
, [Pohjoismaat] = 'Pohjoismaat'
, [Pohjoismaat jarjestys] = 1
, [Maaryhmä] = 'Suomi'
, [Maaryhmä järjestys] = '1'
, [Yhteistyö] = 
	case 
		when f.Kansainvälinen_yt_tunnus=1 then 'Kansainvälinen yhteisjulkaisu' 
		when f.Kansainvälinen_yt_tunnus=0 and (f.Kotim_yliop_yt_tunnus=1 OR f.Kotim_yr_yt_tunnus=1 OR f.Kotim_yt_tunnus=1) then 'Kansallinen yhteisjulkaisu' 
		else 'Yhden organisaation julkaisu'
	end
, [Päätieteenala koodi] = dpta.ScAlakoodi1
, [Päätieteenala] = dpta.Päätieteenala
, [Tieteenala koodi] = dbta.ScAlakoodi2A
, [Tieteenala] = dbta.[Bibliometrinen ala]
, [Tieteenalaryhma koodi] = dtar.ScAlakoodi2B
, [Tieteenalaryhmä] = dtar.Tieteenalaryhmä
, [Tieteenalaryhmä jarjestys] = dtar.Esitys
, [Scopus tieteenala koodi] = dta.ScAlakoodi3
, [Scopus tieteenala] = dta.[Scopus-tieteenala]
, [Organisaatio] = do.Organisaationimi_suomi
, [Organisaatio jarjestys] = do.[Esitysjärjestys]
, [Organisaation tyyppi] = dot.[Organisaatiotyyppinimi_suomi]
, [Organisaatiotyyppi koodi] = dot.Organisaatiotyyppinumero
, [Kansainvälinen yhteistyö] = dkvy.[Kansainvälinen yhteistyö]
, [Kansainvälinen yhteistyö jarjestys] = dkvy.[Esitys]
, [Kansallinen Yhteistyö] = dky.[Kotimainen yhteistyö]
, [Kansallinen Yhteistyö jarjestys] = dky.[Esitys]
, [Kansallinen Yliopistoyhteistyö] = dkyly.[Kotimainen yliopistoyhteistyö]
, [Kansallinen Yliopistoyhteistyö jarjestys] = dkyly.[Esitys]
, [Kansallinen Yritysyhteistyö] = dkyry.[Kotimainen yhteistyö yritysten kanssa]
, [Kansallinen Yritysyhteistyö jarjestys] = dkyry.[Esitys]
, [Julkaisut Maailma 4 vuotta] = null
, [Top10 Julkaisut (Maailma 4v Ositettu)] = null
, [Analyysijulkaisut Maailma 4 vuotta] = null
, [TOP 10 Julkaisut Maailma 4 vuotta] = null
, [TOP 5 Julkaisut Maailma 4 vuotta] = null
, [TOP 1 Julkaisut Maailma 4 vuotta] = null
, [Sisäinen kattavuus Maailma 4 vuotta] = null
, [Sitaatiot Maailma 4 vuotta] = null
, [TOP 10 Indeksi Maailma 4 vuotta] = null
, [TOP 5 Indeksi Maailma 4 vuotta] = null
, [TOP 1 Indeksi Maailma 4 vuotta] = null
, [Julkaisut Suomi 4 vuotta] = null
, [Analyysijulkaisut Suomi 4 vuotta] = null
, [Julkaisut Suomi] = null
, [TOP 10 Indeksi Suomi 4 vuotta] = null 
, [TOP 5 Indeksi Suomi 4 vuotta] = null
, [TOP 1 Indeksi Suomi 4 vuotta] = null
, [Sisäinen kattavuus Suomi 4 vuotta] = null
, [Sitaatiot Suomi 4 vuotta] = null
, [TOP 10 Julkaisut Suomi 4 vuotta] = null 
, [TOP 5 Julkaisut Suomi 4 vuotta] = null
, [TOP 1 Julkaisut Suomi 4 vuotta] = null
, [TOP 10 Julkaisut Suomi 1 vuosi] = null
, [TOP 5 Julkaisut Suomi 1 vuosi] = null
, [TOP 1 Julkaisut Suomi 1 vuosi] = null
, [Sisäinen kattavuus Suomi 1 vuosi] = null
, [Sitaatiot Suomi 1 vuosi] = null
, [TOP 10 Indeksi Suomi 1 vuosi] = null
, [TOP 5 Indeksi Suomi 1 vuosi] = null
, [TOP 1 Indeksi Suomi 1 vuosi] = null
, [PID] = f.PID

FROM ScKuutio2021.FactSuomiWhole1Vuosi as f   
INNER JOIN ScKuutio2021.DimVuosi as dv ON f.ScVuosikoodi1 = dv.ScVuosikoodi1 
INNER JOIN ScKuutio2021.DimScTieteenala as dta ON f.ScAlakoodi3 = dta.ScAlakoodi3 
INNER JOIN ScKuutio2021.DimTieteenalaryhmät as dtar ON dta.ScAlakoodi2b = dtar.ScAlakoodi2B
INNER JOIN ScKuutio2021.DimBibliometrisetTieteenalat as dbta ON dta.ScAlakoodi2A = dbta.ScAlakoodi2A 
INNER JOIN ScKuutio2021.DimPäätieteenala as dpta ON dta.ScAlakoodi1 = dpta.ScAlakoodi1 
INNER JOIN ScKuutio2021.DimKansainvälinenYhteistyö as dkvy ON f.Kansainvälinen_yt_tunnus = dkvy.Kansainvälinen_yt_tunnus 
INNER JOIN ScKuutio2021.DimKansallinenYhteistyö as dky ON f.kotim_yt_tunnus = dky.Kotim_yt_tunnus 
INNER JOIN ScKuutio2021.DimKansallinenYliopistoyhteistyö as dkyly ON f.Kotim_yliop_yt_tunnus = dkyly.Kotim_yliop_yt_tunnus 
INNER JOIN ScKuutio2021.DimKansallinenYritysYhteistyö as dkyry ON f.Kotim_yr_yt_tunnus = dkyry.Kotim_yr_yt_tunnus 
INNER JOIN ScKuutio2021.DimOrg as do ON f.Organisaationumero = do.Organisaationumero 
INNER JOIN ScKuutio2021.DimOrgTyyppi as dot ON do.Organisaatiotyyppi = dot.Organisaatiotyyppinumero 
WHERE dv.[ScVuosikoodi1] < '21'



GO

USE [ANTERO]

