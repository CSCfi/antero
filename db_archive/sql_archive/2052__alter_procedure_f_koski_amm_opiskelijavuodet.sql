USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_amm_opiskelijavuodet]    Script Date: 23.1.2019 14:20:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_f_koski_amm_opiskelijavuodet] AS


DECLARE @date DATE
SET @date = '2018-01-01'

TRUNCATE TABLE dw.f_koski_amm_opiskelijavuodet

WHILE (@date <= CAST(DATEADD(month, DATEDIFF(month, -1, getdate()) - 2, 0) AS DATE)) --EDELLISEN KUUKAUDEN EKA PÄIVÄ

BEGIN

	INSERT INTO dw.f_koski_amm_opiskelijavuodet (
		 vuosi
		,d_kalenteri_id
		,d_sukupuoli_id
		,d_kieli_aidinkieli_id
		,d_ika_id
		,d_osa_aikaisuus_id
		,d_erityisopetus_id
		,d_majoitus_id
		,d_kytkin_oppisopimuskoulutus_id
		,d_kytkin_vankilaopetus_id
		,d_kytkin_henkilostokoulutus_id
		,d_kytkin_tyovoimakoulutus_id
		,d_koulutusluokitus_id
		,d_organisaatioluokitus_oppilaitos_id
		,d_organisaatioluokitus_jarj_id
		,d_kustannusryhma_id
		,d_suorituksen_tyyppi_id
		,d_opintojenrahoitus_id
		,opiskelijavuodet
	)

	SELECT 
	
		 vuosi = tilv
		,d_kalenteri_id = COALESCE(d1.id,-1)
		,d_sukupuoli_id = COALESCE(d2.id,-1)
		,d_kieli_aidinkieli_id = COALESCE(d3.id,-1)
		,d_ika_id = COALESCE(d4.id,-1)
		,d_osa_aikaisuus_id = COALESCE(osa_aikaisuus,-1)
		,d_erityisopetus_id = COALESCE(d5.id,-1)
		,d_majoitus_id = COALESCE(d6.id,-1)
		,d_kytkin_oppisopimuskoulutus_id = COALESCE(d7.id,-1)
		,d_kytkin_vankilaopetus_id = COALESCE(d8.id,-1)
		,d_kytkin_henkilostokoulutus_id = COALESCE(d9.id,-1)
		,d_kytkin_tyovoimakoulutus_id = COALESCE(d10.id,-1)
		,d_koulutusluokitus_id = COALESCE(d11.id,-1)
		,d_organisaatioluokitus_oppilaitos_id = COALESCE(d12.id,-1)
		,d_organisaatioluokitus_jarj_id = COALESCE(d13.id,-1)
		,d_kustannusryhma_id = COALESCE(d15.id,-1)
		,d_suorituksen_tyyppi_id = COALESCE(d14.id,-1)
		,d_opintojenrahoitus_id = COALESCE(d16.id,-1)
		,opiskelijavuodet = (SUM(q.opiskelijavuosi_pv_lasna) /*- SUM(opiskelijavuosi_pv_loma)*/ ) / 365.0
	
	FROM (
	
		SELECT 
			 tilv = YEAR(CAST(@date AS date))
			,tilv_date = @date
			,oo.oppija_oid
			,oo.opiskeluoikeus_oid
			,(CASE WHEN CAST(SUBSTRING(h.hetu,8,3) AS INT) % 2 = 1 THEN '2' WHEN CAST(SUBSTRING(h.hetu,8,3) AS INT) % 2 = 0 THEN '1' ELSE NULL END) AS sukupuoli
			,h.aidinkieli AS aidinkieli
			,YEAR(@date)-YEAR(h.syntymaaika) AS ika 
			,(CASE WHEN ooa.osa_aikaisuus = 100 OR ooa.osa_aikaisuus is NULL THEN 2 ELSE 1 END) AS osa_aikaisuus --PITÄÄ TEHDÄ DIMENSIO
		
			,ooa.oppisopimus_jossain_paatason_suorituksessa AS oppis
			,(CASE				
				--Erityisopiskelija ilman erit. tuen tehtävää; tutk. joht 
				WHEN (ooa.erityinen_tuki=1 or hojks=1) and ooa.vaativan_erityisen_tuen_erityinen_tehtava=0 and ps.suorituksen_tyyppi not in ('telma','valma') THEN 2 --tämä dynaamiseksi
				--Erityisopiskelija ilman erit. tehtävää; valmentava
				WHEN (ooa.erityinen_tuki=1 or hojks=1) and ooa.vaativan_erityisen_tuen_erityinen_tehtava=0 and ps.suorituksen_tyyppi in ('telma','valma') THEN 3 
				--Erit. tuen tehtävä; tutk.joht; erityisopiskelija
				WHEN ooa.vaativan_erityisen_tuen_erityinen_tehtava=1 and ps.suorituksen_tyyppi not in ('telma','valma') /*and ooa.erityinen_tuki=1*/ THEN 4
				--Erit. tuen tehtävä; tutk.joht; vaikeasti vammainen
				WHEN /*ooa.vaativan_erityisen_tuen_erityinen_tehtava=1 and*/ ps.suorituksen_tyyppi not in ('telma','valma') and ooa.vaikeasti_vammainen=1 THEN 5
				--Erit. tuen tehtävä; tutk.joht; vammainen&avustaja
				WHEN /*ooa.vaativan_erityisen_tuen_erityinen_tehtava=1 and*/ ps.suorituksen_tyyppi not in ('telma','valma') and ooa.vammainen_ja_avustaja=1 THEN 6
				--Erit. tuen tehtävä; TELMA&VALMA; erityisopiskelija
				WHEN ooa.vaativan_erityisen_tuen_erityinen_tehtava=1 and ps.suorituksen_tyyppi in ('telma','valma') /*and ooa.erityinen_tuki=1*/ THEN 7
				--Erit. tuen tehtävä; TELMA&VALMA; vaikeasti vammainen
				WHEN /*ooa.vaativan_erityisen_tuen_erityinen_tehtava=1 and*/ ps.suorituksen_tyyppi in ('telma','valma') and ooa.vaikeasti_vammainen=1 THEN 8
				--Erit. tuen tehtävä; TELMA&VALMA; vammainen&avustaja
				WHEN /*ooa.vaativan_erityisen_tuen_erityinen_tehtava=1 and*/ ps.suorituksen_tyyppi in ('telma','valma') and ooa.vammainen_ja_avustaja=1 THEN 9
				--Ei erityisopiskelija
				WHEN ooa.erityinen_tuki=0 THEN 1
				ELSE 9
			  END) AS erityisopetus
			,(CASE					
				WHEN ooa.majoitus=1 THEN 2
				WHEN ooa.sisaoppilaitosmainen_majoitus=1 THEN 3
				WHEN ooa.vaativan_erityisen_tuen_yhteydessa_jarjestettäva_majoitus=1 THEN 4
				ELSE 1
			  END) AS majoitus
			,ooa.vankilaopetuksessa AS vankilaopetus
			,oo.lisatiedot_henkilostokoulutus AS henkilostokoulutus
			,(CASE WHEN ooa.opintojen_rahoitus in ('10','2','3') THEN 1 ELSE 0 END) AS tyovoimakoulutus
		
			,k.koulutusluokitus_koodi AS koulk --näyttötutkintoon valmistavalle koulutukselle haetaan "oikea" tutkintokoodi
			,oo.oppilaitos_oid AS tunn
			,oo.koulutustoimija_oid AS jarj
		
			,CASE WHEN ooa.opiskeluvalmiuksia_tukevat_opinnot = 1 THEN 'ot' ELSE COALESCE(okr.kustannusryhma_koodi, tkr.kustannusryhma_koodi) END AS kustannusryhma

			,(CASE
				--koko tutkinto
				WHEN ps.suorituksen_tyyppi = 'ammatillinentutkinto' then 1
				--tutkinnon osa/osia
				ELSE 2
			END) as suorituksen_tyyppi

			,ooa.opintojen_rahoitus as opintojen_rahoitus

			/* opiskelijavuosi = ((jakson lopetuspäivä-jakson aloituspäivä+1) - (yli neljä viikkoa kestäneen loman neljä viikkoa ylittävä viikkojen määrä x 7)) x osa-aikaisuusprosentti / 365 */
			,opiskelijavuosi_pv_lasna = (CASE 
												WHEN ooa.tila in ('lasna','valmistunut') THEN (ooa.osa_aikaisuus / 100.0) * ((DATEDIFF(DAY,
																									  (CASE 
																											WHEN ooa.alku < @date THEN @date --jos opiskeluoikeus on alkanut ennen tarkastelujaksoa, lasketaan kertyneet päivät tarkastelujakson alusta 
																											ELSE ooa.alku 
																									   END),
																									  (CASE 
																											WHEN ooa.loppu > CONCAT(LEFT(@date,7),'-',DAY(DATEADD(MM,DATEDIFF(MM, -1, @date),0) -1) ) THEN CAST(CONCAT(LEFT(@date,7),'-',DAY(DATEADD(MM,DATEDIFF(MM, -1, @date),0) -1)) AS DATE) --jos opiskeluoikeus päättyy tarkastelujakson jälkeen, lasketaan kertyneet päivät tarkastelujakson loppuun mennessä
																											ELSE ooa.loppu 
																									   END))) + 1) 
												--LOMIEN LASKENNASSA SEURAAVAT VAIHTOEHDOT:
												--alkanut ennen jakson alkua, kertynyt yhtäjaksoisesti väh. 28 päivää -> saa arvon 0
												--alkanut ennen jakson alkua, kertynyt yhtäjaksoisesti alle 28 päivää
													--aiempi loma + nykyisen jakson loma yhteensä yli 28 päivää -> saa arvon 28 - aiempi
													--muuten jakson aikana kertyneet päivät
												--alkanut jakson aikana, kestää yli 28 päivää -> saa arvon 28
												--alkanut jakson aikana -> jakson aikana kertyneet päivät
												--muuten nolla
												WHEN ooa.tila = 'loma' THEN (ooa.osa_aikaisuus / 100.0) *
																				(CASE
																					WHEN ooa.alku < @date AND ((DATEDIFF(DAY, ooa.alku, CONCAT(LEFT(CONVERT (varchar(15),DATEADD(month,-1,@date), 112),4),'-',SUBSTRING(CONVERT(varchar(15),DATEADD(month,-1,@date), 112),5,2),'-',DAY(EOMONTH(DATEADD(month,-1,@date)))))) + 1) >= 28 THEN 0
																					WHEN ooa.alku < @date AND ((DATEDIFF(DAY, ooa.alku, CONCAT(LEFT(CONVERT (varchar(15),DATEADD(month,-1,@date), 112),4),'-',SUBSTRING(CONVERT(varchar(15),DATEADD(month,-1,@date), 112),5,2),'-',DAY(EOMONTH(DATEADD(month,-1,@date)))))) + 1) < 28 THEN 
																						CASE 
																							WHEN ((DATEDIFF(DAY, ooa.alku, CONCAT(LEFT(CONVERT (varchar(15),DATEADD(month,-1,@date), 112),4),'-',SUBSTRING(CONVERT(varchar(15),DATEADD(month,-1,@date), 112),5,2),'-',DAY(EOMONTH(DATEADD(month,-1,@date)))))) + 1)      +      ((DATEDIFF(DAY, @date, (CASE WHEN ooa.loppu > CONCAT(LEFT(@date,7),'-',DAY(DATEADD(MM,DATEDIFF(MM, -1, @date),0) -1) ) THEN CAST(CONCAT(LEFT(@date,7),'-',DAY(DATEADD(MM,DATEDIFF(MM, -1, @date),0) -1)) AS DATE) ELSE ooa.loppu END))) + 1) >= 28 THEN 28-((DATEDIFF(DAY, ooa.alku, CONCAT(LEFT(CONVERT (varchar(15),DATEADD(month,-1,@date), 112),4),'-',SUBSTRING(CONVERT(varchar(15),DATEADD(month,-1,@date), 112),5,2),'-',DAY(EOMONTH(DATEADD(month,-1,@date)))))) + 1)
																							ELSE ((DATEDIFF(DAY, @date, (CASE WHEN ooa.loppu > CONCAT(LEFT(@date,7),'-',DAY(DATEADD(MM,DATEDIFF(MM, -1, @date),0) -1) ) THEN CAST(CONCAT(LEFT(@date,7),'-',DAY(DATEADD(MM,DATEDIFF(MM, -1, @date),0) -1)) AS DATE) ELSE ooa.loppu END))) + 1)
																						END
																					WHEN ooa.alku >= @date AND ((DATEDIFF(DAY, ooa.alku, (CASE WHEN ooa.loppu > CONCAT(LEFT(@date,7),'-',DAY(DATEADD(MM,DATEDIFF(MM, -1, @date),0) -1) ) THEN CAST(CONCAT(LEFT(@date,7),'-',DAY(DATEADD(MM,DATEDIFF(MM, -1, @date),0) -1)) AS DATE) ELSE ooa.loppu END))) + 1) > 28 THEN 28
																					WHEN ooa.alku >= @date THEN ((DATEDIFF(DAY, ooa.alku, (CASE WHEN ooa.loppu > CONCAT(LEFT(@date,7),'-',DAY(DATEADD(MM,DATEDIFF(MM, -1, @date),0) -1) ) THEN CAST(CONCAT(LEFT(@date,7),'-',DAY(DATEADD(MM,DATEDIFF(MM, -1, @date),0) -1)) AS DATE) ELSE ooa.loppu END))) + 1)
																					ELSE 0
																				END) 
											ELSE 0
										 END) 
					
		FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo
		LEFT JOIN ( --lomatiedot erikseen kuin lasna/valmistunut, koska yhtäkestoinen loma voi olla useana jaksona, joten käytettävä tila_alkanut tietoa
					SELECT 
						 opiskeluoikeus_oid
						,tila
						,alku
						,loppu
						,opintojen_rahoitus
						,majoitus
						,sisaoppilaitosmainen_majoitus
						,vaativan_erityisen_tuen_yhteydessa_jarjestettäva_majoitus
						,erityinen_tuki
						,vaativan_erityisen_tuen_erityinen_tehtava
						,hojks
						,vaikeasti_vammainen
						,vammainen_ja_avustaja
						,osa_aikaisuus
						,opiskeluvalmiuksia_tukevat_opinnot
						,vankilaopetuksessa
						,oppisopimus_jossain_paatason_suorituksessa
					FROM (
							SELECT 
								 sa1.opiskeluoikeus_oid
								,tila
								,tila_alkanut as alku
								,MAX(sa1.loppu) loppu
								,COALESCE(sa2.opintojen_rahoitus,sa1.opintojen_rahoitus) as opintojen_rahoitus
								,majoitus
								,sisaoppilaitosmainen_majoitus
								,vaativan_erityisen_tuen_yhteydessa_jarjestettäva_majoitus
								,erityinen_tuki
								,vaativan_erityisen_tuen_erityinen_tehtava
								,hojks
								,vaikeasti_vammainen
								,vammainen_ja_avustaja
								,COALESCE(sa2.osa_aikaisuus,sa1.osa_aikaisuus) as osa_aikaisuus
								,opiskeluvalmiuksia_tukevat_opinnot
								,vankilaopetuksessa
								,oppisopimus_jossain_paatason_suorituksessa
							FROM Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso sa1
							LEFT JOIN (--loman osa-aikaisuus ja rahoitus otetaan edellisestä läsnäolojaksosta
								SELECT 
									 opiskeluoikeus_oid
									,loppu
									,osa_aikaisuus 
									,opintojen_rahoitus
								FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus_aikajakso] 
								WHERE tila='lasna'
							) sa2 on sa2.opiskeluoikeus_oid=sa1.opiskeluoikeus_oid and DATEDIFF(DAY,sa2.loppu,sa1.tila_alkanut)=1
							WHERE tila = 'loma' 
							GROUP BY sa1.opiskeluoikeus_oid,tila,tila_alkanut,COALESCE(sa2.opintojen_rahoitus,sa1.opintojen_rahoitus),majoitus,sisaoppilaitosmainen_majoitus,vaativan_erityisen_tuen_yhteydessa_jarjestettäva_majoitus,erityinen_tuki,vaativan_erityisen_tuen_erityinen_tehtava,hojks,vaikeasti_vammainen,vammainen_ja_avustaja,COALESCE(sa2.osa_aikaisuus,sa1.osa_aikaisuus),opiskeluvalmiuksia_tukevat_opinnot,vankilaopetuksessa,oppisopimus_jossain_paatason_suorituksessa

							UNION ALL

							SELECT 
								 sa1.opiskeluoikeus_oid
								,tila
								,alku
								,sa1.loppu
								,COALESCE(sa1.opintojen_rahoitus,sa2.opintojen_rahoitus)
								,majoitus
								,sisaoppilaitosmainen_majoitus
								,vaativan_erityisen_tuen_yhteydessa_jarjestettäva_majoitus
								,erityinen_tuki
								,vaativan_erityisen_tuen_erityinen_tehtava
								,hojks
								,vaikeasti_vammainen
								,vammainen_ja_avustaja
								,sa1.osa_aikaisuus
								,opiskeluvalmiuksia_tukevat_opinnot
								,vankilaopetuksessa
								,oppisopimus_jossain_paatason_suorituksessa
							FROM Koski_SA.[sa].[sa_koski_opiskeluoikeus_aikajakso] sa1
							LEFT JOIN (--valmistumisen rahoitus otetaan edellisestä läsnäolojaksosta
								SELECT 
									 opiskeluoikeus_oid
									,loppu
									,opintojen_rahoitus
								FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus_aikajakso] 
								WHERE tila='lasna'
							) sa2 on sa2.opiskeluoikeus_oid=sa1.opiskeluoikeus_oid and DATEDIFF(DAY,sa2.loppu,sa1.tila_alkanut)=1
							WHERE tila in ('lasna','valmistunut')
					) k WHERE ((@date between alku and loppu) OR (MONTH(@date) = MONTH(alku) AND YEAR(@date) = YEAR(alku)))	
		) ooa ON ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid

		LEFT JOIN ( --yhteen aikajaksoon voi liittyä monta päätason suoritusta, otetaan vain yksi
			SELECT 
				 a.opiskeluoikeus_oid
				,a.suorituksen_tyyppi
				,a.koulutusmoduuli_koodiarvo
				,a.tutkinto_koodiarvo
				,a.osaamisala_koodiarvo
				,a.rnk 
			FROM 
			(
				SELECT DISTINCT 
					 opiskeluoikeus_oid
					,suorituksen_tyyppi
					,koulutusmoduuli_koodiarvo
					,tutkinto_koodiarvo
					,osaamisala_koodiarvo
					,RANK() OVER (PARTITION BY opiskeluoikeus_oid ORDER BY suorituksen_tyyppi,osaamisala_koodiarvo,koulutusmoduuli_koodiarvo) as rnk 
				FROM [Koski_SA].sa.sa_koski_paatason_suoritus
			) a  WHERE a.rnk = 1) ps ON ps.opiskeluoikeus_oid=ooa.opiskeluoikeus_oid

		LEFT JOIN [Koski_SA].[sa].[sa_koski_henkilo] h ON h.oppija_oid = oo.oppija_oid
		LEFT JOIN [dw].[d_koulutusluokitus] k ON k.koulutusluokitus_koodi = COALESCE(NULLIF(ps.koulutusmoduuli_koodiarvo,'999904'), ps.tutkinto_koodiarvo)
		 --uusi joinaus koulutusluokitukseen, 3-alkuiset erikoisammattitutkintokoodit muutetaan 4-alkuisiksi
		LEFT JOIN [dw].[d_koulutusluokitus] k2 ON k2.koulutusluokitus_koodi=(CASE WHEN k.koulutusluokitus_koodi like '3%' and k.koulutusluokitus_fi like '%erikoisammattitutkinto%' THEN '4' + RIGHT(k.koulutusluokitus_koodi,LEN(k.koulutusluokitus_koodi)-1) ELSE k.koulutusluokitus_koodi END)
		LEFT JOIN [sa].[sa_amos_osaamisala_kustannusryhma] okr ON okr.osaamisala_koodi = ps.osaamisala_koodiarvo
		LEFT JOIN [sa].[sa_amos_tutkinto_kustannusryhma] tkr ON tkr.tutkinto_koodi = k2.koulutusluokitus_koodi
		WHERE oo.koulutusmuoto = 'ammatillinenkoulutus' and oo.sisaltyy_opiskeluoikeuteen_oid is null

	) q

	LEFT JOIN d_kalenteri d1 ON d1.kalenteri_avain=q.tilv_date
	LEFT JOIN d_sukupuoli d2 ON d2.sukupuoli_koodi=q.sukupuoli
	LEFT JOIN d_kieli d3 ON d3.kieli_koodi=q.aidinkieli
	LEFT JOIN d_ika d4 ON d4.ika_avain=q.ika
	LEFT JOIN d_erityisopetus d5 ON d5.erityisopetus_koodi=q.erityisopetus
	LEFT JOIN d_majoitus d6 ON d6.majoitus_koodi=q.majoitus
	LEFT JOIN d_kytkin d7 ON d7.kytkin_koodi=q.oppis
	LEFT JOIN d_kytkin d8 ON d8.kytkin_koodi=q.vankilaopetus
	LEFT JOIN d_kytkin d9 ON d9.kytkin_koodi=q.henkilostokoulutus
	LEFT JOIN d_kytkin d10 ON d10.kytkin_koodi=q.tyovoimakoulutus
	LEFT JOIN d_koulutusluokitus d11 ON d11.koulutusluokitus_koodi=q.koulk
	LEFT JOIN d_organisaatioluokitus d12 ON d12.organisaatio_oid=q.tunn
	LEFT JOIN d_organisaatioluokitus d13 ON d13.organisaatio_oid=q.jarj
	LEFT JOIN d_suorituksen_tyyppi d14 ON d14.koodi=q.suorituksen_tyyppi
	LEFT JOIN d_ammatillisen_tutkinnon_kustannusryhma d15 ON d15.koodi=q.kustannusryhma
	LEFT JOIN d_opintojenrahoitus d16 ON d16.koodi=q.opintojen_rahoitus

	GROUP BY 
	tilv
	,COALESCE(d1.id,-1)
	,COALESCE(d2.id,-1)
	,COALESCE(d3.id,-1)
	,COALESCE(d4.id,-1)
	,COALESCE(osa_aikaisuus,-1)
	,COALESCE(d5.id,-1)
	,COALESCE(d6.id,-1)
	,COALESCE(d7.id,-1)
	,COALESCE(d8.id,-1)
	,COALESCE(d9.id,-1)
	,COALESCE(d10.id,-1)
	,COALESCE(d11.id,-1)
	,COALESCE(d12.id,-1)
	,COALESCE(d13.id,-1)
	,COALESCE(d14.id,-1)
	,COALESCE(d15.id,-1)
	,COALESCE(d16.id,-1)

	HAVING (SUM(q.opiskelijavuosi_pv_lasna)/*-SUM(opiskelijavuosi_pv_loma)*/) > 0.000

	SET @date = DATEADD(MONTH,1,@date)

END

