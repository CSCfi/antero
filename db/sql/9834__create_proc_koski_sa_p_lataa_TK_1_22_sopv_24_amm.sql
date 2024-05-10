USE [Koski_SA]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_TK_1_22_sopv_24_amm]    Script Date: 10.5.2024 18:09:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROC [sa].[p_lataa_TK_1_22_sopv_24_amm] AS

--23.3.2022 / JS: Poiminta osaksi jatkuvan oppimisen TK-aineistoa 1.22, uudet opiskelijat ammatillisen koulutuksen Koski-raportoinnin pohjalta.
--5.4.2022 / JS: Huom. Aineistoon huomioitaneen oppija vain kerran per "koulutus", joten mahdollisessa sopv23 poiminnasta ehkä poistetaan ainakin opiskeluoikeus alta.
--5.5.2023 / JS: sopv23 poimintaan lisätty alkamisajankohta, jos halutaan käyttää karsittaessa tuplia, sekä päivitetty rajauksen tilastovuosi ja poistettu hetu.
--10.5.2024 / JS: sopv24 poimintaan lisätty samanaikaisen TUVA-opiskelun liputus (jos päällekkäisyyttä joka kuukautena tilastovuonna) mahdollista poistoa varten.

DROP TABLE IF EXISTS [sa].[TK_1_22_sopv_24_amm]

SELECT DISTINCT
	tilv = tilastovuosi_fi 
	,oppija_oid = apusarake_oppija_oid 
	,opiskeluoikeus_oid = apusarake_opiskeluoikeus_oid
	,opiskeluoikeuden_alkamisajankohta
	,suorituksen_tyyppi = case when suorituksen_tyyppi_fi = 'Tutkinnon osaa pienempi kokonaisuus' then suorituksen_tyyppi_fi else tutkintotyypin_ryhma_fi end 
	,tyov = case tyovoimakoulutus_fi when 'Kyllä' then 1 when 'Ei' then 2 end
	,syntymaaika 
	,sukupuoli 
	,aidinkieli 
	,kansalaisuus = left(kansalaisuus,3)
	,paallekkainen_tuva = min(v.samanaikainen_tuva) over(partition by apusarake_opiskeluoikeus_oid)

	--meta, ei poimintaan
	,source = '[ANTERO].[dw].[v_koski_amm_opiskelijat_ja_tutkinnot_cultures_TK_1_22_sopv_24_amm]'
	,loadtime = getdate()
	,username = suser_sname()

INTO [sa].[TK_1_22_sopv_24_amm] 

FROM [ANTERO].[dw].[v_koski_amm_opiskelijat_ja_tutkinnot_cultures_TK_1_22_sopv_24_amm] v 
LEFT JOIN sa.sa_koski_henkilo h on h.oppija_oid = v.apusarake_oppija_oid 

WHERE 1=1 
--AND apusarake_ryhma = 'opiskelijat' 
AND uusi = 1 --AND apusarake_uusi_opiskelija = 1 
AND tilastovuosi_fi = 2023
AND (suorituksen_tyyppi_fi = 'Tutkinnon osaa pienempi kokonaisuus' OR tutkintotyypin_ryhma_fi in ('Muu ammatillinen koulutus', 'Valmentava koulutus'))

ORDER BY apusarake_oppija_oid, opiskeluoikeuden_alkamisajankohta, apusarake_opiskeluoikeus_oid

GO
