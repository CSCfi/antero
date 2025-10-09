USE [VipunenTK_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dbo].[v_sa_TK_Koski_perusopetus_ainevalinnat] AS

SELECT 
	[Lukuvuosi]
	,oppija_oid
	,[opiskeluoikeus_oid]
	,[paatason_suoritus_id] = cast([Lukuvuosi] as varchar(4)) + '_' + cast([paatason_suoritus_id] as varchar(10))
	,[vuosiluokka]
	,[vuosiluokan_suorituskieli]
	,[toimipiste_oid]
	,[oppilaitos_oid]
	,[koulutustoimija_oid]
	,[sukupuoli]
	,[ika]
	,[aidinkieli]
	,[kansalaisuus]
	,[osasuoritus_id] = cast([Lukuvuosi] as varchar(4)) + '_' + cast([osasuoritus_id] as varchar(15))
	,[aine_koodisto]
	,[aine]
	,[aineen_oppimaara_koodisto]
	,[aineen_oppimaara]
	,[aineen_suorituskieli]
	,[aineen_arvosana]
	,[aineen_arviointi_hyvaksytty]
	,[koulutusmoduuli_pakollinen]
	,[koulutusmoduuli_paikallinen]
	,[koulutusmoduuli_laajuus_arvo]
	,[koulutusmoduuli_laajuus_yksikko]
	,[kielet_lkm]

FROM 
(	
	SELECT 
		[Lukuvuosi]
		,[oppija_oid]
		,[opiskeluoikeus_oid]
		,[paatason_suoritus_id]
		,[vuosiluokka]
		,[vuosiluokan_suorituskieli]
		,[toimipiste_oid]
		,[oppilaitos_oid]
		,[koulutustoimija_oid]
		,[sukupuoli]
		,[ika]
		,[aidinkieli]
		,[kansalaisuus]
		,[osasuoritus_id]
		,[aine_koodisto]
		,[aine] --= case when [aine] in ('KT','ET') and [aine_koodisto] = 'koskioppiaineetyleissivistava' then 'KT/ET' else [aine] end
		,[aineen_oppimaara_koodisto]
		,[aineen_oppimaara] --= case when [aineen_oppimaara] in ('KT','ET') and [aineen_oppimaara_koodisto] = 'koskioppiaineetyleissivistava' then 'KT/ET' else [aineen_oppimaara] end
		,[aineen_suorituskieli]
		,[aineen_arvosana]
		,[aineen_arviointi_hyvaksytty]
		,[koulutusmoduuli_pakollinen]
		,[koulutusmoduuli_paikallinen]
		,[koulutusmoduuli_laajuus_arvo]
		,[koulutusmoduuli_laajuus_yksikko]
		,[kielet_lkm] 
	FROM dbo.TK_Koski_perusopetus_ainevalinnat_2025

	UNION ALL

	SELECT 
		[Lukuvuosi]
		,[oppija_oid]
		,[opiskeluoikeus_oid]
		,[paatason_suoritus_id]
		,[vuosiluokka]
		,[vuosiluokan_suorituskieli]
		,[toimipiste_oid]
		,[oppilaitos_oid]
		,[koulutustoimija_oid]
		,[sukupuoli]
		,[ika]
		,[aidinkieli]
		,[kansalaisuus]
		,[osasuoritus_id]
		,[aine_koodisto]
		,[aine] --= case when [aine] in ('KT','ET') and [aine_koodisto] = 'koskioppiaineetyleissivistava' then 'KT/ET' else [aine] end
		,[aineen_oppimaara_koodisto]
		,[aineen_oppimaara] --= case when [aineen_oppimaara] in ('KT','ET') and [aineen_oppimaara_koodisto] = 'koskioppiaineetyleissivistava' then 'KT/ET' else [aineen_oppimaara] end
		,[aineen_suorituskieli]
		,[aineen_arvosana]
		,[aineen_arviointi_hyvaksytty]
		,[koulutusmoduuli_pakollinen]
		,[koulutusmoduuli_paikallinen]
		,[koulutusmoduuli_laajuus_arvo]
		,[koulutusmoduuli_laajuus_yksikko]
		,[kielet_lkm] 
	FROM dbo.TK_Koski_perusopetus_ainevalinnat_2024

	UNION ALL

	SELECT 
		[Lukuvuosi]
		,[oppija_oid]
		,[opiskeluoikeus_oid]
		,[paatason_suoritus_id]
		,[vuosiluokka]
		,[vuosiluokan_suorituskieli]
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
		,[aineen_oppimaara_koodisto]
		,[aineen_oppimaara] = case when [aineen_oppimaara] in ('KT','ET') and [aineen_oppimaara_koodisto] = 'koskioppiaineetyleissivistava' then 'KT/ET' else [aineen_oppimaara] end
		,[aineen_suorituskieli]
		,[aineen_arvosana]
		,[aineen_arviointi_hyvaksytty]
		,[koulutusmoduuli_pakollinen]
		,[koulutusmoduuli_paikallinen]
		,[koulutusmoduuli_laajuus_arvo]
		,[koulutusmoduuli_laajuus_yksikko]
		,[kielet_lkm] 
	FROM dbo.TK_Koski_perusopetus_ainevalinnat_2023

	UNION ALL

	SELECT 
		[Lukuvuosi]
		,[oppija_oid]
		,[opiskeluoikeus_oid]
		,[paatason_suoritus_id]
		,[vuosiluokka]
		,[vuosiluokan_suorituskieli]
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
		,[aineen_oppimaara_koodisto]
		,[aineen_oppimaara] = case when [aineen_oppimaara] in ('KT','ET') and [aineen_oppimaara_koodisto] = 'koskioppiaineetyleissivistava' then 'KT/ET' else [aineen_oppimaara] end
		,[aineen_suorituskieli]
		,[aineen_arvosana]
		,[aineen_arviointi_hyvaksytty]
		,[koulutusmoduuli_pakollinen]
		,[koulutusmoduuli_paikallinen]
		,[koulutusmoduuli_laajuus_arvo]
		,[koulutusmoduuli_laajuus_yksikko]
		,[kielet_lkm] 
	FROM dbo.TK_Koski_perusopetus_ainevalinnat_2022

	UNION ALL

	SELECT 
		[Lukuvuosi]
		,[oppija_oid]
		,[opiskeluoikeus_oid]
		,[paatason_suoritus_id]
		,[vuosiluokka]
		,[vuosiluokan_suorituskieli]
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
		,[aineen_oppimaara_koodisto]
		,[aineen_oppimaara] = case when [aineen_oppimaara] in ('KT','ET') and [aineen_oppimaara_koodisto] = 'koskioppiaineetyleissivistava' then 'KT/ET' else [aineen_oppimaara] end
		,[aineen_suorituskieli]
		,[aineen_arvosana]
		,[aineen_arviointi_hyvaksytty]
		,[koulutusmoduuli_pakollinen]
		,[koulutusmoduuli_paikallinen]
		,[koulutusmoduuli_laajuus_arvo]
		,[koulutusmoduuli_laajuus_yksikko]
		,[kielet_lkm] 
	FROM dbo.TK_Koski_perusopetus_ainevalinnat_2021

	UNION ALL

	SELECT 
		[Lukuvuosi]
		,[oppija_oid]
		,[opiskeluoikeus_oid]
		,[paatason_suoritus_id]
		,[vuosiluokka]
		,[vuosiluokan_suorituskieli]
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
		,[aineen_oppimaara_koodisto]
		,[aineen_oppimaara] = case when [aineen_oppimaara] in ('KT','ET') and [aineen_oppimaara_koodisto] = 'koskioppiaineetyleissivistava' then 'KT/ET' else [aineen_oppimaara] end
		,[aineen_suorituskieli]
		,[aineen_arvosana]
		,[aineen_arviointi_hyvaksytty]
		,[koulutusmoduuli_pakollinen]
		,[koulutusmoduuli_paikallinen]
		,[koulutusmoduuli_laajuus_arvo]
		,[koulutusmoduuli_laajuus_yksikko]
		,[kielet_lkm] 
	FROM dbo.TK_Koski_perusopetus_ainevalinnat_2020

) kaikki

GO
