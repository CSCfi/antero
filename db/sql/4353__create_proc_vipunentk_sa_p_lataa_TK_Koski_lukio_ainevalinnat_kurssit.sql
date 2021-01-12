USE [VipunenTK_SA]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_TK_Koski_lukio_ainevalinnat_kurssit]    Script Date: 12.1.2021 6:38:00 ******/
DROP PROCEDURE IF EXSISTS [dbo].[p_lataa_TK_Koski_lukio_ainevalinnat_kurssit]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_TK_Koski_lukio_ainevalinnat_kurssit]    Script Date: 12.1.2021 6:38:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[p_lataa_TK_Koski_lukio_ainevalinnat_kurssit] @pvm nvarchar(10) = '', @viive int = 0, @linkedServerDot nvarchar(50) = ''
AS

--Huom. 
-- Tämä proseduuri luo ja ajaa vuosiproseduurin. Ajetaan käsin eksolta, kunnes ajotunnusten oikeudet linked serverille kunnossa.
-- Parametreina jäädytyspäivämäärä pp-kk-vvvv sekä tiedon viive [jäädytysvuosi - tilastovuosi]. Oletusarvoilla muodostuu ..sql16-palvelimen datasta tuoreimmat testiversiot.

-- Kutsutaan tulevaisuudessa proseduurilla X, jossa kursori hakee jäädytyspäivän perusteella taulusta Y ajettavat proseduurit viipeineen.
-- Latauksen onnistumisesta kirjoitetaan tauluun VipunenTK_lisatiedot.dbo.Vipunen_automaattipaivitys_kuutio (tai _fakta, jos liittyy TK-putkeen), jotta kuutiot prosessoituvat osana TK-ajoja.


--jäädytyskannan pääte ja tilastovuosi
DECLARE @pvmPaate nvarchar(9) = case when @pvm = '' then '' else '_' + replace(@pvm, '-', '') end
DECLARE @tilv nvarchar(4) = case when @pvm = '' then year(getdate()) - @viive else year(@pvm) - @viive end

--taulu sekä luotava proseduuri
DECLARE @taulupohja nvarchar(100) = 'dbo.TK_Koski_lukio_ainevalinnat_kurssit'
DECLARE @taulu nvarchar(100) = @taulupohja + '_' + @tilv + (case when @pvm = '' or @linkedServerDot = '' then '_TEST' else '' end)
DECLARE @procpohja nvarchar(100) = 'dbo.p_lataa_TK_Koski_lukio_ainevalinnat_kurssit'
DECLARE @proc nvarchar(100) = @procpohja + '_' + @tilv + (case when @pvm = '' or @linkedServerDot = '' then '_TEST' else '' end)

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
		,[sukupuoli] = [sukupuoli_koodi]
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
		,[sukupuoli_koodi] = 
			case 
				when cast(substring(h.hetu,8,3) as int) % 2 = 1 then ''1'' 
				when cast(substring(h.hetu,8,3) as int) % 2 = 0 then ''2''
				else ''-1''
			end
		--,[ika] = coalesce(year(ps.[vahvistus_paiva]) - year(h.syntymaaika), -1)
		--,h.aidinkieli
		--,[kansalaisuus] = left(coalesce(kansalaisuus,''999''),3)

	  --aine ja oppimäärä
		--,os2.[osasuoritus_id]
		,[aine_koodisto] = os2.[koulutusmoduuli_koodisto]
		,[aine] = os2.[koulutusmoduuli_koodiarvo]
		,[aineenoppimaara_koodisto] =	
			case 
				when os2.[matematiikan_oppimaara_koodiarvo] is not null --AND os2.[koulutusmoduuli_koodiarvo] = ''MA''
				then ''oppiainematematiikka''		
				--when os2.[uskonnon_oppimaara_koodiarvo] is not null --AND os2.[koulutusmoduuli_koodiarvo] in (''KT'',''ET'') 
				--then ''uskonnonoppimaara'' --in the future
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
		FROM ' + @linkedServerDot + 'Koski_SA' + @pvmPaate + '.sa.[sa_koski_paatason_suoritus] ps
		LEFT JOIN ' + @linkedServerDot + 'Koski_SA' + @pvmPaate + '.sa.[sa_koski_opiskeluoikeus] oo on oo.[opiskeluoikeus_oid] = ps.[opiskeluoikeus_oid]
		LEFT JOIN ' + @linkedServerDot + 'Koski_SA' + @pvmPaate + '.sa.[sa_koski_henkilo] h on h.[oppija_oid] = oo.[oppija_oid]
		LEFT JOIN ' + @linkedServerDot + 'Koski_SA' + @pvmPaate + '.sa.[sa_koski_osasuoritus] os on os.[paatason_suoritus_id] = ps.[paatason_suoritus_id]
		LEFT JOIN ' + @linkedServerDot + 'Koski_SA' + @pvmPaate + '.sa.[sa_koski_osasuoritus] os2 on os2.[osasuoritus_id] = os.[ylempi_osasuoritus_id]
		
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
		,[sukupuoli_koodi]
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



GO


use antero