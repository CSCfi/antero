USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_hakeutumisvelvolliset]    Script Date: 27.1.2023 23:39:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE OR ALTER VIEW [dw].[v_koski_hakeutumisvelvolliset] AS

--Tiedot selkokielisinä jo lähdetaulussa, koska yhdistetään eri aikoina ladattavia lähteitä. Tarvittaessa ks. dw._temp-taulut ja niiden lataukset. JS 14.3.2023

  SELECT --top 1000

	--apu
	[oppija_oid]
	,[hakenut_ensisijaisesti_1_0]
	,[hakenut_1_0]
	,[valittu_1_0]
	,[vastaanottanut_1_0]
	,[ilmoittautunut_1_0]

	--aika
	,[Tilastovuosi]
	,[Päivitysaika] = cast(getdate() as date)
	,[Hak.velv. tarkasteluhetki]
	,[Opiskelun tarkasteluhetki]
	,[Koul. alkamiskausi (hakukohde)]

	--hlö
	,[Sukupuoli]
	,[Ikä]
	,[Täyttänyt 18 v. (opiskelun tarkasteluhetki)]
	,[Syntymävuosi]
	,[Äidinkieli (ryhmä)]
	,[Kansalaisuus (ryhmä)]
	,[Kotikunta]
	,[Kotimaakunta]
	,[Perusop. suoritusvuosi]
	,[Perusop. suorituskausi]
	,[Perusop. suor. til.v. keväänä]
	,[Perusop. suorituskunta]
	,[Perusop. suoritusmaakunta]

	--haku
	,[Hakutoiminta]
	,[Hakutapa]
	,[Hakutyyppi]
	,[Hakutoivenumero]
	,[Hakutoiveen tila]

	--koulutus
	,[Oppiv. suor. kelp. koul. (hak.velv. tarkasteluhetki)]
	,[Oppiv. suor. kelp. koul. (opiskelun tarkasteluhetki)]
	,[Vaativa erityinen tuki (hakukohde)]
	,[Koulutustyyppi (hakukohde)] --erityiskäsittely koodeille 301101-4 tehty ed. vaiheessa 
	,[Koulutustyyppi (opiskelun tarkasteluhetki)] --erityiskäsittely koodeille 301101-4 tehty ed. vaiheessa 
	,[Koulutusmuoto (hak.velv. tarkasteluhetki)] --= d6.selite_fi
	,[Koulutusmuoto (opiskelun tarkasteluhetki)] --= d7.selite_fi
	,[Suorituksen tyyppi (hak.velv. tarkasteluhetki)] --= d8.selite_fi
	,[Suorituksen tyyppi (opiskelun tarkasteluhetki)] --= d9.selite_fi

	--,[koodit_koulutusnimike_hv]
	--,[koodit_koulutusnimike_hv_hakutiedot]
	--,[koodit_koulutusnimike_hv_opiskelutiedot]

	,[jarjestys_hak_velv_tarkasteluhetki]
	,[jarjestys_opiskelun_tarkasteluhetki]
	,[jarjestys_koulutuksen_alkamiskausi]
	,[jarjestys_sukupuoli]
	,[jarjestys_aidinkieli_ryhma]
	,[jarjestys_kansalaisuus_ryhma]
	,[jarjestys_kotimaakunta]
	,[jarjestys_perusop_suoritusmaakunta]
	,[jarjestys_perusop_suoritusvuosi]
	,[jarjestys_perusop_suorituskausi]
	,[jarjestys_hakutapa]
	,[jarjestys_hakutyyppi]
	,[jarjestys_hakutoiveen_tila]
	,jarjestys_koulutustyyppi_hakukohde
	,jarjestys_koulutustyyppi_opiskelun_tarkasteluhetki
	,jarjestys_koulutusmuoto_hak_velv_tarkasteluhetki
	,jarjestys_koulutusmuoto_opiskelun_tarkasteluhetki
	,jarjestys_suorituksen_tyyppi_hak_velv_tarkasteluhetki
	,jarjestys_suorituksen_tyyppi_opiskelun_tarkasteluhetki

  FROM [dw].[f_koski_hakeutumisvelvolliset] f
  /*
  LEFT JOIN [dw].[d_koulutusluokitus] d1 on d1.koulutusluokitus_koodi = f.koodit_koulutusnimike_hv
  LEFT JOIN [dw].[d_koulutusluokitus] d2 on d2.koulutusluokitus_koodi = f.koodit_koulutusnimike_hv_hakutiedot
  LEFT JOIN [dw].[d_koulutusluokitus] d3 on d3.koulutusluokitus_koodi = f.koodit_koulutusnimike_hv_opiskelutiedot
  LEFT JOIN [dw].[d_koulutustyyppi] d4 on d4.koodi = d2.koulutustyyppi_koodi
  LEFT JOIN [dw].[d_koulutustyyppi] d5 on d5.koodi = d3.koulutustyyppi_koodi
  LEFT JOIN [dw].[d_koski_koulutusmuoto] d6 on d6.koodi = f.koulutusmuoto_hv
  LEFT JOIN [dw].[d_koski_koulutusmuoto] d7 on d7.koodi = f.koulutusmuoto_hv_opiskelutiedot
  LEFT JOIN [dw].[d_koski_suorituksen_tyyppi] d8 on d8.koodi = f.suorituksen_tyyppi_hv
  LEFT JOIN [dw].[d_koski_suorituksen_tyyppi] d9 on d9.koodi = f.suorituksen_tyyppi_hv_opiskelutiedot
  */

GO
