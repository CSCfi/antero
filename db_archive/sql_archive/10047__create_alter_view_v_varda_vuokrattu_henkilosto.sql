USE [ANTERO]
GO

/****** Object:  View [dw].[v_varda_vuokrattu_henkilosto]    Script Date: 19.8.2024 12:47:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

























CREATE OR ALTER   VIEW [dw].[v_varda_vuokrattu_henkilosto] AS

	SELECT

		vhl.tilastovuosi as tilastovuosi_fi,
		vhl.tilastovuosi as tilastovuosi_sv,
		vhl.tilastovuosi as tilastovuosi_en,
		kalenteri.kuukausi_fi as tilastokuukausi_fi,
		kalenteri.kuukausi_sv as tilastokuukausi_sv,
		kalenteri.kuukausi_en as tilastokuukausi_en,

	-- apusarakkeet

		vhl.tyontekijamaara_id as apusarake_tyontekijamaara_id,
		vhl.tyontekijamaara as apusarake_tyontekijamaara,
		vhl.tuntimaara as apusarake_tuntimaara,
		vhl.vakajarjestaja_id as apusarake_vakajarjestaja_id,


	-- henkilömuuttujat
		
	-- koulutusmuuttujat

	-- organisaatiomuuttujat
		
		alue.kunta_fi as vakajarjestajan_kunta_fi,
		alue.kunta_en as vakajarjestajan_kunta_en,
		alue.kunta_sv as vakajarjestajan_kunta_sv,

		alue.maakunta_fi as vakajarjestajan_maakunta_fi,
		alue.maakunta_en as vakajarjestajan_maakunta_en,
		alue.maakunta_sv as vakajarjestajan_maakunta_sv,

		alue.kuntaryhma_fi as vakajarjestajan_kuntaryhma_fi,
		alue.kuntaryhma_sv as vakajarjestajan_kuntaryhma_sv,
		alue.kuntaryhma_en as vakajarjestajan_kuntaryhma_en,

		yl.yritysmuoto_ryhma_fi as yritysmuotoryhma_fi,
		yl.yritysmuoto_ryhma_sv as yritysmuotoryhma_sv,
		yl.yritysmuoto_ryhma_en as yritysmuotoryhma_en,

		yl.yritys_tyyppi as yritystyyppi_fi,
		yl.yritys_tyyppi_sv as yritystyyppi_sv,
		yl.yritys_tyyppi_en as yritystyyppi_en,

		tpluok.nimi_fi as toimipaikkamaara_fi,
		tpluok.nimi_sv as toimipaikkamaara_sv,
		tpluok.nimi_en as toimipaikkamaara_en,

	
	-- koodimuuttujat

	-- järjestysmuuttujat

		tpluok.jarjestys as jarjestys_toimipaikkamaara,
		kalenteri.kuukausi as jarjestys_kuukausi


	FROM ANTERO.dw.f_varda_vuokrattu_henkilosto vhl
	LEFT JOIN ANTERO.dw.d_alueluokitus alue on alue.id = d_alueluokitus_id
	LEFT JOIN ANTERO.dw.d_varda_yritysluokitus yl on yl.id = d_varda_yritysmuoto_id
	LEFT JOIN ANTERO.dw.d_varda_toimipaikkaluokitus tpluok on tpluok.id = d_varda_toimipaikkaluokitus_id
	LEFT JOIN ANTERO.dw.d_kalenteri kalenteri on kalenteri.id = d_kalenteri_id

	WHERE vhl.tilastovuosi between 2022 and 2023
		























GO


