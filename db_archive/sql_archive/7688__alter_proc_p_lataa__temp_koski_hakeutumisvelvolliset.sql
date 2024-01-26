USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa__temp_koski_hakeutumisvelvolliset]    Script Date: 4.5.2023 16:41:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






--exec [dw].[p_lataa__temp_koski_hakeutumisvelvolliset]

ALTER PROCEDURE [dw].[p_lataa__temp_koski_hakeutumisvelvolliset] AS

drop table if exists dw._temp_koski_hakeutumisvelvolliset

select * into dw._temp_koski_hakeutumisvelvolliset 
from
(
	select distinct

	--apu
	f.oppija_oid
	,[koodit_koulutusnimike_hv] = coalesce(d6.koulutusluokitus_koodi, '-1')

	--aika
	,[Tilastovuosi] = f.[tilastovuosi]
    ,[Hak.velv. tarkasteluhetki] = concat(d11.kuukausi_fi, 'n ', day(f.ajankohta), '.')

	--hlö
	,[Sukupuoli] = d1.sukupuoli_fi
	,[Ikä] = d2.ika_fi
	,[Syntymävuosi] = f.syntymavuosi
	,[Äidinkieli (ryhmä)] = d4.kieliryhma2_fi
	,[Kansalaisuus (ryhmä)] = d5.maanosa1_fi
	,[Kotikunta] = d3.kunta_fi
	,[Kotimaakunta] = d3.maakunta_fi
	,[Perusop. suorituskunta] = coalesce(d15b.kunta_fi, 'Tieto puuttuu')
	,[Perusop. suoritusmaakunta] = coalesce(d15b.maakunta_fi, 'Tieto puuttuu')
	,[Perusop. suoritusvuosi] = coalesce(nullif(cast(d18.vuosi as varchar), '-1'), 'Ei perusop. oppimäärää suoritettu')
	,[Perusop. suorituskausi] = d18.lukukausi_fi
	
	--koulutus
	,[Oppiv. suor. kelp. koul. (hak.velv. tarkasteluhetki)] = case when f.oppivelvollisuuden_suorittamiseen_kelpaava_hv = 1 then 'Kyllä' else 'Ei' end
	,[Koulutusmuoto (hak.velv. tarkasteluhetki)] = d7.selite_fi
	,[Suorituksen tyyppi (hak.velv. tarkasteluhetki)] = d8.selite_fi

	--jarjestys
	,[jarjestys_hak_velv_tarkasteluhetki] = concat(10+f.tilastokuukausi, 10+day(f.ajankohta))
	,[jarjestys_sukupuoli] = d1.jarjestys_sukupuoli_koodi
	,[jarjestys_aidinkieli_ryhma] = d4.jarjestys_kieliryhma2
	,[jarjestys_kansalaisuus_ryhma] = d5.jarjestys_maanosa1_koodi
	,[jarjestys_kotimaakunta] = d3.jarjestys_maakunta_koodi
	,[jarjestys_perusop_suoritusmaakunta] = coalesce(d15b.jarjestys_maakunta_koodi, '9999')
	,[jarjestys_perusop_suoritusvuosi] = 3000 - d18.vuosi
	,[jarjestys_koulutusmuoto_hak_velv_tarkasteluhetki] = d7.jarjestys
	,[jarjestys_suorituksen_tyyppi_hak_velv_tarkasteluhetki] = d8.jarjestys
	
	FROM [dw].[f_koski_oppivelvolliset] f
	LEFT JOIN [dw].[d_sukupuoli] d1 on d1.id = f.d_sukupuoli_id 
	LEFT JOIN [dw].[d_ika] d2 on d2.id = f.d_ika_id 
	LEFT JOIN [dw].[d_alueluokitus] d3 on d3.id = f.d_alueluokitus_id 
	LEFT JOIN [dw].[d_kieli] d4 on d4.id = f.d_kieli_id 
	LEFT JOIN [dw].[d_maatjavaltiot2] d5 on d5.id = f.d_kansalaisuus_id
	LEFT JOIN [dw].[d_koulutusluokitus] d6 on d6.koulutusluokitus_koodi = f.koulutusmoduuli_koodiarvo_hv
	LEFT JOIN [dw].[d_koski_koulutusmuoto] d7 on d7.koodi = f.koulutusmuoto_hv
	LEFT JOIN [dw].[d_koski_suorituksen_tyyppi] d8 on d8.koodi = f.suorituksen_tyyppi_hv
	LEFT JOIN [dw].[d_kalenteri] d11 on d11.kalenteri_avain = f.ajankohta
	LEFT JOIN [dw].[d_organisaatioluokitus] d14b on d14b.organisaatio_oid = f.perusopetuksen_oppilaitos_oid_hv
	LEFT JOIN [dw].[d_alueluokitus] d15b on d15b.kunta_koodi = d14b.kunta_koodi
	LEFT JOIN [dw].[d_kalenteri] d18 on d18.id = f.d_kalenteri_perusopetuksen_oppimaara_suoritettu_pvm_id
	LEFT JOIN (
		select distinct vuosi, oppija_oid
		from dw.f_koski_esi_ja_perus_oppilaat_ja_paattaneet_lukuvuosittain f
		join dw.d_vuosiluokka_tai_koulutus d on d.id = f.d_vuosiluokka_id
		where d.vuosiluokka_fi = '8. vuosiluokka' and vuosi > 2020
	) kasilla on kasilla.oppija_oid = f.oppija_oid and kasilla.vuosi = f.tilastovuosi

	WHERE f.tilastokuukausi between 1 and 7
	AND NOT (
		f.oppivelvollisen_toiminta in ('1','2','3','4','8','9')
		OR (f.oppivelvollisen_toiminta = '7' and f.suorituksen_tyyppi = 'telma')
		OR (f.oppivelvollisen_toiminta = '7' and f.suorituksen_tyyppi  = 'perusopetukseenvalmistavaopetus' and d2.ika_fi = '16')
		OR (kasilla.vuosi is not null and d2.ika_fi = '16')
	)

) q

GO


