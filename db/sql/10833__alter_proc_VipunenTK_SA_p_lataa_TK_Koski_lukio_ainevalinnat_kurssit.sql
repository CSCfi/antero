USE [VipunenTK_SA]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_TK_Koski_lukio_ainevalinnat_kurssit]    Script Date: 5.6.2025 14.32.30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dbo].[p_lataa_TK_Koski_lukio_ainevalinnat_kurssit]
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
- Ohjataan kurssikoodistot uusimpaan kurssikoodistoon ja kurssikoodit vastaavasti updatella jäljempänä.
- Päätellään suoritettu katsomusaineen oppimäärä pakollisten 1. ja 2. moduulien/kurssien mukaan ET priorisoiden.
*/

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

DECLARE @cols nvarchar(max) = '
		[tilastovuosi] = ' + @tilv + '
		,[lukuvuosi]
		,[lukukausi]
		,[paatason_suoritus_id]
		,ops_voimaantulo
		,[lukionoppimaara]
		,[lukionoppimaara_suorituskieli]
		,katsomusaine_suoritettu_1_0
		,[toimipiste_oid]
		,[oppilaitos_oid]
		,[koulutustoimija_oid]
		,[sukupuoli]
		,ylempi_osasuoritus_id
		,[aine_koodisto]
		,[aine]
		,[aine_suorituskieli]
		,[aineenoppimaara_koodisto]
		,[aineenoppimaara]
		,katsomusaineen_oppimaara_koodisto
		,katsomusaineen_oppimaara = case when katsomusaineen_oppimaara_koodisto = ''koskioppiaineetyleissivistava'' then ''ET'' else katsomusaineen_oppimaara end
		,[kurssi_koodisto]
		,[kurssi]
		,[kurssi_paikallinen_OPS_0_1]
		,[kurssi_pakollinen_0_1]
		,[kurssi_tyyppi]
		,[kurssi_suorituskieli]
		,[kurssi_arvosana]
		,[lkm] = count(*)
'
DECLARE @katsomusaineenOppimaaraJaKoodisto nvarchar(max) = 'katsomusaineen_oppimaara_koodisto = 
				min(
					case 
						when os2.[koulutusmoduuli_koodiarvo] in (''KT'',''ET'') 
							and os2.koulutusmoduuli_koodisto = ''koskioppiaineetyleissivistava'' 
							and os2.arviointi_hyvaksytty = 1 
						then 
							case 
								when os.[koulutusmoduuli_koodiarvo] in (''ET1'',''ET2'') 
									and (
										os.koulutusmoduuli_pakollinen = 1 
										or os.kurssin_tyyppi_koodiarvo = ''pakollinen''
									) 
									then os2.koulutusmoduuli_koodisto
								else ''uskonnonoppimaara''
							end
					end
				) 
				over (partition by os2.osasuoritus_id)
			,katsomusaineen_oppimaara = 
				min(
					case 
						when os2.[koulutusmoduuli_koodiarvo] in (''KT'',''ET'') 
							and os2.koulutusmoduuli_koodisto = ''koskioppiaineetyleissivistava'' 
							and os2.arviointi_hyvaksytty = 1 
							and (
								os.koulutusmoduuli_pakollinen = 1 
								or os.kurssin_tyyppi_koodiarvo = ''pakollinen''
							) 
						then 
							case os.[koulutusmoduuli_koodiarvo]
								--1. moduuli/kurssi
								when ''UBA1'' then ''BA'' --Bahá’í-uskonto
								when ''UBU1'' then ''BU'' --Buddhalainen uskonto
								when ''UE1'' then ''EV'' --Evankelis-luterilainen uskonto
								when ''UI1'' then ''IS'' --Islam
								when ''UJ1'' then ''JU'' --Juutalainen uskonto
								when ''UK1'' then ''KA'' --Katolinen uskonto
								when ''UKR1'' then ''KR'' --Krishna-uskonto
								when ''UO1'' then ''OR'' --Ortodoksinen uskonto
								when ''UX1'' then ''MU'' --Muut uskonnot
								--2. moduuli/kurssi
								when ''UBA2'' then ''BA'' --Bahá’í-uskonto
								when ''UBU2'' then ''BU'' --Buddhalainen uskonto
								when ''UE2'' then ''EV'' --Evankelis-luterilainen uskonto
								when ''UI2'' then ''IS'' --Islam
								when ''UJ2'' then ''JU'' --Juutalainen uskonto
								when ''UK2'' then ''KA'' --Katolinen uskonto
								when ''UKR2'' then ''KR'' --Krishna-uskonto
								when ''UO2'' then ''OR'' --Ortodoksinen uskonto
								when ''UX2'' then ''MU'' --Muut uskonnot
							end
					end
				)
				over (partition by os2.osasuoritus_id)
'
DECLARE @mainQuery nvarchar(max) = '
		SELECT
			lukuvuosi = concat(year(dateadd(month, 5, ps.vahvistus_paiva))-1, ''/'', year(dateadd(month, 5, ps.vahvistus_paiva)))
			,lukukausi = case when month(ps.vahvistus_paiva) < 8 then ''k'' else ''s'' end

			--lukion oppimäärä
			,ps.[paatason_suoritus_id]
			,[ops_voimaantulo] = case when ps.perusteenDiaarinumero in (''OPH-2263-2019'',''OPH-2267-2019'') then ''1.8.2021'' else ''Muu kuin 1.8.2021'' end
			,[lukionoppimaara] = ps.oppimaara
			,[lukionoppimaara_suorituskieli] = coalesce(ps.[suorituskieli_koodiarvo],''-1'')
			,[katsomusaine_suoritettu_1_0] = 
				max(
					case 
						when os2.[koulutusmoduuli_koodiarvo] in (''KT'',''ET'') 
							and os2.koulutusmoduuli_koodisto = ''koskioppiaineetyleissivistava''
							and os2.arviointi_hyvaksytty = 1 
						then 1
						else 0
					end
				) over (partition by ps.[paatason_suoritus_id])
			,ps.[toimipiste_oid]
			,oo.[oppilaitos_oid]
			,oo.[koulutustoimija_oid]

			--henkilö
			,h2.sukupuoli

			--aine ja oppimäärä
			,ylempi_osasuoritus_id = os2.osasuoritus_id
			,[aine_koodisto] = os2.[koulutusmoduuli_koodisto]
			,[aine] = os2.[koulutusmoduuli_koodiarvo]
			,[aine_suorituskieli] = coalesce(os2.[suorituskieli_koodiarvo],''-1'')
			,[aineenoppimaara_koodisto] =	
				case 
					when os2.[matematiikan_oppimaara_koodiarvo] is not null then ''oppiainematematiikka''
					when os2.[kieli_koodiarvo] is not null AND os2.[koulutusmoduuli_koodiarvo] = ''AI'' then ''oppiaineaidinkielijakirjallisuus''
					when os2.[kieli_koodiarvo] is not null AND os2.[koulutusmoduuli_koodiarvo] != ''AI'' then ''kielivalikoima''
					else os2.[koulutusmoduuli_koodisto]
				end
			,[aineenoppimaara] = coalesce(os2.[matematiikan_oppimaara_koodiarvo], os2.[kieli_koodiarvo], os2.[koulutusmoduuli_koodiarvo])

			,' + @katsomusaineenOppimaaraJaKoodisto + '

			--kurssit
			,[kurssi_koodisto] =
				case 
					when os.[koulutusmoduuli_koodisto] in (''lukionkurssitops2003nuoret'', ''lukionkurssitops2004aikuiset'') then ''lukionkurssit'' 
					else os.[koulutusmoduuli_koodisto]
				end
			,[kurssi] = os.[koulutusmoduuli_koodiarvo]
			,[kurssi_paikallinen_OPS_0_1] = cast(os.[koulutusmoduuli_paikallinen] as int)
			,[kurssi_pakollinen_0_1] = cast(os.[koulutusmoduuli_pakollinen] as int)
			,[kurssi_tyyppi] = os.[kurssin_tyyppi_koodiarvo]
			,[kurssi_suorituskieli] = coalesce(os.[suorituskieli_koodiarvo],''-1'')
			,[kurssi_arvosana] = os.[arviointi_arvosana_koodiarvo]
		
		FROM ' + @linkedServerPrefix + 'Koski_SA' + @pvmPaate + '.sa.[sa_koski_paatason_suoritus] ps
		JOIN ' + @linkedServerPrefix + 'Koski_SA' + @pvmPaate + '.sa.[sa_koski_opiskeluoikeus] oo on oo.[opiskeluoikeus_oid] = ps.[opiskeluoikeus_oid]
		LEFT JOIN ' + @linkedServerPrefix + 'Koski_SA' + @pvmPaate + '.sa.[sa_koski_henkilo] h on h.[oppija_oid] = oo.[oppija_oid]
		LEFT JOIN ' + @linkedServerPrefix + 'Koski_SA' + @pvmPaate2 + '.sa.[sa_koski_henkilo] h2 on h2.[oppija_oid] = oo.[oppija_oid] --sukupuoli-tieto tuotu vasta 2021
		LEFT JOIN ' + @linkedServerPrefix + 'Koski_SA' + @pvmPaate + '.sa.[sa_koski_osasuoritus] os on os.[paatason_suoritus_id] = ps.[paatason_suoritus_id]
		LEFT JOIN ' + @linkedServerPrefix + 'Koski_SA' + @pvmPaate + '.sa.[sa_koski_osasuoritus] os2 on os2.[osasuoritus_id] = os.[ylempi_osasuoritus_id]
		
		WHERE ps.[suorituksen_tyyppi] = ''lukionoppimaara'' 
		AND ps.[vahvistus_paiva] between @alkuPvm and @loppuPvm
		AND os.suorituksen_tyyppi in (''lukionkurssi'',''lukionvaltakunnallinenmoduuli'',''lukionpaikallinenopintojakso'')
'

DECLARE @createProc nvarchar(max) = '
CREATE PROCEDURE ' + @proc + '
AS

DECLARE @alkuPvm date = DATEFROMPARTS(' + cast(@tilv-1 as nvarchar(4)) + ', 8, 1)
DECLARE @loppuPvm date = DATEFROMPARTS(' + cast(@tilv as nvarchar(4)) + ', 7, 31)

BEGIN

	INSERT ' + @taulu + '

	SELECT ' + @cols + '

	FROM ( ' + @mainQuery + ') f

	GROUP BY 
		lukuvuosi
		,lukukausi
		,[paatason_suoritus_id]
		,[ops_voimaantulo]
		,[lukionoppimaara]
		,[lukionoppimaara_suorituskieli]
		,katsomusaine_suoritettu_1_0
		,[toimipiste_oid]
		,[oppilaitos_oid]
		,[koulutustoimija_oid]
		,[sukupuoli]
		,ylempi_osasuoritus_id
		,[aine_koodisto]
		,[aine]
		,[aine_suorituskieli]
		,[aineenoppimaara_koodisto]
		,[aineenoppimaara]
		,katsomusaineen_oppimaara_koodisto
		,katsomusaineen_oppimaara
		,[kurssi_koodisto]
		,[kurssi]
		,[kurssi_paikallinen_OPS_0_1]
		,[kurssi_pakollinen_0_1]
		,[kurssi_tyyppi]
		,[kurssi_suorituskieli]
		,[kurssi_arvosana]


	--ohjataan myös kurssikoodit uusimpaan kurssikoodistoon
	update t
	set kurssi =
		case 
			when kurssi in (''MAA1'',''MAB1'') then ''MAY1''
			when left(kurssi,2) = ''R2'' then replace(kurssi, ''R'', ''SV'')
			when left(kurssi,4) = ''FINB'' and len(kurssi)=5 then replace(kurssi, ''FINB'', ''FINB1'')
			when left(kurssi,3) = ''RUB'' and len(kurssi)=4 then replace(kurssi, ''RUB'', ''RUB1'')
			when left(kurssi,4) in (''EAB1'',''ENB1'',''IAB1'',''KXB1'',''LAB1'',''POB1'',''RAB1'',''SAB1'',''VEB1'') then replace(kurssi, left(kurssi,4), ''VKB'')
			when left(kurssi,2) in (''EA'',''EN'',''IA'',''KX'',''LA'',''PO'',''RA'',''RU'',''SA'',''VE'') then replace(kurssi, left(kurssi,2), ''VK'')
			else kurssi
		end
	from ' + @taulu + ' t
	left join ANTERO.dw.d_lukio_kurssit_ja_moduulit d ON d.koodisto = t.kurssi_koodisto AND d.koodi = t.kurssi
	where 1=1
	and d.id is null
	and t.kurssi_koodisto = ''lukionkurssit''

END
'

EXEC (@createTable);
EXEC (@dropProc);
EXEC (@createProc);
EXEC sp_executesql @proc;

GO
