USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_hakeutumisvelvolliset_cultures]    Script Date: 15.4.2025 12.46.46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER   VIEW [dw].[v_koski_hakeutumisvelvolliset_cultures] AS

--Huom. Mittareiden all-ehdot päivitettävä, mikäli hakutoiminta- tai opiskelutoimintamuuttujia lisätään.

SELECT 
	 apusarake_oppija_oid = master_oid
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
	,kotikunta_opiskelun_tarkasteluhetki_fi
	,kotimaakunta_opiskelun_tarkasteluhetki_fi
	,kotikunnan_hyvinvointialue_opiskelun_tarkasteluhetki_fi
	,kotikunta_hak_velv_tarkasteluhetki_fi
	,kotimaakunta_hak_velv_tarkasteluhetki_fi
	,kotikunnan_hyvinvointialue_hak_velv_tarkasteluhetki_fi
	,perusopetuksen_suoritusvuosi_fi
	,perusopetuksen_suorituskausi_fi
	,perusop_suor_tilastovuoden_kevaana_fi
	,perusopetuksen_suorituskunta_fi
	,perusopetuksen_suoritusmaakunta_fi
	,pidennetty_oppivelvollisuus_fi
	,perusopetuksen_yksilollistetty_oppimaara_ja_toiminta_alueittain_jarjestetty_opetus_fi

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
	,erityisopetus_hak_velv_tarkasteluhetki_fi
	,erityisopetus_opiskelun_tarkasteluhetki_fi

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
	,kotikunta_opiskelun_tarkasteluhetki_sv
	,kotimaakunta_opiskelun_tarkasteluhetki_sv
	,kotikunnan_hyvinvointialue_opiskelun_tarkasteluhetki_sv
	,kotikunta_hak_velv_tarkasteluhetki_sv
	,kotimaakunta_hak_velv_tarkasteluhetki_sv
	,kotikunnan_hyvinvointialue_hak_velv_tarkasteluhetki_sv
	,perusopetuksen_suoritusvuosi_sv
	,perusopetuksen_suorituskausi_sv
	,perusop_suor_tilastovuoden_kevaana_sv
	,perusopetuksen_suorituskunta_sv
	,perusopetuksen_suoritusmaakunta_sv
	,pidennetty_oppivelvollisuus_sv
	,perusopetuksen_yksilollistetty_oppimaara_ja_toiminta_alueittain_jarjestetty_opetus_sv

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
	,erityisopetus_hak_velv_tarkasteluhetki_sv
	,erityisopetus_opiskelun_tarkasteluhetki_sv

	--JARJESTYS
	,jarjestys_hak_velv_tarkasteluhetki
	,jarjestys_opiskelun_tarkasteluhetki
	,jarjestys_koulutuksen_alkamiskausi_hakukohde
	,jarjestys_sukupuoli
	,jarjestys_aidinkieli_ryhma
	,jarjestys_kansalaisuus_ryhma
	,jarjestys_kotimaakunta_opiskelun_tarkasteluhetki
	,jarjestys_kotikunnan_hyvinvointialue_opiskelun_tarkasteluhetki
	,jarjestys_kotimaakunta_hak_velv_tarkasteluhetki
	,jarjestys_kotikunnan_hyvinvointialue_hak_velv_tarkasteluhetki
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
	,jarjestys_erityisopetus_opiskelun_tarkasteluhetki
	,jarjestys_erityisopetus_hak_velv_tarkasteluhetki
	,jarjestys_pidennetty_oppivelvollisuus
	,jarjestys_perusopetuksen_yksilollistetty_oppimaara_ja_toiminta_alueittain_jarjestetty_opetus
	
FROM (

	SELECT  --DISTINCT
		hv.[master_oid]
		,[hakenut_ensisijaisesti_1_0] = case when ht.HakutoiveNumero = 1 then 1 else 0 end
		,[hakenut_1_0] = case when ht.master_oid is not null then 1 else 0 end
		,[valittu_1_0] = case when ht.ValinnanTila in ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT') then 1 else 0 end
		,[vastaanottanut_1_0] = case when ht.VastaanotonTila in ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT') then 1 else 0 end
		,[ilmoittautunut_1_0] = case when ht.IlmoittautumisenTila in ('LASNA','LASNA_KOKO_LUKUVUOSI','LASNA_SYKSY') then 1 else 0 end
		,[oppivelvollisuuden_suorittamiseen_kelpaavassa_koulutuksessa_1_0] = ot.oppivelvollisuuden_suorittamiseen_kelpaava_hv
		
		/*
		,hv.koodit_koulutusnimike_hv
		,koodit_koulutusnimike_hv_opiskelutiedot = coalesce(ot.koodit_koulutusnimike_hv_opiskelutiedot, '-1')
		,koodit_koulutusnimike_hv_hakutiedot = coalesce(ht.koodit_koulutusnimike_hv_hakutiedot, '-1')
		*/

		,hv.tilastovuosi
		,hv.syntymavuosi

		--FI
		,hv.hak_velv_tarkasteluhetki_fi
		,opiskelun_tarkasteluhetki_fi = coalesce(ot.opiskelun_tarkasteluhetki_fi, 'Viimeisin / Ei vielä tarkastelua tilastovuonna')
		,koulutuksen_alkamiskausi_hakukohde_fi = case ht.koulutuksen_alkamiskausi when 'k' then 'Kevät' when 's' then 'Syksy' else 'Tieto puuttuu' end

		,hv.sukupuoli_fi
		,hv.ika_fi
		,tayttanyt_18_v_opiskelun_tarkasteluhetki_fi = coalesce(ot.tayttanyt_18_v_opiskelun_tarkasteluhetki_fi, 'Ei / Ei vielä tarkastelua tilastovuonna')
		,hv.aidinkieli_ryhma_fi
		,hv.kansalaisuus_ryhma_fi
		,hv.kotikunta_hak_velv_tarkasteluhetki_fi
		,hv.kotimaakunta_hak_velv_tarkasteluhetki_fi
		,hv.kotikunnan_hyvinvointialue_hak_velv_tarkasteluhetki_fi
		,kotikunta_opiskelun_tarkasteluhetki_fi
		,kotimaakunta_opiskelun_tarkasteluhetki_fi
		,kotikunnan_hyvinvointialue_opiskelun_tarkasteluhetki_fi
		,hv.perusopetuksen_suoritusvuosi_fi
		,hv.perusopetuksen_suorituskausi_fi
		,perusop_suor_tilastovuoden_kevaana_fi = case when hv.perusopetuksen_suoritusvuosi_fi = cast(hv.Tilastovuosi as varchar) and hv.perusopetuksen_suorituskausi_fi = 'Kevät' then 'Kyllä' else 'Ei' end
		,hv.perusopetuksen_suorituskunta_fi
		,hv.perusopetuksen_suoritusmaakunta_fi
		,hv.pidennetty_oppivelvollisuus_fi
		,perusopetuksen_yksilollistetty_oppimaara_ja_toiminta_alueittain_jarjestetty_opetus_fi = hv.perusopetuksen_oppimaaran_yksilollistaminen_fi
	
		,hakutoiminta_fi = case when ht.master_oid is not null then 'Hakenut tilastovuonna alkavaan koulutukseen' else 'Ei ole hakenut tilastovuonna alkavaan koulutukseen' end
		,hakutapa_fi = coalesce(ht.hakutapa_fi, 'Tieto puuttuu')
		,hakutyyppi_fi = coalesce(ht.hakutyyppi_fi, 'Tieto puuttuu')
		,hakutoivenumero_fi = coalesce(cast(ht.HakutoiveNumero as varchar), 'Tieto puuttuu')
		,hakutoiveen_tila_fi = 
			CASE 
				WHEN ht.IlmoittautumisenTila in ('LASNA','LASNA_KOKO_LUKUVUOSI','LASNA_SYKSY') THEN 'Ilmoittautunut'
				WHEN ht.VastaanotonTila in ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT') THEN 'Vastaanottanut'
				WHEN ht.ValinnanTila in ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT') THEN 'Valittu'
				WHEN ht.master_oid is not null THEN 'Hakenut'
				ELSE 'Ei ole hakenut'
			END
		,koulutustyyppi_hakukohde_fi = coalesce(ht.koulutustyyppi_hakukohde_fi, 'Tieto puuttuu')
		,vaativa_erityinen_tuki_hakukohde_fi = case when ht.[ammatillinen_perustutkinto_erityisopetuksena] = 1 then 'Kyllä' else 'Ei' end

		,opiskelutoiminta_opiskelun_tarkasteluhetki_fi = coalesce(ot.opiskelutoiminta_opiskelun_tarkasteluhetki_fi, 'Ei opiskele oppiv. suor. kelp. koulutuksessa / Ei vielä tarkastelua tilastovuonna')
		,koulutustyyppi_opiskelun_tarkasteluhetki_fi = coalesce(ot.koulutustyyppi_opiskelun_tarkasteluhetki_fi, 'Tieto puuttuu')
		,hv.koulutusmuoto_hak_velv_tarkasteluhetki_fi
		,koulutusmuoto_opiskelun_tarkasteluhetki_fi = coalesce(ot.koulutusmuoto_opiskelun_tarkasteluhetki_fi, 'Tieto puuttuu')
		,hv.suorituksen_tyyppi_hak_velv_tarkasteluhetki_fi
		,suorituksen_tyyppi_opiskelun_tarkasteluhetki_fi = coalesce(ot.suorituksen_tyyppi_opiskelun_tarkasteluhetki_fi, 'Tieto puuttuu')
		,hv.erityisopetus_hak_velv_tarkasteluhetki_fi
		,erityisopetus_opiskelun_tarkasteluhetki_fi = coalesce(ot.erityisopetus_opiskelun_tarkasteluhetki_fi, 'Tieto puuttuu')

		--SV
		,hv.hak_velv_tarkasteluhetki_sv
		,opiskelun_tarkasteluhetki_sv = coalesce(ot.opiskelun_tarkasteluhetki_sv, 'Senaste / Har inte ännu granskats under statistikåret')
		,koulutuksen_alkamiskausi_hakukohde_sv = case ht.koulutuksen_alkamiskausi when 'k' then 'Vår' when 's' then 'Höst' else 'Information saknas' end

		,hv.sukupuoli_sv
		,hv.ika_sv
		,tayttanyt_18_v_opiskelun_tarkasteluhetki_sv = coalesce(ot.tayttanyt_18_v_opiskelun_tarkasteluhetki_sv, 'Nej / Har inte ännu granskats under statistikåret')
		,hv.aidinkieli_ryhma_sv
		,hv.kansalaisuus_ryhma_sv
		,hv.kotikunta_hak_velv_tarkasteluhetki_sv
		,hv.kotimaakunta_hak_velv_tarkasteluhetki_sv
		,hv.kotikunnan_hyvinvointialue_hak_velv_tarkasteluhetki_sv
		,kotikunta_opiskelun_tarkasteluhetki_sv
		,kotimaakunta_opiskelun_tarkasteluhetki_sv
		,kotikunnan_hyvinvointialue_opiskelun_tarkasteluhetki_sv
		,hv.perusopetuksen_suoritusvuosi_sv
		,hv.perusopetuksen_suorituskausi_sv
		,perusop_suor_tilastovuoden_kevaana_sv = case when hv.perusopetuksen_suoritusvuosi_sv = cast(hv.Tilastovuosi as varchar) and hv.perusopetuksen_suorituskausi_sv = 'Vår' then 'Ja' else 'Nej' end
		,hv.perusopetuksen_suorituskunta_sv
		,hv.perusopetuksen_suoritusmaakunta_sv
		,hv.pidennetty_oppivelvollisuus_sv
		,perusopetuksen_yksilollistetty_oppimaara_ja_toiminta_alueittain_jarjestetty_opetus_sv = hv.perusopetuksen_oppimaaran_yksilollistaminen_sv
	
		,hakutoiminta_sv = case when ht.master_oid is not null then 'Har sökt till utb. som inleds under statistikåret' else 'Har inte sökt till utb. som inleds under statistikåret' end
		,hakutapa_sv = coalesce(ht.hakutapa_sv, 'Information saknas')
		,hakutyyppi_sv = coalesce(ht.hakutyyppi_sv, 'Information saknas')
		,hakutoivenumero_sv = coalesce(cast(ht.HakutoiveNumero as varchar), 'Information saknas')
		,hakutoiveen_tila_sv = 
			CASE 
				WHEN ht.IlmoittautumisenTila in ('LASNA','LASNA_KOKO_LUKUVUOSI','LASNA_SYKSY') THEN 'Inskriven'
				WHEN ht.VastaanotonTila in ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT') THEN 'Mottagit plats'
				WHEN ht.ValinnanTila in ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT') THEN 'Antagen'
				WHEN ht.master_oid is not null THEN 'Har ansökt'
				ELSE 'Har inte ansökt'
			END
		,koulutustyyppi_hakukohde_sv = coalesce(ht.koulutustyyppi_hakukohde_sv, 'Information saknas')
		,vaativa_erityinen_tuki_hakukohde_sv = case when ht.[ammatillinen_perustutkinto_erityisopetuksena] = 1 then 'Kyllä' else 'Ei' end

		,opiskelutoiminta_opiskelun_tarkasteluhetki_sv = coalesce(ot.opiskelutoiminta_opiskelun_tarkasteluhetki_sv, 'Studerar inte i utb. som är godtagbar för fullgörande av läroplikten / Har inte ännu granskats under statistikåret')
		,koulutustyyppi_opiskelun_tarkasteluhetki_sv = coalesce(ot.koulutustyyppi_opiskelun_tarkasteluhetki_sv, 'Information saknas')
		,hv.koulutusmuoto_hak_velv_tarkasteluhetki_sv
		,koulutusmuoto_opiskelun_tarkasteluhetki_sv = coalesce(ot.koulutusmuoto_opiskelun_tarkasteluhetki_sv, 'Information saknas')
		,hv.suorituksen_tyyppi_hak_velv_tarkasteluhetki_sv
		,suorituksen_tyyppi_opiskelun_tarkasteluhetki_sv = coalesce(ot.suorituksen_tyyppi_opiskelun_tarkasteluhetki_sv, 'Information saknas')
		,hv.erityisopetus_hak_velv_tarkasteluhetki_sv
		,erityisopetus_opiskelun_tarkasteluhetki_sv = coalesce(ot.erityisopetus_opiskelun_tarkasteluhetki_sv, 'Information saknas')

		--JARJESTYS
		,hv.jarjestys_hak_velv_tarkasteluhetki
		,ot.jarjestys_opiskelun_tarkasteluhetki
		,jarjestys_koulutuksen_alkamiskausi_hakukohde = coalesce(ht.koulutuksen_alkamiskausi, 't')
		,hv.jarjestys_sukupuoli
		,hv.jarjestys_aidinkieli_ryhma
		,hv.jarjestys_kansalaisuus_ryhma
		,hv.jarjestys_kotimaakunta_hak_velv_tarkasteluhetki
		,hv.jarjestys_kotikunnan_hyvinvointialue_hak_velv_tarkasteluhetki
		,jarjestys_kotimaakunta_opiskelun_tarkasteluhetki
		,jarjestys_kotikunnan_hyvinvointialue_opiskelun_tarkasteluhetki
		,hv.jarjestys_perusopetuksen_suoritusmaakunta
		,hv.jarjestys_perusopetuksen_suoritusvuosi
		,hv.jarjestys_pidennetty_oppivelvollisuus
		,jarjestys_perusopetuksen_yksilollistetty_oppimaara_ja_toiminta_alueittain_jarjestetty_opetus = hv.jarjestys_perusopetuksen_oppimaaran_yksilollistaminen
		,jarjestys_perusopetuksen_suorituskausi = left(hv.perusopetuksen_suorituskausi_fi, 1)
		,jarjestys_hakutapa = coalesce(ht.jarjestys_hakutapa, '99999')
		,jarjestys_hakutyyppi = coalesce(ht.jarjestys_hakutyyppi, '99999')																							  
		,jarjestys_hakutoiveen_tila = 
			CASE 
				WHEN ht.IlmoittautumisenTila in ('LASNA','LASNA_KOKO_LUKUVUOSI','LASNA_SYKSY') THEN 1
				WHEN ht.VastaanotonTila in ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT') THEN 2
				WHEN ht.ValinnanTila in ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT') THEN 3
				WHEN ht.master_oid is not null THEN 4
				ELSE 5
			END
		,jarjestys_koulutustyyppi_hakukohde = coalesce(nullif(ht.koulutustyyppi_hakukohde_fi, 'Tieto puuttuu'), 'öööö')
		,jarjestys_koulutustyyppi_opiskelun_tarkasteluhetki = coalesce(nullif(ot.koulutustyyppi_opiskelun_tarkasteluhetki_fi, 'Tieto puuttuu'), 'öööö')
		,hv.jarjestys_koulutusmuoto_hak_velv_tarkasteluhetki
		,jarjestys_koulutusmuoto_opiskelun_tarkasteluhetki = coalesce(ot.jarjestys_koulutusmuoto_opiskelun_tarkasteluhetki, 9999)
		,hv.jarjestys_suorituksen_tyyppi_hak_velv_tarkasteluhetki
		,jarjestys_suorituksen_tyyppi_opiskelun_tarkasteluhetki = coalesce(ot.jarjestys_suorituksen_tyyppi_opiskelun_tarkasteluhetki, 9999)
		,jarjestys_erityisopetus_opiskelun_tarkasteluhetki = coalesce(ot.jarjestys_erityisopetus_opiskelun_tarkasteluhetki, 9999)
		,hv.jarjestys_erityisopetus_hak_velv_tarkasteluhetki

	FROM dw.f_koski_hakeutumisvelvolliset hv
	LEFT JOIN dw.f_koski_hakeutumisvelvolliset_hakutiedot ht ON ht.master_oid = hv.master_oid AND ht.koulutuksen_alkamisvuosi = hv.tilastovuosi
	LEFT JOIN dw.f_koski_hakeutumisvelvolliset_opiskelutiedot ot ON ot.master_oid = hv.master_oid AND ot.tilastovuosi = hv.tilastovuosi

) f

GO

USE [ANTERO]