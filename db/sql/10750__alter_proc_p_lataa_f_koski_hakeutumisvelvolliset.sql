USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_hakeutumisvelvolliset]    Script Date: 15.4.2025 11.48.14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER   PROCEDURE  [dw].[p_lataa_f_koski_hakeutumisvelvolliset] AS

DROP TABLE IF EXISTS dw.f_koski_hakeutumisvelvolliset

SELECT * INTO dw.f_koski_hakeutumisvelvolliset 
FROM 
(	
	SELECT DISTINCT
		f.master_oid
		--,[koodit_koulutusnimike_hv] = coalesce(d6.koulutusluokitus_koodi, '-1')
		,f.oppivelvollisuuden_suorittamiseen_kelpaava_hv
	
		,f.tilastovuosi
		,f.syntymavuosi

		--FI
		,hak_velv_tarkasteluhetki_fi = concat(d11.kuukausi_fi, 'n ', day(f.ajankohta), '.')

		,d1.sukupuoli_fi
		,d2.ika_fi
		,aidinkieli_ryhma_fi = d4.kieliryhma2_fi
		,kansalaisuus_ryhma_fi = d5.maanosa1_fi
		,kotikunta_hak_velv_tarkasteluhetki_fi = d3.kunta_fi
		,kotimaakunta_hak_velv_tarkasteluhetki_fi = d3.maakunta_fi
		,kotikunnan_hyvinvointialue_hak_velv_tarkasteluhetki_fi = d3.hyvinvointialue_fi
		,perusopetuksen_suorituskunta_fi = coalesce(d15b.kunta_fi, 'Tieto puuttuu')
		,perusopetuksen_suoritusmaakunta_fi = coalesce(d15b.maakunta_fi, 'Tieto puuttuu')
		,perusopetuksen_suoritusvuosi_fi = coalesce(nullif(cast(d18.vuosi as varchar), '-1'), 'Ei perusopetuksen oppimäärää')
		,perusopetuksen_suorituskausi_fi = d18.lukukausi_fi
		,pidennetty_oppivelvollisuus_fi = d19.selite_fi
		,perusopetuksen_oppimaaran_yksilollistaminen_fi = d20.selite_fi
	
		,koulutusmuoto_hak_velv_tarkasteluhetki_fi = d7.selite_fi
		,suorituksen_tyyppi_hak_velv_tarkasteluhetki_fi = d8.selite_fi
		,erityisopetus_hak_velv_tarkasteluhetki_fi = d21.erityisopetus_ryhma_fi

		--SV
		,hak_velv_tarkasteluhetki_sv = concat(day(f.ajankohta), ' ', d11.kuukausi_sv)

		,d1.sukupuoli_sv
		,d2.ika_sv
		,aidinkieli_ryhma_sv = d4.kieliryhma2_sv
		,kansalaisuus_ryhma_sv = d5.maanosa1_sv
		,kotikunta_hak_velv_tarkasteluhetki_sv = d3.kunta_sv
		,kotimaakunta_hak_velv_tarkasteluhetki_sv = d3.maakunta_sv
		,kotikunnan_hyvinvointialue_hak_velv_tarkasteluhetki_sv = d3.hyvinvointialue_sv
		,perusopetuksen_suorituskunta_sv = coalesce(d15b.kunta_sv, 'Information saknas')
		,perusopetuksen_suoritusmaakunta_sv = coalesce(d15b.maakunta_sv, 'Information saknas')
		,perusopetuksen_suoritusvuosi_sv = coalesce(nullif(cast(d18.vuosi as varchar), '-1'), 'Ingen lärokurs för den grundläggande utbildningen')
		,perusopetuksen_suorituskausi_sv = d18.lukukausi_sv
		,pidennetty_oppivelvollisuus_sv = d19.selite_sv
		,perusopetuksen_oppimaaran_yksilollistaminen_sv = d20.selite_sv
	
		,oppivelvollisuuden_suorittamiseen_kelpaavassa_koulutuksessa_sv = case when f.oppivelvollisuuden_suorittamiseen_kelpaava_hv = 1 then 'Ja' else 'Nej' end
		,koulutusmuoto_hak_velv_tarkasteluhetki_sv = d7.selite_sv
		,suorituksen_tyyppi_hak_velv_tarkasteluhetki_sv = d8.selite_sv
		,erityisopetus_hak_velv_tarkasteluhetki_sv = d21.erityisopetus_ryhma_sv

		--JARJESTYS
		,[jarjestys_hak_velv_tarkasteluhetki] = concat(10+f.tilastokuukausi, 10+day(f.ajankohta))
		,[jarjestys_sukupuoli] = d1.jarjestys_sukupuoli_koodi
		,[jarjestys_aidinkieli_ryhma] = d4.jarjestys_kieliryhma2
		,[jarjestys_kansalaisuus_ryhma] = d5.jarjestys_maanosa1_koodi
		,[jarjestys_kotimaakunta_hak_velv_tarkasteluhetki] = d3.jarjestys_maakunta_koodi
		,[jarjestys_kotikunnan_hyvinvointialue_hak_velv_tarkasteluhetki] = d3.jarjestys_hyvinvointialue_koodi
		,[jarjestys_perusopetuksen_suoritusmaakunta] = coalesce(d15b.jarjestys_maakunta_koodi, '9999')
		,[jarjestys_perusopetuksen_suoritusvuosi] = 3000 - d18.vuosi
		,[jarjestys_koulutusmuoto_hak_velv_tarkasteluhetki] = d7.jarjestys
		,[jarjestys_suorituksen_tyyppi_hak_velv_tarkasteluhetki] = d8.jarjestys
		,[jarjestys_pidennetty_oppivelvollisuus] = d19.jarjestys
		,[jarjestys_perusopetuksen_oppimaaran_yksilollistaminen] = d20.jarjestys
		,[jarjestys_erityisopetus_hak_velv_tarkasteluhetki] = d21.jarjestys_erityisopetus_ryhma
	
	FROM [dw].[f_koski_oppivelvolliset] f
	LEFT JOIN [dw].[d_sukupuoli] d1 on d1.id = f.d_sukupuoli_id 
	LEFT JOIN [dw].[d_ika] d2 on d2.id = f.d_ika_id 
	LEFT JOIN [dw].[d_alueluokitus] d3 on d3.kunta_koodi = coalesce(f.kotikunta_hv, -1)
	LEFT JOIN [dw].[d_kieli] d4 on d4.id = f.d_kieli_id 
	LEFT JOIN [dw].[d_maatjavaltiot2] d5 on d5.id = f.d_kansalaisuus_id
	LEFT JOIN [dw].[d_koulutusluokitus] d6 on d6.koulutusluokitus_koodi = f.koulutusmoduuli_koodiarvo_hv
	LEFT JOIN [dw].[d_koski_koulutusmuoto] d7 on d7.koodi = f.koulutusmuoto_hv
	LEFT JOIN [dw].[d_koski_suorituksen_tyyppi] d8 on d8.koodi = f.suorituksen_tyyppi_hv
	LEFT JOIN [dw].[d_kalenteri] d11 on d11.kalenteri_avain = f.ajankohta
	LEFT JOIN [dw].[d_organisaatioluokitus] d14b on d14b.organisaatio_oid = f.perusopetuksen_oppilaitos_oid_hv
	LEFT JOIN [dw].[d_alueluokitus] d15b on d15b.kunta_koodi = d14b.kunta_koodi
	LEFT JOIN [dw].[d_kalenteri] d18 on d18.id = f.d_kalenteri_perusopetuksen_oppimaara_suoritettu_pvm_id
	LEFT JOIN [dw].[d_pidennetty_oppivelvollisuus] d19 on f.d_pidennetty_oppivelvollisuus_id = d19.id
	LEFT JOIN [dw].[d_perusopetuksen_oppimaaran_yksilollistaminen] d20 on d20.id = f.d_perusopetuksen_oppimaaran_yksilollistaminen_hv_id
	LEFT JOIN [dw].[d_erityisopetus] d21 on d21.id = f.d_erityisopetus_hv_id
	LEFT JOIN (
		select distinct vuosi, oppija_oid
		from dw.f_koski_esi_ja_perus_oppilaat_ja_paattaneet_lukuvuosittain f
		join dw.d_vuosiluokka_tai_koulutus d on d.id = f.d_vuosiluokka_id
		where d.vuosiluokka_fi = '8. vuosiluokka' and vuosi > year(getdate()) - 4
	) kasilla on kasilla.oppija_oid = f.master_oid and kasilla.vuosi = f.tilastovuosi

	WHERE 1=1
	AND f.tilastovuosi > year(getdate()) - 4
	AND f.tilastokuukausi between 1 and 7
	AND NOT (
		f.oppivelvollisen_toiminta in ('1','2','3','4','5','9','10','11')
		OR (f.oppivelvollisen_toiminta = '8' and f.suorituksen_tyyppi = 'telma')
		OR (f.oppivelvollisen_toiminta = '8' and f.suorituksen_tyyppi  = 'perusopetukseenvalmistavaopetus' and d2.ika_fi = '16')
		OR (kasilla.vuosi is not null and d2.ika_fi = '16')
	)

) q


GO

USE [ANTERO]