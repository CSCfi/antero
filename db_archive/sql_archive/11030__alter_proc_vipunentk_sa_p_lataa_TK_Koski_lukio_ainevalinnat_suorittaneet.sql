USE [VipunenTK_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dbo].[p_lataa_TK_Koski_lukio_ainevalinnat_suorittaneet] 
	@jaadytyspvm nvarchar(8) = '' --02102024
	,@viive int = 0 --[vvvv-tilv]
	,@linkedServerAlias nvarchar(50) = '' --DWIVIPUARCH
AS

/*
Huom.
- Tämä proseduuri luo ja ajaa vuosiproseduurin. 
- Muutokset skriptiin voi ajaa versionhallinnan läpi ja ajon/vuosiajot Jenkinsistä, tarvittaessa myös käsin suoraan SQL-palvelimelta.
- Tyhjillä parametreilla saa livedatasta tuoreimman tilastovuoden vastaavaan _TEST-päätteiseen tauluun.

Luotavassa vuosiproseduurissa mm.
- Poimitaan oppiaineen tai oppimäärän suoritukset ja näille osasuoritusten tiedot tasolla OPS, tyyppi ja suorituskieli.
- Esilasketaan laajuksia ja muunnetaan ne opintopisteiksi (pl. oppiainetasolle kirjattu laajuus).
*/

--apumuuttujat ja tilastovuosi
DECLARE @tilv nvarchar(4) = case when @jaadytyspvm = '' then year(getdate()) - @viive else right(@jaadytyspvm,4) - @viive end
DECLARE @alkuPvm nvarchar(10) = cast(@tilv - 1 as nvarchar(4)) + '-08-01'
DECLARE @loppuPvm nvarchar(10) = cast(@tilv as nvarchar(4)) + '-07-31'
DECLARE @linkedServerPrefix nvarchar(50) = case when @linkedServerAlias = '' then '' else @linkedServerAlias + '.' end
DECLARE @pvmPaate nvarchar(9) = case when @jaadytyspvm = '' then '' else '_' + @jaadytyspvm end
DECLARE @pvmPaate2 nvarchar(9) = case when @tilv < 2021 then '_31102021' else @pvmPaate end

--taulu sekä luotava proseduuri
DECLARE @taulupohja nvarchar(100) = 'dbo.TK_Koski_lukio_ainevalinnat_suorittaneet'
DECLARE @taulu nvarchar(100) = @taulupohja + '_' + @tilv + (case when @jaadytyspvm = '' or @linkedServerPrefix = '' then '_TEST' else '' end)
DECLARE @procpohja nvarchar(100) = 'dbo.p_lataa_TK_Koski_lukio_ainevalinnat_suorittaneet'
DECLARE @proc nvarchar(100) = @procpohja + '_' + @tilv + (case when @jaadytyspvm = '' or @linkedServerPrefix = '' then '_TEST' else '' end)


DECLARE @createTable nvarchar(max) = '
DROP TABLE IF EXISTS ' + @taulu + '
SELECT TOP 0 * INTO ' + @taulu + '
FROM ' + @taulupohja

DECLARE @oppiaineet nvarchar(max) = '
		SELECT	
			lukuvuosi = concat(year(dateadd(month, 5, ps.vahvistus_paiva))-1, ''/'', year(dateadd(month, 5, ps.vahvistus_paiva)))
			,lukukausi = case when month(ps.vahvistus_paiva) < 8 then ''k'' else ''s'' end

			--lukion oppimäärä
			,ps.paatason_suoritus_id
			,[ops_voimaantulo] = case when ps.perusteenDiaarinumero in (''OPH-2263-2019'',''OPH-2267-2019'') then ''1.8.2021'' else ''Muu kuin 1.8.2021'' end
			,[lukionoppimaara] = ps.oppimaara
			,[lukionoppimaara_suorituskieli] = coalesce(ps.suorituskieli_koodiarvo,''-1'')
			,ps.toimipiste_oid
			,oo.oppilaitos_oid
			,oo.koulutustoimija_oid

			--henkilö
			,[sukupuoli_koodi] = h2.sukupuoli 
			,[ika] = coalesce((year(ps.vahvistus_paiva) - year(h.syntymaaika)), ''-1'')
			,[aidinkieli] =  coalesce(h.aidinkieli,''-1'')
			,[kansalaisuus] = case when h.kansalaisuus like ''%246%'' then ''246'' else coalesce(left(h.kansalaisuus,3),''999'') end

			--aine ja oppimäärä
			,os.osasuoritus_id
			,[aine_koodisto] = os.koulutusmoduuli_koodisto 
			,[aine] = os.koulutusmoduuli_koodiarvo
			,[aineenoppimaara_koodisto] =	
				case 
					when os.matematiikan_oppimaara_koodiarvo is not null then ''oppiainematematiikka''
					when os.kieli_koodiarvo is not null AND os.koulutusmoduuli_koodiarvo = ''AI'' then ''oppiaineaidinkielijakirjallisuus''
					when os.kieli_koodiarvo is not null AND os.koulutusmoduuli_koodiarvo != ''AI'' then ''kielivalikoima''
					else os.koulutusmoduuli_koodisto
				end
			,[aineenoppimaara] = coalesce(os.matematiikan_oppimaara_koodiarvo, os.kieli_koodiarvo, os.koulutusmoduuli_koodiarvo)
			,[aine_suorituskieli] = coalesce(os.suorituskieli_koodiarvo,''-1'')
			,[aine_laajuus] = os.koulutusmoduuli_laajuus_arvo
			,[aine_laajuus_yksikko] = coalesce(os.koulutusmoduuli_laajuus_yksikko, ''4'')
			,[aine_laajuus_puuttuu_0_1] = case when os.koulutusmoduuli_laajuus_arvo is null then 1 else 0 end
			,[aine_S_arvosana_0_1] = case os.arviointi_arvosana_koodiarvo when ''S'' then 1 else 0 end
			,[aine_arvosana] = os.arviointi_arvosana_koodiarvo
			,[aine_arviointi_hyvaksytty] = os.arviointi_hyvaksytty

			--kielten määrä
			,[kielet_lkm] = 
				sum(case when os.kieli_koodiarvo is not null and os.koulutusmoduuli_koodiarvo != ''AI'' then 1 else 0 end)
				over (partition by ps.paatason_suoritus_id)

		FROM ' + @linkedServerPrefix + 'Koski_SA' + @pvmPaate + '.sa.sa_koski_paatason_suoritus ps	
		LEFT JOIN ' + @linkedServerPrefix + 'Koski_SA' + @pvmPaate + '.sa.sa_koski_opiskeluoikeus oo on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
		LEFT JOIN ' + @linkedServerPrefix + 'Koski_SA' + @pvmPaate + '.sa.sa_koski_henkilo h on h.oppija_oid = oo.oppija_oid
		LEFT JOIN ' + @linkedServerPrefix + 'Koski_SA' + @pvmPaate2 + '.sa.sa_koski_henkilo h2 on h2.[oppija_oid] = oo.[oppija_oid] --sukupuoli-tieto purettu vasta 2021
		LEFT JOIN ' + @linkedServerPrefix + 'Koski_SA' + @pvmPaate + '.sa.sa_koski_osasuoritus os on os.paatason_suoritus_id = ps.paatason_suoritus_id 
														
		WHERE ps.suorituksen_tyyppi = ''lukionoppimaara''
		AND ps.vahvistus_paiva between ''' + @alkuPvm + ''' and ''' + @loppuPvm + '''
		AND os.suorituksen_tyyppi in (''lukionoppiaine'',''lukionmuuopinto'')
		AND os.koulutusmoduuli_koodisto is not null 
		AND (
			os.arviointi_hyvaksytty = 1 --ei hylättyjä
			OR (
				os.suorituksen_tyyppi = ''lukionmuuopinto'' --uudessa lopsissa ei arviointia tällä tasolla
				AND EXISTS (
					select 1 
					from ' + @linkedServerPrefix + 'Koski_SA' + @pvmPaate + '.sa.sa_koski_osasuoritus os2
					where os2.ylempi_osasuoritus_id = os.osasuoritus_id 
					and os2.arviointi_hyvaksytty = 1
				)
			)
		)
'

DECLARE @kurssit nvarchar(max) = '
		SELECT
			os.ylempi_osasuoritus_id
			,[kurssi_paikallinen_OPS_0_1] = cast(os.koulutusmoduuli_paikallinen as int)
			,[kurssi_pakollinen_0_1] = cast(os.koulutusmoduuli_pakollinen as int)
			,[kurssi_tyyppi] = os.kurssin_tyyppi_koodiarvo
			,[kurssi_suorituskieli] = coalesce(os.suorituskieli_koodiarvo,''-1'')			

			,kurssit_laajuus = 
				sum(
					case when os.koulutusmoduuli_laajuus_yksikko = ''2'' then 1 else 2 end
					* coalesce(os.koulutusmoduuli_laajuus_arvo, 1) --laajuus nykyään pakollinen
				)
			,[kurssit_laajuus_all_suorituskieli] = 
				sum(
					sum(
						case when os.koulutusmoduuli_laajuus_yksikko = ''2'' then 1 else 2 end
						* coalesce(os.koulutusmoduuli_laajuus_arvo, 1)
					)
				) 
				over (partition by os.ylempi_osasuoritus_id, os.koulutusmoduuli_paikallinen, os.koulutusmoduuli_pakollinen, os.kurssin_tyyppi_koodiarvo)
			,[kurssit_S_arvosanat_laajuus] = 
				sum(
					case when os.koulutusmoduuli_laajuus_yksikko = ''2'' then 1 else 2 end
					* case os.arviointi_arvosana_koodiarvo when ''S'' then coalesce(os.koulutusmoduuli_laajuus_arvo, 1) else 0 end
				)
			,kurssit_lkm_total = sum(count(*)) over (partition by os.ylempi_osasuoritus_id)

		FROM ' + @linkedServerPrefix + 'Koski_SA' + @pvmPaate + '.[sa].[sa_koski_paatason_suoritus] ps
		LEFT JOIN ' + @linkedServerPrefix + 'Koski_SA' + @pvmPaate + '.[sa].[sa_koski_osasuoritus] os on ps.paatason_suoritus_id = os.paatason_suoritus_id
		
		WHERE ps.suorituksen_tyyppi = ''lukionoppimaara''
		AND ps.vahvistus_paiva between ''' + @alkuPvm + ''' and ''' + @loppuPvm + '''
		AND os.suorituksen_tyyppi in (''lukionkurssi'',''lukionvaltakunnallinenmoduuli'',''lukionpaikallinenopintojakso'')
		AND os.arviointi_arvosana_koodiarvo != ''O'' --ei kesken jääneitä
		AND os.ylempi_osasuoritus_id is not null --ei irtosuorituksia

		GROUP BY 
			os.ylempi_osasuoritus_id
			,os.koulutusmoduuli_paikallinen
			,os.koulutusmoduuli_pakollinen
			,os.kurssin_tyyppi_koodiarvo
			,os.suorituskieli_koodiarvo
'

DECLARE @dropProc nvarchar(max) = '
DROP PROCEDURE IF EXISTS ' + @proc

DECLARE @createProc nvarchar(max) = '
CREATE PROCEDURE ' + @proc + '
AS

BEGIN

	INSERT INTO ' + @taulu + '

	SELECT 
		[tilastovuosi] = ' + @tilv + '
		,lukuvuosi
		,lukukausi
		,paatason_suoritus_id
		,ops_voimaantulo
		,lukionoppimaara
		,lukionoppimaara_suorituskieli
		,toimipiste_oid
		,oppilaitos_oid
		,koulutustoimija_oid
		,sukupuoli = sukupuoli_koodi
		,ika
		,aidinkieli
		,kansalaisuus
		,[osasuoritus_id] = t1.osasuoritus_id
		,aine_koodisto
		,[aine] = --kielet luokitellaan "vähimmäislaajuuden" mukaan
			case 
				when aineenoppimaara_koodisto != ''kielivalikoima'' then aine
				when (
					aine in (''A'',''A1'',''A2'',''AOM'') 
					and (
						(aine_laajuus_yksikko = ''4'' and coalesce(aine_laajuus,0) < 6 and kurssit_lkm_total < 6) 
						or (aine_laajuus_yksikko = ''2'' and aine_laajuus < 12)
					)
				)
				or (
					aine = ''B1'' 
					and (
						(aine_laajuus_yksikko = ''4'' and coalesce(aine_laajuus,0) < 5 and kurssit_lkm_total < 5) 
						or (aine_laajuus_yksikko = ''2'' and aine_laajuus < 10)
					)
				) 
				or (
					aine in (''B2'',''B3'') 
					and (
						(aine_laajuus_yksikko = ''4'' and coalesce(aine_laajuus,0) < 3 and kurssit_lkm_total < 3) 
						or (aine_laajuus_yksikko = ''2'' and aine_laajuus < 6)
					)
				) then aine + ''X''
				else aine
			end
		,aineenoppimaara_koodisto
		,aineenoppimaara
		,aine_suorituskieli
		,aine_laajuus
		,aine_laajuus_yksikko
		,aine_laajuus_puuttuu_0_1
		,aine_S_arvosana_0_1
		,aine_arvosana
		,aine_arviointi_hyvaksytty
		,kielet_lkm
		,kurssi_paikallinen_OPS_0_1
		,kurssi_pakollinen_0_1
		,kurssi_tyyppi
		,kurssi_suorituskieli
		,kurssit_laajuus
		,kurssit_laajuus_all_suorituskieli
		,kurssit_S_arvosanat_laajuus

	FROM (' 	
		+ @oppiaineet +
	') t1
	LEFT JOIN (' 
		+ @kurssit + 
	') t2 ON t2.ylempi_osasuoritus_id = t1.osasuoritus_id

	WHERE aineenoppimaara not in (''MAA'',''MAB'',''MAY'')
	--siivotaan matematiikan keskeneräiset/ylimääräiset suoritukset
	OR (
		aineenoppimaara = ''MAA'' 
		AND (
			(aine_laajuus_yksikko = ''4'' AND (aine_laajuus >= 5 OR kurssit_lkm_total >= 5))
			OR (aine_laajuus_yksikko = ''2'' AND aine_laajuus >= 9)
		)
	)
	OR (
		aineenoppimaara = ''MAB'' 
		AND (
			(aine_laajuus_yksikko = ''4'' AND (aine_laajuus >= 3 OR kurssit_lkm_total >= 3))
			OR (aine_laajuus_yksikko = ''2'' AND aine_laajuus >= 6)
		)
	)

END
'

EXEC (@createTable);
EXEC (@dropProc);
EXEC (@createProc);
EXEC sp_executesql @proc;

GO
