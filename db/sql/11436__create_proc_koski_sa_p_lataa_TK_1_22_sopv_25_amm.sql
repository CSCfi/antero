USE [Koski_SA]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_TK_1_22_sopv_24_amm]    Script Date: 1.12.2025 18.17.13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROC [sa].[p_lataa_TK_1_22_sopv_25_amm] AS

--1.12.2025 / JS: sopv25 jätetty samanaikaisen tuvan liputuksen muodostus pois, koska ei nähtävästi käytetty sopv24 aineistoon; poimittu testin jäädytyksestä
--10.5.2024 / JS: sopv24 poimintaan lisätty samanaikaisen TUVA-opiskelun liputus (jos päällekkäisyyttä joka kuukautena tilastovuonna) mahdollista poistoa varten.
--5.5.2023 / JS: sopv23 poimintaan lisätty alkamisajankohta, jos halutaan käyttää karsittaessa tuplia, sekä päivitetty rajauksen tilastovuosi ja poistettu hetu.
--5.4.2022 / JS: Huom. Aineistoon huomioitaneen oppija vain kerran per "koulutus", joten mahdollisessa sopv23 poiminnasta ehkä poistetaan ainakin opiskeluoikeus alta.
--23.3.2022 / JS: Poiminta osaksi jatkuvan oppimisen TK-aineistoa 1.22, uudet opiskelijat ammatillisen koulutuksen Koski-raportoinnin pohjalta.

SELECT DISTINCT
	tilv = tilastovuosi_fi 
	,oppija_oid = apusarake_oppija_oid --sisältönä master-oid sopv25-
	,opiskeluoikeus_oid = apusarake_opiskeluoikeus_oid
	,opiskeluoikeuden_alkamisajankohta
	,suorituksen_tyyppi = case when suorituksen_tyyppi_fi = 'Tutkinnon osaa pienempi kokonaisuus' then suorituksen_tyyppi_fi else tutkintotyypin_ryhma_fi end 
	,tyov = case when left(tyovoimakoulutus_fi,2) = 'Ei' or tyovoimakoulutus_fi = 'Tieto puuttuu' then 2 else 1 end
	,syntymaaika 
	,sukupuoli 
	,aidinkieli 
	,kansalaisuus = left(kansalaisuus,3)
	--,paallekkainen_tuva = min(v.samanaikainen_tuva) over(partition by apusarake_opiskeluoikeus_oid)

	--meta, ei poimintaan
	,source = '[ANTERO].[dw].[v_koski_amm_opiskelijat_ja_tutkinnot_cultures_TK_1_22_sopv_25_amm]'
	,loadtime = getdate()
	,username = suser_sname()

INTO [sa].[TK_1_22_sopv_25_amm] --HUOM. vaihda vuosi

FROM [ANTERO_02102025].[dw].[v_koski_amm_opiskelijat_ja_tutkinnot_cultures] v --HUOM. vaihda vuosi
LEFT JOIN sa.sa_koski_henkilo_master h on h.master_oid = v.apusarake_oppija_oid 

WHERE 1=1 
AND apusarake_uusi_opiskelija = 1 
AND tilastovuosi_fi = 2024 --HUOM. vaihda vuosi
AND (suorituksen_tyyppi_fi = 'Tutkinnon osaa pienempi kokonaisuus' OR tutkintotyypin_ryhma_fi in ('Muu ammatillinen koulutus', 'Valmentava koulutus'))

ORDER BY apusarake_oppija_oid, opiskeluoikeuden_alkamisajankohta, apusarake_opiskeluoikeus_oid

GO
