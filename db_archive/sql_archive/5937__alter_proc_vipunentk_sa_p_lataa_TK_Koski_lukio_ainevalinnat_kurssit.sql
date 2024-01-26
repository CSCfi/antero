USE [VipunenTK_SA]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_TK_Koski_lukio_ainevalinnat_kurssit]    Script Date: 23.2.2022 16:42:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dbo].[p_lataa_TK_Koski_lukio_ainevalinnat_kurssit]
@jaadytyspvm nvarchar(8) = '' --ex.g. '31102021'
,@viive int = 0 --[vvvv-tilv]
,@linkedServerAlias nvarchar(50) = '' --empty for testing, 'DWIVIPUARCH' for real
AS

--Huom. vuosipäivityksessä (ehkä vasta lops2021+3v)
-- kurssi vs. opintopiste -laajuus
-- suorituksen_tyyppi, kurssin_tyyppi_koodiarvo, koulutusmoduuli_paikallinen mahdolliset uudet arvot
-- päivitä tarvittaessa näkymän käyttämät dimensiot ja huomioi tässä latauksessa 
-- muuttujien nimeäminen näkymässä/kuutiossa ml. mittarien all-ehdot

--Huom.:
-- Tämä proseduuri luo ja ajaa vuosiproseduurin. 
-- Muutokset skriptiin voi ajaa versionhallinnan läpi ja ajon/vuosiajot Jenkinsistä, tarvittaessa käsin ekson kautta sql16-palvelimilta.
-- Tyhjillä parametreilla saa livedatasta tuoreimman tilastovuoden vastaavaan _TEST-päätteiseen tauluun.
-- Kutsutaan ehkä tulevaisuudessa proseduurilla X, jossa kursori hakee jäädytyspäivän perusteella taulusta Y ajettavat proseduurit viipeineen.


--apumuuttujat ja tilastovuosi
DECLARE @tilv nvarchar(4) = case when @jaadytyspvm = '' then year(getdate()) - @viive else right(@jaadytyspvm,4) - @viive end
DECLARE @linkedServerPrefix nvarchar(50) = case when @linkedServerAlias = '' then '' else @linkedServerAlias + '.' end
DECLARE @pvmPaate nvarchar(9) = case when @jaadytyspvm = '' then '' else '_' + @jaadytyspvm end
DECLARE @pvmPaate2 nvarchar(9) = case when @tilv < 2021 then '_31102021' else @pvmPaate end

--taulu sekä luotava proseduuri
DECLARE @taulupohja nvarchar(100) = 'dbo.TK_Koski_lukio_ainevalinnat_kurssit'
DECLARE @taulu nvarchar(100) = @taulupohja + '_' + @tilv + (case when @jaadytyspvm = '' or @linkedServerPrefix = '' then '_TEST' else '' end)
DECLARE @procpohja nvarchar(100) = 'dbo.p_lataa_TK_Koski_lukio_ainevalinnat_kurssit'
DECLARE @proc nvarchar(100) = @procpohja + '_' + @tilv + (case when @jaadytyspvm = '' or @linkedServerPrefix = '' then '_TEST' else '' end)

DECLARE @createTable nvarchar(max) = '
DROP TABLE IF EXISTS ' + @taulu + '
SELECT TOP 0 * INTO ' + @taulu + '
FROM ' + @taulupohja

DECLARE @dropProc nvarchar(max) = '
DROP PROCEDURE IF EXISTS ' + @proc

DECLARE @createProc nvarchar(max) = '
CREATE PROCEDURE ' + @proc + '
AS

DECLARE @alkuPvm date = DATEFROMPARTS(' + cast(@tilv - 1 as nvarchar(4)) + ', 8, 1)
DECLARE @loppuPvm date = DATEFROMPARTS(' + cast(@tilv as nvarchar(4)) + ', 7, 31)

BEGIN

  INSERT INTO ' + @taulu + '

	SELECT 

		[Tilastovuosi] = ' + @tilv + '
		,[paatason_suoritus_id]
		,[lukionoppimaara]
		,[lukionoppimaara_suorituskieli]
		,[toimipiste_oid]
		,[oppilaitos_oid]
		,[koulutustoimija_oid]
		,[sukupuoli]
		,[aine_koodisto]
		,[aine]
		,[aineenoppimaara_koodisto]
		,[aineenoppimaara]
		,[kurssi_koodisto]
		,[kurssi]
		,[kurssi_paikallinen_OPS_0_1]
		,[kurssi_tyyppi]
		,[kurssi_suorituskieli]
		,[kurssi_arvosana]
		,[lkm] = count(*)

	FROM 
	(
	  SELECT

	  --lukion oppimäärä
		ps.[paatason_suoritus_id]
		,[lukionoppimaara] = ps.oppimaara
		,[lukionoppimaara_suorituskieli] = coalesce(ps.[suorituskieli_koodiarvo],''-1'')
		,ps.[toimipiste_oid]
		,oo.[oppilaitos_oid]
		,oo.[koulutustoimija_oid]

	  --henkilö
		,h2.sukupuoli
		--,[ika] = coalesce(year(ps.[vahvistus_paiva]) - year(h.syntymaaika), -1)
		--,h.aidinkieli
		--,[kansalaisuus] = case when h.kansalaisuus like ''%246%'' then ''246'' else coalesce(left(h.kansalaisuus,3),''999'') end

	  --aine ja oppimäärä
		--,os2.[osasuoritus_id]
		,[aine_koodisto] = os2.[koulutusmoduuli_koodisto]
		,[aine] = os2.[koulutusmoduuli_koodiarvo]
		,[aineenoppimaara_koodisto] =	
			case 
				when os2.[matematiikan_oppimaara_koodiarvo] is not null --AND os2.[koulutusmoduuli_koodiarvo] = ''MA''
				then ''oppiainematematiikka''		
				--when os2.[uskonnon_oppimaara_koodiarvo] is not null --AND os2.[koulutusmoduuli_koodiarvo] in (''KT'',''ET'') 
				--then ''uskonnonoppimaara'' --in the future?
				when os2.[kieli_koodiarvo] is not null AND os2.[koulutusmoduuli_koodiarvo] = ''AI'' 
				then ''oppiaineaidinkielijakirjallisuus''
				when os2.[kieli_koodiarvo] is not null --AND os2.[koulutusmoduuli_koodiarvo] <> ''AI''
				then ''kielivalikoima''
				else os2.[koulutusmoduuli_koodisto]
			end
		,[aineenoppimaara] = coalesce(os2.[matematiikan_oppimaara_koodiarvo], os2.[kieli_koodiarvo], os2.[koulutusmoduuli_koodiarvo]) --os2.[uskonnon_oppimaara_koodiarvo]

	  --kurssit
		,[kurssi_koodisto] = os.[koulutusmoduuli_koodisto]
		,[kurssi] = os.[koulutusmoduuli_koodiarvo]
		,[kurssi_paikallinen_OPS_0_1] = cast(os.[koulutusmoduuli_paikallinen] as int)
		,[kurssi_tyyppi] = os.[kurssin_tyyppi_koodiarvo]
		,[kurssi_suorituskieli] = coalesce(os.[suorituskieli_koodiarvo],''-1'')
		,[kurssi_arvosana] = os.[arviointi_arvosana_koodiarvo]
		
	  --_pvm
		FROM ' + @linkedServerPrefix + 'Koski_SA' + @pvmPaate + '.sa.[sa_koski_paatason_suoritus] ps
		LEFT JOIN ' + @linkedServerPrefix + 'Koski_SA' + @pvmPaate + '.sa.[sa_koski_opiskeluoikeus] oo on oo.[opiskeluoikeus_oid] = ps.[opiskeluoikeus_oid]
		LEFT JOIN ' + @linkedServerPrefix + 'Koski_SA' + @pvmPaate + '.sa.[sa_koski_henkilo] h on h.[oppija_oid] = oo.[oppija_oid]
		LEFT JOIN ' + @linkedServerPrefix + 'Koski_SA' + @pvmPaate2 + '.sa.[sa_koski_henkilo] h2 on h2.[oppija_oid] = oo.[oppija_oid] --hetuttomille sukupuoli-tieto purettu vasta 2021
		LEFT JOIN ' + @linkedServerPrefix + 'Koski_SA' + @pvmPaate + '.sa.[sa_koski_osasuoritus] os on os.[paatason_suoritus_id] = ps.[paatason_suoritus_id]
		LEFT JOIN ' + @linkedServerPrefix + 'Koski_SA' + @pvmPaate + '.sa.[sa_koski_osasuoritus] os2 on os2.[osasuoritus_id] = os.[ylempi_osasuoritus_id]
		
		WHERE ps.[suorituksen_tyyppi] = ''lukionoppimaara'' 
		  AND ps.[vahvistus_paiva] between @alkuPvm and @loppuPvm
		  AND os.[suorituksen_tyyppi] = ''lukionkurssi''
			
	) f

	GROUP BY [paatason_suoritus_id]
		,[lukionoppimaara]
		,[lukionoppimaara_suorituskieli]
		,[toimipiste_oid]
		,[oppilaitos_oid]
		,[koulutustoimija_oid]
		,[sukupuoli]
		,[aine_koodisto]
		,[aine]
		,[aineenoppimaara_koodisto]
		,[aineenoppimaara]
		,[kurssi_koodisto]
		,[kurssi]
		,[kurssi_paikallinen_OPS_0_1]
		,[kurssi_tyyppi]
		,[kurssi_suorituskieli]
		,[kurssi_arvosana]

END
'

EXEC (@createTable);
EXEC (@dropProc);
EXEC (@createProc);
EXEC sp_executesql @proc;
