USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_perusopetuksen_jalkeinen_koulutus_hakeneet_ja_paikan_vastaanottaneet_esilataus]    Script Date: 17.11.2025 17.44.22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER   PROCEDURE [dw].[p_lataa_api_perusopetuksen_jalkeinen_koulutus_hakeneet_ja_paikan_vastaanottaneet_esilataus] as

DROP TABLE IF EXISTS ANTERO.sa.temp_haku_ja_valinta_api

SELECT 
	f.koulutuksen_alkamisvuosi,
	f.d_kausi_koulutuksen_alkamiskausi_id,
	f.d_hakukohde_id,
	f.d_haku_id,
	f.d_kieli_koulutus_id,
	f.d_koulutusluokitus_hakukohde_id,
	f.d_alueluokitus_hakukohde_id,
	f.d_organisaatio_koulutuksen_jarjestaja_id,
	f.d_organisaatio_oppilaitos_id,
	f.d_organisaatio_toimipiste_id,
	MIN(f2.aloituspaikat) as aloituspaikat_lkm,
	COUNT(DISTINCT henkilo_oid) as kaikki_hakijat_lkm,
	COUNT(DISTINCT CASE WHEN hakutoive = 1 THEN henkilo_oid ELSE NULL END) as ensisijaiset_hakijat_lkm,
	COUNT(DISTINCT CASE WHEN f.valinnan_tila IN ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT') THEN henkilo_oid ELSE NULL END) as valitut_lkm,
	COUNT(DISTINCT CASE WHEN f.vastaanoton_tila IN ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT') THEN henkilo_oid ELSE NULL END) as paikan_vastaanottaneet_lkm,
	COUNT(DISTINCT CASE WHEN f.ilmoittautumisen_tila IN ('LASNA','LASNA_KOKO_LUKUVUOSI','LASNA_SYKSY') THEN henkilo_oid ELSE NULL END) as aloittaneet_lkm
INTO ANTERO.sa.temp_haku_ja_valinta_api
FROM ANTERO.dw.f_haku_ja_valinta_hakeneet_toinen_aste f
LEFT JOIN ANTERO.dw.d_haku d2 ON d2.id = f.d_haku_id
LEFT JOIN ANTERO.dw.f_haku_ja_valinta_aloituspaikat_ja_pistemaarat f2 on f.d_hakukohde_id = f2.d_hakukohde_id
WHERE f.koulutuksen_alkamisvuosi > 2013 and d2.korkeakouluhaku=0 and d2.hakutapa_koodi in ('01','03')
GROUP BY f.koulutuksen_alkamisvuosi,f.d_kausi_koulutuksen_alkamiskausi_id,f.d_hakukohde_id,f.d_haku_id,f.d_kieli_koulutus_id,f.d_koulutusluokitus_hakukohde_id,f.d_alueluokitus_hakukohde_id,f.d_organisaatio_koulutuksen_jarjestaja_id,f.d_organisaatio_oppilaitos_id,f.d_organisaatio_toimipiste_id

INSERT INTO ANTERO.sa.temp_haku_ja_valinta_api
SELECT
	f.koulutuksen_alkamisvuosi,
	f.d_kausi_koulutuksen_alkamiskausi_id,
	f.d_hakukohde_id,
	f.d_haku_id,
	f.d_kieli_koulutus_id,
	f.d_koulutusluokitus_hakukohde_id,
	f.d_alueluokitus_hakukohde_id,
	f.d_organisaatio_koulutuksen_jarjestaja_id,
	f.d_organisaatio_oppilaitos_id,
	f.d_organisaatio_toimipiste_id,
	MIN(f.aloituspaikat) as aloituspaikat_lkm,
	0 as kaikki_hakijat_lkm,
	0 as ensisijaiset_hakijat_lkm,
	0 as valitut_lkm,
	0 as paikan_vastaanottaneet_lkm,
	0 as aloittaneet_lkm
FROM ANTERO.dw.f_haku_ja_valinta_aloituspaikat_ja_pistemaarat f
LEFT JOIN ANTERO.dw.d_haku d2 ON d2.id = f.d_haku_id
LEFT JOIN ANTERO.dw.d_hakukohde d3 on d3.id = f.d_hakukohde_id
WHERE f.koulutuksen_alkamisvuosi > 2013 and d2.korkeakouluhaku=0 and d2.hakutapa_koodi in ('01','03') AND f.aloituspaikat is not null
AND NOT EXISTS (
	SELECT TOP 1 haku_oid 
	FROM ANTERO.dw.f_haku_ja_valinta_hakeneet_toinen_aste f2 
	LEFT JOIN ANTERO.dw.d_hakukohde d0a on d0a.id = f2.d_hakukohde_id
	LEFT JOIN ANTERO.dw.d_haku d0b ON d0b.id = f.d_haku_id
	WHERE d0a.oid = d3.oid and f.koulutuksen_alkamisvuosi > 2013 and d2.korkeakouluhaku=0 and d2.hakutapa_koodi in ('01','03')
) 
GROUP BY f.koulutuksen_alkamisvuosi,f.d_kausi_koulutuksen_alkamiskausi_id,f.d_hakukohde_id,f.d_haku_id,f.d_kieli_koulutus_id,f.d_koulutusluokitus_hakukohde_id,f.d_alueluokitus_hakukohde_id,f.d_organisaatio_koulutuksen_jarjestaja_id,f.d_organisaatio_oppilaitos_id,f.d_organisaatio_toimipiste_id

TRUNCATE TABLE AnteroAPI.dw.api_perusopetuksen_jalkeinen_koulutus_hakeneet_ja_paikan_vastaanottaneet

INSERT INTO AnteroAPI.dw.api_perusopetuksen_jalkeinen_koulutus_hakeneet_ja_paikan_vastaanottaneet
SELECT 
	f.koulutuksen_alkamisvuosi,
	d2.selite_fi as koulutuksen_alkamiskausi,
	d25.hakuryhma_fi as haku,
	d10.selite_fi as hakukohde,
	d25.hakutapa_fi as hakutapa,
	d20.koulutusastetaso1_fi as koulutusaste_taso_1,
	d20.koulutusastetaso2_fi as koulutusaste_taso_2,
	d20.koulutusalataso1_fi as koulutusala_taso_1,
	d20.koulutusalataso2_fi as koulutusala_taso_2,
	d20.koulutusalataso3_fi as koulutusala_taso_3,
	d20.koulutusluokitus_fi as tutkinto_hakukohde,
	d27.kieli_fi as koulutuksen_kieli,
	d19.maakunta_fi as maakunta_hakukohde,
	d19.kunta_fi as kunta_hakukohde,
	d16a.organisaatio_fi as koulutuksen_jarjestaja,
	d16b.organisaatio_fi as oppilaitos,
	d16c.organisaatio_fi as toimipiste,
	d20.koulutusluokitus_koodi as koodit_tutkinto_hakukohde,
	d19.kunta_koodi as koodit_kunta_hakukohde,
	d16a.organisaatio_koodi as koodit_koulutuksen_jarjestaja,
	d16b.organisaatio_koodi as koodit_oppilaitos,
	d10.oid as koodit_hakukohde,
	f.aloituspaikat_lkm,
	f.kaikki_hakijat_lkm,
	f.ensisijaiset_hakijat_lkm,
	f.valitut_lkm,
	f.paikan_vastaanottaneet_lkm,
	f.aloittaneet_lkm
FROM ANTERO.sa.temp_haku_ja_valinta_api f
LEFT JOIN ANTERO.dw.d_haku d25 ON d25.id = f.d_haku_id
LEFT JOIN ANTERO.dw.d_kausi d2 ON d2.id = f.d_kausi_koulutuksen_alkamiskausi_id
LEFT JOIN ANTERO.dw.d_hakukohde d10 ON d10.id = f.d_hakukohde_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d16a ON d16a.id = f.d_organisaatio_koulutuksen_jarjestaja_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d16b ON d16b.id = f.d_organisaatio_oppilaitos_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d16c ON d16c.id = f.d_organisaatio_toimipiste_id
LEFT JOIN ANTERO.dw.d_alueluokitus d19 ON d19.id = f.d_alueluokitus_hakukohde_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d20 ON d20.id = f.d_koulutusluokitus_hakukohde_id
LEFT JOIN ANTERO.dw.d_kieli d27 ON d27.id=f.d_kieli_koulutus_id

DROP TABLE IF EXISTS ANTERO.sa.temp_haku_ja_valinta_api

GO


