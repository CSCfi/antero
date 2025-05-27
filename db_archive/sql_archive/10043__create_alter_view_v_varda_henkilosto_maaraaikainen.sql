USE [ANTERO]
GO

/****** Object:  View [dw].[v_varda_henkilosto_maaraaikainen]    Script Date: 19.8.2024 12:44:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





















CREATE OR ALTER   VIEW [dw].[v_varda_henkilosto_maaraaikainen] AS

	SELECT

		hl.tilastovuosi as tilastovuosi_fi,
		hl.tilastovuosi as tilastovuosi_sv,
		hl.tilastovuosi as tilastovuosi_en,
		kalenteri.kuukausi_fi as tilastokuukausi_fi,
		kalenteri.kuukausi_sv as tilastokuukausi_sv,
		kalenteri.kuukausi_en as tilastokuukausi_en,

	-- apusarakkeet

		hl.henkilo_id as apusarake_henkilo_id,
		hl.tyontekija_id as apusarake_tyontekija_id,
		hl.vakajarjestaja_id as apusarake_vakajarjestaja_id,
		hl.toimipaikka_oid as apusarake_toimipaikka_oid,

	-- henkilömuuttujat
		
		ikar.ikaryhma8_fi as ikaryhma_fi,
		ikar.ikaryhma8_sv as ikaryhma_sv,
		ikar.ikaryhma8_en as ikaryhma_en,

		sukup.sukupuoli_fi as sukupuoli_fi,
		sukup.sukupuoli_sv as sukupuoli_sv,
		sukup.sukupuoli_en as sukupuoli_en,

		tn.nimi_fi as tehtavanimike_fi,
		tn.nimi_sv as tehtavanimike_sv,
		tn.nimi_en as tehtavanimike_en,

		ts.nimi_fi as palvelusuhteen_tyyppi_fi,
		ts.nimi_sv as palvelusuhteen_tyyppi_sv,
		ts.nimi_en as palvelusuhteen_tyyppi_en,

		ta.nimi_fi as tyoaika_fi,
		ta.nimi_sv as tyoaika_sv,
		ta.nimi_en as tyoaika_en,

		kytkin.kytkin_fi as kelpoisuus_fi,
		kytkin.kytkin_sv as kelpoisuus_sv,
		kytkin.kytkin_en as kelpoisuus_en,

		mkl.nimi_fi as maaraaikaisuuden_kesto_fi,
		mkl.nimi_sv as maaraaikaisuuden_kesto_sv,
		mkl.nimi_en as maaraaikaisuuden_kesto_en,

	-- koulutusmuuttujat


	-- organisaatiomuuttujat
		
		alue.kunta_fi as toimipaikan_kunta_fi,
		alue.kunta_en as toimipaikan_kunta_en,
		alue.kunta_sv as toimipaikan_kunta_sv,
		alue.maakunta_fi as toimipaikan_maakunta_fi,
		alue.maakunta_en as toimipaikan_maakunta_en,
		alue.maakunta_sv as toimipaikan_maakunta_sv,
		alue.kuntaryhma_fi as toimipaikan_kuntaryhma_fi,
		alue.kuntaryhma_sv as toimipaikan_kuntaryhma_sv,
		alue.kuntaryhma_en as toimipaikan_kuntaryhma_en,
		
		alue2.kunta_fi as vakajarjestajan_kunta_fi,
		alue2.kunta_en as vakajarjestajan_kunta_en,
		alue2.kunta_sv as vakajarjestajan_kunta_sv,
		alue2.maakunta_fi as vakajarjestajan_maakunta_fi,
		alue2.maakunta_en as vakajarjestajan_maakunta_en,
		alue2.maakunta_sv as vakajarjestajan_maakunta_sv,
		alue2.kuntaryhma_fi as vakajarjestajan_kuntaryhma_fi,
		alue2.kuntaryhma_sv as vakajarjestajan_kuntaryhma_sv,
		alue2.kuntaryhma_en as vakajarjestajan_kuntaryhma_en,

		tpluok.nimi_fi as toimipaikkojen_maara_fi,
		tpluok.nimi_sv as toimipaikkojen_maara_sv,
		tpluok.nimi_en as toimipaikkojen_maara_en,
		
		CASE WHEN tm.kuvaus_fi is null THEN 'Kiertävät työntekijät' ELSE tm.kuvaus_fi END as toimintamuoto_fi,
		CASE WHEN tm.kuvaus_sv is null THEN 'Ambulerande arbetstagare' ELSE tm.kuvaus_sv END as toimintamuoto_sv,
		CASE WHEN tm.kuvaus_en is null THEN 'Information missing' ELSE tm.kuvaus_en END as toimintamuoto_en,

		yl.yritysmuoto_ryhma_fi as yritysmuotoryhma_fi,
		yl.yritysmuoto_ryhma_sv as yritysmuotoryhma_sv,
		yl.yritysmuoto_ryhma_en as yritysmuotoryhma_en,
		yl.yritys_tyyppi as yritystyyppi_fi,
		yl.yritys_tyyppi_sv as yritystyyppi_sv,
		yl.yritys_tyyppi_en as yritystyyppi_en,

		coalesce(kk.nimi_fi, 'ei kielipainotusta') as toimipaikan_kielipainotus_fi,
		coalesce(kk.nimi_en, 'Other') as toimipaikan_kielipainotus_en,
		coalesce(kk.nimi_sv, 'okänt') as toimipaikan_kielipainotus_sv,
	
	-- koodimuuttujat

	-- järjestysmuuttujat

		kalenteri.kuukausi as jarjestys_tilastokuukausi,
		ikar.jarjestys_ikaryhma8 as jarjestys_ikaryhma,
		sukup.jarjestys_sukupuoli_koodi as jarjestys_sukupuoli,
		tm.jarjestys as jarjestys_toimintamuoto,
		tn.jarjestys as jarjestys_tehtavanimike,
		mkl.jarjestys as jarjestys_maaraaikaisuuden_kesto


	FROM ANTERO.dw.f_varda_henkilosto_maaraaikainen hl
	LEFT JOIN ANTERO.dw.d_ika ikar on ikar.id = d_ikaryhma_id
	LEFT JOIN ANTERO.dw.d_alueluokitus alue on alue.id = d_alueluokitus_toimipaikka_id
	LEFT JOIN ANTERO.dw.d_alueluokitus alue2 on alue2.id = d_alueluokitus_vakajarjestaja_id
	LEFT JOIN ANTERO.dw.d_varda_yritysluokitus yl on yl.id = d_varda_yritysmuoto_id
	LEFT JOIN ANTERO.dw.d_sukupuoli sukup on sukup.id = d_sukupuoli
	LEFT JOIN ANTERO.dw.d_varda_toimintamuoto tm on tm.id = d_varda_toimintamuoto_id
	LEFT JOIN ANTERO.dw.d_varda_tehtavanimike tn on tn.id = d_varda_tehtavanimike_id
	LEFT JOIN ANTERO.dw.d_kytkin kytkin on kytkin.id = d_kelpoisuus_id
	LEFT JOIN ANTERO.dw.d_varda_toimipaikkaluokitus tpluok on tpluok.id = d_varda_toimipaikkaluokitus_id
	LEFT JOIN ANTERO.dw.d_varda_tyosuhde ts on ts.id = d_varda_tyosuhde_id
	LEFT JOIN ANTERO.dw.d_varda_tyoaika ta on ta.id = d_varda_tyoaika_id
	LEFT JOIN ANTERO.dw.f_varda_kielipainotus kp on kp.tilastovuosi_toimipaikka_oid = CONCAT(hl.tilastovuosi, '_', hl.toimipaikka_oid) 
	LEFT JOIN ANTERO.dw.d_varda_kielikoodistoopetushallinto kk on kk.id = kp.d_varda_kielikoodistoopetushallinto_id
	LEFT JOIN ANTERO.dw.d_varda_maaraaikaisuuden_kesto_luokitus mkl on mkl.id = d_varda_maaraaikaisuuden_kesto_id
	LEFT JOIN ANTERO.dw.d_kalenteri kalenteri on kalenteri.id = d_kalenteri_id
	
	
--tilapäinen rajaus, poista myöhemmin	
	WHERE hl.tilastovuosi between 2022 and 2023 and ts.nimi_fi = 'Määräaikainen'
































GO


