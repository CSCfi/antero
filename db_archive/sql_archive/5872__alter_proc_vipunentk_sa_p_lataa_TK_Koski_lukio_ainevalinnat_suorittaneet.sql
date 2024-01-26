USE [VipunenTK_SA]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_TK_Koski_lukio_ainevalinnat_suorittaneet]    Script Date: 8.2.2022 21:09:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dbo].[p_lataa_TK_Koski_lukio_ainevalinnat_suorittaneet] 
@jaadytyspvm nvarchar(8) = '' --ex.g. '31102021'
,@viive int = 0 --[vvvv-tilv]
,@linkedServerAlias nvarchar(50) = '' --empty for testing, 'DWIVIPUARCH' for real
AS

--Huom. vuosipäivityksessä (ehkä vasta lops2021+3v)
-- kurssi vs. opintopiste -laajuus
-- "suorituksen_tyyppi" uudet arvot rajauksissa 
-- päivitä tarvittaessa näkymän käyttämät dimensiot ja huomioi tässä latauksessa 
-- muuttujien nimeäminen näkymässä/kuutiossa 
-- "kurssin_tyyppi_koodiarvo" / "koulutusmoduuli_paikallinen" uudet arvot

--Huom.:
-- Tämä proseduuri luo ja ajaa vuosiproseduurin. 
-- Muutokset skriptiin voi ajaa versionhallinnan läpi ja ajon/vuosiajot Jenkinsistä, tarvittaessa käsin ekson kautta sql16-palvelimilta.
-- Tyhjillä parametreilla saa livedatasta tuoreimman tilastovuoden vastaavaan _TEST-päätteiseen tauluun.
-- Kutsutaan ehkä tulevaisuudessa proseduurilla X, jossa kursori hakee jäädytyspäivän perusteella taulusta Y ajettavat proseduurit viipeineen.


--apumuuttujat ja tilastovuosi
DECLARE @pvmPaate nvarchar(9) = case when @jaadytyspvm = '' then '' else '_' + @jaadytyspvm end
DECLARE @tilv nvarchar(4) = case when @jaadytyspvm = '' then year(getdate()) - @viive else right(@jaadytyspvm,4) - @viive end
DECLARE @alkuPvm nvarchar(10) = cast(@tilv - 1 as nvarchar(4)) + '-08-01'
DECLARE @loppuPvm nvarchar(10) = cast(@tilv as nvarchar(4)) + '-07-31'
DECLARE @linkedServerPrefix nvarchar(50) = case when @linkedServerAlias = '' then '' else @linkedServerAlias + '.' end

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
--lukion oppimäärä
ps.paatason_suoritus_id
,[lukionoppimaara] = ps.oppimaara
,[lukionoppimaara_suorituskieli] = coalesce(ps.suorituskieli_koodiarvo,''-1'')
,ps.toimipiste_oid
,oo.oppilaitos_oid
,oo.koulutustoimija_oid
--,d.organisaatiotyypit

--henkilö
,[sukupuoli_koodi] = h.sukupuoli
--coalesce(h2.sukupuoli,
--	case 
--		when cast(substring(h.hetu,8,3) as int) % 2 = 1 then ''1'' 
--		when cast(substring(h.hetu,8,3) as int) % 2 = 0 then ''2''
--		else ''-1''
--	end
--)
,[ika] = coalesce((year(ps.vahvistus_paiva) - year(h.syntymaaika)), ''-1'')
,[aidinkieli] =  coalesce(h.aidinkieli,''-1'')
,[kansalaisuus] = coalesce(left(h.kansalaisuus,3),''999'')

--aine ja oppimäärä
,os.osasuoritus_id
,[aine_koodisto] = os.koulutusmoduuli_koodisto 
,[aine] = os.koulutusmoduuli_koodiarvo
,[aineenoppimaara_koodisto] =	
	case 
		when os.matematiikan_oppimaara_koodiarvo is not null --AND os.koulutusmoduuli_koodiarvo = ''MA''
		then ''oppiainematematiikka''		
		--when os.uskonnon_oppimaara_koodiarvo is not null --AND os.koulutusmoduuli_koodiarvo in (''KT'',''ET'') 
		--then ''uskonnonoppimaara'' --in the future
		when os.kieli_koodiarvo is not null AND os.koulutusmoduuli_koodiarvo = ''AI'' 
		then ''oppiaineaidinkielijakirjallisuus''
		when os.kieli_koodiarvo is not null --AND os.koulutusmoduuli_koodiarvo <> ''AI'' 
		then ''kielivalikoima''
		else os.koulutusmoduuli_koodisto
	end
,[aineenoppimaara] = coalesce(os.matematiikan_oppimaara_koodiarvo, os.kieli_koodiarvo, os.koulutusmoduuli_koodiarvo) --os.uskonnon_oppimaara_koodiarvo,
,[aine_suorituskieli] = coalesce(os.suorituskieli_koodiarvo,''-1'')
,[aine_laajuus] = os.koulutusmoduuli_laajuus_arvo
,[aine_laajuus_yksikko] = coalesce(os.koulutusmoduuli_laajuus_yksikko, ''4'') --null estetty lops2021-?
,[aine_laajuus_puuttuu_0_1] = case when os.koulutusmoduuli_laajuus_arvo is null then 1 else 0 end
,[aine_S_arvosana_0_1] = case os.arviointi_arvosana_koodiarvo when ''S'' then 1 else 0 end
,[aine_arvosana] = os.arviointi_arvosana_koodiarvo
,[aine_arviointi_hyvaksytty] = os.arviointi_hyvaksytty

--kielten määrä
,[kielet_lkm] = sum(case when os.kieli_koodiarvo is not null AND os.koulutusmoduuli_koodiarvo <> ''AI'' then 1 else 0 end) 
				over (partition by ps.paatason_suoritus_id)
--_pvm
FROM ' + @linkedServerPrefix + 'Koski_SA' + @pvmPaate + '.sa.sa_koski_paatason_suoritus ps	
LEFT JOIN ' + @linkedServerPrefix + 'Koski_SA' + @pvmPaate + '.sa.sa_koski_opiskeluoikeus oo on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
LEFT JOIN ' + @linkedServerPrefix + 'Koski_SA' + @pvmPaate + '.sa.sa_koski_henkilo h on h.oppija_oid = oo.oppija_oid
--LEFT JOIN Koski_SA.sa.[sa_koski_henkilo] h2 on h2.[oppija_oid] = oo.[oppija_oid] --hetuttomille sukupuoli-tieto purettu vasta 2021
LEFT JOIN ' + @linkedServerPrefix + 'Koski_SA' + @pvmPaate + '.sa.sa_koski_osasuoritus os on os.paatason_suoritus_id = ps.paatason_suoritus_id 
														
WHERE ps.suorituksen_tyyppi = ''lukionoppimaara''
AND ps.vahvistus_paiva between ''' + @alkuPvm + ''' and ''' + @loppuPvm + '''
AND os.suorituksen_tyyppi in (''lukionoppiaine'',''lukionmuuopinto'')
AND os.koulutusmoduuli_koodisto is not null --ei tuntemattomia
AND os.koulutusmoduuli_paikallinen = 0 --varmistus että jatkossakin vain valtakunnalliset
AND os.arviointi_hyvaksytty = 1 --ei hylättyjä
'

DECLARE @kurssit nvarchar(max) = '
SELECT
ylempi_osasuoritus_id
,[kurssi_paikallinen_OPS_0_1] = cast(koulutusmoduuli_paikallinen as int)
,[kurssi_tyyppi] = os.kurssin_tyyppi_koodiarvo
,[kurssi_suorituskieli] = coalesce(os.suorituskieli_koodiarvo,''-1'')
--,[kurssi_arvosana] = arviointi_arvosana_koodiarvo
,kurssit_laajuus = sum(coalesce(os.koulutusmoduuli_laajuus_arvo, 1)) --laajuus nykyään pakollinen
,[kurssit_laajuus_all_suorituskieli] = sum(sum(coalesce(os.koulutusmoduuli_laajuus_arvo, 1))) over (partition by ylempi_osasuoritus_id, koulutusmoduuli_paikallinen, kurssin_tyyppi_koodiarvo)
,kurssit_lkm_total = sum(count(*)) over (partition by ylempi_osasuoritus_id)
,[kurssit_S_arvosanat_laajuus] = sum(case os.arviointi_arvosana_koodiarvo when ''S'' then coalesce(os.koulutusmoduuli_laajuus_arvo, 1) else 0 end)
--,kurssit_lkm = count(*)
--,[kurssit_lkm_all_suorituskieli] = sum(count(*)) over (partition by ylempi_osasuoritus_id, koulutusmoduuli_paikallinen, kurssin_tyyppi_koodiarvo)
--,[kurssit_S_arvosanat_lkm] = sum(case os.arviointi_arvosana_koodiarvo when ''S'' then 1 else 0 end)

--_pvm
FROM ' + @linkedServerPrefix + 'Koski_SA' + @pvmPaate + '.[sa].[sa_koski_paatason_suoritus] ps
LEFT JOIN ' + @linkedServerPrefix + 'Koski_SA' + @pvmPaate + '.[sa].[sa_koski_osasuoritus] os on ps.paatason_suoritus_id = os.paatason_suoritus_id
		
WHERE ps.suorituksen_tyyppi = ''lukionoppimaara''
AND ps.vahvistus_paiva between ''' + @alkuPvm + ''' and ''' + @loppuPvm + '''
AND os.suorituksen_tyyppi = ''lukionkurssi''
AND os.ylempi_osasuoritus_id is not null --ei irtokursseja
AND os.arviointi_arvosana_koodiarvo <> ''O'' --ei kesken jääneitä

GROUP BY os.ylempi_osasuoritus_id
	,os.koulutusmoduuli_paikallinen
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
	
[Tilastovuosi] = ' + @tilv + '
,paatason_suoritus_id
,lukionoppimaara
,lukionoppimaara_suorituskieli
,toimipiste_oid
,oppilaitos_oid
,koulutustoimija_oid
--,d.organisaatiotyypit
,sukupuoli = sukupuoli_koodi
,ika
,aidinkieli
,kansalaisuus
,[osasuoritus_id] = t1.osasuoritus_id
,aine_koodisto
,[aine] = --kielet luokitellaan "vähimmäislaajuuden" mukaan
	case 
		when aineenoppimaara_koodisto <> ''kielivalikoima'' 
		then aine
		when (aine = ''B1'' AND ((aine_laajuus_yksikko = ''4'' and coalesce(aine_laajuus,0) < 5 and kurssit_lkm_total < 5) or (aine_laajuus_yksikko = ''2'' and aine_laajuus < 10))) 
		  OR (aine <> ''B1'' AND ((aine_laajuus_yksikko = ''4'' and coalesce(aine_laajuus,0) < 6 and kurssit_lkm_total < 6) or (aine_laajuus_yksikko = ''2'' and aine_laajuus < 12)))
		then aine + ''X''
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
,kurssi_tyyppi
,kurssi_suorituskieli
,kurssit_laajuus
,kurssit_laajuus_all_suorituskieli
,kurssit_S_arvosanat_laajuus

FROM 

--oppiaineet
(' 

+ @oppiaineet + 
	
') 

t1
	
LEFT JOIN 

--kurssit	
(' 

+ @kurssit + 
	  
') 

t2 ON t2.ylempi_osasuoritus_id = t1.osasuoritus_id

WHERE aineenoppimaara not in (''MAA'',''MAB'',''MAY'')
OR (aineenoppimaara = ''MAA'' AND ((aine_laajuus_yksikko = ''4'' and (aine_laajuus >= 9 or kurssit_lkm_total >= 9))
									OR (aine_laajuus_yksikko = ''2'' and aine_laajuus >= 18)))
OR (aineenoppimaara = ''MAB'' AND ((aine_laajuus_yksikko = ''4'' and (aine_laajuus >= 5 or kurssit_lkm_total >= 5))
									OR (aine_laajuus_yksikko = ''2'' and aine_laajuus >= 10)))

END
'

EXEC (@createTable);
EXEC (@dropProc);
EXEC (@createProc);
EXEC sp_executesql @proc;
