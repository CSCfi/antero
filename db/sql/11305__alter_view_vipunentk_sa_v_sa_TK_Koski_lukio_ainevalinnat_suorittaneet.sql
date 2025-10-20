USE [VipunenTK_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dbo].[v_sa_TK_Koski_lukio_ainevalinnat_suorittaneet] AS

SELECT 
	[tilastovuosi]
	,lukuvuosi
	,lukukausi
    ,[paatason_suoritus_id] = cast(tilastovuosi as varchar(4)) + '_' + cast(paatason_suoritus_id as varchar(10))
	,ops_voimaantulo
    ,[lukionoppimaara]
    ,[lukionoppimaara_suorituskieli]
    ,[toimipiste_oid]
    ,[oppilaitos_oid]
    ,[koulutustoimija_oid]
    ,[sukupuoli]
    ,[ika]
    ,[aidinkieli]
    ,[kansalaisuus]
    ,[osasuoritus_id] = cast(tilastovuosi as varchar(4)) + '_' + cast(osasuoritus_id as varchar(15))
    ,[aine_koodisto]
    ,[aine]
    ,[aineenoppimaara_koodisto]
    ,[aineenoppimaara]
    ,[aine_suorituskieli]
    ,[aine_laajuus]
    ,[aine_laajuus_yksikko]
    ,[aine_laajuus_puuttuu_0_1]
    ,[aine_S_arvosana_0_1]
    ,[aine_arvosana]
    ,[aine_arviointi_hyvaksytty]
    ,[kielet_lkm]
    ,[kurssi_paikallinen_OPS_0_1]
    ,[kurssi_pakollinen_0_1]
    ,[kurssi_tyyppi]
    ,[kurssi_suorituskieli]
    ,[kurssit_laajuus]
    ,[kurssit_laajuus_all_suorituskieli]
    ,[kurssit_S_arvosanat_laajuus]

FROM (
	
	SELECT 
		[tilastovuosi]
		,lukuvuosi
		,lukukausi
		,[paatason_suoritus_id]
		,ops_voimaantulo
		,[lukionoppimaara]
		,[lukionoppimaara_suorituskieli]
		,[toimipiste_oid]
		,[oppilaitos_oid]
		,[koulutustoimija_oid]
		,[sukupuoli]
		,[ika]
		,[aidinkieli]
		,[kansalaisuus]
		,[osasuoritus_id]
		,[aine_koodisto]
		,[aine]
		,[aineenoppimaara_koodisto]
		,[aineenoppimaara]
		,[aine_suorituskieli]
		,[aine_laajuus]
		,[aine_laajuus_yksikko]
		,[aine_laajuus_puuttuu_0_1]
		,[aine_S_arvosana_0_1]
		,[aine_arvosana]
		,[aine_arviointi_hyvaksytty]
		,[kielet_lkm]
		,[kurssi_paikallinen_OPS_0_1]
		,[kurssi_pakollinen_0_1]
		,[kurssi_tyyppi]
		,[kurssi_suorituskieli]
		,[kurssit_laajuus]
		,[kurssit_laajuus_all_suorituskieli]
		,[kurssit_S_arvosanat_laajuus] 
	FROM dbo.TK_koski_lukio_ainevalinnat_suorittaneet_2025

	UNION ALL
	
	SELECT 
		[tilastovuosi]
		,lukuvuosi
		,lukukausi
		,[paatason_suoritus_id]
		,ops_voimaantulo
		,[lukionoppimaara]
		,[lukionoppimaara_suorituskieli]
		,[toimipiste_oid]
		,[oppilaitos_oid]
		,[koulutustoimija_oid]
		,[sukupuoli]
		,[ika]
		,[aidinkieli]
		,[kansalaisuus]
		,[osasuoritus_id]
		,[aine_koodisto]
		,[aine]
		,[aineenoppimaara_koodisto]
		,[aineenoppimaara]
		,[aine_suorituskieli]
		,[aine_laajuus]
		,[aine_laajuus_yksikko]
		,[aine_laajuus_puuttuu_0_1]
		,[aine_S_arvosana_0_1]
		,[aine_arvosana]
		,[aine_arviointi_hyvaksytty]
		,[kielet_lkm]
		,[kurssi_paikallinen_OPS_0_1]
		,[kurssi_pakollinen_0_1]
		,[kurssi_tyyppi]
		,[kurssi_suorituskieli]
		,[kurssit_laajuus]
		,[kurssit_laajuus_all_suorituskieli]
		,[kurssit_S_arvosanat_laajuus] 
	FROM dbo.TK_koski_lukio_ainevalinnat_suorittaneet_2024

	UNION ALL
	
	SELECT 
		[tilastovuosi]
		,lukuvuosi
		,lukukausi
		,[paatason_suoritus_id]
		,ops_voimaantulo
		,[lukionoppimaara]
		,[lukionoppimaara_suorituskieli]
		,[toimipiste_oid]
		,[oppilaitos_oid]
		,[koulutustoimija_oid]
		,[sukupuoli]
		,[ika]
		,[aidinkieli]
		,[kansalaisuus]
		,[osasuoritus_id]
		,[aine_koodisto]
		,[aine] = case when [aine] in ('KT','ET') and [aine_koodisto] = 'koskioppiaineetyleissivistava' then 'KT/ET' else [aine] end
		,[aineenoppimaara_koodisto]
		,[aineenoppimaara] = case when [aineenoppimaara] in ('KT','ET') and [aineenoppimaara_koodisto] = 'koskioppiaineetyleissivistava' then 'KT/ET' else [aineenoppimaara] end
		,[aine_suorituskieli]
		,[aine_laajuus]
		,[aine_laajuus_yksikko]
		,[aine_laajuus_puuttuu_0_1]
		,[aine_S_arvosana_0_1]
		,[aine_arvosana]
		,[aine_arviointi_hyvaksytty]
		,[kielet_lkm]
		,[kurssi_paikallinen_OPS_0_1]
		,[kurssi_pakollinen_0_1]
		,[kurssi_tyyppi]
		,[kurssi_suorituskieli]
		,[kurssit_laajuus]
		,[kurssit_laajuus_all_suorituskieli]
		,[kurssit_S_arvosanat_laajuus] 
	FROM dbo.TK_koski_lukio_ainevalinnat_suorittaneet_2023

	UNION ALL

	SELECT 
		[tilastovuosi]
		,lukuvuosi
		,lukukausi
		,[paatason_suoritus_id]
		,ops_voimaantulo
		,[lukionoppimaara]
		,[lukionoppimaara_suorituskieli]
		,[toimipiste_oid]
		,[oppilaitos_oid]
		,[koulutustoimija_oid]
		,[sukupuoli]
		,[ika]
		,[aidinkieli]
		,[kansalaisuus]
		,[osasuoritus_id]
		,[aine_koodisto]
		,[aine] = case when [aine] in ('KT','ET') and [aine_koodisto] = 'koskioppiaineetyleissivistava' then 'KT/ET' else [aine] end
		,[aineenoppimaara_koodisto]
		,[aineenoppimaara] = case when [aineenoppimaara] in ('KT','ET') and [aineenoppimaara_koodisto] = 'koskioppiaineetyleissivistava' then 'KT/ET' else [aineenoppimaara] end
		,[aine_suorituskieli]
		,[aine_laajuus]
		,[aine_laajuus_yksikko]
		,[aine_laajuus_puuttuu_0_1]
		,[aine_S_arvosana_0_1]
		,[aine_arvosana]
		,[aine_arviointi_hyvaksytty]
		,[kielet_lkm]
		,[kurssi_paikallinen_OPS_0_1]
		,[kurssi_pakollinen_0_1]
		,[kurssi_tyyppi]
		,[kurssi_suorituskieli]
		,[kurssit_laajuus]
		,[kurssit_laajuus_all_suorituskieli]
		,[kurssit_S_arvosanat_laajuus] 
	FROM dbo.TK_koski_lukio_ainevalinnat_suorittaneet_2022

	UNION ALL

	SELECT 
		[tilastovuosi]
		,lukuvuosi
		,lukukausi
		,[paatason_suoritus_id]
		,ops_voimaantulo
		,[lukionoppimaara]
		,[lukionoppimaara_suorituskieli]
		,[toimipiste_oid]
		,[oppilaitos_oid]
		,[koulutustoimija_oid]
		,[sukupuoli]
		,[ika]
		,[aidinkieli]
		,[kansalaisuus]
		,[osasuoritus_id]
		,[aine_koodisto]
		,[aine] = case when [aine] in ('KT','ET') and [aine_koodisto] = 'koskioppiaineetyleissivistava' then 'KT/ET' else [aine] end
		,[aineenoppimaara_koodisto]
		,[aineenoppimaara] = case when [aineenoppimaara] in ('KT','ET') and [aineenoppimaara_koodisto] = 'koskioppiaineetyleissivistava' then 'KT/ET' else [aineenoppimaara] end
		,[aine_suorituskieli]
		,[aine_laajuus]
		,[aine_laajuus_yksikko]
		,[aine_laajuus_puuttuu_0_1]
		,[aine_S_arvosana_0_1]
		,[aine_arvosana]
		,[aine_arviointi_hyvaksytty]
		,[kielet_lkm]
		,[kurssi_paikallinen_OPS_0_1]
		,[kurssi_pakollinen_0_1]
		,[kurssi_tyyppi]
		,[kurssi_suorituskieli]
		,[kurssit_laajuus]
		,[kurssit_laajuus_all_suorituskieli]
		,[kurssit_S_arvosanat_laajuus] 
	FROM dbo.TK_koski_lukio_ainevalinnat_suorittaneet_2021

	UNION ALL

	SELECT 
		[tilastovuosi]
		,lukuvuosi
		,lukukausi
		,[paatason_suoritus_id]
		,ops_voimaantulo
		,[lukionoppimaara]
		,[lukionoppimaara_suorituskieli]
		,[toimipiste_oid]
		,[oppilaitos_oid]
		,[koulutustoimija_oid]
		,[sukupuoli]
		,[ika]
		,[aidinkieli]
		,[kansalaisuus]
		,[osasuoritus_id]
		,[aine_koodisto]
		,[aine] = case when [aine] in ('KT','ET') and [aine_koodisto] = 'koskioppiaineetyleissivistava' then 'KT/ET' else [aine] end
		,[aineenoppimaara_koodisto]
		,[aineenoppimaara] = case when [aineenoppimaara] in ('KT','ET') and [aineenoppimaara_koodisto] = 'koskioppiaineetyleissivistava' then 'KT/ET' else [aineenoppimaara] end
		,[aine_suorituskieli]
		,[aine_laajuus]
		,[aine_laajuus_yksikko]
		,[aine_laajuus_puuttuu_0_1]
		,[aine_S_arvosana_0_1]
		,[aine_arvosana]
		,[aine_arviointi_hyvaksytty]
		,[kielet_lkm]
		,[kurssi_paikallinen_OPS_0_1]
		,[kurssi_pakollinen_0_1]
		,[kurssi_tyyppi]
		,[kurssi_suorituskieli]
		,[kurssit_laajuus]
		,[kurssit_laajuus_all_suorituskieli]
		,[kurssit_S_arvosanat_laajuus] 
	FROM dbo.TK_koski_lukio_ainevalinnat_suorittaneet_2020

	UNION ALL

	SELECT 
		[tilastovuosi]
		,lukuvuosi
		,lukukausi
		,[paatason_suoritus_id]
		,ops_voimaantulo
		,[lukionoppimaara]
		,[lukionoppimaara_suorituskieli]
		,[toimipiste_oid]
		,[oppilaitos_oid]
		,[koulutustoimija_oid]
		,[sukupuoli]
		,[ika]
		,[aidinkieli]
		,[kansalaisuus]
		,[osasuoritus_id]
		,[aine_koodisto]
		,[aine] = case when [aine] in ('KT','ET') and [aine_koodisto] = 'koskioppiaineetyleissivistava' then 'KT/ET' else [aine] end
		,[aineenoppimaara_koodisto]
		,[aineenoppimaara] = case when [aineenoppimaara] in ('KT','ET') and [aineenoppimaara_koodisto] = 'koskioppiaineetyleissivistava' then 'KT/ET' else [aineenoppimaara] end
		,[aine_suorituskieli]
		,[aine_laajuus]
		,[aine_laajuus_yksikko]
		,[aine_laajuus_puuttuu_0_1]
		,[aine_S_arvosana_0_1]
		,[aine_arvosana]
		,[aine_arviointi_hyvaksytty]
		,[kielet_lkm]
		,[kurssi_paikallinen_OPS_0_1]
		,[kurssi_pakollinen_0_1]
		,[kurssi_tyyppi]
		,[kurssi_suorituskieli]
		,[kurssit_laajuus]
		,[kurssit_laajuus_all_suorituskieli]
		,[kurssit_S_arvosanat_laajuus] 
	FROM dbo.TK_koski_lukio_ainevalinnat_suorittaneet_2019

) kaikki

GO
