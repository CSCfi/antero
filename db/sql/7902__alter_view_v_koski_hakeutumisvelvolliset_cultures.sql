USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_hakeutumisvelvolliset_cultures]    Script Date: 20.7.2023 13:25:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO














ALTER VIEW [dw].[v_koski_hakeutumisvelvolliset_cultures] AS

/*
Tiedot selkokielisinä jo lähdetaulussa, koska siihen yhdistetty eri aikoina ladattavia lähteitä. Tarvittaessa ks. lähdetaulun lähdetaulujen lataukset.
Huom. Mittareiden all-ehdot päivitettävä, mikäli hakutoiminta- tai opiskelutoimintamuuttujia lisätään.
*/

 SELECT

	 apusarake_oppija_oid = oppija_oid
	,apusarake_hakenut_ensisijaisesti_1_0 = hakenut_ensisijaisesti_1_0
	,apusarake_hakenut_1_0 = hakenut_1_0
	,apusarake_valittu_1_0 = valittu_1_0
	,apusarake_vastaanottanut_1_0 = vastaanottanut_1_0
	,apusarake_ilmoittautunut_1_0 = ilmoittautunut_1_0
	,apusarake_oppivelvollisuuden_suorittamiseen_kelpaavassa_koulutuksessa_1_0 = oppivelvollisuuden_suorittamiseen_kelpaavassa_koulutuksessa_1_0
	
	--FI
	,paivitysaika_fi = cast(getdate() as date)
	,tilastovuosi_fi = tilastovuosi
	,hak_velv_tarkasteluhetki_fi
	,opiskelun_tarkasteluhetki_fi
	,koulutuksen_alkamiskausi_hakukohde_fi

	,sukupuoli_fi
	,ika_fi
	,syntymavuosi_fi = syntymavuosi
	,tayttanyt_18_v_opiskelun_tarkasteluhetki_fi
	,aidinkieli_ryhma_fi
	,kansalaisuus_ryhma_fi
	,kotikunta_nykyinen_fi
	,kotimaakunta_nykyinen_fi
	,kotikunnan_hyvinvointialue_nykyinen_fi
	,perusopetuksen_suoritusvuosi_fi
	,perusopetuksen_suorituskausi_fi
	,perusop_suor_tilastovuoden_kevaana_fi
	,perusopetuksen_suorituskunta_fi
	,perusopetuksen_suoritusmaakunta_fi

	,hakutoiminta_fi
	,hakutapa_fi
	,hakutyyppi_fi
	,hakutoivenumero_fi
	,hakutoiveen_tila_fi

	,opiskelutoiminta_opiskelun_tarkasteluhetki_fi
	,vaativa_erityinen_tuki_hakukohde_fi
	,koulutustyyppi_hakukohde_fi
	,koulutustyyppi_opiskelun_tarkasteluhetki_fi
	,koulutusmuoto_hak_velv_tarkasteluhetki_fi
	,koulutusmuoto_opiskelun_tarkasteluhetki_fi
	,suorituksen_tyyppi_hak_velv_tarkasteluhetki_fi
	,suorituksen_tyyppi_opiskelun_tarkasteluhetki_fi

	--SV
	,paivitysaika_sv = cast(getdate() as date)
	,tilastovuosi_sv = tilastovuosi
	,hak_velv_tarkasteluhetki_sv
	,opiskelun_tarkasteluhetki_sv
	,koulutuksen_alkamiskausi_hakukohde_sv

	,sukupuoli_sv
	,ika_sv
	,syntymavuosi_sv = syntymavuosi
	,tayttanyt_18_v_opiskelun_tarkasteluhetki_sv
	,aidinkieli_ryhma_sv
	,kansalaisuus_ryhma_sv
	,kotikunta_nykyinen_sv
	,kotimaakunta_nykyinen_sv
	,kotikunnan_hyvinvointialue_nykyinen_sv
	,perusopetuksen_suoritusvuosi_sv
	,perusopetuksen_suorituskausi_sv
	,perusop_suor_tilastovuoden_kevaana_sv
	,perusopetuksen_suorituskunta_sv
	,perusopetuksen_suoritusmaakunta_sv

	,hakutoiminta_sv
	,hakutapa_sv
	,hakutyyppi_sv
	,hakutoivenumero_sv
	,hakutoiveen_tila_sv

	,opiskelutoiminta_opiskelun_tarkasteluhetki_sv
	,vaativa_erityinen_tuki_hakukohde_sv
	,koulutustyyppi_hakukohde_sv
	,koulutustyyppi_opiskelun_tarkasteluhetki_sv
	,koulutusmuoto_hak_velv_tarkasteluhetki_sv
	,koulutusmuoto_opiskelun_tarkasteluhetki_sv
	,suorituksen_tyyppi_hak_velv_tarkasteluhetki_sv
	,suorituksen_tyyppi_opiskelun_tarkasteluhetki_sv

	--JARJESTYS
	,jarjestys_hak_velv_tarkasteluhetki
	,jarjestys_opiskelun_tarkasteluhetki
	,jarjestys_koulutuksen_alkamiskausi_hakukohde
	,jarjestys_sukupuoli
	,jarjestys_aidinkieli_ryhma
	,jarjestys_kansalaisuus_ryhma
	,jarjestys_kotimaakunta
	,jarjestys_kotikunnan_hyvinvointialue
	,jarjestys_perusopetuksen_suoritusmaakunta
	,jarjestys_perusopetuksen_suoritusvuosi
	,jarjestys_perusopetuksen_suorituskausi
	,jarjestys_hakutapa
	,jarjestys_hakutyyppi
	,jarjestys_hakutoiveen_tila
	,jarjestys_koulutustyyppi_hakukohde
	,jarjestys_koulutustyyppi_opiskelun_tarkasteluhetki
	,jarjestys_koulutusmuoto_hak_velv_tarkasteluhetki
	,jarjestys_koulutusmuoto_opiskelun_tarkasteluhetki
	,jarjestys_suorituksen_tyyppi_hak_velv_tarkasteluhetki
	,jarjestys_suorituksen_tyyppi_opiskelun_tarkasteluhetki
	
  FROM [dw].[f_koski_hakeutumisvelvolliset] f

GO
