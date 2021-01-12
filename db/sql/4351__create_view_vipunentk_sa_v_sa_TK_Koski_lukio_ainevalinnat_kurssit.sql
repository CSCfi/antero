use vipunentk_sa
go

drop view if exists dbo.v_sa_TK_Koski_lukio_ainevalinnat_kurssit
go

CREATE VIEW dbo.v_sa_TK_Koski_lukio_ainevalinnat_kurssit 
AS

  SELECT [Tilastovuosi]
    ,[paatason_suoritus_id]
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
	FROM VipunenTK_SA.dbo.TK_Koski_lukio_ainevalinnat_kurssit_2019

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
	FROM VipunenTK_SA.dbo.TK_Koski_lukio_ainevalinnat_kurssit_2020

  ) kaikki

go
use antero