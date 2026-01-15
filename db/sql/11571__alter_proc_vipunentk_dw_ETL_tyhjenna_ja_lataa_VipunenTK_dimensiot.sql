USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[ETL_tyhjenna_ja_lataa_VipunenTK_dimensiot]    Script Date: 15.1.2026 15.13.38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
















ALTER PROCEDURE [dbo].[ETL_tyhjenna_ja_lataa_VipunenTK_dimensiot] AS

exec dbo.p_lataa_d_1_24_taustamuuttujan_arvo;

DELETE FROM VipunenTK..d_aidinkieli_versio1;
INSERT INTO VipunenTK..d_aidinkieli_versio1
	SELECT * FROM VipunenTK_DW.[dbo].[v_aidinkieli_versio1];

DELETE FROM VipunenTK..d_aidinkieli_versio2;
INSERT INTO VipunenTK..d_aidinkieli_versio2
	SELECT * FROM VipunenTK_DW.[dbo].[v_aidinkieli_versio2];

DELETE FROM VipunenTK..d_aidinkieli_versio3;
INSERT INTO VipunenTK..d_aidinkieli_versio3
	SELECT * FROM VipunenTK_DW.[dbo].[v_aidinkieli_versio3];

DELETE FROM VipunenTK..d_aidinkieli_versio5;
INSERT INTO VipunenTK..d_aidinkieli_versio5
	SELECT * FROM VipunenTK_DW.[dbo].[v_aidinkieli_versio5];

DELETE FROM VipunenTK..d_aikuisopiskelija;
INSERT INTO VipunenTK..d_aikuisopiskelija
	SELECT * FROM VipunenTK_DW.[dbo].[v_aikuisopiskelija];

DELETE FROM VipunenTK..d_aineisto;
INSERT INTO VipunenTK..d_aineisto
	SELECT * FROM VipunenTK_DW.[dbo].[v_aineisto];

DELETE FROM VipunenTK..d_aineisto_OTV;
INSERT INTO VipunenTK..d_aineisto_OTV
	SELECT * FROM VipunenTK_DW.[dbo].[v_aineisto_OTV];

DELETE FROM VipunenTK..d_amm_sopimusjaksot;
INSERT INTO VipunenTK..d_amm_sopimusjaksot 
	SELECT * FROM VipunenTK_DW.[dbo].[v_amm_sopimusjaksot];

DELETE FROM VipunenTK.dbo.d_ammatillinen_koulutus_luokittelu
INSERT INTO VipunenTK.dbo.d_ammatillinen_koulutus_luokittelu
	SELECT * FROM VipunenTK_DW.dbo.v_ammatillinen_koulutus_luokittelu

DELETE FROM VipunenTK..d_ammatillinen_peruskoulutus_lisakoulutus;
INSERT INTO VipunenTK..d_ammatillinen_peruskoulutus_lisakoulutus
	SELECT * FROM VipunenTK_DW.[dbo].[v_ammatillinen_peruskoulutus_lisakoulutus];

DELETE FROM VipunenTK..d_ammatillisen_koulutuksen_koulutuslaji;
INSERT INTO VipunenTK..d_ammatillisen_koulutuksen_koulutuslaji
	SELECT * FROM VipunenTK_DW.[dbo].[v_ammatillisen_koulutuksen_koulutuslaji];

DELETE FROM VipunenTK..d_ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa;
INSERT INTO VipunenTK..d_ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa
	SELECT * FROM VipunenTK_DW.[dbo].[v_ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa];

DELETE FROM VipunenTK..d_ammattiasema;
INSERT INTO VipunenTK..d_ammattiasema
	SELECT * FROM VipunenTK_DW.[dbo].[v_ammattiasema];

DELETE FROM VipunenTK..d_ammattiluokitus_2001;   -- oli tyhjä devissä
INSERT INTO VipunenTK..d_ammattiluokitus_2001
	SELECT * FROM VipunenTK_DW.[dbo].[v_ammattiluokitus_2001];

DELETE FROM VipunenTK..d_ammattiluokitus_2010;   -- oli tyhjä devissä
INSERT INTO VipunenTK..d_ammattiluokitus_2010
	SELECT * FROM VipunenTK_DW.[dbo].[v_ammattiluokitus_2010];

DELETE FROM VipunenTK..d_asuinkunta_sama_vai_eri_kuin_aiemmin;   -- oli tyhjä devissä
INSERT INTO VipunenTK..d_asuinkunta_sama_vai_eri_kuin_aiemmin
	SELECT * FROM VipunenTK_DW.[dbo].[v_asuinkunta_sama_vai_eri_kuin_aiemmin];

DELETE FROM VipunenTK..d_asuinmaakunta_sama_kuin_tyopaikan;
INSERT INTO VipunenTK..d_asuinmaakunta_sama_kuin_tyopaikan
	SELECT * FROM VipunenTK_DW.[dbo].[v_asuinmaakunta_sama_kuin_tyopaikan];

DELETE FROM VipunenTK..d_avoinvayla;
INSERT INTO VipunenTK..d_avoinvayla
	SELECT * FROM VipunenTK_DW.[dbo].[v_avoinvayla];

DELETE FROM VipunenTK..d_edellisen_vuoden_opiskelu;
INSERT INTO VipunenTK..d_edellisen_vuoden_opiskelu
	SELECT * FROM VipunenTK_DW..v_edellisen_vuoden_opiskelu;

DELETE FROM VipunenTK..d_edeltavan_vuoden_asuinpaikka;
INSERT INTO VipunenTK..d_edeltavan_vuoden_asuinpaikka
	SELECT * FROM VipunenTK_DW..v_edeltavan_vuoden_asuinpaikka;

DELETE FROM VipunenTK..d_elakkeelle_siirtynyt_tai_kuollut;
INSERT INTO VipunenTK..d_elakkeelle_siirtynyt_tai_kuollut
	SELECT * FROM VipunenTK_DW.[dbo].[v_elakkeelle_siirtynyt_tai_kuollut];

DELETE FROM VipunenTK..d_ensisijainen_opintooikeus;
INSERT INTO VipunenTK..d_ensisijainen_opintooikeus
	SELECT * FROM VipunenTK_DW.[dbo].[v_ensisijainen_opintooikeus];

DELETE FROM VipunenTK..d_erikoislaakarikoulutus;
INSERT INTO VipunenTK..d_erikoislaakarikoulutus
	SELECT * FROM VipunenTK_DW.[dbo].[v_erikoislaakarikoulutus];

DELETE FROM VipunenTK..d_eu_etamaat;
INSERT INTO VipunenTK..d_eu_etamaat
	SELECT * FROM VipunenTK_DW.[dbo].[v_eu_etamaat];

DELETE FROM VipunenTK..d_hakukohde;
INSERT INTO VipunenTK..d_hakukohde
	SELECT * FROM VipunenTK_DW..v_hakukohde;

DELETE FROM VipunenTK..d_hakukohde_erillisvalinta;
INSERT INTO VipunenTK..d_hakukohde_erillisvalinta
	SELECT * FROM VipunenTK_DW..v_hakukohde_erillisvalinta;

DELETE FROM VipunenTK..d_hakukohteen_prioriteetti;
INSERT INTO VipunenTK..d_hakukohteen_prioriteetti
	SELECT * FROM VipunenTK_DW..v_hakukohteen_prioriteetti;

DELETE FROM VipunenTK..d_hakukohteen_tulos;
INSERT INTO VipunenTK..d_hakukohteen_tulos
	SELECT * FROM VipunenTK_DW..v_hakukohteen_tulos;

DELETE FROM VipunenTK..d_hakukohteen_tutkinnon_taso;
INSERT INTO VipunenTK..d_hakukohteen_tutkinnon_taso
	SELECT * FROM VipunenTK_DW..v_hakukohteen_tutkinnon_taso;

DELETE FROM VipunenTK..d_hallinnonala;
INSERT INTO VipunenTK..d_hallinnonala
	SELECT * FROM VipunenTK_DW.[dbo].[v_hallinnonala];

DELETE FROM VipunenTK..d_hallinnonala2;
INSERT INTO VipunenTK..d_hallinnonala2
	SELECT * FROM VipunenTK_DW.[dbo].[v_hallinnonala2];

DELETE FROM VipunenTK..d_hetu_ok;
INSERT INTO VipunenTK..d_hetu_ok
	SELECT * FROM VipunenTK_DW..v_hetu_ok;

DELETE FROM VipunenTK..d_ika;
INSERT INTO VipunenTK..d_ika
	SELECT * FROM VipunenTK_DW.[dbo].[v_ika];

DELETE FROM VipunenTK..d_jarjestaja;
INSERT INTO VipunenTK..d_jarjestaja
	SELECT * FROM VipunenTK_DW.[dbo].[v_jarjestaja];

DELETE FROM VipunenTK..d_kansalaisuus_versio1;
INSERT INTO VipunenTK..d_kansalaisuus_versio1
	SELECT * FROM VipunenTK_DW.[dbo].[v_kansalaisuus_versio1];

DELETE FROM VipunenTK..d_kansalaisuus_versio2;
INSERT INTO VipunenTK..d_kansalaisuus_versio2
	SELECT * FROM VipunenTK_DW.[dbo].[v_kansalaisuus_versio2];

--DELETE FROM VipunenTK..d_katsomusaine;
--INSERT INTO VipunenTK..d_katsomusaine
--	SELECT * FROM VipunenTK_DW.[dbo].[v_katsomusaine];

/* ei toimi Column name or number of supplied values does not match table definition. 
- lähteestä ei tietoa ja rakenteet eroavat kantojen välillä, ei oteta mukaan lataukseen
Korjattu 22.12.2014 / Jarmo
*/

DELETE FROM VipunenTK..d_kausi;
INSERT INTO VipunenTK..d_kausi
	SELECT * FROM VipunenTK_DW.[dbo].[v_kausi];

DELETE FROM VipunenTK..d_kieli;
INSERT INTO VipunenTK..d_kieli
	SELECT * FROM VipunenTK_DW.[dbo].[v_kieli];

DELETE FROM VipunenTK..d_kieli2;
INSERT INTO VipunenTK..d_kieli2
	SELECT * FROM VipunenTK_DW.[dbo].[v_kieli2];

DELETE FROM VipunenTK..d_koulutuksen_jarjestajan_koko;
INSERT INTO VipunenTK..d_koulutuksen_jarjestajan_koko
	SELECT * FROM VipunenTK_DW.[dbo].[v_koulutuksen_jarjestajan_koko];

DELETE FROM VipunenTK..d_koulutuksen_jarjestamismuoto;
INSERT INTO VipunenTK..d_koulutuksen_jarjestamismuoto
	SELECT * FROM VipunenTK_DW.[dbo].[v_koulutuksen_jarjestamismuoto];

DELETE FROM VipunenTK..d_koulutuksen_kieli_versio1;
INSERT INTO VipunenTK..d_koulutuksen_kieli_versio1
	SELECT * FROM VipunenTK_DW.[dbo].[v_koulutuksen_kieli_versio1];

DELETE FROM VipunenTK..d_koulutuksen_paattaneiden_toiminta;
INSERT INTO VipunenTK..d_koulutuksen_paattaneiden_toiminta
	SELECT * FROM VipunenTK_DW.[dbo].[v_koulutuksen_paattaneiden_toiminta];

DELETE FROM VipunenTK..d_koulutuksen_tavoite_toteuma;
INSERT INTO VipunenTK..d_koulutuksen_tavoite_toteuma
	SELECT * FROM VipunenTK_DW.[dbo].[v_koulutuksen_tavoite_toteuma];

DELETE FROM VipunenTK..d_koulutusaste_2002;
INSERT INTO VipunenTK..d_koulutusaste_2002
	SELECT * FROM VipunenTK_DW.[dbo].[v_koulutusaste_2002];

DELETE FROM VipunenTK..d_koulutuslaji;
INSERT INTO VipunenTK..d_koulutuslaji
	SELECT * FROM VipunenTK_DW.[dbo].[v_koulutuslaji];

DELETE FROM VipunenTK..d_koulutuslaji2;
INSERT INTO VipunenTK..d_koulutuslaji2
	SELECT * FROM VipunenTK_DW.[dbo].[v_koulutuslaji2];

DELETE FROM VipunenTK..d_koulutuslaji3;
INSERT INTO VipunenTK..d_koulutuslaji3
	SELECT * FROM VipunenTK_DW.[dbo].[v_koulutuslaji3];

DELETE FROM VipunenTK..d_koulutuslaji_okm;
INSERT INTO VipunenTK..d_koulutuslaji_okm
	SELECT * FROM VipunenTK_DW.[dbo].[v_koulutuslaji_okm];

DELETE FROM VipunenTK..d_koulutusmuoto;
INSERT INTO VipunenTK..d_koulutusmuoto
	SELECT * FROM VipunenTK_DW.[dbo].[v_koulutusmuoto];

DELETE FROM VipunenTK..d_koulutusohjelma_amk;
INSERT INTO VipunenTK..d_koulutusohjelma_amk
	SELECT * FROM VipunenTK_DW.[dbo].[v_koulutusohjelma_amk];

DELETE FROM VipunenTK..d_koulutusohjelma_ammpk;
INSERT INTO VipunenTK..d_koulutusohjelma_ammpk
	SELECT * FROM VipunenTK_DW.[dbo].[v_koulutusohjelma_ammpk];

DELETE FROM VipunenTK..d_koulutusryhma;
INSERT INTO VipunenTK..d_koulutusryhma
	SELECT * FROM VipunenTK_DW.[dbo].[v_koulutusryhma];

DELETE FROM VipunenTK..d_koulutussektori;
INSERT INTO VipunenTK..d_koulutussektori
	SELECT * FROM VipunenTK_DW.[dbo].[v_koulutussektori];

DELETE FROM VipunenTK..d_koulutustyyppi;
INSERT INTO VipunenTK..d_koulutustyyppi
	SELECT * FROM VipunenTK_DW.[dbo].[v_koulutustyyppi];

DELETE FROM VipunenTK..d_kvopiskelija;
INSERT INTO VipunenTK..d_kvopiskelija
	SELECT * FROM VipunenTK_DW.[dbo].[v_kvopiskelija];

DELETE FROM VipunenTK..d_kylla_ei;
INSERT INTO VipunenTK..d_kylla_ei
	SELECT * FROM VipunenTK_DW.[dbo].[v_kylla_ei];

DELETE FROM VipunenTK..d_lahde;
INSERT INTO VipunenTK..d_lahde
	SELECT * FROM VipunenTK_DW.[dbo].[v_lahde];

DELETE FROM VipunenTK..d_lukiokoulutuksen_koulutuslaji;
INSERT INTO VipunenTK..d_lukiokoulutuksen_koulutuslaji
	SELECT * FROM VipunenTK_DW.[dbo].[v_lukiokoulutuksen_koulutuslaji];

DELETE FROM VipunenTK..d_lukion_ainevalinnat;
INSERT INTO VipunenTK..d_lukion_ainevalinnat
	SELECT * FROM VipunenTK_DW.[dbo].[v_lukion_ainevalinnat];

DELETE FROM VipunenTK..d_lukion_kieltenmaara;
INSERT INTO VipunenTK..d_lukion_kieltenmaara
	SELECT * FROM VipunenTK_DW.[dbo].[v_lukion_kieltenmaara];

DELETE FROM VipunenTK..d_maassaolo;
INSERT INTO VipunenTK..d_maassaolo
	SELECT * FROM VipunenTK_DW.[dbo].[v_maassaolo];

DELETE FROM VipunenTK..d_maahantulo_ja_opiskelun_aloittaminen;
INSERT INTO VipunenTK..d_maahantulo_ja_opiskelun_aloittaminen
	SELECT * FROM VipunenTK_DW.[dbo].[v_maahantulo_ja_opiskelun_aloittaminen];

DELETE FROM VipunenTK..d_mitenna_ammatti;
INSERT INTO VipunenTK..d_mitenna_ammatti
	SELECT * FROM VipunenTK_DW.[dbo].[v_mitenna_ammatti];

DELETE FROM VipunenTK..d_mitenna_toimiala;
INSERT INTO VipunenTK..d_mitenna_toimiala
	SELECT * FROM VipunenTK_DW.[dbo].[v_mitenna_toimiala];

DELETE FROM VipunenTK..d_moninkertainen_haku;
INSERT INTO VipunenTK..d_moninkertainen_haku
	SELECT * FROM VipunenTK_DW.[dbo].[v_moninkertainen_haku];

DELETE FROM VipunenTK..d_nuorten_aikuisten_koulutus;
INSERT INTO VipunenTK..d_nuorten_aikuisten_koulutus
	SELECT * FROM VipunenTK_DW.[dbo].[v_nuorten_aikuisten_koulutus];

DELETE FROM VipunenTK..d_nuorten_aikuisten_koulutus_amm;
INSERT INTO VipunenTK..d_nuorten_aikuisten_koulutus_amm
	SELECT * FROM VipunenTK_DW.[dbo].[v_nuorten_aikuisten_koulutus_amm];

DELETE FROM VipunenTK..d_oef_ammatti;
INSERT INTO VipunenTK..d_oef_ammatti
	SELECT * FROM VipunenTK_DW.[dbo].[v_oef_ammatti];

DELETE FROM VipunenTK..d_oef_toimiala;
INSERT INTO VipunenTK..d_oef_toimiala
	SELECT * FROM VipunenTK_DW.[dbo].[v_oef_toimiala];

DELETE FROM VipunenTK..d_opettajankelpoisuus;
INSERT INTO VipunenTK..d_opettajankelpoisuus
	SELECT * FROM VipunenTK_DW.[dbo].[v_opettajankelpoisuus];

DELETE FROM VipunenTK..d_opettajankelpoisuus2;
INSERT INTO VipunenTK..d_opettajankelpoisuus2
	SELECT * FROM VipunenTK_DW.[dbo].[v_opettajankelpoisuus2];

DELETE FROM VipunenTK..d_opettajan_tehtavatyyppi_ammatillisessa_koulutuksessa;
INSERT INTO VipunenTK..d_opettajan_tehtavatyyppi_ammatillisessa_koulutuksessa
	SELECT * FROM VipunenTK_DW.[dbo].[v_opettajan_tehtavatyyppi_ammatillisessa_koulutuksessa];

DELETE FROM VipunenTK..d_opettajan_tehtavatyyppi_lukiokoulutuksessa;
INSERT INTO VipunenTK..d_opettajan_tehtavatyyppi_lukiokoulutuksessa
	SELECT * FROM VipunenTK_DW.[dbo].[v_opettajan_tehtavatyyppi_lukiokoulutuksessa];

DELETE FROM VipunenTK..d_opettajan_tehtavatyyppi_perusopetuksessa;
INSERT INTO VipunenTK..d_opettajan_tehtavatyyppi_perusopetuksessa
	SELECT * FROM VipunenTK_DW.[dbo].[v_opettajan_tehtavatyyppi_perusopetuksessa];

DELETE FROM VipunenTK..d_opettajan_tehtavatyyppi_taiteen_perusopetuksessa;
INSERT INTO VipunenTK..d_opettajan_tehtavatyyppi_taiteen_perusopetuksessa
	SELECT * FROM VipunenTK_DW.[dbo].[v_opettajan_tehtavatyyppi_taiteen_perusopetuksessa];

DELETE FROM VipunenTK..d_opettajan_tehtavatyyppi_vapaassa_sivistystyossa;
INSERT INTO VipunenTK..d_opettajan_tehtavatyyppi_vapaassa_sivistystyossa
	SELECT * FROM VipunenTK_DW.[dbo].[v_opettajan_tehtavatyyppi_vapaassa_sivistystyossa];

DELETE FROM VipunenTK..d_opettajat_aine;
INSERT INTO VipunenTK..d_opettajat_aine
	SELECT * FROM VipunenTK_DW.[dbo].[v_opettajat_aine];

DELETE FROM VipunenTK..d_opettajat_aine_2016;
INSERT INTO VipunenTK..d_opettajat_aine_2016
	SELECT * FROM VipunenTK_DW.[dbo].[v_opettajat_aine_2016];

DELETE FROM VipunenTK..d_opettajat_aine_2016_lukio;
INSERT INTO VipunenTK..d_opettajat_aine_2016_lukio
	SELECT * FROM VipunenTK_DW.[dbo].[v_opettajat_aine_2016_lukio];

DELETE FROM VipunenTK..d_opettajat_aine_amm;
INSERT INTO VipunenTK..d_opettajat_aine_amm
	SELECT * FROM VipunenTK_DW.[dbo].[v_opettajat_aine_amm];

DELETE FROM VipunenTK..d_opettajat_aine_vst;
INSERT INTO VipunenTK..d_opettajat_aine_vst
	SELECT * FROM VipunenTK_DW.[dbo].[v_opettajat_aine_vst];

DELETE FROM VipunenTK..d_opettajat_ala_tpo;
INSERT INTO VipunenTK..d_opettajat_ala_tpo
	SELECT * FROM VipunenTK_DW.[dbo].[v_opettajat_ala_tpo];

DELETE FROM VipunenTK..d_opettajat_kelpoisuus_amm;
INSERT INTO VipunenTK..d_opettajat_kelpoisuus_amm
	SELECT * FROM VipunenTK_DW.[dbo].[v_opettajat_kelpoisuus_amm];

DELETE FROM VipunenTK..d_opettajat_koko_osa_aikainen;
INSERT INTO VipunenTK..d_opettajat_koko_osa_aikainen
	SELECT * FROM VipunenTK_DW.[dbo].[v_opettajat_koko_osa_aikainen];

DELETE FROM VipunenTK..d_opettajat_koulutusaste;
INSERT INTO VipunenTK..d_opettajat_koulutusaste
	SELECT * FROM VipunenTK_DW.[dbo].[v_opettajat_koulutusaste];

DELETE FROM VipunenTK..d_opettajat_koulutusaste_amm;
INSERT INTO VipunenTK..d_opettajat_koulutusaste_amm
	SELECT * FROM VipunenTK_DW.[dbo].[v_opettajat_koulutusaste_amm];

DELETE FROM VipunenTK..d_opettajat_koulutusaste_tpo;
INSERT INTO VipunenTK..d_opettajat_koulutusaste_tpo
	SELECT * FROM VipunenTK_DW.[dbo].[v_opettajat_koulutusaste_tpo];

DELETE FROM VipunenTK..d_opettajat_luokka_aste;
INSERT INTO VipunenTK..d_opettajat_luokka_aste
	SELECT * FROM VipunenTK_DW.[dbo].[v_opettajat_luokka_aste];

DELETE FROM VipunenTK..d_opettajat_opintotaso_tpo;
INSERT INTO VipunenTK..d_opettajat_opintotaso_tpo
	SELECT * FROM VipunenTK_DW.[dbo].[v_opettajat_opintotaso_tpo];

DELETE FROM VipunenTK..d_opettajat_osa_aikaisuuden_syy;
INSERT INTO VipunenTK..d_opettajat_osa_aikaisuuden_syy
	SELECT * FROM VipunenTK_DW.[dbo].[v_opettajat_osa_aikaisuuden_syy];
	
DELETE FROM VipunenTK..d_opettajat_taydennyskoulutus_tpo;
INSERT INTO VipunenTK..d_opettajat_taydennyskoulutus_tpo
	SELECT * FROM VipunenTK_DW.[dbo].[v_opettajat_taydennyskoulutus_tpo];

DELETE FROM VipunenTK..d_opettajat_tyosuhteen_luonne;
INSERT INTO VipunenTK..d_opettajat_tyosuhteen_luonne
	SELECT * FROM VipunenTK_DW.[dbo].[v_opettajat_tyosuhteen_luonne];

DELETE FROM VipunenTK..d_opetushallinnon_koulutus;
INSERT INTO VipunenTK..d_opetushallinnon_koulutus
	SELECT * FROM VipunenTK_DW.[dbo].[v_opetushallinnon_koulutus];

DELETE FROM VipunenTK..d_opetuskieli;
INSERT INTO VipunenTK..d_opetuskieli
	SELECT * FROM VipunenTK_DW.[dbo].[v_opetuskieli];

DELETE FROM VipunenTK..d_opetuskieli2;
INSERT INTO VipunenTK..d_opetuskieli2
	SELECT * FROM VipunenTK_DW.[dbo].[v_opetuskieli2];

DELETE FROM VipunenTK..d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus;
INSERT INTO VipunenTK..d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus
	SELECT * FROM VipunenTK_DW.[dbo].[v_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus];

DELETE FROM VipunenTK..d_opetustuntien_sisalto_ja_tavoiteluokitus;
INSERT INTO VipunenTK..d_opetustuntien_sisalto_ja_tavoiteluokitus
	SELECT * FROM VipunenTK_DW.[dbo].[v_opetustuntien_sisalto_ja_tavoiteluokitus];

DELETE FROM VipunenTK..d_opintoala2002;
INSERT INTO VipunenTK..d_opintoala2002
	SELECT * FROM VipunenTK_DW.[dbo].[v_opintoala2002];

DELETE FROM VipunenTK..d_opiskelijan_fte_tieto;
INSERT INTO VipunenTK..d_opiskelijan_fte_tieto
	SELECT * FROM VipunenTK_DW.[dbo].[v_opiskelijan_fte_tieto];

DELETE FROM VipunenTK..d_opiskelijan_olo;
INSERT INTO VipunenTK..d_opiskelijan_olo
	SELECT * FROM VipunenTK_DW.[dbo].[v_opiskelijan_olo];

DELETE FROM VipunenTK..d_opiskelu_toiminta;
INSERT INTO VipunenTK..d_opiskelu_toiminta
	SELECT * FROM VipunenTK_DW.[dbo].[v_opiskelu_toiminta];

DELETE FROM VipunenTK..d_opiskelumuoto;
INSERT INTO VipunenTK..d_opiskelumuoto
	SELECT * FROM VipunenTK_DW.[dbo].[v_opiskelumuoto];

DELETE FROM VipunenTK..d_oppilaitostyyppi;
INSERT INTO VipunenTK..d_oppilaitostyyppi
	SELECT * FROM VipunenTK_DW.[dbo].[v_oppilaitostyyppi];

DELETE FROM VipunenTK..d_oppilaitostyyppi_amm;
INSERT INTO VipunenTK..d_oppilaitostyyppi_amm
	SELECT * FROM VipunenTK_DW.[dbo].[v_oppilaitostyyppi_amm];

DELETE FROM VipunenTK..d_oppisopimus_purkautunut;
INSERT INTO VipunenTK..d_oppisopimus_purkautunut
	SELECT * FROM VipunenTK_DW.[dbo].[v_oppisopimus_purkautunut];

DELETE FROM VipunenTK..d_oppisopimus_yrityksen_koko;
INSERT INTO VipunenTK..d_oppisopimus_yrityksen_koko
	SELECT * FROM VipunenTK_DW.[dbo].[v_oppisopimus_yrityksen_koko];

DELETE FROM VipunenTK..d_oppisopimuskoulutus;
INSERT INTO VipunenTK..d_oppisopimuskoulutus
	SELECT * FROM VipunenTK_DW.[dbo].[v_oppisopimuskoulutus];


DELETE FROM VipunenTK..d_osatutkinto;
INSERT INTO VipunenTK..d_osatutkinto
	SELECT * FROM VipunenTK_DW.[dbo].[v_osatutkinto];


DELETE FROM VipunenTK..d_paaasiallinen_toiminta;
INSERT INTO VipunenTK..d_paaasiallinen_toiminta
	SELECT * FROM VipunenTK_DW.[dbo].[v_paaasiallinen_toiminta];


DELETE FROM VipunenTK..d_paaasiallinen_toiminta_versio2;
INSERT INTO VipunenTK..d_paaasiallinen_toiminta_versio2
	SELECT * FROM VipunenTK_DW.[dbo].[v_paaasiallinen_toiminta_versio2];


DELETE FROM VipunenTK..d_paaasiallinen_toiminta_versio3;
INSERT INTO VipunenTK..d_paaasiallinen_toiminta_versio3
	SELECT * FROM VipunenTK_DW.[dbo].[v_paaasiallinen_toiminta_versio3];

DELETE FROM VipunenTK..d_paaasiallinen_toiminta_versio9;
INSERT INTO VipunenTK..d_paaasiallinen_toiminta_versio9
	SELECT * FROM VipunenTK_DW.[dbo].[v_paaasiallinen_toiminta_versio9];

DELETE FROM VipunenTK..d_paaasiallinen_toiminta_ja_maasta_muuttaneet;
INSERT INTO VipunenTK..d_paaasiallinen_toiminta_ja_maasta_muuttaneet
	SELECT * FROM VipunenTK_DW.[dbo].[v_paaasiallinen_toiminta_ja_maasta_muuttaneet];

DELETE FROM VipunenTK..d_patevyyteen_tahtaavat_opinnot_amk;
INSERT INTO VipunenTK..d_patevyyteen_tahtaavat_opinnot_amk
	SELECT * FROM VipunenTK_DW.[dbo].[v_patevyyteen_tahtaavat_opinnot_amk];

DELETE FROM VipunenTK..d_perusjoukko_tyolliset;
INSERT INTO VipunenTK..d_perusjoukko_tyolliset
	SELECT * FROM VipunenTK_DW.[dbo].[v_perusjoukko_tyolliset];


DELETE FROM VipunenTK..d_perusopetuksen_ainevalinnat;
INSERT INTO VipunenTK..d_perusopetuksen_ainevalinnat
	SELECT * FROM VipunenTK_DW.[dbo].[v_perusopetuksen_ainevalinnat];


DELETE FROM VipunenTK..d_perusopetuksen_kieltenmaara;
INSERT INTO VipunenTK..d_perusopetuksen_kieltenmaara
	SELECT * FROM VipunenTK_DW.[dbo].[v_perusopetuksen_kieltenmaara];


DELETE FROM VipunenTK..d_perusopetuksen_vuosiluokat;
INSERT INTO VipunenTK..d_perusopetuksen_vuosiluokat
	SELECT * FROM VipunenTK_DW.[dbo].[v_perusopetuksen_vuosiluokat];

DELETE FROM VipunenTK..d_pohjoismaa;
INSERT INTO VipunenTK..d_pohjoismaa
	SELECT * FROM VipunenTK_DW.[dbo].[v_pohjoismaa];

DELETE FROM VipunenTK..d_rahoituslahde;
INSERT INTO VipunenTK..d_rahoituslahde
	SELECT * FROM VipunenTK_DW.[dbo].[v_rahoituslahde];

DELETE FROM VipunenTK..d_rahoituslahde_amm;
INSERT INTO VipunenTK..d_rahoituslahde_amm
	SELECT * FROM VipunenTK_DW.[dbo].[v_rahoituslahde_amm];

DELETE FROM VipunenTK..d_rahoituslahde_versio2;
INSERT INTO VipunenTK..d_rahoituslahde_versio2
	SELECT * FROM VipunenTK_DW.[dbo].[v_rahoituslahde_versio2];

DELETE FROM VipunenTK.dbo.d_sama_koulutusala
Insert into VipunenTK.dbo.d_sama_koulutusala
Select * from VipunenTK_DW.dbo.v_sama_koulutusala

DELETE FROM VipunenTK..Sarakeleveys;
INSERT INTO VipunenTK..Sarakeleveys
	SELECT * FROM VipunenTK_DW.[dbo].[v_sarakeleveys];

DELETE FROM VipunenTK..d_sektoritutkimuslaitos;
INSERT INTO VipunenTK..d_sektoritutkimuslaitos
	SELECT * FROM VipunenTK_DW.[dbo].[v_sektoritutkimuslaitos];

DELETE FROM VipunenTK..d_siirtyman_tarkastelusuunta;
INSERT INTO VipunenTK..d_siirtyman_tarkastelusuunta
	SELECT * FROM VipunenTK_DW.[dbo].[v_siirtyman_tarkastelusuunta];

DELETE FROM VipunenTK..d_sosioekonominen_asema;
INSERT INTO VipunenTK..d_sosioekonominen_asema
	SELECT * FROM VipunenTK_DW.[dbo].[v_sosioekonominen_asema];

DELETE FROM VipunenTK..d_suhteellinen_ajankohta
INSERT INTO VipunenTK..d_suhteellinen_ajankohta
	SELECT * FROM VipunenTK_DW..v_suhteellinen_ajankohta

DELETE FROM VipunenTK..d_sukupuoli;
INSERT INTO VipunenTK..d_sukupuoli
	SELECT * FROM VipunenTK_DW.[dbo].[v_sukupuoli];
	
DELETE FROM VipunenTK..d_suuntautumisvaihtoehto_amk;
INSERT INTO VipunenTK..d_suuntautumisvaihtoehto_amk
	SELECT * FROM VipunenTK_DW.[dbo].[v_suuntautumisvaihtoehto_amk];


DELETE FROM VipunenTK..d_tarkastelujakso;
INSERT INTO VipunenTK..d_tarkastelujakso
	SELECT * FROM VipunenTK_DW.[dbo].[v_tarkastelujakso];


DELETE FROM VipunenTK..d_tiedekunta_yo;
INSERT INTO VipunenTK..d_tiedekunta_yo
	SELECT * FROM VipunenTK_DW.[dbo].[v_tiedekunta_yo];

DELETE FROM VipunenTK.dbo.d_tieteenala;
Insert into VipunenTK.dbo.d_tieteenala
	Select * from VipunenTK_DW.dbo.v_tieteenala;

DELETE FROM VipunenTK..d_tietojen_ajankohta;
INSERT INTO VipunenTK..d_tietojen_ajankohta
	SELECT * FROM VipunenTK_DW.[dbo].[v_tietojen_ajankohta];


DELETE FROM VipunenTK..d_tilauskoulutuksen_sijaintimaa;
INSERT INTO VipunenTK..d_tilauskoulutuksen_sijaintimaa
	SELECT * FROM VipunenTK_DW.[dbo].[v_tilauskoulutuksen_sijaintimaa];


DELETE FROM VipunenTK..d_todistus_oppisopimuskoulutuksen_suorittamisesta;
INSERT INTO VipunenTK..d_todistus_oppisopimuskoulutuksen_suorittamisesta
	SELECT * FROM VipunenTK_DW.[dbo].[v_todistus_oppisopimuskoulutuksen_suorittamisesta];


DELETE FROM VipunenTK..d_toimiala_2008;   ---! oli tyhjä devissä
INSERT INTO VipunenTK..d_toimiala_2008
	SELECT * FROM VipunenTK_DW.[dbo].[v_toimiala_2008];

DELETE FROM VipunenTK..d_toimiala_tk; 
INSERT INTO VipunenTK..d_toimiala_tk
	SELECT * FROM VipunenTK_DW.[dbo].[v_toimiala_tk];

DELETE FROM VipunenTK..d_toimiala_tthv; 
INSERT INTO VipunenTK..d_toimiala_tthv
	SELECT * FROM VipunenTK_DW.[dbo].[v_toimiala_tthv];

DELETE FROM VipunenTK..d_tulodesiili;
INSERT INTO VipunenTK..d_tulodesiili
	SELECT * FROM VipunenTK_DW.[dbo].[v_tulodesiili];

DELETE FROM VipunenTK.dbo.d_tutkimuksen_rahoituslahde;
Insert into VipunenTK.dbo.d_tutkimuksen_rahoituslahde
	Select * from VipunenTK_DW.dbo.v_tutkimuksen_rahoituslahde;

DELETE FROM VipunenTK.dbo.d_tutkimusmenojen_kohde;
Insert into VipunenTK.dbo.d_tutkimusmenojen_kohde
	Select * from VipunenTK_DW.dbo.v_tutkimusmenojen_kohde;

DELETE FROM VipunenTK.dbo.d_tutkimus_tehtava;
Insert into VipunenTK.dbo.d_tutkimus_tehtava
	Select * from VipunenTK_DW.dbo.v_tutkimus_tehtava;

DELETE FROM VipunenTK..d_tutkinnon_tavoite;
INSERT INTO VipunenTK..d_tutkinnon_tavoite
	SELECT * FROM VipunenTK_DW.[dbo].[v_tutkinnon_tavoite];


DELETE FROM VipunenTK..d_tutkinnon_toteuma;
INSERT INTO VipunenTK..d_tutkinnon_toteuma
	SELECT * FROM VipunenTK_DW.[dbo].[v_tutkinnon_toteuma];


DELETE FROM VipunenTK..d_tutkinto;
INSERT INTO VipunenTK..d_tutkinto
	SELECT * FROM VipunenTK_DW..v_tutkinto;
	
DELETE FROM VipunenTK..d_tutkinto_amk;
INSERT INTO VipunenTK..d_tutkinto_amk
	SELECT * FROM VipunenTK_DW.[dbo].[v_tutkinto_amk];

DELETE FROM VipunenTK.dbo.d_tutkinto_suoritettu
Insert into VipunenTK.dbo.d_tutkinto_suoritettu
Select * from VipunenTK_DW.dbo.v_tutkinto_suoritettu

DELETE FROM VipunenTK..d_tutkinto_yo;
INSERT INTO VipunenTK..d_tutkinto_yo
	SELECT * FROM VipunenTK_DW.[dbo].[v_tutkinto_yo];

DELETE FROM VipunenTK..d_tutkintoasetus;
INSERT INTO VipunenTK..d_tutkintoasetus
	SELECT * FROM VipunenTK_DW.[dbo].[v_tutkintoasetus];

DELETE FROM VipunenTK.dbo.d_tutkintojen_maara
Insert into VipunenTK.dbo.d_tutkintojen_maara
Select * from VipunenTK_DW.dbo.v_tutkintojen_maara

DELETE FROM VipunenTK..d_tutkintolaji_tyollistymiseen;
INSERT INTO VipunenTK..d_tutkintolaji_tyollistymiseen
	SELECT * FROM VipunenTK_DW.[dbo].[v_tutkintolaji_tyollistymiseen];

DELETE FROM VipunenTK..d_tutkintonimike_ammpk;
INSERT INTO VipunenTK..d_tutkintonimike_ammpk
	SELECT * FROM VipunenTK_DW.[dbo].[v_tutkintonimike_ammpk];

DELETE FROM VipunenTK..d_tutkintoryhma;
INSERT INTO VipunenTK..d_tutkintoryhma
	SELECT * FROM VipunenTK_DW.[dbo].[v_tutkintoryhma];

DELETE FROM  VipunenTK.dbo.d_tutkintotaso;
Insert into VipunenTK.dbo.d_tutkintotaso
	Select * from VipunenTK_DW.dbo.v_tutkintotaso;

DELETE FROM  VipunenTK.dbo.d_tuva_rahoitusjarjestelma;
Insert into VipunenTK.dbo.d_tuva_rahoitusjarjestelma
	Select * from VipunenTK_DW.dbo.v_tuva_rahoitusjarjestelma;

DELETE FROM VipunenTK..d_tyopaikan_sijainti_v_tilastovuonna;
INSERT INTO VipunenTK..d_tyopaikan_sijainti_v_tilastovuonna
	SELECT * FROM VipunenTK_DW.[dbo].[v_tyopaikan_sijainti_v_tilastovuonna];

DELETE FROM VipunenTK..d_tyonantajasektori;
INSERT INTO VipunenTK..d_tyonantajasektori
	SELECT * FROM VipunenTK_DW.[dbo].[v_tyonantajasektori];

DELETE FROM VipunenTK..d_tyonantajasektori2;
INSERT INTO VipunenTK..d_tyonantajasektori2
	SELECT * FROM VipunenTK_DW.[dbo].[v_tyonantajasektori2];

DELETE FROM VipunenTK..d_tyossakayntitilaston_tyonantajasektori;
INSERT INTO VipunenTK..d_tyossakayntitilaston_tyonantajasektori
	SELECT * FROM VipunenTK_DW.[dbo].[v_tyossakayntitilaston_tyonantajasektori];

DELETE FROM VipunenTK..d_tyovoimapoliittinen;
INSERT INTO VipunenTK..d_tyovoimapoliittinen
	SELECT * FROM VipunenTK_DW.[dbo].[v_tyovoimapoliittinen];


DELETE FROM VipunenTK..d_tyovoimapoliittinen_koulutus;
INSERT INTO VipunenTK..d_tyovoimapoliittinen_koulutus
	SELECT * FROM VipunenTK_DW.[dbo].[v_tyovoimapoliittinen_koulutus];


DELETE FROM VipunenTK..d_uusi_vanha_opiskelija;
INSERT INTO VipunenTK..d_uusi_vanha_opiskelija
	SELECT * FROM VipunenTK_DW.[dbo].[v_uusi_vanha_opiskelija];


DELETE FROM VipunenTK..d_vahintaan_55_op_suorittanut;
INSERT INTO VipunenTK..d_vahintaan_55_op_suorittanut
	SELECT * FROM VipunenTK_DW.[dbo].[v_vahintaan_55_op_suorittanut];


DELETE FROM VipunenTK..d_valiaikainen_amk;
INSERT INTO VipunenTK..d_valiaikainen_amk
	SELECT * FROM VipunenTK_DW.[dbo].[v_valiaikainen_amk];

-- poistettu kohdetaulu koska ei ollut käytössä; FK-viitteitä oli mutta id:illä liityttiin dimensioon d_valtio
--DELETE FROM VipunenTK..d_valtio_historia;  -- oli tyhjä
--INSERT INTO VipunenTK..d_valtio_historia
--	SELECT * FROM VipunenTK_DW.[dbo].[v_valtio];

DELETE FROM VipunenTK..d_vayla_nayttotutkintoon;
INSERT INTO VipunenTK..d_vayla_nayttotutkintoon
	SELECT * FROM VipunenTK_DW.[dbo].[v_vayla_nayttotutkintoon];

DELETE FROM VipunenTK.dbo.d_virkaryhma;
Insert into VipunenTK.dbo.d_virkaryhma
	Select * from VipunenTK_DW.dbo.v_virkaryhma;

DELETE FROM VipunenTK..d_yliopisto;
INSERT INTO VipunenTK..d_yliopisto
	SELECT * FROM VipunenTK_DW.[dbo].[v_yliopisto];


DELETE FROM VipunenTK..d_yllapitajan_kieli;
INSERT INTO VipunenTK..d_yllapitajan_kieli
	SELECT * FROM VipunenTK_DW.[dbo].[v_yllapitajan_kieli];

DELETE FROM VipunenTK..d_yosairaala;
INSERT INTO VipunenTK..d_yosairaala
	SELECT * FROM VipunenTK_DW.[dbo].[v_yosairaala];

DELETE FROM VipunenTK..d_yrittajan_oppisopimuskoulutus;
INSERT INTO VipunenTK..d_yrittajan_oppisopimuskoulutus
	SELECT * FROM VipunenTK_DW.[dbo].[v_yrittajan_oppisopimuskoulutus];

/*** Luokitusdimensiot, ladattava seuraavassa järjestyksessä ***/

DELETE FROM VipunenTK..d_alueluokitus_historia;
INSERT INTO VipunenTK..d_alueluokitus_historia
	SELECT * FROM VipunenTK_DW.[dbo].[v_alueluokitus_historia];
	
DELETE FROM VipunenTK..d_alueluokitus;
INSERT INTO VipunenTK..d_alueluokitus
	SELECT * FROM VipunenTK_DW.[dbo].[v_alueluokitus_nykytila];

DELETE FROM VipunenTK.dbo.d_kuntaryhma
INSERT INTO VipunenTK.dbo.d_kuntaryhma
	SELECT * FROM VipunenTK.[dbo].[v_d_alueluokitus_kuntaryhma]

DELETE FROM VipunenTK..d_koulutusluokitus_historia; 
INSERT INTO VipunenTK..d_koulutusluokitus_historia
	SELECT * FROM VipunenTK_DW.[dbo].[v_koulutusluokitus_historia];
	
DELETE FROM VipunenTK..d_koulutusluokitus;
INSERT INTO VipunenTK..d_koulutusluokitus
	SELECT * FROM VipunenTK_DW.[dbo].[v_koulutusluokitus_nykytila];

DELETE FROM VipunenTK..d_oppilaitoksen_taustatiedot_historia;
INSERT INTO VipunenTK..d_oppilaitoksen_taustatiedot_historia
	SELECT * FROM VipunenTK_DW.[dbo].[v_oppilaitoksen_taustatiedot_historia];
	
DELETE FROM VipunenTK..d_oppilaitoksen_taustatiedot;
INSERT INTO VipunenTK..d_oppilaitoksen_taustatiedot
	SELECT * FROM VipunenTK_DW.[dbo].[v_oppilaitoksen_taustatiedot_nykytila];
	
DELETE FROM VipunenTK..d_aikaisempi_korkein_tutkinto;
INSERT INTO VipunenTK..d_aikaisempi_korkein_tutkinto
	SELECT * FROM VipunenTK_DW.[dbo].[v_aikaisempi_korkein_tutkinto];
	
DELETE FROM VipunenTK..d_koulutuksesta_kulunut_aika;
INSERT INTO VipunenTK..d_koulutuksesta_kulunut_aika
	SELECT * FROM VipunenTK_DW.[dbo].[v_koulutuksesta_kulunut_aika];

DELETE FROM VipunenTK..d_perusopetuksen_aloitusika;
INSERT INTO VipunenTK..d_perusopetuksen_aloitusika
	SELECT * FROM VipunenTK_DW.[dbo].[v_perusopetuksen_aloitusika]

DELETE FROM VipunenTK..d_perusopetuksen_erityisen_tuen_paatos;
INSERT INTO VipunenTK..d_perusopetuksen_erityisen_tuen_paatos
	SELECT * FROM VipunenTK_DW.[dbo].[v_perusopetuksen_erityisen_tuen_paatos]

DELETE FROM VipunenTK..d_perusopetuksen_kuljetusetuus;
INSERT INTO VipunenTK..d_perusopetuksen_kuljetusetuus
	SELECT * FROM VipunenTK_DW.[dbo].[v_perusopetuksen_kuljetusetuus]

DELETE FROM VipunenTK..d_perusopetuksen_majoitusetuus;
INSERT INTO VipunenTK..d_perusopetuksen_majoitusetuus
	SELECT * FROM VipunenTK_DW.[dbo].[v_perusopetuksen_majoitusetuus]

DELETE FROM VipunenTK..d_perusopetuksen_oppimaaran_yksilollistaminen;
INSERT INTO VipunenTK..d_perusopetuksen_oppimaaran_yksilollistaminen
	SELECT * FROM VipunenTK_DW.[dbo].[v_perusopetuksen_oppimaaran_yksilollistaminen]

DELETE FROM VipunenTK..d_perusopetuksen_pidennetty_oppivelvollisuus;
INSERT INTO VipunenTK..d_perusopetuksen_pidennetty_oppivelvollisuus
	SELECT * FROM VipunenTK_DW.[dbo].[v_perusopetuksen_pidennetty_oppivelvollisuus]

DELETE FROM VipunenTK..d_perusopetuksen_tehostettu_tuki;
INSERT INTO VipunenTK..d_perusopetuksen_tehostettu_tuki
	SELECT * FROM VipunenTK_DW.[dbo].[v_perusopetuksen_tehostettu_tuki]

DELETE FROM VipunenTK..d_perusopetuksen_tukimuoto;
INSERT INTO VipunenTK..d_perusopetuksen_tukimuoto
	SELECT * FROM VipunenTK_DW.[dbo].[v_perusopetuksen_tukimuoto]

DELETE FROM VipunenTK..d_perusopetuksen_yleisopetuksen_osuus;
INSERT INTO VipunenTK..d_perusopetuksen_yleisopetuksen_osuus
	SELECT * FROM VipunenTK_DW.[dbo].[v_perusopetuksen_yleisopetuksen_osuus]

DELETE FROM VipunenTK..d_joustava_perusopetus;
INSERT INTO VipunenTK..d_joustava_perusopetus
	SELECT * FROM VipunenTK_DW.[dbo].[v_joustava_perusopetus]

DELETE FROM VipunenTK..d_vieraskielisyys;
INSERT INTO VipunenTK..d_vieraskielisyys
	SELECT * FROM VipunenTK_DW.[dbo].[v_vieraskielisyys]

DELETE FROM VipunenTK..d_opiskelijan_aikaisempi_yleissivistava_koulutus;
INSERT INTO VipunenTK..d_opiskelijan_aikaisempi_yleissivistava_koulutus
	SELECT * FROM VipunenTK_DW.[dbo].[v_opiskelijan_aikaisempi_yleissivistava_koulutus]

DELETE FROM VipunenTK..d_pohjakoulutuksen_tila;
INSERT INTO VipunenTK..d_pohjakoulutuksen_tila
	SELECT * FROM VipunenTK_DW.[dbo].[v_pohjakoulutuksen_tila]

DELETE FROM VipunenTK..d_paaasiallinen_toiminta_okm;
INSERT INTO VipunenTK..d_paaasiallinen_toiminta_okm
	SELECT * FROM VipunenTK_DW.[dbo].[v_paaasiallinen_toiminta_okm]

DELETE FROM VipunenTK..d_opetuksen_jarjestajan_tiedoantajatyyppi;
INSERT INTO VipunenTK..d_opetuksen_jarjestajan_tiedoantajatyyppi
	SELECT * FROM VipunenTK_DW.[dbo].[v_opetuksen_jarjestajan_tiedoantajatyyppi]

DELETE FROM VipunenTK..d_erityisopetuksen_peruste;
INSERT INTO VipunenTK..d_erityisopetuksen_peruste
	SELECT * FROM VipunenTK_DW.[dbo].[v_erityisopetuksen_peruste]

DELETE FROM VipunenTK..d_erityisoppilaan_opetusryhma;
INSERT INTO VipunenTK..d_erityisoppilaan_opetusryhma
	SELECT * FROM VipunenTK_DW.[dbo].[v_erityisoppilaan_opetusryhma]

DELETE FROM VipunenTK..d_perusjoukko;
INSERT INTO VipunenTK..d_perusjoukko
	SELECT * FROM VipunenTK_DW.[dbo].[v_perusjoukko]

DELETE FROM VipunenTK.dbo.d_valtio
INSERT INTO VipunenTK.dbo.d_valtio
	SELECT * FROM VipunenTK_DW.[dbo].[v_valtio_nykytila]

DELETE FROM VipunenTK.dbo.d_opiskelijan_olo_tamm
INSERT INTO VipunenTK.dbo.d_opiskelijan_olo_tamm
	SELECT * FROM VipunenTK_DW.[dbo].[v_opiskelijan_olo_tamm]

DELETE FROM VipunenTK.dbo.d_vahintaan_45_op_suorittanut
INSERT INTO VipunenTK.dbo.d_vahintaan_45_op_suorittanut
	SELECT * FROM VipunenTK_DW.[dbo].[v_vahintaan_45_op_suorittanut]

DELETE FROM VipunenTK.dbo.d_opetushallinnon_koulutusala
INSERT INTO VipunenTK.dbo.d_opetushallinnon_koulutusala
	SELECT * FROM VipunenTK_DW.[dbo].[v_opetushallinnon_koulutusala]

DELETE FROM VipunenTK.dbo.d_suoritettu_tutkinto
INSERT INTO VipunenTK.dbo.d_suoritettu_tutkinto
	SELECT * FROM VipunenTK_DW.[dbo].[v_suoritettu_tutkinto]

DELETE FROM VipunenTK.dbo.d_aikaisemmat_tutkinnot
INSERT INTO VipunenTK.dbo.d_aikaisemmat_tutkinnot
	SELECT * FROM VipunenTK_DW.[dbo].[v_aikaisemmat_tutkinnot]

DELETE FROM  VipunenTK.dbo.d_jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla
INSERT INTO VipunenTK.dbo.d_jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla
	SELECT * FROM VipunenTK_DW.[dbo].[v_jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla]

DELETE FROM  VipunenTK.dbo.d_jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002
INSERT INTO VipunenTK.dbo.d_jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002
	SELECT * FROM VipunenTK_DW.[dbo].[v_jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002]

DELETE FROM  VipunenTK.dbo.d_jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002
INSERT INTO VipunenTK.dbo.d_jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002
	SELECT * FROM VipunenTK_DW.[dbo].[v_jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002]

DELETE FROM  VipunenTK.dbo.d_jatkaa_opiskelua_alkuperaisella_koulutussektorilla
INSERT INTO VipunenTK.dbo.d_jatkaa_opiskelua_alkuperaisella_koulutussektorilla
	SELECT * FROM VipunenTK_DW.[dbo].[v_jatkaa_opiskelua_alkuperaisella_koulutussektorilla]

DELETE FROM  VipunenTK.dbo.d_jatkaa_opiskelua_alkuperaisella_opintoalalla_2002
INSERT INTO VipunenTK.dbo.d_jatkaa_opiskelua_alkuperaisella_opintoalalla_2002
	SELECT * FROM VipunenTK_DW.[dbo].[v_jatkaa_opiskelua_alkuperaisella_opintoalalla_2002]

DELETE FROM  VipunenTK.dbo.d_jatkaa_opiskelua_alkuperaisessa_maakunnassa;
INSERT INTO VipunenTK.dbo.d_jatkaa_opiskelua_alkuperaisessa_maakunnassa
	SELECT * FROM VipunenTK_DW.[dbo].[v_jatkaa_opiskelua_alkuperaisessa_maakunnassa]

DELETE FROM  VipunenTK.dbo.d_jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa
INSERT INTO VipunenTK.dbo.d_jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa
	SELECT * FROM VipunenTK_DW.[dbo].[v_jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa]

DELETE FROM  VipunenTK.dbo.d_jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla
INSERT INTO VipunenTK.dbo.d_jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla
	SELECT * FROM VipunenTK_DW.[dbo].[v_jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla]

DELETE FROM  VipunenTK.dbo.d_jatkaa_opiskelua_muulla_koulutusalalla_2002
INSERT INTO VipunenTK.dbo.d_jatkaa_opiskelua_muulla_koulutusalalla_2002
	SELECT * FROM VipunenTK_DW.[dbo].[v_jatkaa_opiskelua_muulla_koulutusalalla_2002]

DELETE FROM  VipunenTK.dbo.d_jatkaa_opiskelua_muulla_koulutusasteella_2002
INSERT INTO VipunenTK.dbo.d_jatkaa_opiskelua_muulla_koulutusasteella_2002
	SELECT * FROM VipunenTK_DW.[dbo].[v_jatkaa_opiskelua_muulla_koulutusasteella_2002]

DELETE FROM  VipunenTK.dbo.d_jatkaa_opiskelua_muulla_koulutussektorilla
INSERT INTO VipunenTK.dbo.d_jatkaa_opiskelua_muulla_koulutussektorilla
	SELECT * FROM VipunenTK_DW.[dbo].[v_jatkaa_opiskelua_muulla_koulutussektorilla]

DELETE FROM VipunenTK.dbo.d_jatkaa_opiskelua_muulla_opintoalalla_2002
INSERT INTO VipunenTK.dbo.d_jatkaa_opiskelua_muulla_opintoalalla_2002
	SELECT * FROM VipunenTK_DW.[dbo].[v_jatkaa_opiskelua_muulla_opintoalalla_2002]

DELETE FROM  VipunenTK.dbo.d_jatkaa_opiskelua_muussa_maakunnassa
INSERT INTO VipunenTK.dbo.d_jatkaa_opiskelua_muussa_maakunnassa
	SELECT * FROM VipunenTK_DW.[dbo].[v_jatkaa_opiskelua_muussa_maakunnassa]

DELETE FROM  VipunenTK.dbo.d_jatkaa_opiskelua_muussa_oppilaitoksessa
INSERT INTO VipunenTK.dbo.d_jatkaa_opiskelua_muussa_oppilaitoksessa
	SELECT * FROM VipunenTK_DW.[dbo].[v_jatkaa_opiskelua_muussa_oppilaitoksessa]

DELETE FROM  VipunenTK.dbo.d_tutkinto_alkuperaisella_koulutuksen_jarjestajalla
INSERT INTO VipunenTK.dbo.d_tutkinto_alkuperaisella_koulutuksen_jarjestajalla
	SELECT * FROM VipunenTK_DW.[dbo].[v_tutkinto_alkuperaisella_koulutuksen_jarjestajalla]

DELETE FROM  VipunenTK.dbo.d_tutkinto_alkuperaisella_koulutusalalla_2002
INSERT INTO VipunenTK.dbo.d_tutkinto_alkuperaisella_koulutusalalla_2002
	SELECT * FROM VipunenTK_DW.[dbo].[v_tutkinto_alkuperaisella_koulutusalalla_2002]

DELETE FROM  VipunenTK.dbo.d_tutkinto_alkuperaisella_koulutusasteella_2002
INSERT INTO VipunenTK.dbo.d_tutkinto_alkuperaisella_koulutusasteella_2002
	SELECT * FROM VipunenTK_DW.[dbo].[v_tutkinto_alkuperaisella_koulutusasteella_2002]

DELETE FROM  VipunenTK.dbo.d_tutkinto_alkuperaisella_koulutussektorilla
INSERT INTO VipunenTK.dbo.d_tutkinto_alkuperaisella_koulutussektorilla
	SELECT * FROM VipunenTK_DW.[dbo].[v_tutkinto_alkuperaisella_koulutussektorilla]

DELETE FROM  VipunenTK.dbo.d_tutkinto_alkuperaisella_opintoalalla_2002
INSERT INTO VipunenTK.dbo.d_tutkinto_alkuperaisella_opintoalalla_2002
	SELECT * FROM VipunenTK_DW.[dbo].[v_tutkinto_alkuperaisella_opintoalalla_2002]

DELETE FROM  VipunenTK.dbo.d_tutkinto_alkuperaisessa_maakunnassa
INSERT INTO VipunenTK.dbo.d_tutkinto_alkuperaisessa_maakunnassa
	SELECT * FROM VipunenTK_DW.[dbo].[v_tutkinto_alkuperaisessa_maakunnassa] 

DELETE FROM  VipunenTK.dbo.d_tutkinto_alkuperaisessa_oppilaitoksessa
INSERT INTO VipunenTK.dbo.d_tutkinto_alkuperaisessa_oppilaitoksessa
	SELECT * FROM VipunenTK_DW.[dbo].[v_tutkinto_alkuperaisessa_oppilaitoksessa]

DELETE FROM  VipunenTK.dbo.d_tutkinto_muulla_koulutuksen_jarjestajalla
INSERT INTO VipunenTK.dbo.d_tutkinto_muulla_koulutuksen_jarjestajalla
	SELECT * FROM VipunenTK_DW.[dbo].[v_tutkinto_muulla_koulutuksen_jarjestajalla] 

DELETE FROM  VipunenTK.dbo.d_tutkinto_muulla_koulutusalalla_2002
INSERT INTO VipunenTK.dbo.d_tutkinto_muulla_koulutusalalla_2002
	SELECT * FROM VipunenTK_DW.[dbo].[v_tutkinto_muulla_koulutusalalla_2002]

DELETE FROM  VipunenTK.dbo.d_tutkinto_muulla_koulutusasteella_2002
INSERT INTO VipunenTK.dbo.d_tutkinto_muulla_koulutusasteella_2002
	SELECT * FROM VipunenTK_DW.[dbo].[v_tutkinto_muulla_koulutusasteella_2002]

DELETE FROM  VipunenTK.dbo.d_tutkinto_muulla_koulutussektorilla
INSERT INTO VipunenTK.dbo.d_tutkinto_muulla_koulutussektorilla
	SELECT * FROM VipunenTK_DW.[dbo].[v_tutkinto_muulla_koulutussektorilla]

DELETE FROM  VipunenTK.dbo.d_tutkinto_muulla_opintoalalla_2002
INSERT INTO VipunenTK.dbo.d_tutkinto_muulla_opintoalalla_2002
	SELECT * FROM VipunenTK_DW.[dbo].[v_tutkinto_muulla_opintoalalla_2002]

DELETE FROM  VipunenTK.dbo.d_tutkinto_muussa_maakunnassa
INSERT INTO VipunenTK.dbo.d_tutkinto_muussa_maakunnassa
	SELECT * FROM VipunenTK_DW.[dbo].[v_tutkinto_muussa_maakunnassa]

DELETE FROM  VipunenTK.dbo.d_tutkinto_muussa_oppilaitoksessa
INSERT INTO VipunenTK.dbo.d_tutkinto_muussa_oppilaitoksessa
	SELECT * FROM VipunenTK_DW.[dbo].[v_tutkinto_muussa_oppilaitoksessa]

DELETE FROM VipunenTK..d_opintojen_kulku_koulutuksen_jarjestajan_mukaan;
INSERT INTO VipunenTK..d_opintojen_kulku_koulutuksen_jarjestajan_mukaan
	SELECT * FROM VipunenTK_DW.[dbo].[v_opintojen_kulku_koulutuksen_jarjestajan_mukaan];

DELETE FROM VipunenTK..d_opintojen_kulku_koulutusalan_2002_mukaan;
INSERT INTO VipunenTK..d_opintojen_kulku_koulutusalan_2002_mukaan
	SELECT * FROM VipunenTK_DW.[dbo].[v_opintojen_kulku_koulutusalan_2002_mukaan];

DELETE FROM VipunenTK..d_opintojen_kulku_koulutusasteen_2002_mukaan;
INSERT INTO VipunenTK..d_opintojen_kulku_koulutusasteen_2002_mukaan
	SELECT * FROM VipunenTK_DW.[dbo].[v_opintojen_kulku_koulutusasteen_2002_mukaan];

DELETE FROM VipunenTK..d_opintojen_kulku_koulutussektorin_mukaan;
INSERT INTO VipunenTK..d_opintojen_kulku_koulutussektorin_mukaan
	SELECT * FROM VipunenTK_DW.[dbo].[v_opintojen_kulku_koulutussektorin_mukaan];

DELETE FROM VipunenTK..d_opintojen_kulku_maakunnan_mukaan;
INSERT INTO VipunenTK..d_opintojen_kulku_maakunnan_mukaan
	SELECT * FROM VipunenTK_DW.[dbo].[v_opintojen_kulku_maakunnan_mukaan];

DELETE FROM VipunenTK..d_opintojen_kulku_opintoalan_2002_mukaan;
INSERT INTO VipunenTK..d_opintojen_kulku_opintoalan_2002_mukaan
	SELECT * FROM VipunenTK_DW.[dbo].[v_opintojen_kulku_opintoalan_2002_mukaan];

DELETE FROM VipunenTK..d_opintojen_kulku_oppilaitoksen_mukaan;
INSERT INTO VipunenTK..d_opintojen_kulku_oppilaitoksen_mukaan
	SELECT * FROM VipunenTK_DW.[dbo].[v_opintojen_kulku_oppilaitoksen_mukaan];

DELETE FROM VipunenTK..d_koulutuksen_kesto;
INSERT INTO VipunenTK..d_koulutuksen_kesto
	SELECT * FROM VipunenTK_DW.[dbo].[v_koulutuksen_kesto];

DELETE FROM VipunenTK..d_liikkuvuuden_kesto;
INSERT INTO VipunenTK..d_liikkuvuuden_kesto
	SELECT * FROM VipunenTK_DW.[dbo].[v_liikkuvuuden_kesto];

DELETE FROM VipunenTK..d_oppisopimuskoulutus_osallistuneet_ja_tutk_suorittaneet;
INSERT INTO VipunenTK..d_oppisopimuskoulutus_osallistuneet_ja_tutk_suorittaneet
	SELECT * FROM VipunenTK_DW.[dbo].[v_oppisopimuskoulutus_osallistuneet_ja_tutk_suorittaneet];

DELETE FROM VipunenTK..d_jatko_opiskelu;
INSERT INTO VipunenTK..d_jatko_opiskelu
	SELECT * FROM VipunenTK_DW.[dbo].[v_jatko_opiskelu];

DELETE FROM VipunenTK..d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2;
INSERT INTO VipunenTK..d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2
	SELECT * FROM VipunenTK_DW.[dbo].[v_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2];

DELETE FROM VipunenTK..d_opintojen_kulku_koulutusalan_2002_mukaan_versio2;
INSERT INTO VipunenTK..d_opintojen_kulku_koulutusalan_2002_mukaan_versio2
	SELECT * FROM VipunenTK_DW.[dbo].[v_opintojen_kulku_koulutusalan_2002_mukaan_versio2];

DELETE FROM VipunenTK..d_opintojen_kulku_opintoalan_2002_mukaan_versio2;
INSERT INTO VipunenTK..d_opintojen_kulku_opintoalan_2002_mukaan_versio2
	SELECT * FROM VipunenTK_DW.[dbo].[v_opintojen_kulku_opintoalan_2002_mukaan_versio2];

DELETE FROM VipunenTK..d_opintojen_kulku_oppilaitoksen_mukaan_versio2;
INSERT INTO VipunenTK..d_opintojen_kulku_oppilaitoksen_mukaan_versio2
	SELECT * FROM VipunenTK_DW.[dbo].[v_opintojen_kulku_oppilaitoksen_mukaan_versio2];

DELETE FROM VipunenTK..d_yrityksen_koko_tthv;
INSERT INTO VipunenTK..d_yrityksen_koko_tthv
	SELECT * FROM VipunenTK_DW.[dbo].[v_yrityksen_koko_tthv];

DELETE FROM VipunenTK..d_tyonantajasektori_sama_kuin_ed_vuonna;
INSERT INTO VipunenTK..d_tyonantajasektori_sama_kuin_ed_vuonna
	SELECT * FROM VipunenTK_DW.[dbo].[v_tyonantajasektori_sama_kuin_ed_vuonna];

DELETE FROM VipunenTK..d_toimiala_tthv1_sama_kuin_ed_vuonna;
INSERT INTO VipunenTK..d_toimiala_tthv1_sama_kuin_ed_vuonna
	SELECT * FROM VipunenTK_DW.[dbo].[v_toimiala_tthv1_sama_kuin_ed_vuonna];

DELETE FROM VipunenTK..d_toimiala_tthv2_sama_kuin_ed_vuonna;
INSERT INTO VipunenTK..d_toimiala_tthv2_sama_kuin_ed_vuonna
	SELECT * FROM VipunenTK_DW.[dbo].[v_toimiala_tthv2_sama_kuin_ed_vuonna];

--uudet 3.11 dimensiot
--kaste_t2
DELETE FROM  VipunenTK.dbo.d_jatkaa_opiskelua_alkuperaisella_kaste_t2ella
INSERT INTO VipunenTK.dbo.d_jatkaa_opiskelua_alkuperaisella_kaste_t2ella
SELECT * FROM VipunenTK_lisatiedot.dbo.jatkaa_opiskelua_alkuperaisella_kaste_t2ella

DELETE FROM  VipunenTK.dbo.d_jatkaa_opiskelua_muulla_kaste_t2ella
INSERT INTO VipunenTK.dbo.d_jatkaa_opiskelua_muulla_kaste_t2ella
SELECT * FROM VipunenTK_lisatiedot.dbo.jatkaa_opiskelua_muulla_kaste_t2ella

DELETE FROM  VipunenTK.dbo.d_opintojen_kulku_kaste_t2en_mukaan
INSERT INTO VipunenTK.dbo.d_opintojen_kulku_kaste_t2en_mukaan
SELECT * FROM VipunenTK_lisatiedot.dbo.opintojen_kulku_kaste_t2en_mukaan

DELETE FROM  VipunenTK.dbo.d_tutkinto_alkuperaisella_kaste_t2ella
INSERT INTO VipunenTK.dbo.d_tutkinto_alkuperaisella_kaste_t2ella
SELECT * FROM VipunenTK_lisatiedot.dbo.tutkinto_alkuperaisella_kaste_t2ella

DELETE FROM  VipunenTK.dbo.d_tutkinto_muulla_kaste_t2ella
INSERT INTO VipunenTK.dbo.d_tutkinto_muulla_kaste_t2ella
SELECT * FROM VipunenTK_lisatiedot.dbo.tutkinto_muulla_kaste_t2ella

--kalat 1-3
DELETE FROM  VipunenTK.dbo.d_jatkaa_opiskelua_alkuperaisella_kala_t1lla
INSERT INTO VipunenTK.dbo.d_jatkaa_opiskelua_alkuperaisella_kala_t1lla
SELECT * FROM VipunenTK_lisatiedot.dbo.jatkaa_opiskelua_alkuperaisella_kala_t1lla

DELETE FROM  VipunenTK.dbo.d_jatkaa_opiskelua_alkuperaisella_kala_t2lla
INSERT INTO VipunenTK.dbo.d_jatkaa_opiskelua_alkuperaisella_kala_t2lla
SELECT * FROM VipunenTK_lisatiedot.dbo.jatkaa_opiskelua_alkuperaisella_kala_t2lla

DELETE FROM  VipunenTK.dbo.d_jatkaa_opiskelua_alkuperaisella_kala_t3lla
INSERT INTO VipunenTK.dbo.d_jatkaa_opiskelua_alkuperaisella_kala_t3lla
SELECT * FROM VipunenTK_lisatiedot.dbo.jatkaa_opiskelua_alkuperaisella_kala_t3lla

DELETE FROM  VipunenTK.dbo.d_jatkaa_opiskelua_muulla_kala_t1lla
INSERT INTO VipunenTK.dbo.d_jatkaa_opiskelua_muulla_kala_t1lla
SELECT * FROM VipunenTK_lisatiedot.dbo.jatkaa_opiskelua_muulla_kala_t1lla

DELETE FROM  VipunenTK.dbo.d_jatkaa_opiskelua_muulla_kala_t2lla
INSERT INTO VipunenTK.dbo.d_jatkaa_opiskelua_muulla_kala_t2lla
SELECT * FROM VipunenTK_lisatiedot.dbo.jatkaa_opiskelua_muulla_kala_t2lla

DELETE FROM  VipunenTK.dbo.d_jatkaa_opiskelua_muulla_kala_t3lla
INSERT INTO VipunenTK.dbo.d_jatkaa_opiskelua_muulla_kala_t3lla
SELECT * FROM VipunenTK_lisatiedot.dbo.jatkaa_opiskelua_muulla_kala_t3lla

DELETE FROM  VipunenTK.dbo.d_opintojen_kulku_kala_t1n_mukaan
INSERT INTO VipunenTK.dbo.d_opintojen_kulku_kala_t1n_mukaan
SELECT * FROM VipunenTK_lisatiedot.dbo.opintojen_kulku_kala_t1n_mukaan

DELETE FROM  VipunenTK.dbo.d_opintojen_kulku_kala_t1n_mukaan_versio2
INSERT INTO VipunenTK.dbo.d_opintojen_kulku_kala_t1n_mukaan_versio2
SELECT * FROM VipunenTK_lisatiedot.dbo.opintojen_kulku_kala_t1n_mukaan_versio2

DELETE FROM  VipunenTK.dbo.d_opintojen_kulku_kala_t2n_mukaan
INSERT INTO VipunenTK.dbo.d_opintojen_kulku_kala_t2n_mukaan
SELECT * FROM VipunenTK_lisatiedot.dbo.opintojen_kulku_kala_t2n_mukaan

DELETE FROM  VipunenTK.dbo.d_opintojen_kulku_kala_t2n_mukaan_versio2
INSERT INTO VipunenTK.dbo.d_opintojen_kulku_kala_t2n_mukaan_versio2
SELECT * FROM VipunenTK_lisatiedot.dbo.opintojen_kulku_kala_t2n_mukaan_versio2

DELETE FROM  VipunenTK.dbo.d_opintojen_kulku_kala_t3n_mukaan
INSERT INTO VipunenTK.dbo.d_opintojen_kulku_kala_t3n_mukaan
SELECT * FROM VipunenTK_lisatiedot.dbo.opintojen_kulku_kala_t3n_mukaan

DELETE FROM  VipunenTK.dbo.d_opintojen_kulku_kala_t3n_mukaan_versio2
INSERT INTO VipunenTK.dbo.d_opintojen_kulku_kala_t3n_mukaan_versio2
SELECT * FROM VipunenTK_lisatiedot.dbo.opintojen_kulku_kala_t3n_mukaan_versio2

DELETE FROM  VipunenTK.dbo.d_tutkinto_alkuperaisella_kala_t1lla
INSERT INTO VipunenTK.dbo.d_tutkinto_alkuperaisella_kala_t1lla
SELECT * FROM VipunenTK_lisatiedot.dbo.tutkinto_alkuperaisella_kala_t1lla

DELETE FROM  VipunenTK.dbo.d_tutkinto_alkuperaisella_kala_t2lla
INSERT INTO VipunenTK.dbo.d_tutkinto_alkuperaisella_kala_t2lla
SELECT * FROM VipunenTK_lisatiedot.dbo.tutkinto_alkuperaisella_kala_t2lla

DELETE FROM  VipunenTK.dbo.d_tutkinto_alkuperaisella_kala_t3lla
INSERT INTO VipunenTK.dbo.d_tutkinto_alkuperaisella_kala_t3lla
SELECT * FROM VipunenTK_lisatiedot.dbo.tutkinto_alkuperaisella_kala_t3lla

DELETE FROM  VipunenTK.dbo.d_tutkinto_muulla_kala_t1lla
INSERT INTO VipunenTK.dbo.d_tutkinto_muulla_kala_t1lla
SELECT * FROM VipunenTK_lisatiedot.dbo.tutkinto_muulla_kala_t1lla

DELETE FROM  VipunenTK.dbo.d_tutkinto_muulla_kala_t2lla
INSERT INTO VipunenTK.dbo.d_tutkinto_muulla_kala_t2lla
SELECT * FROM VipunenTK_lisatiedot.dbo.tutkinto_muulla_kala_t2lla

DELETE FROM  VipunenTK.dbo.d_tutkinto_muulla_kala_t3lla
INSERT INTO VipunenTK.dbo.d_tutkinto_muulla_kala_t3lla
SELECT * FROM VipunenTK_lisatiedot.dbo.tutkinto_muulla_kala_t3lla




GO


