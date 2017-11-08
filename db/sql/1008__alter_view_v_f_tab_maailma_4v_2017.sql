USE [Bibliometriikka]
GO

/****** Object:  View [dbo].[v_f_tab_maailma_4v_2017]    Script Date: 8.11.2017 11:55:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO














/****** Script for SelectTopNRows command from SSMS  ******/
ALTER VIEW [dbo].[v_f_tab_maailma_4v_2017]
AS

SELECT distinct     [Vuosikoodi] = DimVuosi2017.Vuosikoodi
, [Nelivuotiskausi] = DimVuosi2017.Nelivuotisjakso
, [Vuosi] = null
, [Maajärjestys] = 
case 
	when TRKuutio2017.DimMaat2017.REL=0 then '999' 
	else TRKuutio2017.DimMaat2017.[ABC-koodi]
end
, [IDkoodi] = TRKuutio2017.FactTRMaailma4vuotta2017.[ID_KEY]
, [Maa] =  
	case 
		when TRKuutio2017.DimMaat2017.REL=0 then 'Muu' 
		else DimMaat2017.Maa
	end
, [Manner] = TRKuutio2017.DimManner2017.Manner
, [Mannerkoodi] = TRKuutio2017.DimManner2017.Mannerkoodi
, [EU15-maat] = TRKuutio2017.DimEU152017.[EU15-maa]
, [EU-maat] = TRKuutio2017.DimEU2017.[EU-maa]
, [IC-maat] = TRKuutio2017.DimIC2017.[IC-maa]
, [OECD-maat] = TRKuutio2017.DimOECD2017.[OECD-maa]
, [Pohjoismaat] = TRKuutio2017.DimPohjoismaa2017.[Pohjoismaa]
, [Maaryhmä] = TRKuutio2017.DimMaaryhmät2017.[Maaryhmä]
	--case 
	--	when TRKuutio2017.DimMaat2017.Maa='Suomi' then 'Suomi' 
	--	else TRKuutio2017.DimMaaryhmät.[Maaryhmä]
	--end
, [Maaryhmä Järjestys] = TRKuutio2017.DimMaaryhmät2017.[OrderID]
, [Yhteistyö] = null 
, [Päätieteenala koodi] = DimPäätieteenala2017.Alakoodi1
, [Päätieteenala] = DimPäätieteenala2017.Alanimi_taso1
, [Tieteenala koodi] = DimAKatemianTieteenalat2017.Alakoodi2b
, [Tieteenalaryhmä (tieteen tila)] = DimAKatemianTieteenalat2017.Alanimi_taso2b
, [Tieteenala bibliometrinen koodi] = DimBibliometrisetTieteenalat2017.alakoodi2    --new field added 30.8.2017
, [Tieteenala] = DimBibliometrisetTieteenalat2017.alanimi_taso2						--new field added 30.8.2017
, DimTRTieteenalat2017.TRAlakoodi
, DimTRTieteenalat2017.Alanimi_taso3
, [Organisaatio] = null
, [Organisaatiotyyppi] = null
, [Organisaatiotyyppi koodi] = null
, [Kansainvälinen yhteistyö] = TRKuutio2017.DimKansainvälinenYhteistyö2017.[Kansainvälinen yhteistyö]
, [Kansallinen Yhteistyö] = null
, [Kansallinen Yliopistoyhteistyö] = null
, [Kansallinen Yritysyhteistyö] = null  
, [Julkaisut Maailma 4 vuotta] = TRKuutio2017.FactTRMaailma4vuotta2017.Julkaisut
, [Analyysijulkaisut Maailma 4 vuotta] = TRKuutio2017.FactTRMaailma4vuotta2017.Analyysijulkaisut
, [TOP 10 Julkaisut Maailma 4 vuotta] = TRKuutio2017.FactTRMaailma4vuotta2017.JulkaisutT10
, [TOP 5 Julkaisut Maailma 4 vuotta] = TRKuutio2017.FactTRMaailma4vuotta2017.JulkaisutT5
, [TOP 1 Julkaisut Maailma 4 vuotta] = TRKuutio2017.FactTRMaailma4vuotta2017.JulkaisutT1
, [Sisäinen kattavuus Maailma 4 vuotta] = TRKuutio2017.FactTRMaailma4vuotta2017.[Sisäinen kattavuus]
, [Sitaatiot Maailma 4 vuotta] = TRKuutio2017.FactTRMaailma4vuotta2017.Sitaatiot
, [TOP 10 Indeksi Maailma 4 vuotta] = TRKuutio2017.FactTRMaailma4vuotta2017.Top10
, [TOP 5 Indeksi Maailma 4 vuotta] = TRKuutio2017.FactTRMaailma4vuotta2017.Top5
, [TOP 1 Indeksi Maailma 4 vuotta] = TRKuutio2017.FactTRMaailma4vuotta2017.Top1
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

FROM       TRKuutio2017.FactTRMaailma4vuotta2017  INNER JOIN
                         TRKuutio2017.DimVuosi2017 ON FactTRMaailma4vuotta2017.Vuosikoodi = DimVuosi2017.Vuosikoodi INNER JOIN
                         TRKuutio2017.DimMaat2017 ON FactTRMaailma4vuotta2017.Maakoodi = DimMaat2017.Maakoodi INNER JOIN
						 TRKuutio2017.DimManner2017 ON TRKuutio2017.DimManner2017.Mannerkoodi = DimMaat2017.Mannerkoodi INNER JOIN
						 TRKuutio2017.DimEU152017 ON TRKuutio2017.DimEU152017.[EU15-koodi] = DimMaat2017.[EU15-koodi] INNER JOIN
						 TRKuutio2017.DimEU2017 ON TRKuutio2017.DimEU2017.[EU-koodi] = DimMaat2017.[EU-koodi] INNER JOIN
						 TRKuutio2017.DimOECD2017 ON TRKuutio2017.DimOECD2017.[OECD-koodi] = DimMaat2017.[OECD-koodi] INNER JOIN
						 TRKuutio2017.DimIC2017 ON TRKuutio2017.DimIC2017.[IC-koodi] = DimMaat2017.[IC-koodi] INNER JOIN						 
						 TRKuutio2017.DimPohjoismaa2017 ON TRKuutio2017.DimPohjoismaa2017.Pohjoismaakoodi = DimMaat2017.Pohjoismaakoodi INNER JOIN
                         TRKuutio2017.DimTRTieteenalat2017 ON FactTRMaailma4vuotta2017.TRAlakoodi = DimTRTieteenalat2017.TRAlakoodi INNER JOIN
                         TRKuutio2017.DimAKatemianTieteenalat2017 ON DimTRTieteenalat2017.Alakoodi2b = DimAKatemianTieteenalat2017.Alakoodi2b INNER JOIN
						 TRKuutio2017.DimBibliometrisetTieteenalat2017 ON DimTRTieteenalat2017.Alakoodi2 = DimBibliometrisetTieteenalat2017.Alakoodi2 INNER JOIN --new field added 30.8.2017
                         TRKuutio2017.DimPäätieteenala2017 ON DimTRTieteenalat2017.Alakoodi1 = DimPäätieteenala2017.Alakoodi1 INNER JOIN
                         TRKuutio2017.DimKansainvälinenYhteistyö2017 ON FactTRMaailma4vuotta2017.Kansainvälinen_yt_tunnus = DimKansainvälinenYhteistyö2017.Kansainvälinen_yt_tunnus INNER JOIN
						 TRKuutio2017.DimMaaryhmät2017 ON 
						TRKuutio2017.DimMaaryhmät2017.[Pohjoismaakoodi] = TRKuutio2017.DimMaat2017.[Pohjoismaakoodi] OR
						TRKuutio2017.DimMaaryhmät2017.[EU15-Koodi] = TRKuutio2017.DimMaat2017.[EU15-koodi] OR
						TRKuutio2017.DimMaaryhmät2017.[OECD-koodi] = TRKuutio2017.DimMaat2017.[OECD-koodi] OR
						TRKuutio2017.DimMaaryhmät2017.[IC-koodi] = TRKuutio2017.DimMaat2017.[IC-koodi] OR 
						TRKuutio2017.DimMaaryhmät2017.[Muutkoodi] = TRKuutio2017.DimMaat2017.[Muutkoodi] OR
						TRKuutio2017.DimMaaryhmät2017.[Maakoodi] = TRKuutio2017.DimMaat2017.[Maakoodi]
						 WHERE [TRKuutio2017].[DimVuosi2017].[Vuosikoodi] < '24'
UNION ALL

SELECT distinct [Vuosikoodi] = DimVuosi2017.Vuosikoodi
, [Nelivuotiskausi] = DimVuosi2017.Nelivuotisjakso
, [Vuosi] = null
, [Maajärjestys] = '167'
, [IDkoodi] = null
, Maa = 'Suomi'
, [Manner] = 'Eurooppa'
, [Mannerkoodi] = '1'
, [EU15 Maat] = '1'
, [EU Maat] = '1'
, [IC Maat] = null
, [OECD Maat] = '1'
, [Pohjoismaat] = '1'
, [Maaryhmä] = 'Suomi'
, [Maaryhmä järjestys] = '1'
, [Yhteistyö] = 
	case 
		when f.Kansainvälinen_yt_tunnus=1 then 'Kansainvälinen yhteisjulkaisu' 
		when f.Kansainvälinen_yt_tunnus=0 and (f.Kotim_yliop_yt_tunnus=1 OR f.Kotim_yr_tunnus=1 OR f.Kotim_yt_tunnus=1) then 'Kansallinen yhteisjulkaisu' 
		else 'Yhden organisaation julkaisu'
	end
, DimPäätieteenala2017.Alakoodi1
, DimPäätieteenala2017.Alanimi_taso1
, DimAKatemianTieteenalat2017.Alakoodi2b
, DimAKatemianTieteenalat2017.Alanimi_taso2b
, DimBibliometrisetTieteenalat2017.alakoodi2		--new field added 30.8.2017
, DimBibliometrisetTieteenalat2017.alanimi_taso2	--new field added 30.8.2017
, DimTRTieteenalat2017.TRAlakoodi
, DimTRTieteenalat2017.Alanimi_taso3
, [Organisaatio] = 
	case
		when TRKuutio2017.DimOrg2017.[Organisaationimi_suomi] = 'Kemi-Tornion AMK' then 'Lapin AMK'
		else TRKuutio2017.DimOrg2017.[Organisaationimi_suomi]
	end
, [Organisaation tyyppi] = TRKuutio2017.DimOrgTyyppi2017.[Organisaatiotyyppinimi_suomi]
, [Organisaatiotyyppi koodi] = TRKuutio2017.DimOrgTyyppi2017.Organisaatiotyyppinumero
, [Kansainvälinen yhteistyö] = TRKuutio2017.DimKansainvälinenYhteistyö2017.[Kansainvälinen yhteistyö]
, [Kansallinen Yhteistyö] = TRKuutio2017.DimKansallinenYhteistyö2017.[Kotimainen yhteistyö]
, [Kansallinen Yliopistoyhteistyö] = TRKuutio2017.DimKansallinenYliopistoyhteistyö2017.[Kotimainen yliopistoyhteistyö]
, [Kansallinen Yritysyhteistyö] = TRKuutio2017.DimKansallinenYritysyhteistyö2017.[Kotimainen yhteistyö yritysten kanssa]
, MaailmaJulkaisut = null
, MaailmaAnalyysijulkaisut = null
, MaailmaT10 = null
, MaailmaT5 = null
, MaailmaT1 = null
, Maailma_sisainen_kattavuus = null
, Maailma_sitaatiot = null
, MaailmaTop10 = null
, MaailmaTop5 = null
, MaailmaTop1 = null
, [Julkaisut Suomi 4 vuotta] = f.[Julkaisut]
, [Analyysijulkaisut Suomi 4 vuotta] = f.[Analyysijulkaisut]
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

FROM   [TRKuutio2017].[FactTRSuomi4vuotta2017] f    INNER JOIN
						 TRKuutio2017.DimVuosi2017 ON f.Vuosikoodi = DimVuosi2017.Vuosikoodi INNER JOIN
                         TRKuutio2017.DimOrg2017 ON f.Organisaationumero = DimOrg2017.Organisaationumero INNER JOIN
						 TRKuutio2017.DimOrgTyyppi2017 ON DimOrg2017.Organisaatiotyyppi = DimOrgTyyppi2017.Organisaatiotyyppinumero INNER JOIN
                         TRKuutio2017.DimTRTieteenalat2017 ON f.TRAlakoodi = DimTRTieteenalat2017.TRAlakoodi INNER JOIN
                         TRKuutio2017.DimAKatemianTieteenalat2017 ON DimTRTieteenalat2017.Alakoodi2b = DimAKatemianTieteenalat2017.Alakoodi2b INNER JOIN
						 TRKuutio2017.DimBibliometrisetTieteenalat2017 ON DimTRTieteenalat2017.Alakoodi2 = DimBibliometrisetTieteenalat2017.Alakoodi2 INNER JOIN --new field added 30.8.2017
                         TRKuutio2017.DimPäätieteenala2017 ON DimTRTieteenalat2017.Alakoodi1 = DimPäätieteenala2017.Alakoodi1 INNER JOIN
                         TRKuutio2017.DimKansainvälinenYhteistyö2017 ON f.Kansainvälinen_yt_tunnus = DimKansainvälinenYhteistyö2017.Kansainvälinen_yt_tunnus  INNER JOIN
						 TRKuutio2017.DimKansallinenYhteistyö2017 ON f.kotim_yt_tunnus = DimKansallinenYhteistyö2017.Kotim_yt_tunnus INNER JOIN
						 TRKuutio2017.DimKansallinenYliopistoyhteistyö2017 ON f.Kotim_yliop_yt_tunnus = DimKansallinenYliopistoYhteistyö2017.Kotim_yliop_yt_tunnus INNER JOIN
						 TRKuutio2017.DimKansallinenYritysYhteistyö2017 ON f.Kotim_yr_tunnus = DimKansallinenYritysYhteistyö2017.Kotim_yr_tunnus
						 WHERE [TRKuutio2017].[DimVuosi2017].[Vuosikoodi] < '24'

UNION ALL

SELECT distinct [Vuosikoodi] = DimVuosi2017.Vuosikoodi
, [Nelivuotiskausi] =  DimVuosi2017.Nelivuotisjakso
, [Vuosi] = DimVuosi2017.[Vuosi]
, [Maajärjestys] = '167'
, [IDkoodi] = null
, Maa = 'Suomi'
, [Manner] = 'Eurooppa'
, [Mannerkoodi] = '1'
, [EU15 Maat] = '1'
, [EU Maat] = '1'
, [IC Maat] = null
, [OECD Maat] = '1'
, [Pohjoismaat] = '1'
, [Maaryhmä] = 'Suomi'
, [Maaryhmä järjestys] = '1'
, [Yhteistyö] = 
	case 
		when f.Kansainvälinen_yt_tunnus=1 then 'Kansainvälinen yhteisjulkaisu' 
		when f.Kansainvälinen_yt_tunnus=0 and (f.Kotim_yliop_yt_tunnus=1 OR f.Kotim_yr_tunnus=1 OR f.Kotim_yt_tunnus=1) then 'Kansallinen yhteisjulkaisu' 
		else 'Yhden organisaation julkaisu'
	end
, DimPäätieteenala2017.Alakoodi1
, DimPäätieteenala2017.Alanimi_taso1
, DimAKatemianTieteenalat2017.Alakoodi2b
, DimAKatemianTieteenalat2017.Alanimi_taso2b
, DimBibliometrisetTieteenalat2017.alakoodi2		--new field added 30.8.2017
, DimBibliometrisetTieteenalat2017.alanimi_taso2	--new field added 30.8.2017
, DimTRTieteenalat2017.TRAlakoodi
, DimTRTieteenalat2017.Alanimi_taso3
, [Organisaatio] = 
	case
		when TRKuutio2017.DimOrg2017.[Organisaationimi_suomi] = 'Kemi-Tornion AMK' then 'Lapin AMK'
		else TRKuutio2017.DimOrg2017.[Organisaationimi_suomi]
	end
, [Organisaation tyyppi] = TRKuutio2017.DimOrgTyyppi2017.[Organisaatiotyyppinimi_suomi]
, [Organisaatiotyyppi koodi] = TRKuutio2017.DimOrgTyyppi2017.Organisaatiotyyppinumero
, [Kansainvälinen yhteistyö] = TRKuutio2017.DimKansainvälinenYhteistyö2017.[Kansainvälinen yhteistyö]
, [Kansallinen Yhteistyö] = TRKuutio2017.DimKansallinenYhteistyö2017.[Kotimainen yhteistyö]
, [Kansallinen Yliopistoyhteistyö] = TRKuutio2017.DimKansallinenYliopistoyhteistyö2017.[Kotimainen yliopistoyhteistyö]
, [Kansallinen Yritysyhteistyö] = TRKuutio2017.DimKansallinenYritysyhteistyö2017.[Kotimainen yhteistyö yritysten kanssa]
, MaailmaJulkaisut = null
, MaailmaAnalyysijulkaisut = null
, MaailmaT10 = null
, MaailmaT5 = null
, MaailmaT1 = null
, Maailma_sisainen_kattavuus = null
, Maailma_sitaatiot = null
, MaailmaTop10 = null
, MaailmaTop5 = null
, MaailmaTop1 = null
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

FROM   [TRKuutio2017].[FactTRSuomiWhole2017]  f   INNER JOIN
                         TRKuutio2017.DimVuosi2017 ON f.Vuosikoodi = DimVuosi2017.Vuosikoodi INNER JOIN
                         TRKuutio2017.DimTRTieteenalat2017 ON f.TRAlakoodi = DimTRTieteenalat2017.TRAlakoodi INNER JOIN
                         TRKuutio2017.DimAKatemianTieteenalat2017 ON DimTRTieteenalat2017.Alakoodi2b = DimAKatemianTieteenalat2017.Alakoodi2b INNER JOIN
						 TRKuutio2017.DimBibliometrisetTieteenalat2017 ON DimTRTieteenalat2017.Alakoodi2 = DimBibliometrisetTieteenalat2017.Alakoodi2 INNER JOIN --new field added 30.8.2017
                         TRKuutio2017.DimPäätieteenala2017 ON DimTRTieteenalat2017.Alakoodi1 = DimPäätieteenala2017.Alakoodi1 INNER JOIN
                         TRKuutio2017.DimKansainvälinenYhteistyö2017 ON f.Kansainvälinen_yt_tunnus = DimKansainvälinenYhteistyö2017.Kansainvälinen_yt_tunnus INNER JOIN
                         TRKuutio2017.DimKansallinenYhteistyö2017 ON f.kotim_yt_tunnus = DimKansallinenYhteistyö2017.Kotim_yt_tunnus INNER JOIN
						 TRKuutio2017.DimKansallinenYliopistoyhteistyö2017 ON f.Kotim_yliop_yt_tunnus = DimKansallinenYliopistoYhteistyö2017.Kotim_yliop_yt_tunnus INNER JOIN
						 TRKuutio2017.DimKansallinenYritysYhteistyö2017 ON f.Kotim_yr_tunnus = DimKansallinenYritysYhteistyö2017.Kotim_yr_tunnus INNER JOIN 
						 TRKuutio2017.DimOrg2017 ON f.Organisaationumero = DimOrg2017.Organisaationumero INNER JOIN
						 TRKuutio2017.DimOrgTyyppi2017 ON DimOrg2017.Organisaatiotyyppi = DimOrgTyyppi2017.Organisaatiotyyppinumero 
                        
						WHERE [TRKuutio2017].[DimVuosi2017].[Vuosikoodi] < '27'






GO


