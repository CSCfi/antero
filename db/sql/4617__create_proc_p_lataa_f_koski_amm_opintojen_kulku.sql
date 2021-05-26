USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_amm_opintojen_kulku]    Script Date: 26.5.2021 8:30:06 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_koski_amm_opintojen_kulku]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_amm_opintojen_kulku]    Script Date: 26.5.2021 8:30:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO













CREATE PROCEDURE [dw].[p_lataa_f_koski_amm_opintojen_kulku] AS




DROP TABLE IF EXISTS ANTERO.dw.f_koski_amm_opintojen_kulku

SELECT DISTINCT

     q.[kohortti_vp]
	 ,q.kohortti_fi
	 ,q.oppija_oid
	 ,aloitusvuosi = LEFT(q.kohortti_vp, 4)
	 ,aloitusvuosipuolisko = 
		CASE WHEN RIGHT(q.kohortti_vp, 1) = 1 THEN '1. vuosipuolisko'
			WHEN RIGHT(q.kohortti_vp, 1) = 2 THEN '2. vuosipuolisko' END

      ,peruskoulu_keskiarvo = COALESCE(peruskoulu_keskiarvo, NULL)
      ,peruskoulu_keskiarvo_lukuaineet = COALESCE(peruskoulu_keskiarvo_lukuaineet, NULL)
      ,peruskoulu_keskiarvo_kategoria = COALESCE(peruskoulu_keskiarvo_kategoria, 'Tieto puuttuu')
      ,jarj_peruskoulu_keskiarvo_kategoria = COALESCE(jarj_peruskoulu_keskiarvo_kategoria, 99)
      ,peruskoulu_keskiarvo_lukuaineet_kategoria = COALESCE(peruskoulu_keskiarvo_lukuaineet_kategoria, 'Tieto puuttuu')
      ,jarj_peruskoulu_keskiarvo_lukuaineet_kategoria = COALESCE(jarj_peruskoulu_keskiarvo_lukuaineet_kategoria, 99)
      ,peruskoulu_keskiarvo_kvintiili = COALESCE(keskiarvo_kvintiili, 'Tieto puuttuu')
      ,jarj_keskiarvo_kvintiili = COALESCE(jarj_keskiarvo_kvintiili, 9)
      ,peruskoulu_keskiarvo_lukuaineet_kvintiili = COALESCE(keskiarvo_lukuaineet_kvintiili, 'Tieto puuttuu')
      ,jarj_keskiarvo_lukuaineet_kvintiili = COALESCE(jarj_keskiarvo_lukuaineet_kvintiili, 9)

	,erityisopetus_jossain = A_erityisopetus_jossain
	,d_sukupuoli_id = COALESCE(d2.id,-1)
	,d_kieli_aidinkieli_id = COALESCE(d3.id,-1)
	,d_ika_id = COALESCE(d4.id,-1)
	,d_maatjavaltiot2_kansalaisuus_id = COALESCE(d20.id,-1)
	,da_koulutusluokitus_id = COALESCE(d11a.id,-1)
	,da_organisaatioluokitus_oppilaitos_id = COALESCE(d12a.id,-1)
	,da_organisaatioluokitus_jarj_id = COALESCE(d13a.id,-1)
	,da_suorituksen_tyyppi_id = COALESCE(d14a.id,-1)
	,da_opintojenrahoitus_id = COALESCE(d16a.id,-1)
	,da_osaamisala_id = COALESCE(d17a.id,-1)
	,da_kieli_suorituskieli_id = COALESCE(d21a.id, -1)
	,da_kytkin_muu_ammatillinen_id = COALESCE(d22a.id, -1)
	,d_erityisopetus_id = COALESCE(d5.id,-1)

	,db_koulutusluokitus_id = COALESCE(d11b.id,-1)
	,db_organisaatioluokitus_oppilaitos_id = COALESCE(d12b.id,-1)
	,db_organisaatioluokitus_jarj_id = COALESCE(d13b.id,-1)
	,db_suorituksen_tyyppi_id = COALESCE(d14b.id,-1)
--	,db_opintojenrahoitus_id = COALESCE(d16b.id,-1)
	,db_osaamisala_id = COALESCE(d17b.id,-1)
	,db_kieli_suorituskieli_id = COALESCE(d21b.id, -1)
	,db_kytkin_muu_ammatillinen_id = COALESCE(d22b.id, -1)
	,A_erityisopetus_jossain
	,A_sukupuolivaltaisuus = COALESCE(d23a.sukupuolivaltaisuus, 'Tuntematon')
	,A_jarj_sukupuolivaltaisuus = COALESCE(d23a.jarj_sukupuolivaltaisuus, 9)
	,B_sukupuolivaltaisuus = COALESCE(d23b.sukupuolivaltaisuus, 'Tuntematon')
	,B_jarj_sukupuolivaltaisuus = COALESCE(d23b.jarj_sukupuolivaltaisuus, 9)
      ,[A_lopputulema]
	  ,jarj_a_lopputulema =
		CASE
			WHEN A_lopputulema = 'Koulutus kesken' THEN 1
			WHEN A_lopputulema = 'Eronnut' THEN 3
			WHEN A_lopputulema = 'Valmistunut' THEN 2
			ELSE 99 END
      ,[A_taso1]
	  ,jarj_a_tilanne =
		CASE
			WHEN A_taso1 = 'Koulutus kesken' THEN 1
			WHEN A_taso1 = 'Eronnut' THEN 3
			WHEN A_taso1 = 'Valmistunut' THEN 2
			ELSE 99 END
      ,[B_lopputulema]
	  ,jarj_b_lopputulema =
		CASE
			WHEN B_lopputulema = 'Koulutus kesken' THEN 1
			WHEN B_lopputulema = 'Eronnut' THEN 3
			WHEN B_lopputulema = 'Valmistunut' THEN 2
			ELSE 99 END
      ,[B_taso1]
      ,q.[sarja]
	  ,CASE WHEN B_opiskeluoikeus_oid IS NULL THEN 'Ei'
		ELSE 'Kyllä'
		END
		AS uusi_koulutus_olemassa

	  ,CASE 
		WHEN B_lopputulema = 'Ei uutta koulutusta' THEN NULL
		WHEN DATEDIFF(D, A_paattymispaiva, B_alkamispaiva) < -1000 THEN NULL
		ELSE DATEDIFF(D, A_paattymispaiva, B_alkamispaiva)
		END
		AS aikaero_AB
	  ,CASE 
		WHEN B_lopputulema = 'Ei uutta koulutusta' THEN 0
		WHEN DATEDIFF(D, A_paattymispaiva, B_alkamispaiva) < -1000 THEN 1
		ELSE 0
		END
		AS aikaero_AB_virhe
	  ,CASE 
		WHEN B_lopputulema = 'Ei uutta koulutusta' THEN 'Ei uutta koulutusta'
		WHEN DATEDIFF(D, A_paattymispaiva, B_alkamispaiva) < 0 THEN 'Kyllä'
		ELSE 'Ei'
		END
		AS uusi_alkanut_ennen_paattymista
	  ,CASE 
		WHEN B_lopputulema = 'Ei uutta koulutusta' THEN 'Ei uutta koulutusta'
		WHEN DATEDIFF(D, A_paattymispaiva, B_alkamispaiva) < -10 THEN 'Kyllä'
		ELSE 'Ei'
		END
		AS uusi_alkanut_ennen_paattymista_toleranssi
	  ,CASE
		WHEN A_lopputulema = 'Koulutus kesken' THEN NULL
		ELSE DATEDIFF(D, A_alkamispaiva, A_paattymispaiva)
		END AS A_koulutuksen_kesto
	  ,CASE
		WHEN B_opiskeluoikeus_oid IS NULL THEN 'Ei uutta koulutusta'
		WHEN B_tutkinto_koodi IS NULL OR A_tutkinto_koodi IS NULL THEN 'Tuntematon'
		WHEN B_tutkinto_koodi = A_tutkinto_koodi THEN 'Sama tutkinto'
		WHEN B_tutkinto_koodi != A_tutkinto_koodi THEN 'Eri tutkinto'
		END
		AS muutos_tutkinto
	  ,CASE
		WHEN B_opiskeluoikeus_oid IS NULL THEN 'Ei uutta koulutusta'
		WHEN B_osaamisala_koodiarvo IS NULL THEN 'Ei uutta osaamisalaa'
		WHEN A_osaamisala_koodiarvo IS NULL THEN 'Ei alkup. osaamisalaa'
		WHEN B_osaamisala_koodiarvo = A_osaamisala_koodiarvo THEN 'Sama osaamisala'
		WHEN B_osaamisala_koodiarvo != A_osaamisala_koodiarvo THEN 'Eri osaamisala'
		END
		AS muutos_osaamisala
	  ,CASE
		WHEN B_opiskeluoikeus_oid IS NULL THEN 'Ei uutta koulutusta'
		WHEN B_tutkinto_koodi = A_tutkinto_koodi 
			AND A_suorituksen_tyyppi = B_suorituksen_tyyppi THEN 'Sama tavoite'
		WHEN B_tutkinto_koodi = A_tutkinto_koodi 
			AND A_suorituksen_tyyppi != B_suorituksen_tyyppi THEN 'Eri tavoite'
		END
		AS muutos_tavoite
	  ,muutos_koulutustoimija =
		CASE
			WHEN B_opiskeluoikeus_oid IS NULL THEN 'Ei uutta koulutusta'
			WHEN A_koulutustoimija_oid = B_koulutustoimija_oid THEN 'Sama koulutuksen järjestäjä'
			WHEN A_koulutustoimija_oid != B_koulutustoimija_oid THEN 'Eri koulutuksen järjestäjä'
			ELSE 'Tieto puuttuu' END
	  ,paivat_lasna = COALESCE(paivat_lasna, 0)
	  ,paivat_koulutussopimus = COALESCE(paivat_koulutussopimus,0)
	  ,paivat_oppisopimus = COALESCE(paivat_oppisopimus, 0)
--      ,osaamispisteet_per_sarja = COALESCE(osaamispisteet_per_sarja, 0)
 --     ,osaamispisteet_kum = COALESCE(osaamispisteet_kum, 0)
	  ,ero_ajankohta_kk
	  ,CASE WHEN eroaminen_tapahtunut = 1 THEN 1 ELSE 0 END AS eroaminen_tapahtunut
	  ,CASE WHEN valmistuminen_tapahtunut = 1 THEN 1 ELSE 0 END AS valmistuminen_tapahtunut
	  ,kohortin_koko
	  ,priorisoitu_tilanne = case when A_taso1 = 'Koulutus kesken' THEN 'Jatkaa alkuperäisessä tutkinnossa' ELSE COALESCE(priorisoitu_tilanne, 'Keskeyttänyt ammatillisen koulutuksen') END
	  ,priorisoitu_tilanne_koodi = case when A_taso1 = 'Koulutus kesken' THEN 3 ELSE  COALESCE(priorisoitu_tilanne_koodi, '8') END
	  ,vaihtanut_jarjestajaa = 
		CASE
			WHEN A_taso1 = 'Koulutus kesken' THEN 'Sama koulutuksen järjestäjä'
			WHEN vaihtanut_jarjestajaa IS NULL OR priorisoitu_tilanne_koodi = 8 THEN 'Tieto puuttuu'
			WHEN vaihtanut_jarjestajaa = 0 THEN 'Sama koulutuksen järjestäjä'
			WHEN vaihtanut_jarjestajaa = 1 THEN 'Eri koulutuksen järjestäjä'
			ELSE 'Tieto puuttuu' END
	  ,jarj_vaihtanut_jarjestajaa =
		CASE
			WHEN A_taso1 = 'Koulutus kesken' THEN 0
			WHEN vaihtanut_jarjestajaa IS NULL OR priorisoitu_tilanne_koodi = 8 THEN 9
			WHEN vaihtanut_jarjestajaa = 0 THEN 0
			WHEN vaihtanut_jarjestajaa = 1 THEN 1
			ELSE 9 END
	  ,loadtime = GETDATE()
INTO ANTERO.dw.f_koski_amm_opintojen_kulku
  FROM [Koski_SA].[sa].[temp_amm_kesk_koottu] q
  LEFT JOIN ANTERO.dw.d_sukupuoli d2 ON d2.sukupuoli_koodi = q.sukupuoli
  LEFT JOIN ANTERO.dw.d_kieli d3 ON d3.kieli_koodi = q.aidinkieli
  LEFT JOIN ANTERO.dw.d_ika d4 ON d4.ika_avain = q.ika_aloittaessa
  LEFT JOIN ANTERO.dw.d_erityisopetus d5 ON d5.erityisopetus_koodi = q.A_erityisopetus
	LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d20 ON d20.maatjavaltiot2_koodi = q.kansalaisuus

	LEFT JOIN ANTERO.dw.d_koulutusluokitus d11a ON d11a.koulutusluokitus_koodi = q.A_tutkinto_koodi
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus d12a ON d12a.organisaatio_oid = q.A_oppilaitos_oid
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus d13a ON d13a.organisaatio_oid = q.A_koulutustoimija_oid
	LEFT JOIN ANTERO.dw.d_suorituksen_tyyppi d14a ON d14a.koodi = q.A_suorituksen_tyyppi_koodi
	LEFT JOIN ANTERO.dw.d_opintojenrahoitus d16a ON d16a.koodi = q.A_opintojen_rahoitus
	LEFT JOIN ANTERO.dw.d_osaamisala d17a ON d17a.koodi = q.A_osaamisala_koodiarvo
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus d18a ON d18a.organisaatio_oid = q.A_toimipiste_oid
	LEFT JOIN ANTERO.dw.d_kieli d21a ON d21a.kieli_koodi = q.A_suorituskieli_koodiarvo
	LEFT JOIN ANTERO.dw.d_kytkin d22a ON d22a.kytkin_koodi = q.A_muu_ammatillinen_koodi
	LEFT JOIN Koski_SA.sa.temp_amm_sukupuolivaltaisuus d23a ON d23a.tutkinto_koodi = q.A_tutkinto_koodi
	--LEFT JOIN Koski_SA.sa.temp_amm_osaamispisteet d24a 
	--	ON d24a.opiskeluoikeus_oid = q.A_opiskeluoikeus_oid
	--	AND d24a.sarja = q.sarja
	LEFT JOIN ANTERO.dw.d_koulutusluokitus d11b ON d11b.koulutusluokitus_koodi = q.B_tutkinto_koodi
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus d12b ON d12b.organisaatio_oid = q.B_oppilaitos_oid
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus d13b ON d13b.organisaatio_oid = q.B_koulutustoimija_oid
	LEFT JOIN ANTERO.dw.d_suorituksen_tyyppi d14b ON d14b.koodi = q.B_suorituksen_tyyppi_koodi
--	LEFT JOIN ANTERO.dw.d_opintojenrahoitus d16b ON d16b.koodi = q.B_opintojen_rahoitus
	LEFT JOIN ANTERO.dw.d_osaamisala d17b ON d17b.koodi = q.B_osaamisala_koodiarvo
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus d18b ON d18b.organisaatio_oid = q.B_toimipiste_oid
	LEFT JOIN ANTERO.dw.d_kieli d21b ON d21b.kieli_koodi = q.B_suorituskieli_koodiarvo
	LEFT JOIN ANTERO.dw.d_kytkin d22b ON d22b.kytkin_koodi = q.B_muu_ammatillinen_koodi
	LEFT JOIN Koski_SA.sa.temp_amm_sukupuolivaltaisuus d23b ON d23b.tutkinto_koodi = q.B_tutkinto_koodi
	LEFT JOIN Koski_SA.sa.temp_amm_kesk_keskiarvot d25 ON d25.oppija_oid = q.oppija_oid
	LEFT JOIN Koski_SA.sa.temp_amm_kesk_sopimusmuotoinen d26 
		ON d26.opiskeluoikeus_oid = q.A_opiskeluoikeus_oid
		AND d26.sarja = q.sarja
	LEFT JOIN Koski_SA.sa.temp_amm_kesk_priorisoitu_tilanne d27 
		ON q.oppija_oid = d27.oppija_oid 
		AND q.A_opiskeluoikeus_oid = d27.A_opiskeluoikeus_oid
		AND q.kohortti_vp = d27.kohortti_vp
		AND q.sarja = d27.sarja


DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_keskeytykset_kalenteri
DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_opisk_kohortti
DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_kesk_kierros1
DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_opisk_alkamispaivat
DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_opisk_paattymispaivat
DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_kesk_kierros2
DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_kesk_osaamispisteet
DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_kesk_sarja_kytkin
DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_sukupuolivaltaisuus
DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_kesk_sopimusmuotoinen
DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_kesk_koottu
DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_kesk_priorisoitu_tilanne








GO


USE ANTERO