USE [Koski_SA]
GO

/****** Object:  View [dw].[v_koski_amm_opiskelijat_ja_tutkinnot_cultures]    Script Date: 23.3.2022 12:42:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROC [sa].[p_lataa_TK_1_22_sopv_22_amm] AS

--Poiminta osaksi jatkuvan oppimisen TK-aineistoa 1.22, uudet opiskelijat ammatillisen koulutuksen Koski-raportoinnin pohjalta. JS 23.3.2022

--tilv
--oppija_oid
--opiskeluoikeus_oid (ei pyydetty, mutta tulkitaan alustavasti ereiksi; huom. distinct)
--suorituksen_tyyppi
--tyov
--
--hetu
--syntymaaika
--sukupuoli
--aidinkieli
--kansalaisuus

DROP TABLE IF EXISTS [sa].[TK_1_22_sopv_22_amm]

SELECT DISTINCT 
tilv = tilastovuosi_fi 
,oppija_oid = apusarake_oppija_oid 
,opiskeluoikeus_oid = apusarake_opiskeluoikeus_oid
,suorituksen_tyyppi = case when suorituksen_tyyppi_fi = 'Tutkinnon osaa pienempi kokonaisuus' then suorituksen_tyyppi_fi else tutkintotyypin_ryhma_fi end 
,tyov = case tyovoimakoulutus_fi when 'Kyllä' then 1 when 'Ei' then 2 end
--hlö
,hetu 
,syntymaaika 
,sukupuoli 
,aidinkieli 
,kansalaisuus = left(kansalaisuus,3) 
--meta, ei poimintaan
,source = '[ANTERO].[dw].[v_koski_amm_opiskelijat_ja_tutkinnot_cultures]'
,loadtime = getdate()
,username = suser_sname()

INTO [sa].[TK_1_22_sopv_22_amm] 

FROM [ANTERO].[dw].[v_koski_amm_opiskelijat_ja_tutkinnot_cultures] v 
LEFT JOIN sa.sa_koski_henkilo h on h.oppija_oid = v.apusarake_oppija_oid 

WHERE 1=1 
AND apusarake_ryhma = 'opiskelijat' 
AND apusarake_uusi_opiskelija = 1 
AND tilastovuosi_fi in (2020,2021) 
AND (suorituksen_tyyppi_fi = 'Tutkinnon osaa pienempi kokonaisuus' OR tutkintotyypin_ryhma_fi IN ('Muu ammatillinen koulutus', 'Valmentava koulutus'))

ORDER BY tilastovuosi_fi desc, apusarake_oppija_oid

GO


