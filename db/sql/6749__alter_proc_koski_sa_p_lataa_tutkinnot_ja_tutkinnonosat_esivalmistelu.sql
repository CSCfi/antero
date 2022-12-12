USE [Koski_SA]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_esivalmistelu]    Script Date: 12.12.2022 21:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_esivalmistelu] @minVuosi int = 2018, @maxVuosi int = NULL AS


/*
AJAA ESIVALMISTELUPROSEDUURIT JA KIRJOITTAA JOKAISEN PROSEDUURIN ALKAMIS- JA PÄÄTTYMISAJAN ERILLISEEN TAULUUN.
PROSEDUURIEN NIMET KIRJOITETAAN ENSIN TEMP-TAULUUN JOSTA NE LUETAAN JA AJETAAN YKSI KERRALLAAN KURSORIN AVULLA.
LISÄTIETONA TEMP-TAULUSSA LIITTYYKÖ PROSEDUURIIN PARAMETREJA (minVuosi ja maxVuosi)
*/


CREATE TABLE #proseduurit (nimi varchar(500), par int, jarjestys int)

INSERT INTO #proseduurit VALUES('dbo.p_lataa_eperusteet_tutkinnonosa_osaamisala_laajuus', 0, 1)
INSERT INTO #proseduurit VALUES('sa.p_lataa_tutkinnot_ja_tutkinnonosat_liputa_ei_vos_rahoitettu_koulutus', 0, 2)
INSERT INTO #proseduurit VALUES('sa.p_lataa_tutkinnot_ja_tutkinnonosat_osasuoritus_pl_eivos', 1, 3)
INSERT INTO #proseduurit VALUES('sa.p_lataa_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset', 0, 4)
INSERT INTO #proseduurit VALUES('sa.p_lataa_tutkinnot_ja_tutkinnonosat_paatason_suoritukset', 1, 5)
INSERT INTO #proseduurit VALUES('sa.p_lataa_tutkinnot_ja_tutkinnonosat_aikajaksot', 0, 6)



DECLARE @skeemaNimi varchar(25); SET @skeemaNimi = 'Koski_SA'

DECLARE @prosNimi varchar(500), @prosPara int


DECLARE @declParam1 varchar(250), @declParam2 varchar(250), @parametrit varchar(50)


DECLARE temp_taulu_cursor CURSOR FOR SELECT nimi, par FROM #proseduurit ORDER BY jarjestys



--taulujen tyhjennys ennen uusien tietojen kirjoitusta
--TRUNCATE TABLE sa.proseduuri_tutkinnot_ja_tutkinnonosat

OPEN temp_taulu_cursor;  

FETCH NEXT FROM temp_taulu_cursor INTO @prosNimi, @prosPara

WHILE (@@FETCH_STATUS <> -1)  

BEGIN 

	INSERT INTO sa.proseduuri_tutkinnot_ja_tutkinnonosat (proseduuri,alku) VALUES(@prosNimi, GETDATE())

	IF @prosPara = 0 SET @declParam1 = '' ELSE SET @declParam1 = CONCAT('DECLARE @minV int; SET @minV=', @minVuosi, ';') 
	IF @prosPara = 0 SET @declParam2 = '' ELSE SET @declParam2 = CONCAT('DECLARE @maxV int; SET @maxV=', COALESCE(@maxVuosi, 9999), ';') 
	IF @prosPara = 0 SET @parametrit= '' ELSE SET @parametrit = '@minV, @maxV';

	EXECUTE (@declParam1 + @declParam2 + 'EXEC ' + @skeemaNimi + '.' + @prosNimi + ' ' + @parametrit)

	UPDATE sa.proseduuri_tutkinnot_ja_tutkinnonosat SET loppu = GETDATE(), kesto = (select convert(char(8),dateadd(s,datediff(s,alku,getdate()),'1900-1-1'),8)) WHERE proseduuri = @prosNimi and loppu is null

	FETCH NEXT FROM temp_taulu_cursor INTO @prosNimi, @prosPara

END



CLOSE temp_taulu_cursor;  
DEALLOCATE temp_taulu_cursor; 

DROP TABLE #proseduurit
