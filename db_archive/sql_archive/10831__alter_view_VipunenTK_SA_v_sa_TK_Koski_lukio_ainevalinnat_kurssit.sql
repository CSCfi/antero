USE [VipunenTK_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dbo].[v_sa_TK_Koski_lukio_ainevalinnat_kurssit] AS

SELECT 
	[tilastovuosi]
    ,[lukuvuosi]
    ,[lukukausi]
    ,[paatason_suoritus_id] = cast(tilastovuosi as varchar(4)) + '_' + cast(paatason_suoritus_id as varchar(10))
    ,[ops_voimaantulo]
    ,[lukionoppimaara]
    ,[lukionoppimaara_suorituskieli]
    ,[katsomusaine_suoritettu_1_0]
    ,[toimipiste_oid]
    ,[oppilaitos_oid]
    ,[koulutustoimija_oid]
    ,[sukupuoli]
    ,[ylempi_osasuoritus_id]
    ,[aine_koodisto]
    ,[aine]
    ,[aine_suorituskieli]
    ,[aineenoppimaara_koodisto]
    ,[aineenoppimaara]
    ,[katsomusaineen_oppimaara_koodisto]
    ,[katsomusaineen_oppimaara]
    ,[kurssi_koodisto]
    ,[kurssi]
    ,[kurssi_paikallinen_OPS_0_1]
    ,[kurssi_pakollinen_0_1]
    ,[kurssi_tyyppi]
    ,[kurssi_suorituskieli]
    ,[kurssi_arvosana]
    ,[lkm] 
	  
FROM (

	SELECT 
		[tilastovuosi]
		,[lukuvuosi]
		,[lukukausi]
		,[paatason_suoritus_id]
		,[ops_voimaantulo]
		,[lukionoppimaara]
		,[lukionoppimaara_suorituskieli]
		,[katsomusaine_suoritettu_1_0]
		,[toimipiste_oid]
		,[oppilaitos_oid]
		,[koulutustoimija_oid]
		,[sukupuoli]
		,[ylempi_osasuoritus_id]
		,[aine_koodisto]
		,[aine]
		,[aine_suorituskieli]
		,[aineenoppimaara_koodisto]
		,[aineenoppimaara]
		,[katsomusaineen_oppimaara_koodisto]
		,[katsomusaineen_oppimaara]
		,[kurssi_koodisto]
		,[kurssi]
		,[kurssi_paikallinen_OPS_0_1]
		,[kurssi_pakollinen_0_1]
		,[kurssi_tyyppi]
		,[kurssi_suorituskieli]
		,[kurssi_arvosana]
		,[lkm] 
	FROM VipunenTK_SA.dbo.TK_Koski_lukio_ainevalinnat_kurssit_2024

	UNION ALL

	SELECT 
		[tilastovuosi]
		,[lukuvuosi]
		,[lukukausi]
		,[paatason_suoritus_id]
		,[ops_voimaantulo]
		,[lukionoppimaara]
		,[lukionoppimaara_suorituskieli]
		,[katsomusaine_suoritettu_1_0]
		,[toimipiste_oid]
		,[oppilaitos_oid]
		,[koulutustoimija_oid]
		,[sukupuoli]
		,[ylempi_osasuoritus_id]
		,[aine_koodisto]
		,[aine] = case when [aine] in ('KT','ET') and [aine_koodisto] = 'koskioppiaineetyleissivistava' then 'KT/ET' else [aine] end
		,[aine_suorituskieli]
		,[aineenoppimaara_koodisto]
		,[aineenoppimaara] = case when [aineenoppimaara] in ('KT','ET') and [aineenoppimaara_koodisto] = 'koskioppiaineetyleissivistava' then 'KT/ET' else [aineenoppimaara] end
		,[katsomusaineen_oppimaara_koodisto]
		,[katsomusaineen_oppimaara]
		,[kurssi_koodisto]
		,[kurssi]
		,[kurssi_paikallinen_OPS_0_1]
		,[kurssi_pakollinen_0_1]
		,[kurssi_tyyppi]
		,[kurssi_suorituskieli]
		,[kurssi_arvosana]
		,[lkm] 
	FROM VipunenTK_SA.dbo.TK_Koski_lukio_ainevalinnat_kurssit_2023

	UNION ALL

	SELECT 
		[tilastovuosi]
		,[lukuvuosi]
		,[lukukausi]
		,[paatason_suoritus_id]
		,[ops_voimaantulo]
		,[lukionoppimaara]
		,[lukionoppimaara_suorituskieli]
		,[katsomusaine_suoritettu_1_0]
		,[toimipiste_oid]
		,[oppilaitos_oid]
		,[koulutustoimija_oid]
		,[sukupuoli]
		,[ylempi_osasuoritus_id]
		,[aine_koodisto]
		,[aine] = case when [aine] in ('KT','ET') and [aine_koodisto] = 'koskioppiaineetyleissivistava' then 'KT/ET' else [aine] end
		,[aine_suorituskieli]
		,[aineenoppimaara_koodisto]
		,[aineenoppimaara] = case when [aineenoppimaara] in ('KT','ET') and [aineenoppimaara_koodisto] = 'koskioppiaineetyleissivistava' then 'KT/ET' else [aineenoppimaara] end
		,[katsomusaineen_oppimaara_koodisto]
		,[katsomusaineen_oppimaara]
		,[kurssi_koodisto]
		,[kurssi]
		,[kurssi_paikallinen_OPS_0_1]
		,[kurssi_pakollinen_0_1]
		,[kurssi_tyyppi]
		,[kurssi_suorituskieli]
		,[kurssi_arvosana]
		,[lkm] 
	FROM VipunenTK_SA.dbo.TK_Koski_lukio_ainevalinnat_kurssit_2022

	UNION ALL

	SELECT 
		[tilastovuosi]
		,[lukuvuosi]
		,[lukukausi]
		,[paatason_suoritus_id]
		,[ops_voimaantulo]
		,[lukionoppimaara]
		,[lukionoppimaara_suorituskieli]
		,[katsomusaine_suoritettu_1_0]
		,[toimipiste_oid]
		,[oppilaitos_oid]
		,[koulutustoimija_oid]
		,[sukupuoli]
		,[ylempi_osasuoritus_id]
		,[aine_koodisto]
		,[aine] = case when [aine] in ('KT','ET') and [aine_koodisto] = 'koskioppiaineetyleissivistava' then 'KT/ET' else [aine] end
		,[aine_suorituskieli]
		,[aineenoppimaara_koodisto]
		,[aineenoppimaara] = case when [aineenoppimaara] in ('KT','ET') and [aineenoppimaara_koodisto] = 'koskioppiaineetyleissivistava' then 'KT/ET' else [aineenoppimaara] end
		,[katsomusaineen_oppimaara_koodisto]
		,[katsomusaineen_oppimaara]
		,[kurssi_koodisto]
		,[kurssi]
		,[kurssi_paikallinen_OPS_0_1]
		,[kurssi_pakollinen_0_1]
		,[kurssi_tyyppi]
		,[kurssi_suorituskieli]
		,[kurssi_arvosana]
		,[lkm] 
	FROM VipunenTK_SA.dbo.TK_Koski_lukio_ainevalinnat_kurssit_2021

	UNION ALL

	SELECT 
		[tilastovuosi]
		,[lukuvuosi]
		,[lukukausi]
		,[paatason_suoritus_id]
		,[ops_voimaantulo]
		,[lukionoppimaara]
		,[lukionoppimaara_suorituskieli]
		,[katsomusaine_suoritettu_1_0]
		,[toimipiste_oid]
		,[oppilaitos_oid]
		,[koulutustoimija_oid]
		,[sukupuoli]
		,[ylempi_osasuoritus_id]
		,[aine_koodisto]
		,[aine] = case when [aine] in ('KT','ET') and [aine_koodisto] = 'koskioppiaineetyleissivistava' then 'KT/ET' else [aine] end
		,[aine_suorituskieli]
		,[aineenoppimaara_koodisto]
		,[aineenoppimaara] = case when [aineenoppimaara] in ('KT','ET') and [aineenoppimaara_koodisto] = 'koskioppiaineetyleissivistava' then 'KT/ET' else [aineenoppimaara] end
		,[katsomusaineen_oppimaara_koodisto]
		,[katsomusaineen_oppimaara]
		,[kurssi_koodisto]
		,[kurssi]
		,[kurssi_paikallinen_OPS_0_1]
		,[kurssi_pakollinen_0_1]
		,[kurssi_tyyppi]
		,[kurssi_suorituskieli]
		,[kurssi_arvosana]
		,[lkm] 
	FROM VipunenTK_SA.dbo.TK_Koski_lukio_ainevalinnat_kurssit_2020

) kaikki

GO
