USE [Koski_SA]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_aikajaksot]    Script Date: 23.10.2019 17:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_tutkinnot_ja_tutkinnonosat_aikajaksot]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_aikajaksot] AS' 
END
GO



ALTER PROCEDURE [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_aikajaksot] AS

TRUNCATE TABLE [sa].[temp_tutkinnot_ja_tutkinnonosat_aikajaksot]

;WITH cte AS (
	SELECT 
		 ooa.opiskeluoikeus_oid
		,alku
		,loppu
		,opintojen_rahoitus
	FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus_aikajakso] ooa
	JOIN Koski_SA.sa.sa_koski_opiskeluoikeus oo ON oo.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
	WHERE oo.koulutusmuoto = 'ammatillinenkoulutus'
)

INSERT INTO [sa].[temp_tutkinnot_ja_tutkinnonosat_aikajaksot]

select distinct

	oo.oppija_oid
	,oo.opiskeluoikeus_oid as opiskeluoikeus_oid
	,case when oo.sisaltyy_opiskeluoikeuteen_oid is not null then 1 else 0 end as sisaltyy_toiseen
	,oo.oppilaitos_oid 
	,oo.koulutustoimija_oid 
	--12.5.2019 diaarinumero haettava data-kentän jsonista, per mikkonen email pe 10.5.2019 11.21
	--16.5.2019 siivotaan välilyönnit diaarinumeroista (uloin replace)
	--,coalesce(kl.uusi_eat_koodi, kl.koulutusluokitus_koodi) as tutkinto_koodi
	,replace(replace(replace(replace(substring(ps.data,CHARINDEX('"perusteenDiaarinumero": ',ps.data)+26,15),'}',''),'"',''),',',''),' ','') as diaarinumero
	,NULL /* replace(replace(replace(replace(substring(ps.data,CHARINDEX('"perusteenDiaarinumero": ',ps.data)+26,15),'}',''),'"',''),',',''),' ','')+'_'+ps.koulutusmoduuli_koodiarvo */ as diaarinumero_tutkinto_koodi

	,/* case 
		when ps.osaamisala_koodiarvo is null then replace(replace(replace(replace(substring(ps.data,CHARINDEX('"perusteenDiaarinumero": ',ps.data)+26,15),'}',''),'"',''),',',''),' ','')+'_'+ps.koulutusmoduuli_koodiarvo
		else replace(replace(replace(replace(substring(ps.data,CHARINDEX('"perusteenDiaarinumero": ',ps.data)+26,15),'}',''),'"',''),',',''),' ','')+'_'+ps.koulutusmoduuli_koodiarvo+'_'+ps.osaamisala_koodiarvo 
	 end */ NULL as diaarinumero_tutkinto_osaamisala_koodi

	,ooa.tila
	,ooa.alku
	,ooa.loppu
	,ooa.oppisopimus_jossain_paatason_suorituksessa AS oppisopimus
	,coalesce(ooa.opintojen_rahoitus, ooa2.opintojen_rahoitus, ooa3.opintojen_rahoitus, ooa4.opintojen_rahoitus) as opintojen_rahoitus_koodi
					
	,CASE				
		WHEN (erityinen_tuki=1 or hojks=1) and vaativan_erityisen_tuen_erityinen_tehtava=0 and suorituksen_tyyppi not in ('telma','valma') THEN 2						--Erityisopiskelija ilman erit. tuen tehtävää; tutk. joht 
		WHEN (erityinen_tuki=1 or hojks=1) and vaativan_erityisen_tuen_erityinen_tehtava=0 and suorituksen_tyyppi in ('telma','valma') THEN 3							--Erityisopiskelija ilman erit. tehtävää; valmentava
		WHEN vaativan_erityisen_tuen_erityinen_tehtava=1 and suorituksen_tyyppi not in ('telma','valma') and vaikeasti_vammainen=0 and vammainen_ja_avustaja=0 THEN 4	--Erit. tuen tehtävä; tutk.joht; erityisopiskelija
		WHEN suorituksen_tyyppi not in ('telma','valma') and vaikeasti_vammainen=1 THEN 5																				--Erit. tuen tehtävä; tutk.joht; vaikeasti vammainen
		WHEN suorituksen_tyyppi not in ('telma','valma') and vammainen_ja_avustaja=1 THEN 6																				--Erit. tuen tehtävä; tutk.joht; vammainen&avustaja
		WHEN vaativan_erityisen_tuen_erityinen_tehtava=1 and suorituksen_tyyppi in ('telma','valma') and vaikeasti_vammainen=0 and vammainen_ja_avustaja=0 THEN 7		--Erit. tuen tehtävä; TELMA&VALMA; erityisopiskelija
		WHEN suorituksen_tyyppi in ('telma','valma') and vaikeasti_vammainen=1 THEN 8																					--Erit. tuen tehtävä; TELMA&VALMA; vaikeasti vammainen
		WHEN suorituksen_tyyppi in ('telma','valma') and vammainen_ja_avustaja=1 THEN 9																					--Erit. tuen tehtävä; TELMA&VALMA; vammainen&avustaja
		WHEN erityinen_tuki=0 THEN 1																																	--Ei erityisopiskelija
		ELSE 9
	 END as erityisopetus_koodi

	 ,ps.paatason_suoritus_id

FROM Koski_SA.sa.sa_koski_opiskeluoikeus oo
INNER JOIN Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
INNER JOIN Koski_SA.sa.sa_koski_paatason_suoritus ps ON ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus oo2 ON oo2.opiskeluoikeus_oid = oo.sisaltyy_opiskeluoikeuteen_oid
--LEFT JOIN dw.d_koulutusluokitus kl ON kl.koulutusluokitus_koodi = COALESCE(NULLIF(ps.koulutusmoduuli_koodiarvo, '999904'), ps.tutkinto_koodiarvo)
--puuttuva rahoitus otetaan edellisestä läsnäolojaksosta AP 20.6.2019
LEFT JOIN cte as ooa2 on ooa2.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid and DATEDIFF(DAY,ooa2.loppu, ooa.alku) = 1
LEFT JOIN cte as ooa3 on ooa3.opiskeluoikeus_oid = ooa2.opiskeluoikeus_oid and DATEDIFF(DAY,ooa3.loppu, ooa2.alku) = 1
LEFT JOIN cte as ooa4 on ooa4.opiskeluoikeus_oid = ooa3.opiskeluoikeus_oid and DATEDIFF(DAY,ooa4.loppu, ooa3.alku) = 1
WHERE oo.koulutusmuoto = 'ammatillinenkoulutus'
--AND (kl.tutkintotyyppi_koodi IN ('02','19','20') OR koulutusmoduuli_koodiarvo IN ('999901','999903')) --AP 17.10.2019 valma ja telma mukaan
--AND (ps.suorituksen_tyyppi <> 'nayttotutkintoonvalmistavakoulutus') --jhe 17.5.2019 Juhon meili:"Eli sun pitää pudottaa sieltä pois kaikki päätason suoritukset, joiden tyyppi on "nayttotutkintoonvalmistavakoulutus". Niistä ei tarvi katsoa ollenkaan osasuorituksia."




















GO
/****** Object:  StoredProcedure [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_liputa_ei_vos_rahoitettu_koulutus]    Script Date: 23.10.2019 17:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_tutkinnot_ja_tutkinnonosat_liputa_ei_vos_rahoitettu_koulutus]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_liputa_ei_vos_rahoitettu_koulutus] AS' 
END
GO





ALTER PROCEDURE [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_liputa_ei_vos_rahoitettu_koulutus] AS


-- jhe 20.3.2019, 23.4.2019, 25.4.2019, 30.4
-- tätä näkymää käytetään AMOS-suoritepäätöslaskennan suodattimena
-- tässä liputetut opiskeluoikeudet tai suorituksen osat jätetään pois sp-laskennasta..
--..kaksi filtteriä siis samassa näkymässä
-- Huom: tämä on VOS-laskennan raskain ajo !!!

TRUNCATE TABLE [sa].[temp_tutkinnot_ja_tutkinnonosat_liputa_ei_vos_rahoitettu_koulutus]

INSERT INTO [sa].[temp_tutkinnot_ja_tutkinnonosat_liputa_ei_vos_rahoitettu_koulutus]

SELECT DISTINCT 
	opiskeluoikeus_oid, 
    osasuoritus_id, 
    vaatimus,
	tieto 
FROM   (
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

    --# 2               
    -- koulutusvientinä järjestetty koulutus, rajaa pois nämä opiskeluoikeudet  
    -- CSCVIPUNEN-1384  
    -- 21.3.2019 Juhon uusi speksi vaihdettu sisempään kyselyyn, aikarajaukset muutettu kovakoodatusta dynaamisiksi /jhe
        

	SELECT opiskeluoikeus_oid, 
		NULL                                   AS osasuoritus_id, 
        'r2, rajaa pois nämä opiskeluoikeudet - CSCVIPUNEN-1384, koulutusvienti' AS vaatimus,
		'opiskeluoikeus' as tieto 
	FROM   (
		SELECT 
			oo.opiskeluoikeus_oid 
        FROM koski_sa.sa.sa_koski_opiskeluoikeus AS oo 
        WHERE oo.koulutusmuoto = 'ammatillinenkoulutus' 
        AND ( 
			( oo.paattymispaiva > Datefromparts(Year(Getdate()) - 2, 12, 31) 
                        -- vuosi-2 joulukuun viimeinen 'YYYY-12-31'   
                               
			AND oo.paattymispaiva < Datefromparts(Year(Getdate()) - 1, 12, 31) ) 
                            -- vuosi-1 joulukuun viimeinen 'YYYY-12-31'   
                                   
            OR oo.paattymispaiva IS NULL 
		) 
		AND oo.alkamispaiva < Datefromparts(Year(Getdate()) - 0, 1, 1) 
                --kuluva vuosi tammikuun ensimmäinen 'YYYY-01-01'  
        AND oo.lisatiedot_koulutusvienti = 1
	) t2 
--/*  
	UNION 


	--# 3, rajaa pois nämä osasuoritukset  
	-- opiskelu ei ole rahoituksen piirissä, päätellään data-kentän json-tiedosta  
	-- pudottaa pois tunnustetut tutkinnon osat tai osa-alueet (jotka ei rahoituksen piirissä) 
	-- tämäkin juho mikkosen speksi 19.3.2019  
	-- CSCVIPUNEN-1386  
	SELECT 
		opiskeluoikeus_oid, 
		osasuoritus_id, 
		'r3, rajaa pois nämä osasuoritukset - CSCVIPUNEN-1386, json-tieto, rahoituksenPiirissa: false' AS 
		vaatimus,
		'osasuoritus' as tieto 
	FROM   (
		SELECT 
			opiskeluoikeus_oid, 
			osasuoritus_id, 
            data, 
            CASE 
				WHEN os.data LIKE '%"rahoituksenPiirissä": false}%' THEN '1' 
                ELSE '0' 
			END AS rp 
		FROM koski_sa.sa.sa_koski_osasuoritus AS os
	) t3 
	WHERE t3.rp = 1 

  
	UNION 
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
	SELECT 
		t4.opiskeluoikeus_oid, 
		t4.osasuoritus_id, 
		'r4, rajaa pois nämä osasuoritukset - 29.4.2019 email, Juho Mikkonen: Rahoituksesta taas pudotetaan ne, joissa os.suorituksen_tyyppi = ammatillisentutkinnonosanosaalue.' AS vaatimus,
		'osasuoritus' as tieto 
	FROM   (
		SELECT 
			opiskeluoikeus_oid, 
			osasuoritus_id, 
			CASE 
				WHEN os.suorituksen_tyyppi = 'ammatillisentutkinnonosanosaalue' THEN 1
        --             AND Year(os.arviointi_paiva) = Year(Getdate()) - 1  
        -- aikarajaus tehdään seuraavalla vaiheessa joka tapauksessa 
				ELSE 0 
			END AS ei_rahoiteta 
		FROM koski_sa.sa.sa_koski_osasuoritus AS os
	) t4 
	WHERE t4.ei_rahoiteta = 1 
--*/  
--/*  
	UNION 
	--# 5, rajaa pois nämä osasuoritukset 
	--Kari Korhonen ja Seppo Hänninen, email 25.4.2019: 
	--..hylätyt suoritukset pois rahoituslaskennasta 
	SELECT 
		t5.opiskeluoikeus_oid, 
		t5.osasuoritus_id, 
		'r5, rajaa pois nämä osasuoritukset - Kari Korhonen ja Seppo Hänninen, email 25.4.2019: hylätyt suoritukset pois rahoituslaskennasta' AS vaatimus,
		'osasuoritus' as tieto 
	FROM   (
		SELECT 
			opiskeluoikeus_oid, 
			osasuoritus_id, 
			CASE 
				WHEN os.arviointi_hyvaksytty = 0 THEN 1 
				ELSE 0 
			END AS osa_suoritus_hylatty 
		FROM koski_sa.sa.sa_koski_osasuoritus AS os
	) t5 
	WHERE t5.osa_suoritus_hylatty = 1 
--/*  
) t100 









GO
/****** Object:  StoredProcedure [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_osasuoritus_pl_eivos]    Script Date: 23.10.2019 17:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_tutkinnot_ja_tutkinnonosat_osasuoritus_pl_eivos]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_osasuoritus_pl_eivos] AS' 
END
GO




ALTER PROCEDURE [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_osasuoritus_pl_eivos] AS

-- tässä suodatetaan pois ne osasuoritukset ja opiskeluoikeudet.. 
-- .. jotka nkymässä [dw].[v_amos_spl_liputa_ei_vos_rahoitettu_koulutus]..
-- .. liputettiin ei kuuluviksi amos vos-rahoituksen piiriin
-- tuodaan eperusteista laajuudet, logiikkaa ehkä vielä tarkistettava Sepon kanssa, jhe 30.4
-- lisätty aikarajaus ja arviointi_hyvaksytty rajaus jo tähän vaiheeseen

TRUNCATE TABLE [sa].[temp_tutkinnot_ja_tutkinnonosat_osasuoritus_pl_eivos]

INSERT INTO [sa].[temp_tutkinnot_ja_tutkinnonosat_osasuoritus_pl_eivos]



SELECT 
	os.osasuoritus_id, 
	os.ylempi_osasuoritus_id, 
	coalesce(os2.koulutusmoduuli_koodisto,'') as koulutusmoduuli_koodisto_ylempi,
	os.paatason_suoritus_id, 
	os.opiskeluoikeus_oid, 
	os.suorituksen_tyyppi, 
	os.koulutusmoduuli_koodisto,
	-- jhe 30.4 tuodaan ep tietoja, tutkintokoodi ja laajuus, 1.5 kytkentä pois toistaseksi, hukkaa 5% riveistä
	-- seuraavalla tasolla korvataan yhdistelmäavaimen tutkintokoodi_tutkinnonosakoodi avulla kosken laajuustieto
	-- yhdistelmäavain siksi, että sama tutkinnonosa voi olla eri laajuinen eri tutkinnoissa 
	--,ep.tutkintokoodi as ep_tutkinto_koodi, 
   
	os.koulutusmoduuli_koodiarvo, 
	--jhe 10.5 lisätään numeerinen koodiarvo kenttä
	cast(
	case 
		when isnumeric(os.koulutusmoduuli_koodiarvo)= 1 and os.koulutusmoduuli_koodiarvo not like '0%' and os.koulutusmoduuli_koodiarvo not like '%.%' then os.koulutusmoduuli_koodiarvo
		else NULL 
	end as varchar) as koulutusmoduuli_koodiarvo_numeerinen, 
	os.koulutusmoduuli_laajuus_arvo, 
	os.koulutusmoduuli_laajuus_yksikko, 
	os.koulutusmoduuli_paikallinen, 
	os.koulutusmoduuli_pakollinen, 
	os.vahvistus_paiva, 
	os.arviointi_arvosana_koodiarvo, 
	os.arviointi_arvosana_koodisto, 
	os.arviointi_hyvaksytty, 
	os.arviointi_paiva, 
	os.nayton_arviointi_paiva, 
	case when eivos.osasuoritus_id is not null then 1 else 0 end as osasuoritus_hylataan,
	coalesce(oo2.koulutustoimija_oid, oo.koulutustoimija_oid) as koulutustoimija_oid,
	os.data

FROM Koski_SA.sa.sa_koski_osasuoritus AS os 

LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus oo ON oo.opiskeluoikeus_oid = os.opiskeluoikeus_oid 
LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus oo2 ON oo2.opiskeluoikeus_oid = oo.sisaltyy_opiskeluoikeuteen_oid

--jhe 3.6.2019 eivos-suodatuksen korjaus
LEFT OUTER JOIN (
	SELECT DISTINCT      
		osasuoritus_id, tieto
	FROM sa.temp_tutkinnot_ja_tutkinnonosat_liputa_ei_vos_rahoitettu_koulutus
	WHERE tieto = 'osasuoritus'
) AS eivos ON os.osasuoritus_id = eivos.osasuoritus_id

--AP 23.6.2019 joinin muokkaus
--LEFT OUTER JOIN [dw].[d_amos_spl_koski_liputa_ei_vos_rahoitettu_koulutus] AS eivos ON eivos.osasuoritus_id = os.osasuoritus_id and eivos.tieto = 'osasuoritus'

--AP 1.8.2019 join jolla haetaan ylemmän osasuorituksen koulutusmoduuli_koodisto
LEFT JOIN Koski_SA.sa.sa_koski_osasuoritus os2 ON os2.osasuoritus_id = os.ylempi_osasuoritus_id

WHERE oo.koulutusmuoto = 'ammatillinenkoulutus'
AND year(os.arviointi_paiva)= 2018
AND os.arviointi_hyvaksytty = '1'
--13.5.2019 jhe FYI laajuusykiköllä suodattaminen karsii riveistä n. 90%
--AP 20.6.2019 nullit -> 6
AND coalesce(os.koulutusmoduuli_laajuus_yksikko,6) = '6'
--AND (eivos.osasuoritus_id IS NULL)
--AP 9.7.2019 lisätty ao ehto
--Seppo 8.7.2019: "Tutkinnon osien määrässä tai osaamispisteissä ei huomioda sellaisia osasuorituksia joiden tyyppi on ammatillisentutkinnonosaapienempikokonaisuus."
AND os.suorituksen_tyyppi != 'ammatillisentutkinnonosaapienempikokonaisuus'





GO
/****** Object:  StoredProcedure [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_paatason_suoritukset]    Script Date: 23.10.2019 17:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_tutkinnot_ja_tutkinnonosat_paatason_suoritukset]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_paatason_suoritukset] AS' 
END
GO





ALTER PROCEDURE [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_paatason_suoritukset] AS



--4 §
--Tutkintojen ja tutkinnon osien kustannusryhmän määräytyminen
--Tutkinnon osan kustannusryhmä määräytyy sen tutkinnon mukaisesti, johon tutkinnon osa tutkinnon perusteiden mukaisesti kuuluu.
--Ammatillisesta koulutuksesta annetun lain 13 §:n 2 momentissa tarkoitetut yhteiset tutkinnon osat kuuluvat kuitenkin kustannusryhmään 1.

--Jos tutkinnon osa voi tutkinnon perusteiden mukaisesti kuulua useaan tutkintoon, jotka kuuluvat eri kustannusryhmiin,
--tutkinnon osan kustannusryhmä määräytyy sen tutkinnon mukaisesti, jota opiskelija suorittaa.
--Jos opiskelijan tavoitteena on suorittaa vain tutkinnon osa tai osia, tässä momentissa tarkoitettu tutkinnon osa kuuluu kustannusryhmään 1.


-- ## Määritys OPH 7.3.2019, Korhonen, Hänninen Mikkonen -> Helminen, CSC ##
-- Logiikka: poimitaan tutkintotyypin koodilla rajaten PT, AT ja EAT tutkinnot ja liitetään niihin kustannusryhmät
-- Sitten tähän kyselyyn liitetään..
		-- .. suoritustason tieto [dw].[v_amos_spl_koski_tutkinnon_osien_suoritukset]..
		-- .. ja koulutustoimijatieto [dw].[v_amos_spl_koski_suorite_organisaatio_linkki]..
		-- .. suodatetaan pois ei-vos-suoritukset [dw].[v_amos_spl_sa_koski_osasuoritus_pl_eivos]..
		-- .. ja kootaan kuutioon ladattavaksi ensin ilman organisaatiota [dw].[v_amos_spl_suoritepaatoslaskennan_tiedot]..
		-- .. ja sitten organisaation linkittäen [dw].[v_amos_spl_suoritepaatoslaskennan_tiedot_laajat]
		-- .. suorituskykysyistä osatuloksia ladataan samannimisiin materialisoituihin näkymiin ..
		-- .. tämä tehdään Jobissa, myöhemmin ehkä PDI:llä /jhe 25.3.2019
 -- aikarajaus: vahvistuspäivä päätason suorituksella tarkasteluvuoden aikana TAI
 -- osasuorituksella arviointipäivä tarkasteluvuoden aikana
 -- eli liputa tässä vahvistuspäivä ja osasuorituksessa arviointipäivä..
 -- rajaus jos ainakin toinen täyttää ehdon

-- Erityistä: neljällä tutkinnolla on kahteen kustannusryhmään kuuluvia osaamisaloja, joten niiden kustannusryhmiä ei haeta kr-taulusta,
-- ..poikkeavat osaamisalat liputetaan laatukontrollia varten sisemmässä kyselyssä, ulommassa kyselyssä..
-- .. kovakoodataan poikkeukset tutkinnon varsinaisesta kustannusryhmästä, case when t.osaamisala_koodiarvo in.....
-- 12.3 päivitetty Sepon lisäykset poikkeaviin osaamisalakoodeihin, meili torstai 7. maaliskuuta 2019 15.09
-- 13.3 toimipiste_nimi pudotettu pois, sisältää historiatietoa eli samalla oidilla voi olla useita nimiversioita, sotkee raportin
-- 2.4. kustannusryhmä liputettu poikkeavaksi jos ei suorita koko tutkintoa

TRUNCATE TABLE [sa].[temp_tutkinnot_ja_tutkinnonosat_paatason_suoritukset]

;WITH CTE AS (
	SELECT
		opiskeluoikeus_oid
		,sisaltyy_opiskeluoikeuteen_oid
		,koulutustoimija_oid
		,oppilaitos_oid
		,alkamispaiva
		,paattymispaiva = COALESCE(paattymispaiva,'9999-12-31')
	FROM koski_sa.sa.sa_koski_opiskeluoikeus
	WHERE koulutusmuoto = 'ammatillinenkoulutus'
)

INSERT INTO [sa].[temp_tutkinnot_ja_tutkinnonosat_paatason_suoritukset]

SELECT DISTINCT
         t.toimipiste_oid,
		 t.koulutustoimija_oid,
         t.opiskeluoikeus_oid,
		 t.ylempi_opiskeluoikeus_oid,
		 t.paatason_suoritus_id,
         tutkinto_koodi = coalesce(kl.uusi_eat_koodi, kl.koulutusluokitus_koodi, koulutusmoduuli_koodiarvo), --AP 16.6.2019 null-käsittely lisätty
         NULL AS osaamisala_koodiarvo, --t.osaamisala_koodiarvo,
		-- 9.5 jhe yhdistelmavain lisätty
         NULL AS tutkinto_ja_osaamisala_koodi, --t.tutkinto_ja_osaamisala_koodi,
		 atok.tutkinto_ja_osaamisala_koodi as eper_tutkinto_ja_osaamisala_koodi,

		-- 12.5 diaarinumero ja yhdistelmäavaimet lisätty
		 t.diaarinumero,
		 --t.diaarinumero_space,
		 NULL as diaarinumero_tutkinto_koodi, -- t.diaarinumero+'_'+t.koulutusmoduuli_koodiarvo as diaarinumero_tutkinto_koodi,
		 NULL as diaarinumero_tutkinto_ja_osaamisala_koodi, -- t.diaarinumero+'_'+t.tutkinto_ja_osaamisala_koodi  as diaarinumero_tutkinto_ja_osaamisala_koodi,
		t.suorituksen_tyyppi,

		 case
			WHEN t.suorituksen_tyyppi <> 'ammatillinentutkinto' THEN '1'
			else coalesce(sa1.kustannusryhma_koodi, sa2.kustannusryhma_koodi)
		end AS kustannusryhma_koodi,

         atok.tutkinto_kustannusryhma_koodi AS alkup_kustannusryhmakoodi,
         t.suorittaa_koko_tutkintoa,

		 kl.tutkintotyyppi_koodi,
         kl.tutkintotyyppi_fi,
         kl.koulutusluokitus_fi,
         t.vahvistus_paiva,
         t.vahvistus_paiva_on,
		 vahvistus_paiva_kohdevuonna
 FROM   (

		SELECT
			--12.5.2019 diaarinumero haettava data-kentän jsonista, per mikkonen email pe 10.5.2019 11.21
			--						 ltrim(rtrim(replace(replace(replace(substring(data,CHARINDEX('"perusteenDiaarinumero": ',data)+26,15),'}',''),'"',''),',',''))) as diaarinumero_space,
			replace(replace(replace(replace(substring(data,CHARINDEX('"perusteenDiaarinumero": ',data)+26,15),'}',''),'"',''),',',''),' ','') as diaarinumero,
			ps.toimipiste_oid,
			coalesce(so.koulutustoimija_oid, oo.koulutustoimija_oid) as koulutustoimija_oid,
			ps.opiskeluoikeus_oid,
			coalesce(oo.sisaltyy_opiskeluoikeuteen_oid,'') as ylempi_opiskeluoikeus_oid,
			ps.paatason_suoritus_id,
			CASE
				WHEN ps.suorituksen_tyyppi = 'ammatillinentutkinto' THEN 1
				ELSE 0
			END AS suorittaa_koko_tutkintoa,
			ps.koulutusmoduuli_koodiarvo,
			--CASE
			--	WHEN ps.koulutusmoduuli_koodiarvo = '999904' THEN ps.tutkinto_koodiarvo
			--	ELSE ps.koulutusmoduuli_koodiarvo
			--END AS koulutusmoduuli_koodiarvo,

			ps.osaamisala_koodiarvo,
			--AP 16.6.2019 muutettu alla olevaa päättelyä
			CASE
				WHEN ps.osaamisala_koodiarvo IS NULL and ps.koulutusmoduuli_koodiarvo = '999904' THEN ps.tutkinto_koodiarvo
				WHEN ps.osaamisala_koodiarvo IS NULL and ps.koulutusmoduuli_koodiarvo <> '999904' THEN ps.koulutusmoduuli_koodiarvo
				WHEN ps.osaamisala_koodiarvo IS NOT NULL THEN ps.osaamisala_koodiarvo
				--WHEN ps.osaamisala_koodiarvo IS NOT NULL and ps.koulutusmoduuli_koodiarvo = '999904' THEN CAST(ps.tutkinto_koodiarvo AS varchar(20)) + '_' + CAST(ps.osaamisala_koodiarvo AS varchar(20))
				--ELSE CAST(ps.koulutusmoduuli_koodiarvo AS varchar(20)) + '_' + CAST(ps.osaamisala_koodiarvo AS varchar(20))
			END AS tutkinto_ja_osaamisala_koodi,

			ps.suorituksen_tyyppi,
			-- AP 11.9.2019 lisätty case
			CASE
				WHEN ps.vahvistus_paiva < oo.alkamispaiva THEN oo.alkamispaiva
				WHEN ps.vahvistus_paiva > oo.paattymispaiva THEN oo.paattymispaiva
				ELSE ps.vahvistus_paiva
			END AS vahvistus_paiva,

			CASE
				WHEN year(vahvistus_paiva)=2018 --year(getdate())-1
					THEN 1
				ELSE 0
			END AS vahvistus_paiva_kohdevuonna,

			CASE
				WHEN vahvistus_paiva IS NULL THEN 0
				ELSE 1
			END AS vahvistus_paiva_on


		FROM CTE AS oo
		LEFT JOIN koski_sa.sa.sa_koski_paatason_suoritus ps ON ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
		LEFT JOIN CTE AS so ON so.opiskeluoikeus_oid = coalesce(oo.sisaltyy_opiskeluoikeuteen_oid,'')

		  --jhe 17.5.2019 Juhon meili:"Eli sun pitää pudottaa sieltä pois kaikki päätason suoritukset, joiden tyyppi on "nayttotutkintoonvalmistavakoulutus". Niistä ei tarvi katsoa ollenkaan osasuorituksia."
		WHERE ps.suorituksen_tyyppi != 'nayttotutkintoonvalmistavakoulutus'
		--AP 13.10.2019 ylempää "kuorioikeutta" ei huomioida
		
		
		
		

) AS t
-- AP 16.6.2019 lisätty kaksi joinia
LEFT JOIN (SELECT DISTINCT tutkinto_ja_osaamisala_koodi, tutkinto_kustannusryhma_koodi FROM dbo.kustannusryhma_tutkinto_ja_osaamisala) atok on atok.tutkinto_ja_osaamisala_koodi = t.tutkinto_ja_osaamisala_koodi
LEFT JOIN ANTERO.sa.sa_amos_osaamisala_kustannusryhma sa1 on sa1.osaamisala_koodi = t.tutkinto_ja_osaamisala_koodi
LEFT JOIN ANTERO.dw.d_koulutusluokitus kl on kl.koulutusluokitus_koodi = t.koulutusmoduuli_koodiarvo
LEFT JOIN ANTERO.sa.sa_amos_tutkinto_kustannusryhma sa2 on sa2.tutkinto_koodi = coalesce(kl.uusi_eat_koodi, kl.koulutusluokitus_koodi)


















GO
/****** Object:  StoredProcedure [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset]    Script Date: 23.10.2019 17:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset] AS' 
END
GO



ALTER PROCEDURE [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset] AS

-- ## Määritys OPH 7.3.2019, Korhonen, Hänninen Mikkonen -> Helminen ##
-- Logiikka: poimitaan osasuoritukset opiskeluoikeuksittain..
-- .. toiseen opiskeluoikeuteen sisältyvät suoritukset niputetaan emo-oikeuden eli ylemmän osasuorituksen alle
-- .. tätä varten on luotu uusi raportointikäsite "suoritustason_tunniste", jolla suoritusten kpl-määrä voidaan laskea
-- Aikarajaus tehdään arviointipäivän avulla, mutta tässä kyselyssä ei karsita rivejä, ainoastaan liputetaan osuminen raportointivuoteen..
-- .. varsinainen aikarajaus tehdään kun osasuoritus yhdistetään päätason tauluun, jonka vahvistus_paiva -arvo on vaihtoehtoinen hyväksymiskriteeri
-- Yhteinen tutkinnonosa liputetaan täällä myöhempää kustannusryhmittelyä varten


TRUNCATE TABLE [sa].[temp_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset]

;WITH CTE AS (
	SELECT
		opiskeluoikeus_oid
		,sisaltyy_opiskeluoikeuteen_oid
		,oppilaitos_oid
		,koulutustoimija_oid
		,alkamispaiva
		,paattymispaiva = COALESCE(paattymispaiva,'9999-12-31')
	FROM koski_sa.sa.sa_koski_opiskeluoikeus
	WHERE koulutusmuoto = 'ammatillinenkoulutus'
)

INSERT INTO [sa].[temp_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset]

SELECT
       oppilaitos_oid,
	   koulutustoimija_oid,
       opiskeluoikeus_oid,
	   ylempi_opiskeluoikeus_oid,
       paatason_suoritus_id,
       coalesce(CASE
					WHEN kuuluu_kaatoluokkaan = 1 THEN t.osasuoritus_id
					ELSE t.ylempi_osasuoritus_id
				END
	   ,t.osasuoritus_id) AS suoritustason_tunniste,
       arviointi_paiva,
       arviointi_paiva_kohdevuonna,
	   usean_tutkinnon_tutkinnonosa,
	   usean_tutkinnon_tutkinnonosa_usea_kustannusryhma,
	   kustannusryhma_usean_tutkinnon_tutkinnonosa_yksi_kustannusryhma,
	   tutkinto_johon_tutkinnonosa_kuuluu,
	   osaamisala_johon_tutkinnonosa_kuuluu,
	   yhteinen_tutkinnon_osa,
	   toisesta_tutkinnosta_sisallytetty_tutkinnonosa,
       kuuluu_kaatoluokkaan,
       koulutus_moduuli_laajuus_alle_yhden,
	   koulutusmoduuli_koodiarvo,
	   koulutusmoduuli_koodiarvo_paataso,
	   koulutusmoduuli_koodiarvo_numeerinen,
	   --laajuus_puuttuu_eperusteista,
----------------------------------------
    --jhe 23.5 korvataan kosken laajuustieto eper-tiedolla jos se on saatavana
	--.. näytetään myös alkuperäinen arvo
	--.. huom. vanhojen tutkintojen osalta laajuus määritellään diaarinumeron perusteella
	--.. seuraavassa kyselyssä: [dw].[v_amos_spl_suoritepaatoslaskennan_tiedot]
	-- jhe 23.5 Sepon speksi 21.5: jos suorituksen laajuus haetaan koskesta ja arvo ei ole välillä 5-15..
	-- oikaistaan ohjelmallisesti, arvo<5=0, arvo<15=15
	  laajuus_puuttuu_eperusteista,

 	COALESCE(
		CASE
      --ensisijaisesti laajuus eperusteista
      -- jhe 23.5, ei löydy kaikkia laajuuksia epersta?
	  --laajuus_puuttuu_eperusteista=0 then ep_tutkinnonosa_laajuus
			when laajuus_puuttuu_eperusteista=0 then isnull(ep_tutkinnonosa_laajuus,koulutusmoduuli_laajuus_arvo)
	  --jos laajuus koskesta, hyväksytään vain sallituissa rajoissa
			when laajuus_puuttuu_eperusteista=1 and [koulutusmoduuli_laajuus_arvo] < 5 then 0
			when laajuus_puuttuu_eperusteista=1 and [koulutusmoduuli_laajuus_arvo] > 15 then 15
			when laajuus_puuttuu_eperusteista=2 and [koulutusmoduuli_laajuus_arvo] > 25 then 25
			when laajuus_puuttuu_eperusteista=3 then 0
			else [koulutusmoduuli_laajuus_arvo]
		END
	,0) AS koulutusmoduuli_laajuus_arvo,

    koulutusmoduuli_laajuus_arvo as koulutusmoduuli_laajuus_arvo_alkup
	,suorituksen_tyyppi
	,suorittaa_koko_tutkintoa
	--koulutusmoduuli_laajuus_yksikko

FROM   (

	SELECT 
		oo.oppilaitos_oid,
		coalesce(oo2.koulutustoimija_oid, oo.koulutustoimija_oid) AS koulutustoimija_oid,
		os.opiskeluoikeus_oid AS opiskeluoikeus_oid,
		coalesce(oo.sisaltyy_opiskeluoikeuteen_oid,'') AS ylempi_opiskeluoikeus_oid,
		os.paatason_suoritus_id,
		os.osasuoritus_id,
		os.ylempi_osasuoritus_id,
		--AP 2.8.2019 tällä varmistetaan se, että arviointipäivä mappaantuu myöhemmin johonkin aikajaksoon
		CASE
			WHEN os.arviointi_paiva < oo.alkamispaiva THEN oo.alkamispaiva
			WHEN os.arviointi_paiva > oo.paattymispaiva THEN oo.paattymispaiva
			ELSE os.arviointi_paiva
		END AS arviointi_paiva,

		CASE
			WHEN Year(os.arviointi_paiva) = 2018 THEN 1
			ELSE 0
		END AS arviointi_paiva_kohdevuonna,
		os.arviointi_hyvaksytty,
		CASE
			WHEN os.koulutusmoduuli_laajuus_arvo < 1 THEN 1
			ELSE 0
		END AS koulutus_moduuli_laajuus_alle_yhden,
		os.koulutusmoduuli_laajuus_arvo,
		os.koulutusmoduuli_laajuus_yksikko,

		ep.tutkinnonosa_laajuus as ep_tutkinnonosa_laajuus,
		os.koulutusmoduuli_koodiarvo,
		kl.koulutusluokitus_koodi as koulutusmoduuli_koodiarvo_paataso,
		os.koulutusmoduuli_koodiarvo_numeerinen,
		--os.ep_usean_tutkinnon_tutkinnonosa,
		-- 10.5.2019 jhe, tämä liputus tarvitaan kustannusryhmän määrittelyssä, per Seppo H
		-- liputus tehdään eperusteita vasten, siellä tunnistetut tutkinnonosat tässä ykkösellä, muut nollalla
		coalesce(epu.kuuluu_useaan_tutkintoon,0) as usean_tutkinnon_tutkinnonosa,
		coalesce(epu.kuuluu_eri_kustannusryhmiin,0) as usean_tutkinnon_tutkinnonosa_usea_kustannusryhma,
		epu.kuuluu_useaan_tutkintoon_yksi_kustannusryhma as kustannusryhma_usean_tutkinnon_tutkinnonosa_yksi_kustannusryhma,
		coalesce(epu.tutkinto_koodi,'') as tutkinto_johon_tutkinnonosa_kuuluu,
		coalesce(epu.osaamisala_koodi,'') AS osaamisala_johon_tutkinnonosa_kuuluu,

		CASE
			WHEN os.koulutusmoduuli_koodiarvo IN (
			'101053', '101054', '101055', '101056',
			'400012', '400013', '400014' )
			AND os.koulutusmoduuli_koodisto = 'tutkinnonosat' THEN 1

			ELSE 0
		END AS yhteinen_tutkinnon_osa,

		

		CASE
			WHEN os.data LIKE '%{_tutkinto_:%' THEN 1
			ELSE 0
		END AS toisesta_tutkinnosta_sisallytetty_tutkinnonosa,

		CASE
			WHEN os.koulutusmoduuli_koodiarvo IN ( '1', '2' ) AND os.koulutusmoduuli_koodisto = 'tutkinnonosatvalinnanmahdollisuus' THEN 1
			ELSE 0
		END AS kuuluu_kaatoluokkaan,

		---------------------
		--jhe 23.5.2019 Juho mikkosen speksi 21.5., so. suoritustyyppien laajuutta ei löydy eperusteista..
		--..käytetään koskeen kirjattua arvoa, tässä ensin ominaisuuden liputus:
		--AP 17.10.2019 muutettu Juhon uuden speksin mukaan

		CASE

		-- yhteinen tutkinnonosa
			WHEN os.koulutusmoduuli_koodiarvo IN ('101053', '101054', '101055', '101056', '400012', '400013', '400014')
				AND os.koulutusmoduuli_koodisto = 'tutkinnonosat'
				AND Year(os.arviointi_paiva) = 2018--Year(Getdate()) -1
				THEN 1

			WHEN os.koulutusmoduuli_koodisto_ylempi = 'tutkinnonosatvalinnanmahdollisuus' AND os.suorituksen_tyyppi = 'ammatillinenkorkeakouluopintoja'
				THEN 1

			WHEN os.koulutusmoduuli_koodisto_ylempi = 'tutkinnonosatvalinnanmahdollisuus' AND os.suorituksen_tyyppi in ('ammatillinenlukionopintoja','ammatillinenmuitaopintovalmiuksiatukeviaopintoja','ammatillisentutkinnonosanosaalue')
				THEN 2

		--kaatoluokka 
			WHEN os.koulutusmoduuli_koodiarvo IN ('1', '2')	AND os.koulutusmoduuli_koodisto = 'tutkinnonosatvalinnanmahdollisuus'
				THEN 3

			ELSE 0

		END as laajuus_puuttuu_eperusteista

		,ps.suorituksen_tyyppi

		,case when ps.suorituksen_tyyppi = 'ammatillinentutkinto' then 1 else 0 end as suorittaa_koko_tutkintoa


	FROM [sa].[temp_tutkinnot_ja_tutkinnonosat_osasuoritus_pl_eivos] AS os
	LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus ps on ps.paatason_suoritus_id = os.paatason_suoritus_id
	LEFT JOIN CTE AS oo ON oo.opiskeluoikeus_oid = os.opiskeluoikeus_oid
	--AP 1.10.2019 ao join linkitettyjen oikeuksien järjestäjän hakemiseen
	LEFT JOIN CTE AS oo2 on oo2.opiskeluoikeus_oid = oo.sisaltyy_opiskeluoikeuteen_oid
	--AP 23.6.2019 lisätty alla olevaan joiniin ehto rnk=1
	LEFT JOIN [Koski_SA].[dbo].[eperusteet_osaamisalat_tutkinnonosat_laajuudet] as ep ON cast(os.koulutusmoduuli_koodiarvo_numeerinen as bigint) = ep.tutkinnonosa_koodi and rnk2=1
	--jhe 30.4 tuodaan ep:stä usean tutkinnonosan liputus
	LEFT JOIN [Koski_SA].[dbo].[eperusteet_tutkinnonosa_tutkinto_kustannusryhma] as epu ON cast(os.koulutusmoduuli_koodiarvo_numeerinen as bigint) = epu.tutkinnonosa_koodi

	LEFT JOIN ANTERO.dw.d_koulutusluokitus kl ON kl.koulutusluokitus_koodi = ps.koulutusmoduuli_koodiarvo

	WHERE os.osasuoritus_hylataan = 0 AND 
	kl.tutkintotyyppi_koodi IN ('02','19','20') --OR kl.koulutusluokitus_koodi IN ('999901','999903'))
	

) AS t

GO
USE [ANTERO]
