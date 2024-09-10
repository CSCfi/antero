USE [Koski_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_liputa_ei_vos_rahoitettu_koulutus] AS

-- jhe 20.3.2019, 23.4.2019, 25.4.2019, 30.4
-- tätä näkymää käytetään AMOS-suoritepäätöslaskennan suodattimena
-- tässä liputetut opiskeluoikeudet tai suorituksen osat jätetään pois sp-laskennasta..
--..kaksi filtteriä siis samassa näkymässä
-- Huom: tämä on VOS-laskennan raskain ajo !!!

TRUNCATE TABLE [sa].[temp_tutkinnot_ja_tutkinnonosat_liputa_ei_vos_rahoitettu_koulutus]

INSERT INTO [sa].[temp_tutkinnot_ja_tutkinnonosat_liputa_ei_vos_rahoitettu_koulutus]

SELECT 
	opiskeluoikeus_oid, 
    osasuoritus_id, 
    vaatimus,
	tieto 
FROM (
/* 14.10.2019 AP raportilla tehdään rajaus rahoitusmuodon mukaan, ei tarvita vielä tässä
	SELECT 
		--# 1  
        -- maksullisena palveluna järjestetty koulutus, rajaa pois nämä opiskeluoikeudet  
        -- CSCVIPUNEN-1383  
        opiskeluoikeus_oid, 
        osasuoritus_id, 
        'r1, rajaa pois nämä opiskeluoikeudet - CSCVIPUNEN-1383, maksullinen palvelu' AS vaatimus,
		'opiskeluoikeus' as tieto 
    FROM   (
		SELECT 
            --distinct  
            -- 21.3.2019 korvattu aiempi kysely Juho Mikkosen mallin mukaisella kyselyllä   
            oo.opiskeluoikeus_oid, 
            NULL AS osasuoritus_id 
		FROM koski_sa.sa.sa_koski_opiskeluoikeus AS oo 
        JOIN koski_sa.sa.sa_koski_opiskeluoikeus_aikajakso AS b ON oo.opiskeluoikeus_oid = b.opiskeluoikeus_oid 
        WHERE oo.koulutusmuoto = 'ammatillinenkoulutus' 
        AND oo.sisaltyy_opiskeluoikeuteen_oid IS NULL 
        AND ( 
                        -- vuosi-2 joulukuun viimeinen 'YYYY-12-31'   
			( b.loppu > Datefromparts(Year(Getdate()) - 2, 12, 31 
						) 
				AND 
				-- vuosi-1 joulukuun viimeinen 'YYYY-12-31  
				b.loppu < Datefromparts(Year(Getdate()) - 1, 12, 31 
						) ) 
			OR b.loppu IS NULL 
		) 
        AND b.alku < Datefromparts(Year(Getdate()) - 0, 1, 1) 
                    --kuluva vuosi tammikuun ensimmäinen 'YYYY-01-01'  
                    
		EXCEPT 

        SELECT 
			DISTINCT d.opiskeluoikeus_oid, 
			NULL AS osasuoritus_id 
        FROM koski_sa.sa.sa_koski_opiskeluoikeus AS d 
        JOIN koski_sa.sa.sa_koski_opiskeluoikeus_aikajakso AS e ON d.opiskeluoikeus_oid = e.opiskeluoikeus_oid 
        WHERE d.koulutusmuoto = 'ammatillinenkoulutus' 
        AND ( 
                        -- vuosi-2 joulukuun viimeinen 'YYYY-12-31'   
			(e.loppu > Datefromparts(Year(Getdate()) - 2, 12, 31) 
            AND e.loppu < Datefromparts(Year(Getdate()) - 1, 12, 31) 
                            -- vuosi-1 joulukuun viimeinen 'YYYY-12-31  
                             
            OR e.loppu IS NULL ) 
            AND e.alku < Datefromparts(Year(Getdate()) - 0, 1, 1) 
                        --kuluva vuosi tammikuun ensimmäinen 'YYYY-01-01'  
                           
			AND (e.opintojen_rahoitus <> '6' OR e.opintojen_rahoitus IS NULL ) 
		)
	) t1 

	UNION 
*/

--AP 8.12.2019 
    --# 2               
    -- koulutusvientinä järjestetty koulutus, rajaa pois nämä opiskeluoikeudet  
    -- CSCVIPUNEN-1384  
    -- 21.3.2019 Juhon uusi speksi vaihdettu sisempään kyselyyn, aikarajaukset muutettu kovakoodatusta dynaamisiksi /jhe
        
/*
	SELECT opiskeluoikeus_oid, 
		NULL                                   AS osasuoritus_id, 
        'r2, rajaa pois nämä opiskeluoikeudet - CSCVIPUNEN-1384, koulutusvienti' AS vaatimus,
		'opiskeluoikeus' as tieto 
	FROM   (
		SELECT 
			oo.opiskeluoikeus_oid 
        FROM koski_sa.sa.sa_koski_opiskeluoikeus AS oo 
        WHERE oo.koulutusmuoto = 'ammatillinenkoulutus' 
		--AP 8.12.2019 aikarajaukset otettu pois
  --      AND ( 
		--	( oo.paattymispaiva > Datefromparts(Year(Getdate()) - 2, 12, 31) 
  --                      -- vuosi-2 joulukuun viimeinen 'YYYY-12-31'   
                               
		--	AND oo.paattymispaiva < Datefromparts(Year(Getdate()) - 1, 12, 31) ) 
  --                          -- vuosi-1 joulukuun viimeinen 'YYYY-12-31'   
                                   
  --          OR oo.paattymispaiva IS NULL 
		--) 
		--AND oo.alkamispaiva < Datefromparts(Year(Getdate()) - 0, 1, 1) 
  --              --kuluva vuosi tammikuun ensimmäinen 'YYYY-01-01'  
        AND oo.lisatiedot_koulutusvienti = 1
	) t2 

	UNION 
*/

	--# 3, rajaa pois nämä osasuoritukset  
	-- opiskelu ei ole rahoituksen piirissä, päätellään data-kentän json-tiedosta  
	-- pudottaa pois tunnustetut tutkinnon osat tai osa-alueet (jotka ei rahoituksen piirissä) 
	-- tämäkin juho mikkosen speksi 19.3.2019  
	-- CSCVIPUNEN-1386  
	SELECT 
		opiskeluoikeus_oid, 
		osasuoritus_id
		,'r3, rajaa pois nämä osasuoritukset - CSCVIPUNEN-1386, json-tieto, rahoituksenPiirissa: false' AS vaatimus
		,'osasuoritus' as tieto 
	FROM sa.sa_koski_osasuoritus AS os
	where tunnustettu = 1
	and rahoituksen_piirissa = 0
  
	--UNION 
	--# 4, rajaa pois nämä osasuoritukset  
	--Lisämääreet 24.4.2019 palaverista, Juho Mikkonen, täsmennys meilissä 29.4 ja 30.4 
	--Yhteisten tutkinnonosien osa-alueiden suoritukset eivät kuulu 
	--..rahoituslaskennan kun kyse ammatillisen tutkinnnon osa-alueesta 
/*    SELECT t4.opiskeluoikeus_oid,  
            t4.osasuoritus_id,  
    'r4 - 29.4.2019 email, Juho Mikkonen: Rahoituksesta taas pudotetaan ne, joissa os.suorituksen_tyyppi = ammatillisentutkinnonosanosaalue.'
    AS vaatimus  
    FROM   (SELECT opiskeluoikeus_oid,  
                osasuoritus_id,  
                CASE  
                WHEN /*os.koulutusmoduuli_koodiarvo IN (  
                '101053', '101054', '101055', '101056',  
                '400012', '400013', '400014' )  
                AND*/ os.suorituksen_tyyppi =  
                    'ammatillisentutkinnonosanosaalue'  
            --    AND Year(os.arviointi_paiva) = Year(Getdate()) - 1  
            -- aikarajaus tehdään seuraavalla vaiheessa joka tapauksessa 
            THEN 1  
                ELSE 0  
                END AS ei_rahoiteta  
*/ 
	UNION
	--# 4, rajaa pois nämä osasuoritukset  
	SELECT 
		opiskeluoikeus_oid, 
		osasuoritus_id
		,'r4, rajaa pois nämä osasuoritukset - 29.4.2019 email, Juho Mikkonen: Rahoituksesta taas pudotetaan ne, joissa os.suorituksen_tyyppi = ammatillisentutkinnonosanosaalue.' AS vaatimus
		,'osasuoritus' as tieto 
	FROM sa.sa_koski_osasuoritus AS os
	WHERE suorituksen_tyyppi in ('ammatillisentutkinnonosanosaalue','ammatillisentutkinnonosaapienempikokonaisuus')

	UNION 
	--# 5, hylätyt suoritukset pois rahoituslaskennasta 
	SELECT 
		opiskeluoikeus_oid, 
		osasuoritus_id
		,'r5, rajaa pois nämä osasuoritukset - Kari Korhonen ja Seppo Hänninen, email 25.4.2019: hylätyt suoritukset pois rahoituslaskennasta' AS vaatimus
		,'osasuoritus' as tieto 
	FROM sa.sa_koski_osasuoritus AS os
	WHERE arviointi_hyvaksytty = 0
 
) t100 

GO
