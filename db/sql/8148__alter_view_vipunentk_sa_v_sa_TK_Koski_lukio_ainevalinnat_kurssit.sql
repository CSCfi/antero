USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_TK_Koski_lukio_ainevalinnat_kurssit]    Script Date: 4.10.2023 17:31:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER VIEW [dbo].[v_sa_TK_Koski_lukio_ainevalinnat_kurssit] AS

SELECT 
	[Tilastovuosi]
    ,[paatason_suoritus_id] = cast(Tilastovuosi as varchar(4)) + '_' + cast(paatason_suoritus_id as varchar(10))
    ,[lukionoppimaara]
    ,[lukionoppimaara_suorituskieli]
    ,[toimipiste_oid]
    ,[oppilaitos_oid]
    ,[koulutustoimija_oid]
    ,[sukupuoli]
    ,[aine_koodisto]
    ,[aine]
    ,[aineenoppimaara_koodisto]
    ,[aineenoppimaara]
    ,[kurssi_koodisto]
    ,[kurssi]
    ,[kurssi_paikallinen_OPS_0_1]
    ,[kurssi_tyyppi]
    ,[kurssi_suorituskieli]
    ,[kurssi_arvosana]
    ,[lkm] 
	  
FROM 
(

	SELECT [Tilastovuosi]
      ,[paatason_suoritus_id]
      ,[lukionoppimaara]
      ,[lukionoppimaara_suorituskieli]
      ,[toimipiste_oid]
      ,[oppilaitos_oid]
      ,[koulutustoimija_oid]
      ,[sukupuoli]
      ,[aine_koodisto]
      ,[aine] = case when [aine] in ('KT','ET') and [aine_koodisto] = 'koskioppiaineetyleissivistava' then 'KT/ET' else [aine] end
      ,[aineenoppimaara_koodisto]
      ,[aineenoppimaara] = case when [aineenoppimaara] in ('KT','ET') and [aineenoppimaara_koodisto] = 'koskioppiaineetyleissivistava' then 'KT/ET' else [aineenoppimaara] end
      ,[kurssi_koodisto]
      ,[kurssi]
      ,[kurssi_paikallinen_OPS_0_1]
      ,[kurssi_tyyppi]
      ,[kurssi_suorituskieli]
      ,[kurssi_arvosana]
      ,[lkm] 
	FROM VipunenTK_SA.dbo.TK_Koski_lukio_ainevalinnat_kurssit_2023

	UNION ALL

	SELECT [Tilastovuosi]
      ,[paatason_suoritus_id]
      ,[lukionoppimaara]
      ,[lukionoppimaara_suorituskieli]
      ,[toimipiste_oid]
      ,[oppilaitos_oid]
      ,[koulutustoimija_oid]
      ,[sukupuoli]
      ,[aine_koodisto]
      ,[aine] = case when [aine] in ('KT','ET') and [aine_koodisto] = 'koskioppiaineetyleissivistava' then 'KT/ET' else [aine] end
      ,[aineenoppimaara_koodisto]
      ,[aineenoppimaara] = case when [aineenoppimaara] in ('KT','ET') and [aineenoppimaara_koodisto] = 'koskioppiaineetyleissivistava' then 'KT/ET' else [aineenoppimaara] end
      ,[kurssi_koodisto]
      ,[kurssi]
      ,[kurssi_paikallinen_OPS_0_1]
      ,[kurssi_tyyppi]
      ,[kurssi_suorituskieli]
      ,[kurssi_arvosana]
      ,[lkm] 
	FROM VipunenTK_SA.dbo.TK_Koski_lukio_ainevalinnat_kurssit_2022

	UNION ALL

	SELECT [Tilastovuosi]
      ,[paatason_suoritus_id]
      ,[lukionoppimaara]
      ,[lukionoppimaara_suorituskieli]
      ,[toimipiste_oid]
      ,[oppilaitos_oid]
      ,[koulutustoimija_oid]
      ,[sukupuoli]
      ,[aine_koodisto]
      ,[aine] = case when [aine] in ('KT','ET') and [aine_koodisto] = 'koskioppiaineetyleissivistava' then 'KT/ET' else [aine] end
      ,[aineenoppimaara_koodisto]
      ,[aineenoppimaara] = case when [aineenoppimaara] in ('KT','ET') and [aineenoppimaara_koodisto] = 'koskioppiaineetyleissivistava' then 'KT/ET' else [aineenoppimaara] end
      ,[kurssi_koodisto]
      ,[kurssi]
      ,[kurssi_paikallinen_OPS_0_1]
      ,[kurssi_tyyppi]
      ,[kurssi_suorituskieli]
      ,[kurssi_arvosana]
      ,[lkm] 
	FROM VipunenTK_SA.dbo.TK_Koski_lukio_ainevalinnat_kurssit_2021

	UNION ALL

	SELECT [Tilastovuosi]
      ,[paatason_suoritus_id]
      ,[lukionoppimaara]
      ,[lukionoppimaara_suorituskieli]
      ,[toimipiste_oid]
      ,[oppilaitos_oid]
      ,[koulutustoimija_oid]
      ,[sukupuoli]
      ,[aine_koodisto]
      ,[aine] = case when [aine] in ('KT','ET') and [aine_koodisto] = 'koskioppiaineetyleissivistava' then 'KT/ET' else [aine] end
      ,[aineenoppimaara_koodisto]
      ,[aineenoppimaara] = case when [aineenoppimaara] in ('KT','ET') and [aineenoppimaara_koodisto] = 'koskioppiaineetyleissivistava' then 'KT/ET' else [aineenoppimaara] end
      ,[kurssi_koodisto]
      ,[kurssi]
      ,[kurssi_paikallinen_OPS_0_1]
      ,[kurssi_tyyppi]
      ,[kurssi_suorituskieli]
      ,[kurssi_arvosana]
      ,[lkm] 
	FROM VipunenTK_SA.dbo.TK_Koski_lukio_ainevalinnat_kurssit_2020

	UNION ALL

	SELECT [Tilastovuosi]
      ,[paatason_suoritus_id]
      ,[lukionoppimaara]
      ,[lukionoppimaara_suorituskieli]
      ,[toimipiste_oid]
      ,[oppilaitos_oid]
      ,[koulutustoimija_oid]
      ,[sukupuoli]
      ,[aine_koodisto]
      ,[aine] = case when [aine] in ('KT','ET') and [aine_koodisto] = 'koskioppiaineetyleissivistava' then 'KT/ET' else [aine] end
      ,[aineenoppimaara_koodisto]
      ,[aineenoppimaara] = case when [aineenoppimaara] in ('KT','ET') and [aineenoppimaara_koodisto] = 'koskioppiaineetyleissivistava' then 'KT/ET' else [aineenoppimaara] end
      ,[kurssi_koodisto]
      ,[kurssi]
      ,[kurssi_paikallinen_OPS_0_1]
      ,[kurssi_tyyppi]
      ,[kurssi_suorituskieli]
      ,[kurssi_arvosana]
      ,[lkm] 
	FROM VipunenTK_SA.dbo.TK_Koski_lukio_ainevalinnat_kurssit_2019

) kaikki

GO
