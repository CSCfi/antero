USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_ehoks_tutkinnon_suorittaneet_generoi_puuttuvat_hankkimistavat]    Script Date: 30.7.2025 11.45.53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_ehoks_tutkinnon_suorittaneet_generoi_puuttuvat_hankkimistavat] AS

DECLARE @oht AS VARCHAR(50)

DECLARE db_cursor CURSOR FOR 
	SELECT distinct sopimusmuoto=f.d_osaamisen_hankkimistapa_id
	FROM dw.f_ehoks_tutkinnon_suorittaneet f
	WHERE f.d_osaamisen_hankkimistapa_id != -1

OPEN db_cursor  
FETCH NEXT FROM db_cursor INTO @oht

WHILE @@FETCH_STATUS = 0  
BEGIN 

	DROP TABLE IF EXISTS #ooTemp
	
	SELECT DISTINCT opiskeluoikeus_oid
	INTO #ooTemp 
	FROM (
		SELECT opiskeluoikeus_oid 
		FROM dw.f_ehoks_tutkinnon_suorittaneet

		EXCEPT

		SELECT opiskeluoikeus_oid 
		FROM dw.f_ehoks_tutkinnon_suorittaneet
		WHERE d_osaamisen_hankkimistapa_id = @oht
	) q

	INSERT INTO dw.f_ehoks_tutkinnon_suorittaneet (
		[master_oid]
		,[opiskeluoikeus_oid]
		,[ehoks_id]
		,[alkamispaiva]
		,[alkamisvuosi]
		,[paattymispaiva]
		,[paattymisvuosi]
		,[vahvistuspaiva]
		,[opiskeluoikeuden_kesto_paivia]
		,[opiskeluoikeuden_kesto_paivia_kaikki_tilat]
		,[d_organisaatioluokitus_jarj_id]
		,[d_kytkin_koulutus_paattynyt_id]
		,[d_kytkin_valmistunut_id]
		,[oppilaitosmuotoinen_paivat]
		,[koulutussopimus_paivat]
		,[oppisopimus_paivat]
		,[d_osaamisen_hankkimistavat_id]
		,[d_kytkin_tutkinnon_osakohtaisia_jaksoja_hoksissa_id]
		,[d_koulutusluokitus_id]
		,[d_suorituksen_tyyppi_id]
		,[d_kytkin_muu_ammatillinen_id]
		,[d_sukupuoli_id]
		,[d_kansalaisuus_id]
		,[d_aidinkieli_id]
		,[d_ika_alkamisvuonna_id]
		,[d_osaamisen_hankkimistapa_id]
		,[ytunnus]
		,[d_toimiala_id]
		,[paivat_kaikki]
		,[paivat_hankkimistapa]
		,[koulutussopimuksen_osuus]
		,[oppisopimuksen_osuus]
		,[muu_oppismisympäristö_osuus]
		,[generoitu]
	)
	--osaamisen hankkimistavat
	SELECT distinct
		[master_oid]
		,f.[opiskeluoikeus_oid]
		,[ehoks_id]
		,[alkamispaiva]
		,[alkamisvuosi]
		,[paattymispaiva]
		,[paattymisvuosi]
		,[vahvistuspaiva]
		,[opiskeluoikeuden_kesto_paivia]
		,[opiskeluoikeuden_kesto_paivia_kaikki_tilat]
		,[d_organisaatioluokitus_jarj_id]
		,[d_kytkin_koulutus_paattynyt_id]
		,[d_kytkin_valmistunut_id]
		,[oppilaitosmuotoinen_paivat]
		,[koulutussopimus_paivat]
		,[oppisopimus_paivat]
		,[d_osaamisen_hankkimistavat_id]
		,[d_kytkin_tutkinnon_osakohtaisia_jaksoja_hoksissa_id]
		,[d_koulutusluokitus_id]
		,[d_suorituksen_tyyppi_id]
		,[d_kytkin_muu_ammatillinen_id]
		,[d_sukupuoli_id]
		,[d_kansalaisuus_id]
		,[d_aidinkieli_id]
		,[d_ika_alkamisvuonna_id]
		,[d_osaamisen_hankkimistapa_id] = @oht
		,[ytunnus]
		,[d_toimiala_id]
		,[paivat_kaikki] = 0
		,[paivat_hankkimistapa] = 0
		,[koulutussopimuksen_osuus]
		,[oppisopimuksen_osuus]
		,[muu_oppismisympäristö_osuus]
		,[generoitu] = 1
	FROM dw.f_ehoks_tutkinnon_suorittaneet f
	--WHERE opiskeluoikeus_oid NOT IN (SELECT opiskeluoikeus_oid FROM dw.f_ehoks_tutkinnon_suorittaneet f WHERE d_osaamisen_hankkimistapa_id = @oht)
	JOIN #ooTemp on #ooTemp.opiskeluoikeus_oid = f.opiskeluoikeus_oid
	
	DROP TABLE IF EXISTS #ooTemp

	FETCH NEXT FROM db_cursor INTO @oht

END
	
CLOSE db_cursor  
DEALLOCATE db_cursor 

DELETE FROM dw.f_ehoks_tutkinnon_suorittaneet WHERE d_osaamisen_hankkimistapa_id = -1
	
GO


