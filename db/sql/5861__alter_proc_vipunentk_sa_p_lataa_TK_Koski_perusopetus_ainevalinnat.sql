USE [VipunenTK_SA]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_TK_Koski_perusopetus_ainevalinnat]    Script Date: 31.1.2022 11:26:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dbo].[p_lataa_TK_Koski_perusopetus_ainevalinnat]
@jaadytyspvm nvarchar(8) = '' --ex.g. '31102021'
,@viive int = 0 --[vvvv-tilv]
,@linkedServerAlias nvarchar(50) = '' --empty for testing, 'DWIVIPUARCH' for real
AS

--Huom.:
-- Tämä proseduuri luo ja ajaa vuosiproseduurin. 
-- Muutokset skriptiin voi ajaa versionhallinnan läpi ja ajon/vuosiajot Jenkinsistä, tarvittaessa käsin ekson kautta arch-palvelimelta.
-- Tyhjillä parametreilla saa livedatasta tuoreimman tilastovuoden vastaavaan _TEST-päätteiseen tauluun.
-- Kutsutaan ehkä tulevaisuudessa proseduurilla X, jossa kursori hakee jäädytyspäivän perusteella taulusta Y ajettavat proseduurit viipeineen.


--apumuuttujat ja tilastovuosi (josta lukuvuosi)
DECLARE @pvmPaate nvarchar(9) = case when @jaadytyspvm = '' then '' else '_' + @jaadytyspvm end
DECLARE @tilv nvarchar(4) = case when @jaadytyspvm = '' then year(getdate()) - @viive else right(@jaadytyspvm,4) - @viive end
DECLARE @alkuPvm nvarchar(10) = cast(@tilv as nvarchar(4)) + '-01-01'
DECLARE @loppuPvm nvarchar(10) = cast(@tilv as nvarchar(4)) + '-07-31'
DECLARE @linkedServerPrefix nvarchar(50) = case when @linkedServerAlias = '' then '' else @linkedServerAlias + '.' end

--taulu sekä luotava proseduuri
DECLARE @taulupohja nvarchar(100) = 'dbo.TK_Koski_perusopetus_ainevalinnat'
DECLARE @taulu nvarchar(100) = @taulupohja + '_' + @tilv + (case when @jaadytyspvm = '' or @linkedServerPrefix = '' then '_TEST' else '' end)
DECLARE @procpohja nvarchar(100) = 'dbo.p_lataa_TK_Koski_perusopetus_ainevalinnat'
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

BEGIN

INSERT INTO ' + @taulu + '

SELECT
	[Lukuvuosi] = ''' + cast(@tilv-1 as nvarchar(4)) + '/' + @tilv + '''
	,oppija_oid
	,opiskeluoikeus_oid
	,paatason_suoritus_id
	,vuosiluokka
	,[vuosiluokan_suorituskieli]
	,[toimipiste_oid]
	,[oppilaitos_oid]
	,[koulutustoimija_oid]
	,[sukupuoli]
	,ika
	,aidinkieli
	,kansalaisuus
	,osasuoritus_id
	,[aine_koodisto]
	,[aine]
	,[aineen_oppimaara_koodisto]
	,[aineen_oppimaara]
	,[aineen_suorituskieli]
	,[aineen_arvosana]
	,[aineen_arviointi_hyvaksytty]
	,koulutusmoduuli_pakollinen
	,koulutusmoduuli_paikallinen
	,koulutusmoduuli_laajuus_arvo
	,koulutusmoduuli_laajuus_yksikko
	,kielet_lkm = sum(case when kieli_1_0 = 1 and kieli_ranki = 1 then 1 else 0 end) over (partition by paatason_suoritus_id)

FROM 
(
	SELECT	  
	oo.oppija_oid
	,oo.opiskeluoikeus_oid

	--suor
	,ps.paatason_suoritus_id
	,vuosiluokka = case when ps.suorituksen_tyyppi = ''perusopetuksenoppimaara'' then ''9'' else ps.koulutusmoduuli_koodiarvo end
	,vuosiluokan_suorituskieli = ps.suorituskieli_koodiarvo

	--org
	,ps.[toimipiste_oid]
	,oo.[oppilaitos_oid]
	,oo.[koulutustoimija_oid]

	--hlö
	,h.sukupuoli
	,[ika] = ' + @tilv + ' - year(h.syntymaaika)
	,h.aidinkieli
	,[kansalaisuus] = left(coalesce(kansalaisuus,''999''),3)

	--aineet ja oppimäärät
	,os.osasuoritus_id
	,[aine_koodisto] = os.[koulutusmoduuli_koodisto]
	,[aine] = os.[koulutusmoduuli_koodiarvo]
	,[aineen_oppimaara_koodisto] =	
		case 
			when os.[kieli_koodiarvo] is not null AND os.[koulutusmoduuli_koodiarvo] = ''AI'' 
			then ''oppiaineaidinkielijakirjallisuus''
			when os.[kieli_koodiarvo] is not null --AND os.[koulutusmoduuli_koodiarvo] <> ''AI''
			then ''kielivalikoima''
			else os.[koulutusmoduuli_koodisto]
		end
	,[aineen_oppimaara] = coalesce(os.[kieli_koodiarvo], os.[koulutusmoduuli_koodiarvo])
	,[aineen_suorituskieli] = os.suorituskieli_koodiarvo
	,[aineen_arvosana] = os.arviointi_arvosana_koodiarvo
	,[aineen_arviointi_hyvaksytty] = os.arviointi_hyvaksytty
	,os.koulutusmoduuli_pakollinen
	,os.koulutusmoduuli_paikallinen
	,os.koulutusmoduuli_laajuus_arvo
	,os.koulutusmoduuli_laajuus_yksikko

	--,[kielet_lkm] = sum(case when os.kieli_koodiarvo is not null AND os.koulutusmoduuli_koodiarvo <> ''AI'' then 1 else 0 end) 
	--				  over (partition by ps.paatason_suoritus_id)
	,kieli_1_0 = case when os.kieli_koodiarvo is not null and os.koulutusmoduuli_koodiarvo <> ''AI'' then 1 else 0 end
	,kieli_ranki = row_number() over (partition by ps.paatason_suoritus_id
										,case 
											when os.kieli_koodiarvo is not null and os.koulutusmoduuli_koodiarvo <> ''AI'' 
											then os.kieli_koodiarvo 
										 end
									  order by os.osasuoritus_id)
		
	--_pvm
	FROM ' + @linkedServerPrefix + 'Koski_SA' + @pvmPaate + '.[sa].[sa_koski_paatason_suoritus] ps
	LEFT JOIN ' + @linkedServerPrefix + 'Koski_SA' + @pvmPaate + '.[sa].[sa_koski_opiskeluoikeus] oo on oo.[opiskeluoikeus_oid] = ps.[opiskeluoikeus_oid]
	LEFT JOIN ' + @linkedServerPrefix + 'Koski_SA' + @pvmPaate + '.[sa].[sa_koski_henkilo] h on h.[oppija_oid] = oo.[oppija_oid]
	LEFT JOIN ' + @linkedServerPrefix + 'Koski_SA' + @pvmPaate + '.[sa].[sa_koski_osasuoritus] os on os.paatason_suoritus_id = ps.paatason_suoritus_id
		
	WHERE ((ps.[suorituksen_tyyppi] = ''perusopetuksenvuosiluokka'' AND ps.koulutusmoduuli_koodiarvo <> ''9'')
			OR ps.[suorituksen_tyyppi] = ''perusopetuksenoppimaara'')
		AND ps.[vahvistus_paiva] between ''' + @alkuPvm + ''' and ''' + @loppuPvm + '''
		AND os.[suorituksen_tyyppi] = ''perusopetuksenoppiaine''
		AND os.koulutusmoduuli_koodisto = ''koskioppiaineetyleissivistava''
		AND os.arviointi_hyvaksytty = 1
) q

END
'

EXEC (@createTable);
EXEC (@dropProc);
EXEC (@createProc);
EXEC sp_executesql @proc;


