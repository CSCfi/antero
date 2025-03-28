use VipunenTK_SA
go

drop view if exists [dbo].[v_sa_TK_Koski_lukio_ainevalinnat_suorittaneet]
go

CREATE VIEW [dbo].[v_sa_TK_Koski_lukio_ainevalinnat_suorittaneet]
AS

  SELECT [Tilastovuosi]
    ,[paatason_suoritus_id]
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
    ,[kurssi_tyyppi]
    ,[kurssi_suorituskieli]
    ,[kurssit_laajuus]
    ,[kurssit_laajuus_all_suorituskieli]
    ,[kurssit_S_arvosanat_laajuus]

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
      ,[kurssi_tyyppi]
      ,[kurssi_suorituskieli]
      ,[kurssit_laajuus]
      ,[kurssit_laajuus_all_suorituskieli]
      ,[kurssit_S_arvosanat_laajuus] 
	FROM dbo.TK_koski_lukio_ainevalinnat_suorittaneet_2019

	UNION ALL

	SELECT [Tilastovuosi]
      ,[paatason_suoritus_id]
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
      ,[kurssi_tyyppi]
      ,[kurssi_suorituskieli]
      ,[kurssit_laajuus]
      ,[kurssit_laajuus_all_suorituskieli]
      ,[kurssit_S_arvosanat_laajuus] 
	FROM dbo.TK_koski_lukio_ainevalinnat_suorittaneet_2020

  ) kaikki

go
use antero