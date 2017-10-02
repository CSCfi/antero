USE [Bibliometriikka]
GO

/****** Object:  View [dbo].[v_f_tab_maailma_4v_2014]    Script Date: 2.10.2017 16:27:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO















/****** Script for SelectTopNRows command from SSMS  ******/
ALTER VIEW [dbo].[v_f_tab_maailma_4v_2014]
AS

SELECT distinct     [Vuosikoodi] = DimVuosi2014.Vuosikoodi
, [Nelivuotiskausi] = DimVuosi2014.Nelivuotisjakso
, [Vuosi] = null
, [Maajärjestys] = 
case 
	when TRKuutio2014.DimMaat2014.REL=0 then '999' 
	else TRKuutio2014.DimMaat2014.[ABC-koodi]
end
, [IDkoodi] = TRKuutio2014.FactTRMaailma4vuotta2014.[ID_KEY]
, [Maa] =  
	case 
		when TRKuutio2014.DimMaat2014.REL=0 then 'Muu' 
		else DimMaat2014.Maa
	end
, [Manner] = TRKuutio2014.DimManner2014.Manner
, [Mannerkoodi] = TRKuutio2014.DimManner2014.Mannerkoodi
, [EU15-maat] = TRKuutio2014.DimEU152014.[EU15-maa]
, [EU-maat] = TRKuutio2014.DimEU2014.[EU-maa]
, [IC-maat] = TRKuutio2014.DimIC2014.[IC-maa]
, [OECD-maat] = TRKuutio2014.DimOECD2014.[OECD-maa]
, [Pohjoismaat] = TRKuutio2014.DimPohjoismaa2014.[Pohjoismaa]
, [Maaryhmä] = TRKuutio2014.DimMaaryhmät.[Maaryhmä]
	--case 
	--	when TRKuutio2014.DimMaat2014.Maa='Suomi' then 'Suomi' 
	--	else TRKuutio2014.DimMaaryhmät.[Maaryhmä]
	--end
, [Maaryhmä Järjestys] = TRKuutio2014.DimMaaryhmät.[OrderId]
, [Yhteistyö] = null 
, [Päätieteenala koodi] = DimPäätieteenala2014.Alakoodi1
, [Päätieteenala] = DimPäätieteenala2014.Alanimi_taso1
, [Tieteenala koodi] = DimAKatemianTieteenalat2014.Alakoodi2
, [Tieteenala] = DimAKatemianTieteenalat2014.Alanimi_taso2
, DimTRTieteenalat2014.TRAlakoodi
, DimTRTieteenalat2014.Alanimi_taso3
, [Organisaatio] = null
, [Organisaatiotyyppi] = null
, [Organisaatiotyyppi koodi] = null
, [Kansainvälinen yhteistyö] = TRKuutio2014.DimKansainvälinenYhteistyö2014.[Kansainvälinen yhteistyö]
, [Kansallinen Yhteistyö] = null
, [Kansallinen Yliopistoyhteistyö] = null
, [Kansallinen Yritysyhteistyö] = null  
, [Julkaisut Maailma 4 vuotta] = TRKuutio2014.FactTRMaailma4vuotta2014.Julkaisut
, [TOP 10 Julkaisut Maailma 4 vuotta] = TRKuutio2014.FactTRMaailma4vuotta2014.JulkaisutT10
, [TOP 5 Julkaisut Maailma 4 vuotta] = TRKuutio2014.FactTRMaailma4vuotta2014.JulkaisutT5
, [TOP 1 Julkaisut Maailma 4 vuotta] = TRKuutio2014.FactTRMaailma4vuotta2014.JulkaisutT1
, [Sisäinen kattavuus Maailma 4 vuotta] = TRKuutio2014.FactTRMaailma4vuotta2014.[Sisäinen kattavuus]
, [Sitaatiot Maailma 4 vuotta] = TRKuutio2014.FactTRMaailma4vuotta2014.Sitaatiot
, [TOP 10 Indeksi Maailma 4 vuotta] = TRKuutio2014.FactTRMaailma4vuotta2014.Top10
, [TOP 5 Indeksi Maailma 4 vuotta] = TRKuutio2014.FactTRMaailma4vuotta2014.Top5
, [TOP 1 Indeksi Maailma 4 vuotta] = TRKuutio2014.FactTRMaailma4vuotta2014.Top1
, [Julkaisut Suomi 4 vuotta] = null
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

FROM       TRKuutio2014.FactTRMaailma4vuotta2014  INNER JOIN
                         TRKuutio2014.DimVuosi2014 ON FactTRMaailma4vuotta2014.Vuosikoodi = DimVuosi2014.Vuosikoodi INNER JOIN
                         TRKuutio2014.DimMaat2014 ON FactTRMaailma4vuotta2014.Maakoodi = DimMaat2014.Maakoodi INNER JOIN
						 TRKuutio2014.DimManner2014 ON TRKuutio2014.DimManner2014.Mannerkoodi = DimMaat2014.Mannerkoodi INNER JOIN
						 TRKuutio2014.DimEU152014 ON TRKuutio2014.DimEU152014.[EU15-koodi] = DimMaat2014.[EU15-koodi] INNER JOIN
						 TRKuutio2014.DimEU2014 ON TRKuutio2014.DimEU2014.[EU-koodi] = DimMaat2014.[EU-koodi] INNER JOIN
						 TRKuutio2014.DimOECD2014 ON TRKuutio2014.DimOECD2014.[OECD-koodi] = DimMaat2014.[OECD-koodi] INNER JOIN
						 TRKuutio2014.DimIC2014 ON TRKuutio2014.DimIC2014.[IC-koodi] = DimMaat2014.[IC-koodi] INNER JOIN						 
						 TRKuutio2014.DimPohjoismaa2014 ON TRKuutio2014.DimPohjoismaa2014.Pohjoismaakoodi = DimMaat2014.Pohjoismaakoodi INNER JOIN
                         TRKuutio2014.DimTRTieteenalat2014 ON FactTRMaailma4vuotta2014.TRAlakoodi = DimTRTieteenalat2014.TRAlakoodi INNER JOIN
                         TRKuutio2014.DimAKatemianTieteenalat2014 ON DimTRTieteenalat2014.Alakoodi2 = DimAKatemianTieteenalat2014.Alakoodi2 INNER JOIN
                         TRKuutio2014.DimPäätieteenala2014 ON DimTRTieteenalat2014.Alakoodi1 = DimPäätieteenala2014.Alakoodi1 INNER JOIN
                         TRKuutio2014.DimKansainvälinenYhteistyö2014 ON FactTRMaailma4vuotta2014.Kansainvälinen_yt_koodi = DimKansainvälinenYhteistyö2014.Kansainvälinen_yt_tunnus INNER JOIN
						 TRKuutio2014.DimMaaryhmät ON 
						TRKuutio2014.DimMaaryhmät.[Pohjoismaakoodi] = TRKuutio2014.DimMaat2014.[Pohjoismaakoodi] OR
						TRKuutio2014.DimMaaryhmät.[EU15-Koodi] = TRKuutio2014.DimMaat2014.[EU15-koodi] OR
						TRKuutio2014.DimMaaryhmät.[OECD-koodi] = TRKuutio2014.DimMaat2014.[OECD-koodi] OR
						TRKuutio2014.DimMaaryhmät.[IC-koodi] = TRKuutio2014.DimMaat2014.[IC-koodi] OR 
						TRKuutio2014.DimMaaryhmät.[Muutkoodi] = TRKuutio2014.DimMaat2014.[Muutkoodi] OR
						TRKuutio2014.DimMaaryhmät.[Maakoodi] = TRKuutio2014.DimMaat2014.[Maakoodi]
						 WHERE [TRKuutio2014].[DimVuosi2014].[Vuosikoodi] < '23'
UNION ALL

SELECT distinct [Vuosikoodi] = DimVuosi2014.Vuosikoodi
, [Nelivuotiskausi] = DimVuosi2014.Nelivuotisjakso
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
, DimPäätieteenala2014.Alakoodi1
, DimPäätieteenala2014.Alanimi_taso1
, DimAKatemianTieteenalat2014.Alakoodi2
, DimAKatemianTieteenalat2014.Alanimi_taso2
, DimTRTieteenalat2014.TRAlakoodi
, DimTRTieteenalat2014.Alanimi_taso3
, [Organisaatio] = 
	case 
		when TRKuutio2014.DimOrg2014.[Organisaationimi_suomi] = 'Kymenlaakson AMK' then 'Kaakkois-Suomen AMK'
		when TRKuutio2014.DimOrg2014.[Organisaationimi_suomi] = 'Mikkelin AMK' then 'Kaakkois-Suomen AMK'
		when TRKuutio2014.DimOrg2014.[Organisaationimi_suomi] = 'Kemi-Tornion AMK' then 'Lapin AMK'
		when TRKuutio2014.DimOrg2014.[Organisaationimi_suomi] = 'Rovaniemen AMK' then 'Lapin AMK'
		else TRKuutio2014.DimOrg2014.[Organisaationimi_suomi]
	end
, [Organisaation tyyppi] = TRKuutio2014.DimOrgTyyppi2014.[Organisaatiotyyppinimi_suomi]
, [Organisaatiotyyppi koodi] = TRKuutio2014.DimOrgTyyppi2014.Organisaatiotyyppinumero
, [Kansainvälinen yhteistyö] = TRKuutio2014.DimKansainvälinenYhteistyö2014.[Kansainvälinen yhteistyö]
, [Kansallinen Yhteistyö] = TRKuutio2014.DimKansallinenYhteistyö2014.[Kotimainen yhteistyö]
, [Kansallinen Yliopistoyhteistyö] = TRKuutio2014.DimKansallinenYliopistoyhteistyö2014.[Kotimainen yliopistoyhteistyö]
, [Kansallinen Yritysyhteistyö] = TRKuutio2014.DimKansallinenYritysyhteistyö2014.[Kotimainen yhteistyö yritysten kanssa]
, MaailmaJulkaisut = null
, MaailmaT10 = null
, MaailmaT5 = null
, MaailmaT1 = null
, Maailma_sisainen_kattavuus = null
, Maailma_sitaatiot = null
, MaailmaTop10 = null
, MaailmaTop5 = null
, MaailmaTop1 = null
, [Julkaisut Suomi 4 vuotta] = f.[Julkaisut]
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

FROM   [TRKuutio2014].[FactTRSuomi4vuotta2014] f    INNER JOIN
						 TRKuutio2014.DimVuosi2014 ON f.Vuosikoodi = DimVuosi2014.Vuosikoodi INNER JOIN
                         TRKuutio2014.DimOrg2014 ON f.Organisaationumero = DimOrg2014.Organisaationumero INNER JOIN
						 TRKuutio2014.DimOrgTyyppi2014 ON DimOrg2014.Organisaatiotyyppi = DimOrgTyyppi2014.Organisaatiotyyppinumero INNER JOIN
                         TRKuutio2014.DimTRTieteenalat2014 ON f.TRAlakoodi = DimTRTieteenalat2014.TRAlakoodi INNER JOIN
                         TRKuutio2014.DimAKatemianTieteenalat2014 ON DimTRTieteenalat2014.Alakoodi2 = DimAKatemianTieteenalat2014.Alakoodi2 INNER JOIN
                         TRKuutio2014.DimPäätieteenala2014 ON DimTRTieteenalat2014.Alakoodi1 = DimPäätieteenala2014.Alakoodi1 INNER JOIN
                         TRKuutio2014.DimKansainvälinenYhteistyö2014 ON f.Kansainvälinen_yt_tunnus = DimKansainvälinenYhteistyö2014.Kansainvälinen_yt_tunnus  INNER JOIN
						 TRKuutio2014.DimKansallinenYhteistyö2014 ON f.kotim_yt_tunnus = DimKansallinenYhteistyö2014.Kotim_yt_tunnus INNER JOIN
						 TRKuutio2014.DimKansallinenYliopistoyhteistyö2014 ON f.Kotim_yliop_yt_tunnus = DimKansallinenYliopistoYhteistyö2014.Kotim_yliop_yt_tunnus INNER JOIN
						 TRKuutio2014.DimKansallinenYritysYhteistyö2014 ON f.Kotim_yr_tunnus = DimKansallinenYritysYhteistyö2014.Kotim_yr_tunnus
						 WHERE [TRKuutio2014].[DimVuosi2014].[Vuosikoodi] < '23'

UNION ALL

SELECT distinct [Vuosikoodi] = DimVuosi2014.Vuosikoodi
, [Nelivuotiskausi] =  DimVuosi2014.Nelivuotisjakso
, [Vuosi] = DimVuosi2014.[Vuosi]
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
, DimPäätieteenala2014.Alakoodi1
, DimPäätieteenala2014.Alanimi_taso1
, DimAKatemianTieteenalat2014.Alakoodi2
, DimAKatemianTieteenalat2014.Alanimi_taso2
, DimTRTieteenalat2014.TRAlakoodi
, DimTRTieteenalat2014.Alanimi_taso3
, [Organisaatio] = 
	case 
		when TRKuutio2014.DimOrg2014.[Organisaationimi_suomi] = 'Kymenlaakson AMK' then 'Kaakkois-Suomen AMK'
		when TRKuutio2014.DimOrg2014.[Organisaationimi_suomi] = 'Mikkelin AMK' then 'Kaakkois-Suomen AMK'
		when TRKuutio2014.DimOrg2014.[Organisaationimi_suomi] = 'Kemi-Tornion AMK' then 'Lapin AMK'
		when TRKuutio2014.DimOrg2014.[Organisaationimi_suomi] = 'Rovaniemen AMK' then 'Lapin AMK'
		else TRKuutio2014.DimOrg2014.[Organisaationimi_suomi]
	end
, [Organisaation tyyppi] = TRKuutio2014.DimOrgTyyppi2014.[Organisaatiotyyppinimi_suomi]
, [Organisaatiotyyppi koodi] = TRKuutio2014.DimOrgTyyppi2014.Organisaatiotyyppinumero
, [Kansainvälinen yhteistyö] = TRKuutio2014.DimKansainvälinenYhteistyö2014.[Kansainvälinen yhteistyö]
, [Kansallinen Yhteistyö] = TRKuutio2014.DimKansallinenYhteistyö2014.[Kotimainen yhteistyö]
, [Kansallinen Yliopistoyhteistyö] = TRKuutio2014.DimKansallinenYliopistoyhteistyö2014.[Kotimainen yliopistoyhteistyö]
, [Kansallinen Yritysyhteistyö] = TRKuutio2014.DimKansallinenYritysyhteistyö2014.[Kotimainen yhteistyö yritysten kanssa]
, MaailmaJulkaisut = null
, MaailmaT10 = null
, MaailmaT5 = null
, MaailmaT1 = null
, Maailma_sisainen_kattavuus = null
, Maailma_sitaatiot = null
, MaailmaTop10 = null
, MaailmaTop5 = null
, MaailmaTop1 = null
, [Julkaisut Suomi 4 vuotta] = null
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

FROM   [TRKuutio2014].[FactTRSuomiKuutioWhole2014]  f   INNER JOIN
                         TRKuutio2014.DimVuosi2014 ON f.Vuosikoodi = DimVuosi2014.Vuosikoodi INNER JOIN
                         TRKuutio2014.DimTRTieteenalat2014 ON f.TRAlakoodi = DimTRTieteenalat2014.TRAlakoodi INNER JOIN
                         TRKuutio2014.DimAKatemianTieteenalat2014 ON DimTRTieteenalat2014.Alakoodi2 = DimAKatemianTieteenalat2014.Alakoodi2 INNER JOIN
                         TRKuutio2014.DimPäätieteenala2014 ON DimTRTieteenalat2014.Alakoodi1 = DimPäätieteenala2014.Alakoodi1 INNER JOIN
                         TRKuutio2014.DimKansainvälinenYhteistyö2014 ON f.Kansainvälinen_yt_tunnus = DimKansainvälinenYhteistyö2014.Kansainvälinen_yt_tunnus INNER JOIN
                         TRKuutio2014.DimKansallinenYhteistyö2014 ON f.kotim_yt_tunnus = DimKansallinenYhteistyö2014.Kotim_yt_tunnus INNER JOIN
						 TRKuutio2014.DimKansallinenYliopistoyhteistyö2014 ON f.Kotim_yliop_yt_tunnus = DimKansallinenYliopistoYhteistyö2014.Kotim_yliop_yt_tunnus INNER JOIN
						 TRKuutio2014.DimKansallinenYritysYhteistyö2014 ON f.Kotim_yr_tunnus = DimKansallinenYritysYhteistyö2014.Kotim_yr_tunnus INNER JOIN 
						 TRKuutio2014.DimOrg2014 ON f.Organisaationumero = DimOrg2014.Organisaationumero INNER JOIN
						 TRKuutio2014.DimOrgTyyppi2014 ON DimOrg2014.Organisaatiotyyppi = DimOrgTyyppi2014.Organisaatiotyyppinumero 
                        
						WHERE [TRKuutio2014].[DimVuosi2014].[Vuosikoodi] < '26'













GO


