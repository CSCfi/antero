USE [ANTERO]
GO

/****** Object:  View [dw].[v_varda_vakajarjestajat_toimipaikat]    Script Date: 7.9.2022 13:34:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dw].[v_varda_vakajarjestajat_toimipaikat] AS

		SELECT
			tp.tilastovuosi as tilastovuosi_fi,
			tp.tilastovuosi as tilastovuosi_sv,
			tp.tilastovuosi as tilastovuosi_en,
			CASE 
				WHEN yl.yritys_tyyppi = 'Yksityinen' THEN NULL
				ELSE do.organisaatio_fi
			END as organisaatio_fi,
			CASE 
				WHEN yl.yritys_tyyppi = 'Yksityinen' THEN NULL
				ELSE do.organisaatio_en
			END as organisaatio_en,
			CASE 
				WHEN yl.yritys_tyyppi = 'Yksityinen' THEN NULL
				ELSE do.organisaatio_sv
			END as organisaatio_sv,
			yl.yritys_tyyppi as yritystyyppi_fi,
			CASE
				WHEN yl.yritys_tyyppi = 'Yksityinen' THEN 'Privat'
				WHEN yl.yritys_tyyppi = 'Kunta' THEN 'Kommun'
			END as yritystyyppi_sv,
			CASE
				WHEN yl.yritys_tyyppi = 'Yksityinen' THEN 'Private'
				WHEN yl.yritys_tyyppi = 'Kunta' THEN 'Municipality'
			END as yritystyyppi_en,
			yl.nimi_fi as yritysmuoto_fi,
			yl.nimi_en as yritysmuoto_en,
			yl.nimi_sv as yritysmuoto_sv,

			alue3.kunta_fi as toimipaikan_kunta_fi,
			alue3.kunta_en as toimipaikan_kunta_en,
			alue3.kunta_sv as toimipaikan_kunta_sv,
			alue3.maakunta_fi as toimipaikan_maakunta_fi,
			alue3.maakunta_en as toimipaikan_maakunta_en,
			alue3.maakunta_sv as toimipaikan_maakunta_sv,

			jm.kuvaus_fi as jarjestamismuoto_fi,
			jm.kuvaus_sv as jarjestamismuoto_sv,
			jm.kuvaus_en as jarjestamismuoto_en,

			coalesce(kk.nimi_fi, 'tuntematon') as toimipaikan_kielipainotus_fi,
			coalesce(kk.nimi_en, 'Other') as toimipaikan_kielipainotus_en,
			coalesce(kk.nimi_sv, 'okänt') as toimipaikan_kielipainotus_sv,

			vtpa.nimi_fi as toimipaikan_toiminnallinen_painotus_fi,
			vtpa.nimi_sv as toimipaikan_toiminnallinen_painotus_sv,
			vtpa.nimi_en as toimipaikan_toiminnallinen_painotus_en,

			alue2.kunta_fi as varhaiskasvatustoimijan_kunta_fi,
			alue2.kunta_sv as varhaiskasvatustoimijan_kunta_sv,
			alue2.kunta_en as varhaiskasvatustoimijan_kunta_en,
			alue2.maakunta_fi as varhaiskasvatustoimijan_maakunta_fi,
			alue2.maakunta_en as varhaiskasvatustoimijan_maakunta_en,
			alue2.maakunta_sv as varhaiskasvatustoimijan_maakunta_sv,
			yl.nimi_fi as yritysluokitus_fi,
			yl.nimi_en as yritysluokitus_en,
			yl.nimi_sv as yritysluokitus_sv,
			yl.yritysmuoto_ryhma_fi as yritysmuotoryhma_fi,
			yl.yritysmuoto_ryhma_en as yritysmuotoryhma_en,
			yl.yritysmuoto_ryhma_sv as yritysmuotoryhma_sv,
			kj.nimi_fi as kasvatusopillinen_jarjestelma_fi,
			kj.nimi_en as kasvatusopillinen_jarjestelma_en,
			kj.nimi_sv as kasvatusopillinen_jarjestelma_sv,
			tm.nimi_fi as toimintamuoto_fi,
			tm.nimi_en as toimintamuoto_en,
			tm.nimi_sv as toimintamuoto_sv,	 
			tl.nimi_fi as toimipaikkaluokitus_fi,
			tl.nimi_en as toimipaikkaluokitus_en,
			tl.nimi_sv as toimipaikkaluokitus_sv,
			
			vpl.nimi_fi as varhaiskasvatuspaikkojen_luokka_fi,
			vpl.nimi_en as varhaiskasvatuspaikkojen_luokka_en,
			vpl.nimi_sv as varhaiskasvatuspaikkojen_luokka_sv,		
			
			-- apusarakkeet
			c2.henkilo_id as apusarake_henkilo_id,
			tp.varhaiskasvatuspaikat as apusarake_varhaiskasvatuspaikat,
			CASE 
				WHEN tp.toimipaikka_oid = '' THEN null 
				ELSE tp.toimipaikka_oid 
			END as apusarake_toimipaikka_oid,
			yl.id as apusarake_yritystyyppi_id,
			tp.vakajarjestaja_id as apusarake_vakajarjestaja_id,

			-- koodimuuttujat
			alue3.kunta_koodi as koodit_kotikunta,
			null as koodit_organisaatio,

			-- järjestysmuuttujat
			vpl.jarj_nro as jarjestys_varhaiskasvatuspaikkojen_luokka,
			tm.jarjestys as jarjestys_toimintamuoto

		FROM ANTERO.dw.f_varda_vakajarjestajat_toimipaikat tp
		LEFT JOIN ANTERO.dw.d_alueluokitus alue2 on alue2.id = d_alueluokitus_vakajarjestaja_kunta_id
		LEFT JOIN ANTERO.dw.d_alueluokitus alue3 on alue3.id = tp.d_alueluokitus_toimipaikka_kunta_id
		LEFT JOIN ANTERO.dw.d_varda_kasvatusopillinenjarjestelma kj on kj.id = tp.d_varda_toimipaikka_kasvatusopillinen_jarjestelma_id
		LEFT JOIN ANTERO.dw.d_varda_toimintamuoto tm on tm.id = tp.d_varda_toimipaikka_toimintamuoto_id
		--LEFT JOIN ANTERO.dw.d_varda_jarjestamismuoto jm ON tp. = jm.id
		LEFT JOIN ANTERO.dw.d_varda_yritysluokitus yl on yl.id = tp.d_varda_yritysluokitus_id
		LEFT JOIN ANTERO.dw.d_varda_toimipaikkaluokitus tl on tl.id = tp.d_varda_toimipaikkaluokitus_id
		LEFT JOIN ANTERO.dw.d_varda_varhaiskasvatuspaikkaluokitus vpl on vpl.id = tp.d_varda_varhaiskasvatuspaikkaluokitus_id
		LEFT JOIN ANTERO.dw.f_varda_kielipainotus kp on kp.tilastovuosi_toimipaikka_oid = CONCAT(tp.tilastovuosi, '_', tp.toimipaikka_oid) 
		LEFT JOIN  ANTERO.dw.d_varda_kielikoodistoopetushallinto kk on kk.id = kp.d_varda_kielikoodistoopetushallinto_id
		LEFT JOIN ANTERO.dw.f_varda_toimintapainotus vtp on vtp.tilastovuosi_toimipaikka_oid = CONCAT(tp.tilastovuosi, '_', tp.toimipaikka_oid) 
		LEFT JOIN  ANTERO.dw.d_varda_toiminnallinenpainotus vtpa on vtpa.id = vtp.d_varda_toiminnallinenpainotus_id
		-- Lasten lkm toiseen tauluun
		LEFT JOIN (
			SELECT DISTINCT
				tilastovuosi, 
				vakasuhde_toimipaikka_id, 
				henkilo_id,
				henkilo_syntyma_pvm
			FROM ANTERO.dw.f_varda_vakasuhteet_vakapaatokset
		) c2 on tp.tilastovuosi = c2.tilastovuosi and tp.toimipaikka_id = c2.vakasuhde_toimipaikka_id and DATEDIFF(year,c2.henkilo_syntyma_pvm, cast(concat(tp.tilastovuosi, '-12-31') as date)) <= 10
		--Järjestämismuodot
		LEFT JOIN (
			SELECT 
				tilastovuosi_toimipaikka_oid, 
				d_varda_jarjestamismuoto_id 
			FROM (
				SELECT 
					tilastovuosi_toimipaikka_oid,
					d_varda_jarjestamismuoto_id_jm01,
					d_varda_jarjestamismuoto_id_jm02,
					d_varda_jarjestamismuoto_id_jm03,
					d_varda_jarjestamismuoto_id_jm04,
					d_varda_jarjestamismuoto_id_jm05
				FROM ANTERO.dw.f_varda_jarjestamismuoto) p
			UNPIVOT (
				d_varda_jarjestamismuoto_id FOR koodi IN (
					d_varda_jarjestamismuoto_id_jm01, d_varda_jarjestamismuoto_id_jm02, d_varda_jarjestamismuoto_id_jm03, d_varda_jarjestamismuoto_id_jm04, d_varda_jarjestamismuoto_id_jm05
				)
			) AS unpvt
		
		) jm_unpvt on jm_unpvt.tilastovuosi_toimipaikka_oid = CONCAT(tp.tilastovuosi, '_', tp.toimipaikka_oid) 
		LEFT JOIN ANTERO.dw.d_varda_jarjestamismuoto jm on jm.id = jm_unpvt.d_varda_jarjestamismuoto_id
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus do on do.id = tp.d_organisaatioluokitus_vakajarjestaja_id
		WHERE tp.tilastovuosi = 2021


GO

USE [ANTERO]