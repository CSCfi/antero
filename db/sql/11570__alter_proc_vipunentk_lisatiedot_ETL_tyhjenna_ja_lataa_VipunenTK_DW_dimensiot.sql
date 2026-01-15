USE [VipunenTK_lisatiedot]
GO

/****** Object:  StoredProcedure [dbo].[ETL_tyhjenna_ja_lataa_VipunenTK_DW_dimensiot]    Script Date: 15.1.2026 15.07.27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

















ALTER PROCEDURE [dbo].[ETL_tyhjenna_ja_lataa_VipunenTK_DW_dimensiot] AS

-- Aluksi jarjestaja-datojen lataus vipunen_koodistokannasta:


EXEC lataa_jarjestajatiedot;


-- Sitten normaalit dimensiolataukset

TRUNCATE TABLE VipunenTK_DW.dbo.d_aidinkieli_versio1;
INSERT INTO VipunenTK_DW.dbo.d_aidinkieli_versio1
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_aidinkieli_versio1] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_aidinkieli_versio2;
INSERT INTO VipunenTK_DW..d_aidinkieli_versio2
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_aidinkieli_versio2] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_aidinkieli_versio3;
INSERT INTO VipunenTK_DW..d_aidinkieli_versio3
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_aidinkieli_versio3] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_aidinkieli_versio5;
INSERT INTO VipunenTK_DW..d_aidinkieli_versio5
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_aidinkieli_versio5] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_aikuisopiskelija;
INSERT INTO VipunenTK_DW..d_aikuisopiskelija
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_aikuisopiskelija] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_aineisto;
INSERT INTO VipunenTK_DW..d_aineisto
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_aineisto] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_aineisto_OTV;
INSERT INTO VipunenTK_DW..d_aineisto_OTV
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_aineisto_OTV] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_amm_sopimusjaksot;
INSERT INTO VipunenTK_DW..d_amm_sopimusjaksot 
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_amm_sopimusjaksot] WHERE virhetilanne = 'E';

Truncate table VipunenTK_DW.dbo.d_ammatillinen_koulutus_luokittelu
Insert into VipunenTK_DW.dbo.d_ammatillinen_koulutus_luokittelu
Select * from VipunenTK_lisatiedot.dbo.[v_ammatillinen_koulutus_luokittelu] where virhetilanne<>'K'

TRUNCATE TABLE VipunenTK_DW..d_ammatillinen_peruskoulutus_lisakoulutus;
INSERT INTO VipunenTK_DW..d_ammatillinen_peruskoulutus_lisakoulutus
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_ammatillinen_peruskoulutus_lisakoulutus] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_ammatillisen_koulutuksen_koulutuslaji;
INSERT INTO VipunenTK_DW..d_ammatillisen_koulutuksen_koulutuslaji
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_ammatillisen_koulutuksen_koulutuslaji] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa;
INSERT INTO VipunenTK_DW..d_ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_ammattiasema;
INSERT INTO VipunenTK_DW..d_ammattiasema
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_ammattiasema] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_ammattiluokitus_2001;   -- oli tyhjä devissä
INSERT INTO VipunenTK_DW..d_ammattiluokitus_2001
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_ammattiluokitus_2001] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_ammattiluokitus_2010;   -- oli tyhjä devissä
INSERT INTO VipunenTK_DW..d_ammattiluokitus_2010
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_ammattiluokitus_2010] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_asuinkunta_sama_vai_eri_kuin_aiemmin;   -- oli tyhjä devissä
INSERT INTO VipunenTK_DW..d_asuinkunta_sama_vai_eri_kuin_aiemmin
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_asuinkunta_sama_vai_eri_kuin_aiemmin] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW.dbo.d_asuinmaakunta_sama_kuin_tyopaikan
INSERT INTO VipunenTK_DW.dbo.d_asuinmaakunta_sama_kuin_tyopaikan
	SELECT * FROM VipunenTK_lisatiedot.dbo.[v_asuinmaakunta_sama_kuin_tyopaikan] WHERE virhetilanne <> 'K'

TRUNCATE TABLE VipunenTK_DW..d_avoinvayla;
INSERT INTO VipunenTK_DW..d_avoinvayla
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_avoinvayla] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW.dbo.d_edellisen_vuoden_opiskelu
INSERT INTO VipunenTK_DW.dbo.d_edellisen_vuoden_opiskelu
	SELECT * FROM VipunenTK_lisatiedot.dbo.[v_edellisen_vuoden_opiskelu] WHERE virhetilanne<>'K'

TRUNCATE TABLE VipunenTK_DW.dbo.d_edeltavan_vuoden_asuinpaikka
INSERT INTO VipunenTK_DW.dbo.d_edeltavan_vuoden_asuinpaikka
	SELECT * FROM VipunenTK_lisatiedot.dbo.[v_edeltavan_vuoden_asuinpaikka] WHERE virhetilanne<>'K'



TRUNCATE TABLE VipunenTK_DW..d_elakkeelle_siirtynyt_tai_kuollut;
INSERT INTO VipunenTK_DW..d_elakkeelle_siirtynyt_tai_kuollut
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_elakkeelle_siirtynyt_tai_kuollut] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_ensisijainen_opintooikeus;
INSERT INTO VipunenTK_DW..d_ensisijainen_opintooikeus
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_ensisijainen_opintooikeus] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_erikoislaakarikoulutus;
INSERT INTO VipunenTK_DW..d_erikoislaakarikoulutus
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_erikoislaakarikoulutus] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_eu_etamaat;
INSERT INTO VipunenTK_DW..d_eu_etamaat
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_eu_etamaat] WHERE virhetilanne = 'E';


TRUNCATE TABLE VipunenTK_DW.dbo.d_hakukohde
INSERT INTO VipunenTK_DW.dbo.d_hakukohde
	SELECT * FROM VipunenTK_lisatiedot.dbo.[v_hakukohde] WHERE virhetilanne<>'K'

TRUNCATE TABLE VipunenTK_DW.dbo.d_hakukohde_erillisvalinta
INSERT INTO VipunenTK_DW.dbo.d_hakukohde_erillisvalinta
	SELECT * FROM VipunenTK_lisatiedot.dbo.[v_hakukohde_erillisvalinta] WHERE virhetilanne<>'K'

TRUNCATE TABLE VipunenTK_DW.dbo.d_hakukohteen_prioriteetti
INSERT INTO VipunenTK_DW.dbo.d_hakukohteen_prioriteetti
	SELECT * FROM VipunenTK_lisatiedot.dbo.[v_hakukohteen_prioriteetti] WHERE virhetilanne<>'K'

TRUNCATE TABLE VipunenTK_DW.dbo.d_hakukohteen_tulos
INSERT INTO VipunenTK_DW.dbo.d_hakukohteen_tulos
	SELECT * FROM VipunenTK_lisatiedot.dbo.[v_hakukohteen_tulos] WHERE virhetilanne<>'K'

TRUNCATE TABLE VipunenTK_DW.dbo.d_hakukohteen_tutkinnon_taso
INSERT INTO VipunenTK_DW.dbo.d_hakukohteen_tutkinnon_taso
	SELECT * FROM VipunenTK_lisatiedot.dbo.[v_hakukohteen_tutkinnon_taso] WHERE virhetilanne<>'K'

TRUNCATE TABLE VipunenTK_DW..d_hallinnonala;
INSERT INTO VipunenTK_DW..d_hallinnonala
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_hallinnonala] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_hallinnonala2;
INSERT INTO VipunenTK_DW..d_hallinnonala2
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_hallinnonala2] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW.dbo.d_hetu_ok
INSERT INTO VipunenTK_DW.dbo.d_hetu_ok
	SELECT * FROM VipunenTK_lisatiedot.dbo.[v_hetu_ok] WHERE virhetilanne<>'K'

TRUNCATE TABLE VipunenTK_DW..d_ika;
INSERT INTO VipunenTK_DW..d_ika
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_ika] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_jarjestaja;
INSERT INTO VipunenTK_DW..d_jarjestaja
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_jarjestaja] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_kansalaisuus_versio1;
INSERT INTO VipunenTK_DW..d_kansalaisuus_versio1
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_kansalaisuus_versio1] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_kansalaisuus_versio2;
INSERT INTO VipunenTK_DW..d_kansalaisuus_versio2
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_kansalaisuus_versio2] WHERE virhetilanne = 'E';

--TRUNCATE TABLE VipunenTK_DW..d_katsomusaine;
--INSERT INTO VipunenTK_DW..d_katsomusaine
--	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_katsomusaine] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_kausi;
INSERT INTO VipunenTK_DW..d_kausi
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_kausi] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_kieli;
INSERT INTO VipunenTK_DW..d_kieli
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_kieli] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_kieli2;
INSERT INTO VipunenTK_DW..d_kieli2
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_kieli2] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_koulutuksen_jarjestamismuoto;
INSERT INTO VipunenTK_DW..d_koulutuksen_jarjestamismuoto
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_koulutuksen_jarjestamismuoto] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_koulutuksen_jarjestajan_koko;
INSERT INTO VipunenTK_DW..d_koulutuksen_jarjestajan_koko
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_koulutuksen_jarjestajan_koko] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_koulutuksen_kieli_versio1;
INSERT INTO VipunenTK_DW..d_koulutuksen_kieli_versio1
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_koulutuksen_kieli_versio1] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_koulutuksen_paattaneiden_toiminta;
INSERT INTO VipunenTK_DW..d_koulutuksen_paattaneiden_toiminta
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_koulutuksen_paattaneiden_toiminta] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_koulutuksen_tavoite_toteuma;
INSERT INTO VipunenTK_DW..d_koulutuksen_tavoite_toteuma
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_koulutuksen_tavoite_toteuma] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_koulutusaste_2002;
INSERT INTO VipunenTK_DW..d_koulutusaste_2002
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_koulutusaste_2002] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_koulutuslaji;
INSERT INTO VipunenTK_DW..d_koulutuslaji
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_koulutuslaji] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_koulutuslaji2;
INSERT INTO VipunenTK_DW..d_koulutuslaji2
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_koulutuslaji2] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_koulutuslaji3;
INSERT INTO VipunenTK_DW..d_koulutuslaji3
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_koulutuslaji3] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_koulutuslaji_okm;
INSERT INTO VipunenTK_DW..d_koulutuslaji_okm
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_koulutuslaji_okm] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_koulutusmuoto;
INSERT INTO VipunenTK_DW..d_koulutusmuoto
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_koulutusmuoto] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_koulutusohjelma_amk;
INSERT INTO VipunenTK_DW..d_koulutusohjelma_amk
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_koulutusohjelma_amk] WHERE virhetilanne = 'E';

EXEC [VipunenTK_lisatiedot].[dbo].[p_lataa_koulutusohjelma_ammpk];
TRUNCATE TABLE VipunenTK_DW..d_koulutusohjelma_ammpk;
INSERT INTO VipunenTK_DW..d_koulutusohjelma_ammpk
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_koulutusohjelma_ammpk] WHERE virhetilanne = 'E';


TRUNCATE TABLE VipunenTK_DW..d_koulutusryhma;
INSERT INTO VipunenTK_DW..d_koulutusryhma
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_koulutusryhma] WHERE virhetilanne = 'E';


TRUNCATE TABLE VipunenTK_DW..d_koulutussektori;
INSERT INTO VipunenTK_DW..d_koulutussektori
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_koulutussektori] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_koulutustyyppi;
INSERT INTO VipunenTK_DW..d_koulutustyyppi
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_koulutustyyppi] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_kvopiskelija;
INSERT INTO VipunenTK_DW..d_kvopiskelija
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_kvopiskelija] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_kylla_ei;
INSERT INTO VipunenTK_DW..d_kylla_ei
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_kylla_ei] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_lahde;
INSERT INTO VipunenTK_DW..d_lahde
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_lahde] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_lukiokoulutuksen_koulutuslaji;
INSERT INTO VipunenTK_DW..d_lukiokoulutuksen_koulutuslaji
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_lukiokoulutuksen_koulutuslaji] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_lukion_ainevalinnat;
INSERT INTO VipunenTK_DW..d_lukion_ainevalinnat
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_lukion_ainevalinnat] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_lukion_kieltenmaara;
INSERT INTO VipunenTK_DW..d_lukion_kieltenmaara
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_lukion_kieltenmaara] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_maahantulo_ja_opiskelun_aloittaminen;
INSERT INTO VipunenTK_DW..d_maahantulo_ja_opiskelun_aloittaminen
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_maahantulo_ja_opiskelun_aloittaminen] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_maassaolo;
INSERT INTO VipunenTK_DW..d_maassaolo
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_maassaolo] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_mitenna_ammatti;
INSERT INTO VipunenTK_DW..d_mitenna_ammatti
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_mitenna_ammatti] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_mitenna_toimiala;
INSERT INTO VipunenTK_DW..d_mitenna_toimiala
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_mitenna_toimiala] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_moninkertainen_haku;
INSERT INTO VipunenTK_DW..d_moninkertainen_haku
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_moninkertainen_haku] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_nuorten_aikuisten_koulutus;
INSERT INTO VipunenTK_DW..d_nuorten_aikuisten_koulutus
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_nuorten_aikuisten_koulutus] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_nuorten_aikuisten_koulutus_amm;
INSERT INTO VipunenTK_DW..d_nuorten_aikuisten_koulutus_amm
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_nuorten_aikuisten_koulutus_amm] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_oef_ammatti;
INSERT INTO VipunenTK_DW..d_oef_ammatti
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_oef_ammatti] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_oef_toimiala;
INSERT INTO VipunenTK_DW..d_oef_toimiala
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_oef_toimiala] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_opettajankelpoisuus;
INSERT INTO VipunenTK_DW..d_opettajankelpoisuus
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opettajankelpoisuus] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_opettajankelpoisuus2;
INSERT INTO VipunenTK_DW..d_opettajankelpoisuus2
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opettajankelpoisuus2] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_opettajan_tehtavatyyppi_ammatillisessa_koulutuksessa;
INSERT INTO VipunenTK_DW..d_opettajan_tehtavatyyppi_ammatillisessa_koulutuksessa
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opettajan_tehtavatyyppi_ammatillisessa_koulutuksessa] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_opettajan_tehtavatyyppi_lukiokoulutuksessa;
INSERT INTO VipunenTK_DW..d_opettajan_tehtavatyyppi_lukiokoulutuksessa
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opettajan_tehtavatyyppi_lukiokoulutuksessa] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_opettajan_tehtavatyyppi_perusopetuksessa;
INSERT INTO VipunenTK_DW..d_opettajan_tehtavatyyppi_perusopetuksessa
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opettajan_tehtavatyyppi_perusopetuksessa] WHERE virhetilanne = 'E';
	
TRUNCATE TABLE VipunenTK_DW..d_opettajan_tehtavatyyppi_taiteen_perusopetuksessa;
INSERT INTO VipunenTK_DW..d_opettajan_tehtavatyyppi_taiteen_perusopetuksessa
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opettajan_tehtavatyyppi_taiteen_perusopetuksessa] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_opettajan_tehtavatyyppi_vapaassa_sivistystyossa;
INSERT INTO VipunenTK_DW..d_opettajan_tehtavatyyppi_vapaassa_sivistystyossa
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opettajan_tehtavatyyppi_vapaassa_sivistystyossa] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_opettajat_aine;
INSERT INTO VipunenTK_DW..d_opettajat_aine
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opettajat_aine] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_opettajat_aine_2016;
INSERT INTO VipunenTK_DW..d_opettajat_aine_2016
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opettajat_aine_2016] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_opettajat_aine_2016_lukio;
INSERT INTO VipunenTK_DW..d_opettajat_aine_2016_lukio
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opettajat_aine_2016_lukio] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_opettajat_aine_amm;
INSERT INTO VipunenTK_DW..d_opettajat_aine_amm
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opettajat_aine_amm] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_opettajat_aine_vst;
INSERT INTO VipunenTK_DW..d_opettajat_aine_vst
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opettajat_aine_vst] WHERE virhetilanne = 'E';
	
TRUNCATE TABLE VipunenTK_DW..d_opettajat_ala_tpo;
INSERT INTO VipunenTK_DW..d_opettajat_ala_tpo
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opettajat_ala_tpo] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_opettajat_kelpoisuus_amm;
INSERT INTO VipunenTK_DW..d_opettajat_kelpoisuus_amm
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opettajat_kelpoisuus_amm] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_opettajat_koko_osa_aikainen;
INSERT INTO VipunenTK_DW..d_opettajat_koko_osa_aikainen
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opettajat_koko_osa_aikainen] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_opettajat_koulutusaste;
INSERT INTO VipunenTK_DW..d_opettajat_koulutusaste
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opettajat_koulutusaste] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_opettajat_koulutusaste_amm;
INSERT INTO VipunenTK_DW..d_opettajat_koulutusaste_amm
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opettajat_koulutusaste_amm] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_opettajat_koulutusaste_tpo;
INSERT INTO VipunenTK_DW..d_opettajat_koulutusaste_tpo
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opettajat_koulutusaste_tpo] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_opettajat_luokka_aste;
INSERT INTO VipunenTK_DW..d_opettajat_luokka_aste
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opettajat_luokka_aste] WHERE virhetilanne = 'E';
	
TRUNCATE TABLE VipunenTK_DW..d_opettajat_opintotaso_tpo;
INSERT INTO VipunenTK_DW..d_opettajat_opintotaso_tpo
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opettajat_opintotaso_tpo] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_opettajat_osa_aikaisuuden_syy;
INSERT INTO VipunenTK_DW..d_opettajat_osa_aikaisuuden_syy
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opettajat_osa_aikaisuuden_syy] WHERE virhetilanne = 'E';
	
TRUNCATE TABLE VipunenTK_DW..d_opettajat_taydennyskoulutus_tpo;
INSERT INTO VipunenTK_DW..d_opettajat_taydennyskoulutus_tpo
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opettajat_taydennyskoulutus_tpo] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_opettajat_tyosuhteen_luonne;
INSERT INTO VipunenTK_DW..d_opettajat_tyosuhteen_luonne
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opettajat_tyosuhteen_luonne] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_opetushallinnon_koulutus;
INSERT INTO VipunenTK_DW..d_opetushallinnon_koulutus
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opetushallinnon_koulutus] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_opetuskieli;
INSERT INTO VipunenTK_DW..d_opetuskieli
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opetuskieli] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_opetuskieli2;
INSERT INTO VipunenTK_DW..d_opetuskieli2
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opetuskieli2] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus;
INSERT INTO VipunenTK_DW..d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_opetustuntien_sisalto_ja_tavoiteluokitus;
INSERT INTO VipunenTK_DW..d_opetustuntien_sisalto_ja_tavoiteluokitus
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opetustuntien_sisalto_ja_tavoiteluokitus] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_opintoala2002;
INSERT INTO VipunenTK_DW..d_opintoala2002
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opintoala2002] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_opiskelijan_fte_tieto;
INSERT INTO VipunenTK_DW..d_opiskelijan_fte_tieto
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opiskelijan_fte_tieto] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_opiskelijan_olo;
INSERT INTO VipunenTK_DW..d_opiskelijan_olo
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opiskelijan_olo] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_opiskelumuoto;
INSERT INTO VipunenTK_DW..d_opiskelumuoto
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opiskelumuoto] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_opiskelu_toiminta;
INSERT INTO VipunenTK_DW..d_opiskelu_toiminta
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opiskelu_toiminta] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_oppilaitostyyppi;
INSERT INTO VipunenTK_DW..d_oppilaitostyyppi
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_oppilaitostyyppi] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_oppilaitostyyppi_amm;
INSERT INTO VipunenTK_DW..d_oppilaitostyyppi_amm
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_oppilaitostyyppi_amm] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_oppisopimus_purkautunut;
INSERT INTO VipunenTK_DW..d_oppisopimus_purkautunut
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_oppisopimus_purkautunut] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_oppisopimus_yrityksen_koko;
INSERT INTO VipunenTK_DW..d_oppisopimus_yrityksen_koko
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_oppisopimus_yrityksen_koko] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_oppisopimuskoulutus;
INSERT INTO VipunenTK_DW..d_oppisopimuskoulutus
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_oppisopimuskoulutus] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_osatutkinto;
INSERT INTO VipunenTK_DW..d_osatutkinto
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_osatutkinto] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_paaasiallinen_toiminta;
INSERT INTO VipunenTK_DW..d_paaasiallinen_toiminta
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_paaasiallinen_toiminta] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_paaasiallinen_toiminta_versio3;
INSERT INTO VipunenTK_DW..d_paaasiallinen_toiminta_versio3
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_paaasiallinen_toiminta_versio3] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_paaasiallinen_toiminta_ja_maasta_muuttaneet;
INSERT INTO VipunenTK_DW..d_paaasiallinen_toiminta_ja_maasta_muuttaneet
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_paaasiallinen_toiminta_ja_maasta_muuttaneet] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_paaasiallinen_toiminta_versio2;
INSERT INTO VipunenTK_DW..d_paaasiallinen_toiminta_versio2
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_paaasiallinen_toiminta_versio2] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_paaasiallinen_toiminta_versio9;
INSERT INTO VipunenTK_DW..d_paaasiallinen_toiminta_versio9
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_paaasiallinen_toiminta_versio9] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_patevyyteen_tahtaavat_opinnot_amk
INSERT INTO VipunenTK_DW..d_patevyyteen_tahtaavat_opinnot_amk
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_patevyyteen_tahtaavat_opinnot_amk] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_perusjoukko_tyolliset;
INSERT INTO VipunenTK_DW..d_perusjoukko_tyolliset
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_perusjoukko_tyolliset] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_perusopetuksen_ainevalinnat;
INSERT INTO VipunenTK_DW..d_perusopetuksen_ainevalinnat
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_perusopetuksen_ainevalinnat] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_perusopetuksen_kieltenmaara;
INSERT INTO VipunenTK_DW..d_perusopetuksen_kieltenmaara
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_perusopetuksen_kieltenmaara] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_perusopetuksen_vuosiluokat;
INSERT INTO VipunenTK_DW..d_perusopetuksen_vuosiluokat
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_perusopetuksen_vuosiluokat] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_pohjoismaa;
INSERT INTO VipunenTK_DW..d_pohjoismaa
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_pohjoismaa] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_rahoituslahde;
INSERT INTO VipunenTK_DW..d_rahoituslahde
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_rahoituslahde] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_rahoituslahde_amm;
INSERT INTO VipunenTK_DW..d_rahoituslahde_amm
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_rahoituslahde_amm] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_rahoituslahde_versio2;
INSERT INTO VipunenTK_DW..d_rahoituslahde_versio2
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_rahoituslahde_versio2] WHERE virhetilanne = 'E';

Truncate table VipunenTK_DW.dbo.d_sama_koulutusala
Insert into VipunenTK_DW.dbo.d_sama_koulutusala
Select * from VipunenTK_lisatiedot.dbo.[v_sama_koulutusala] where virhetilanne<>'K'

TRUNCATE TABLE VipunenTK_DW..Sarakeleveys;
INSERT INTO [VipunenTK_DW].[dbo].[Sarakeleveys]
SELECT *  FROM [VipunenTK_lisatiedot].[dbo].[v_sarakeleveys];

TRUNCATE TABLE VipunenTK_DW..d_sektoritutkimuslaitos;
INSERT INTO [VipunenTK_DW].[dbo].[d_sektoritutkimuslaitos]
SELECT *  FROM [VipunenTK_lisatiedot].[dbo].[v_sektoritutkimuslaitos]  WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_siirtyman_tarkastelusuunta;
INSERT INTO [VipunenTK_DW].[dbo].[d_siirtyman_tarkastelusuunta]
SELECT *  FROM [VipunenTK_lisatiedot].[dbo].[v_siirtyman_tarkastelusuunta]  WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_sosioekonominen_asema;
INSERT INTO VipunenTK_DW..d_sosioekonominen_asema
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_sosioekonominen_asema] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_suhteellinen_ajankohta;
INSERT INTO VipunenTK_DW..d_suhteellinen_ajankohta
	SELECT * FROM VipunenTK_lisatiedot..[v_suhteellinen_ajankohta] WHERE virhetilanne<>'K';

TRUNCATE TABLE VipunenTK_DW..d_sukupuoli;
INSERT INTO VipunenTK_DW..d_sukupuoli
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_sukupuoli] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_suorlk;
INSERT INTO VipunenTK_DW..d_suorlk
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_suorlk] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_suuntautumisvaihtoehto_amk;
INSERT INTO VipunenTK_DW..d_suuntautumisvaihtoehto_amk
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_suuntautumisvaihtoehto_amk] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_tarkastelujakso;
INSERT INTO VipunenTK_DW..d_tarkastelujakso
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_tarkastelujakso] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_tiedekunta_yo;
INSERT INTO VipunenTK_DW..d_tiedekunta_yo
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_tiedekunta_yo] WHERE virhetilanne = 'E';

Truncate table VipunenTK_DW.dbo.d_tieteenala;
Insert into VipunenTK_DW.dbo.d_tieteenala
	Select * from VipunenTK_lisatiedot.dbo.[v_tieteenala] where virhetilanne<>'K';

TRUNCATE TABLE VipunenTK_DW..d_tietojen_ajankohta;
INSERT INTO VipunenTK_DW..d_tietojen_ajankohta
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_tietojen_ajankohta] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_tilauskoulutuksen_sijaintimaa;
INSERT INTO VipunenTK_DW..d_tilauskoulutuksen_sijaintimaa
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_tilauskoulutuksen_sijaintimaa] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_todistus_oppisopimuskoulutuksen_suorittamisesta;
INSERT INTO VipunenTK_DW..d_todistus_oppisopimuskoulutuksen_suorittamisesta
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_todistus_oppisopimuskoulutuksen_suorittamisesta] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_toimiala_2008;   ---! oli tyhjä devissä
INSERT INTO VipunenTK_DW..d_toimiala_2008
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_toimiala_2008] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_toimiala_tk;  
INSERT INTO VipunenTK_DW..d_toimiala_tk
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_toimiala_tk] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_toimiala_tthv;  
INSERT INTO VipunenTK_DW..d_toimiala_tthv
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_toimiala_tthv] WHERE virhetilanne <>'K';

TRUNCATE TABLE VipunenTK_DW..d_toimiala_tthv1_sama_kuin_ed_vuonna;  
INSERT INTO VipunenTK_DW..d_toimiala_tthv1_sama_kuin_ed_vuonna
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_toimiala_tthv1_sama_kuin_ed_vuonna] WHERE virhetilanne <>'K';

TRUNCATE TABLE VipunenTK_DW..d_toimiala_tthv2_sama_kuin_ed_vuonna;  
INSERT INTO VipunenTK_DW..d_toimiala_tthv2_sama_kuin_ed_vuonna
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_toimiala_tthv2_sama_kuin_ed_vuonna] WHERE virhetilanne <>'K';

TRUNCATE TABLE VipunenTK_DW..d_tulodesiili;
INSERT INTO VipunenTK_DW..d_tulodesiili
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_tulodesiili] WHERE virhetilanne = 'E';

Truncate table VipunenTK_DW.dbo.d_tutkimuksen_rahoituslahde;
Insert into VipunenTK_DW.dbo.d_tutkimuksen_rahoituslahde
	Select * from VipunenTK_lisatiedot.dbo.[v_tutkimuksen_rahoituslahde] where virhetilanne<>'K';

Truncate table VipunenTK_DW.dbo.d_tutkimusmenojen_kohde;
Insert into VipunenTK_DW.dbo.d_tutkimusmenojen_kohde
	Select * from VipunenTK_lisatiedot.dbo.[v_tutkimusmenojen_kohde] where virhetilanne<>'K';

Truncate table VipunenTK_DW.dbo.d_tutkimus_tehtava;
Insert into VipunenTK_DW.dbo.d_tutkimus_tehtava
	Select * from VipunenTK_lisatiedot.dbo.[v_tutkimus_tehtava] where virhetilanne<>'K';

TRUNCATE TABLE VipunenTK_DW..d_tutkinnon_tavoite;
INSERT INTO VipunenTK_DW..d_tutkinnon_tavoite
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_tutkinnon_tavoite] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_tutkinnon_toteuma;
INSERT INTO VipunenTK_DW..d_tutkinnon_toteuma
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_tutkinnon_toteuma] WHERE virhetilanne = 'E';

Truncate table VipunenTK_DW.dbo.d_tutkinto_suoritettu
Insert into VipunenTK_DW.dbo.d_tutkinto_suoritettu
Select * from VipunenTK_lisatiedot.dbo.[v_tutkinto_suoritettu] where virhetilanne<>'K'

TRUNCATE TABLE VipunenTK_DW..d_tyopaikan_sijainti_v_tilastovuonna;
INSERT INTO VipunenTK_DW..d_tyopaikan_sijainti_v_tilastovuonna
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_tyopaikan_sijainti_v_tilastovuonna] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW.dbo.d_tutkinto
INSERT INTO VipunenTK_DW.dbo.d_tutkinto
	SELECT * FROM VipunenTK_lisatiedot.dbo.[v_tutkinto] WHERE virhetilanne<>'K'

TRUNCATE TABLE VipunenTK_DW..d_tutkinto_amk;
INSERT INTO VipunenTK_DW..d_tutkinto_amk
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_tutkinto_amk] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_tutkinto_yo;
INSERT INTO VipunenTK_DW..d_tutkinto_yo
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_tutkinto_yo] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_tutkintoasetus;
INSERT INTO VipunenTK_DW..d_tutkintoasetus
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_tutkintoasetus] WHERE virhetilanne = 'E';

Truncate table VipunenTK_DW.dbo.d_tutkintojen_maara
Insert into VipunenTK_DW.dbo.d_tutkintojen_maara
Select * from VipunenTK_lisatiedot.dbo.[v_tutkintojen_maara] where virhetilanne<>'K'

TRUNCATE TABLE VipunenTK_DW..d_tutkintolaji_tyollistymiseen;
INSERT INTO VipunenTK_DW..d_tutkintolaji_tyollistymiseen
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_tutkintolaji_tyollistymiseen] WHERE virhetilanne = 'E';

EXEC [VipunenTK_lisatiedot].[dbo].[p_lataa_tutkintonimike_ammpk];
TRUNCATE TABLE VipunenTK_DW..d_tutkintonimike_ammpk;
INSERT INTO VipunenTK_DW..d_tutkintonimike_ammpk
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_tutkintonimike_ammpk] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_tutkintoryhma;
INSERT INTO VipunenTK_DW..d_tutkintoryhma
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_tutkintoryhma] WHERE virhetilanne = 'E';

Truncate table VipunenTK_DW.dbo.d_tutkintotaso;
Insert into VipunenTK_DW.dbo.d_tutkintotaso
	Select * from VipunenTK_lisatiedot.dbo.[v_tutkintotaso] where virhetilanne<>'K';

TRUNCATE TABLE VipunenTK_DW..d_tuva_rahoitusjarjestelma;
INSERT INTO VipunenTK_DW..d_tuva_rahoitusjarjestelma
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_tuva_rahoitusjarjestelma] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_tyonantajasektori;
INSERT INTO VipunenTK_DW..d_tyonantajasektori
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_tyonantajasektori] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_tyonantajasektori2;
INSERT INTO VipunenTK_DW..d_tyonantajasektori2
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_tyonantajasektori2] WHERE virhetilanne <> 'K';

TRUNCATE TABLE VipunenTK_DW..d_tyossakayntitilaston_tyonantajasektori;
INSERT INTO VipunenTK_DW..d_tyossakayntitilaston_tyonantajasektori
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_tyossakayntitilaston_tyonantajasektori] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_tyovoimapoliittinen;
INSERT INTO VipunenTK_DW..d_tyovoimapoliittinen
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_tyovoimapoliittinen] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_tyovoimapoliittinen_koulutus;
INSERT INTO VipunenTK_DW..d_tyovoimapoliittinen_koulutus
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_tyovoimapoliittinen_koulutus] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_uusi_vanha_opiskelija;
INSERT INTO VipunenTK_DW..d_uusi_vanha_opiskelija
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_uusi_vanha_opiskelija] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_vahintaan_55_op_suorittanut;
INSERT INTO VipunenTK_DW..d_vahintaan_55_op_suorittanut
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_vahintaan_55_op_suorittanut] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_valiaikainen_amk;
INSERT INTO VipunenTK_DW..d_valiaikainen_amk
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_valiaikainen_amk] WHERE virhetilanne = 'E';

-- d_valtio ladataan "suoraan" VipunenTK-kantaan myöhemmässä vaiheessa, pidetään kuitenkin rakenne jos joskus tehdään historioitu versio
TRUNCATE TABLE VipunenTK_DW..d_valtio; 
INSERT INTO VipunenTK_DW..d_valtio
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_valtio] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_vayla_nayttotutkintoon;
INSERT INTO VipunenTK_DW..d_vayla_nayttotutkintoon
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_vayla_nayttotutkintoon] WHERE virhetilanne = 'E';

Truncate table VipunenTK_DW.dbo.d_virkaryhma;
Insert into VipunenTK_DW.dbo.d_virkaryhma
	Select * from VipunenTK_lisatiedot.dbo.[v_virkaryhma] where virhetilanne<>'K';

TRUNCATE TABLE VipunenTK_DW..d_yliopisto;
INSERT INTO VipunenTK_DW..d_yliopisto
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_yliopisto] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_yllapitajan_kieli;
INSERT INTO VipunenTK_DW..d_yllapitajan_kieli
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_yllapitajan_kieli] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_yrittajan_oppisopimuskoulutus;
INSERT INTO VipunenTK_DW..d_yrittajan_oppisopimuskoulutus
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_yrittajan_oppisopimuskoulutus] WHERE virhetilanne = 'E';
	
TRUNCATE TABLE VipunenTK_DW..d_aikaisempi_korkein_tutkinto;
INSERT INTO VipunenTK_DW..d_aikaisempi_korkein_tutkinto
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_aikaisempi_korkein_tutkinto] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_koulutuksesta_kulunut_aika;
INSERT INTO VipunenTK_DW..d_koulutuksesta_kulunut_aika
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_koulutuksesta_kulunut_aika] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_perusopetuksen_aloitusika;
INSERT INTO VipunenTK_DW..d_perusopetuksen_aloitusika
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_perusopetuksen_aloitusika] WHERE virhetilanne = 'E'

TRUNCATE TABLE VipunenTK_DW..d_perusopetuksen_erityisen_tuen_paatos;
INSERT INTO VipunenTK_DW..d_perusopetuksen_erityisen_tuen_paatos
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_perusopetuksen_erityisen_tuen_paatos] WHERE virhetilanne = 'E'

TRUNCATE TABLE VipunenTK_DW..d_perusopetuksen_kuljetusetuus;
INSERT INTO VipunenTK_DW..d_perusopetuksen_kuljetusetuus
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_perusopetuksen_kuljetusetuus] WHERE virhetilanne = 'E'

TRUNCATE TABLE VipunenTK_DW..d_perusopetuksen_majoitusetuus;
INSERT INTO VipunenTK_DW..d_perusopetuksen_majoitusetuus
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_perusopetuksen_majoitusetuus] WHERE virhetilanne = 'E'

TRUNCATE TABLE VipunenTK_DW..d_perusopetuksen_oppimaaran_yksilollistaminen;
INSERT INTO VipunenTK_DW..d_perusopetuksen_oppimaaran_yksilollistaminen
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_perusopetuksen_oppimaaran_yksilollistaminen] WHERE virhetilanne = 'E'

TRUNCATE TABLE VipunenTK_DW..d_perusopetuksen_pidennetty_oppivelvollisuus;
INSERT INTO VipunenTK_DW..d_perusopetuksen_pidennetty_oppivelvollisuus
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_perusopetuksen_pidennetty_oppivelvollisuus] WHERE virhetilanne = 'E'

TRUNCATE TABLE VipunenTK_DW..d_perusopetuksen_tehostettu_tuki;
INSERT INTO VipunenTK_DW..d_perusopetuksen_tehostettu_tuki
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_perusopetuksen_tehostettu_tuki] WHERE virhetilanne = 'E'

TRUNCATE TABLE VipunenTK_DW..d_perusopetuksen_tukimuoto;
INSERT INTO VipunenTK_DW..d_perusopetuksen_tukimuoto
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_perusopetuksen_tukimuoto] WHERE virhetilanne = 'E'

TRUNCATE TABLE VipunenTK_DW..d_perusopetuksen_yleisopetuksen_osuus;
INSERT INTO VipunenTK_DW..d_perusopetuksen_yleisopetuksen_osuus
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_perusopetuksen_yleisopetuksen_osuus] WHERE virhetilanne = 'E'

TRUNCATE TABLE VipunenTK_DW..d_joustava_perusopetus;
INSERT INTO VipunenTK_DW..d_joustava_perusopetus
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_joustava_perusopetus] WHERE virhetilanne = 'E'

TRUNCATE TABLE VipunenTK_DW..d_vieraskielisyys;
INSERT INTO VipunenTK_DW..d_vieraskielisyys
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_vieraskielisyys] WHERE virhetilanne = 'E'

TRUNCATE TABLE VipunenTK_DW..d_opiskelijan_aikaisempi_yleissivistava_koulutus;
INSERT INTO VipunenTK_DW..d_opiskelijan_aikaisempi_yleissivistava_koulutus
	SELECT * FROM VipunenTK_lisatiedot..opiskelijan_aikaisempi_yleissivistava_koulutus WHERE virhetilanne = 'E'

TRUNCATE TABLE VipunenTK_DW..d_pohjakoulutuksen_tila;
INSERT INTO VipunenTK_DW..d_pohjakoulutuksen_tila
	SELECT * FROM VipunenTK_lisatiedot..pohjakoulutuksen_tila WHERE virhetilanne = 'E'

TRUNCATE TABLE VipunenTK_DW..d_paaasiallinen_toiminta_okm;
INSERT INTO VipunenTK_DW..d_paaasiallinen_toiminta_okm
	SELECT * FROM VipunenTK_lisatiedot..paaasiallinen_toiminta_okm WHERE virhetilanne = 'E'

TRUNCATE TABLE VipunenTK_DW..d_opetuksen_jarjestajan_tiedoantajatyyppi;
INSERT INTO VipunenTK_DW..d_opetuksen_jarjestajan_tiedoantajatyyppi
	SELECT * FROM VipunenTK_lisatiedot..opetuksen_jarjestajan_tiedoantajatyyppi WHERE virhetilanne = 'E'

TRUNCATE TABLE VipunenTK_DW..d_erityisopetuksen_peruste;
INSERT INTO VipunenTK_DW..d_erityisopetuksen_peruste
	SELECT * FROM VipunenTK_lisatiedot..erityisopetuksen_peruste WHERE virhetilanne = 'E'

TRUNCATE TABLE VipunenTK_DW..d_erityisoppilaan_opetusryhma;
INSERT INTO VipunenTK_DW..d_erityisoppilaan_opetusryhma
	SELECT * FROM VipunenTK_lisatiedot..erityisoppilaan_opetusryhma WHERE virhetilanne = 'E'

TRUNCATE TABLE VipunenTK_DW..d_perusjoukko;
INSERT INTO VipunenTK_DW..d_perusjoukko
	SELECT * FROM VipunenTK_lisatiedot..perusjoukko WHERE virhetilanne = 'E'

TRUNCATE TABLE VipunenTK_DW..d_opiskelijan_olo_tamm;
INSERT INTO VipunenTK_DW..d_opiskelijan_olo_tamm
	SELECT * FROM VipunenTK_lisatiedot..opiskelijan_olo_tamm WHERE virhetilanne = 'E'

TRUNCATE TABLE VipunenTK_DW..d_vahintaan_45_op_suorittanut;
INSERT INTO VipunenTK_DW..d_vahintaan_45_op_suorittanut
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_vahintaan_45_op_suorittanut] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_yosairaala;
INSERT INTO [VipunenTK_DW].[dbo].[d_yosairaala]
SELECT *  FROM [VipunenTK_lisatiedot].[dbo].[v_yosairaala]  WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_opetushallinnon_koulutusala;
INSERT INTO VipunenTK_DW..d_opetushallinnon_koulutusala
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opetushallinnon_koulutusala] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_suoritettu_tutkinto;
INSERT INTO VipunenTK_DW..d_suoritettu_tutkinto
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_suoritettu_tutkinto] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_aikaisemmat_tutkinnot;
INSERT INTO VipunenTK_DW..d_aikaisemmat_tutkinnot
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_aikaisemmat_tutkinnot] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla;
INSERT INTO VipunenTK_DW..d_jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002;
INSERT INTO VipunenTK_DW..d_jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002;
INSERT INTO VipunenTK_DW..d_jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_jatkaa_opiskelua_alkuperaisella_koulutussektorilla;
INSERT INTO VipunenTK_DW..d_jatkaa_opiskelua_alkuperaisella_koulutussektorilla
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_jatkaa_opiskelua_alkuperaisella_koulutussektorilla] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_jatkaa_opiskelua_alkuperaisella_opintoalalla_2002;
INSERT INTO VipunenTK_DW..d_jatkaa_opiskelua_alkuperaisella_opintoalalla_2002
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_jatkaa_opiskelua_alkuperaisella_opintoalalla_2002] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_jatkaa_opiskelua_alkuperaisessa_maakunnassa;
INSERT INTO VipunenTK_DW..d_jatkaa_opiskelua_alkuperaisessa_maakunnassa
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_jatkaa_opiskelua_alkuperaisessa_maakunnassa] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa;
INSERT INTO VipunenTK_DW..d_jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla;
INSERT INTO VipunenTK_DW..d_jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_jatkaa_opiskelua_muulla_koulutusalalla_2002;
INSERT INTO VipunenTK_DW..d_jatkaa_opiskelua_muulla_koulutusalalla_2002
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_jatkaa_opiskelua_muulla_koulutusalalla_2002] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_jatkaa_opiskelua_muulla_koulutusasteella_2002;
INSERT INTO VipunenTK_DW..d_jatkaa_opiskelua_muulla_koulutusasteella_2002
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_jatkaa_opiskelua_muulla_koulutusasteella_2002] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_jatkaa_opiskelua_muulla_koulutussektorilla;
INSERT INTO VipunenTK_DW..d_jatkaa_opiskelua_muulla_koulutussektorilla
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_jatkaa_opiskelua_muulla_koulutussektorilla] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_jatkaa_opiskelua_muulla_opintoalalla_2002;
INSERT INTO VipunenTK_DW..d_jatkaa_opiskelua_muulla_opintoalalla_2002
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_jatkaa_opiskelua_muulla_opintoalalla_2002] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_jatkaa_opiskelua_muussa_maakunnassa;
INSERT INTO VipunenTK_DW..d_jatkaa_opiskelua_muussa_maakunnassa
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_jatkaa_opiskelua_muussa_maakunnassa] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_jatkaa_opiskelua_muussa_oppilaitoksessa;
INSERT INTO VipunenTK_DW..d_jatkaa_opiskelua_muussa_oppilaitoksessa
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_jatkaa_opiskelua_muussa_oppilaitoksessa] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_tutkinto_alkuperaisella_koulutuksen_jarjestajalla;
INSERT INTO VipunenTK_DW..d_tutkinto_alkuperaisella_koulutuksen_jarjestajalla
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_tutkinto_alkuperaisella_koulutuksen_jarjestajalla] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_tutkinto_alkuperaisella_koulutusalalla_2002;
INSERT INTO VipunenTK_DW..d_tutkinto_alkuperaisella_koulutusalalla_2002
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_tutkinto_alkuperaisella_koulutusalalla_2002] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_tutkinto_alkuperaisella_koulutusasteella_2002;
INSERT INTO VipunenTK_DW..d_tutkinto_alkuperaisella_koulutusasteella_2002
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_tutkinto_alkuperaisella_koulutusasteella_2002] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_tutkinto_alkuperaisella_koulutussektorilla;
INSERT INTO VipunenTK_DW..d_tutkinto_alkuperaisella_koulutussektorilla
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_tutkinto_alkuperaisella_koulutussektorilla] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_tutkinto_alkuperaisella_opintoalalla_2002;
INSERT INTO VipunenTK_DW..d_tutkinto_alkuperaisella_opintoalalla_2002
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_tutkinto_alkuperaisella_opintoalalla_2002] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_tutkinto_alkuperaisessa_maakunnassa;
INSERT INTO VipunenTK_DW..d_tutkinto_alkuperaisessa_maakunnassa
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_tutkinto_alkuperaisessa_maakunnassa] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_tutkinto_alkuperaisessa_oppilaitoksessa;
INSERT INTO VipunenTK_DW..d_tutkinto_alkuperaisessa_oppilaitoksessa
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_tutkinto_alkuperaisessa_oppilaitoksessa] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_tutkinto_muulla_koulutuksen_jarjestajalla;
INSERT INTO VipunenTK_DW..d_tutkinto_muulla_koulutuksen_jarjestajalla
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_tutkinto_muulla_koulutuksen_jarjestajalla] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_tutkinto_muulla_koulutusalalla_2002;
INSERT INTO VipunenTK_DW..d_tutkinto_muulla_koulutusalalla_2002
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_tutkinto_muulla_koulutusalalla_2002] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_tutkinto_muulla_koulutusasteella_2002;
INSERT INTO VipunenTK_DW..d_tutkinto_muulla_koulutusasteella_2002
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_tutkinto_muulla_koulutusasteella_2002] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_tutkinto_muulla_koulutussektorilla;
INSERT INTO VipunenTK_DW..d_tutkinto_muulla_koulutussektorilla
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_tutkinto_muulla_koulutussektorilla] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_tutkinto_muulla_opintoalalla_2002;
INSERT INTO VipunenTK_DW..d_tutkinto_muulla_opintoalalla_2002
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_tutkinto_muulla_opintoalalla_2002] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_tutkinto_muussa_maakunnassa;
INSERT INTO VipunenTK_DW..d_tutkinto_muussa_maakunnassa
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_tutkinto_muussa_maakunnassa] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_tutkinto_muussa_oppilaitoksessa;
INSERT INTO VipunenTK_DW..d_tutkinto_muussa_oppilaitoksessa
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_tutkinto_muussa_oppilaitoksessa] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_opintojen_kulku_koulutuksen_jarjestajan_mukaan;
INSERT INTO VipunenTK_DW..d_opintojen_kulku_koulutuksen_jarjestajan_mukaan
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opintojen_kulku_koulutuksen_jarjestajan_mukaan] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_opintojen_kulku_koulutusalan_2002_mukaan;
INSERT INTO VipunenTK_DW..d_opintojen_kulku_koulutusalan_2002_mukaan
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opintojen_kulku_koulutusalan_2002_mukaan] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_opintojen_kulku_koulutusasteen_2002_mukaan;
INSERT INTO VipunenTK_DW..d_opintojen_kulku_koulutusasteen_2002_mukaan
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opintojen_kulku_koulutusasteen_2002_mukaan] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_opintojen_kulku_koulutussektorin_mukaan;
INSERT INTO VipunenTK_DW..d_opintojen_kulku_koulutussektorin_mukaan
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opintojen_kulku_koulutussektorin_mukaan] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_opintojen_kulku_maakunnan_mukaan;
INSERT INTO VipunenTK_DW..d_opintojen_kulku_maakunnan_mukaan
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opintojen_kulku_maakunnan_mukaan] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_opintojen_kulku_opintoalan_2002_mukaan;
INSERT INTO VipunenTK_DW..d_opintojen_kulku_opintoalan_2002_mukaan
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opintojen_kulku_opintoalan_2002_mukaan] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_opintojen_kulku_oppilaitoksen_mukaan;
INSERT INTO VipunenTK_DW..d_opintojen_kulku_oppilaitoksen_mukaan
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opintojen_kulku_oppilaitoksen_mukaan] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_koulutuksen_kesto;
INSERT INTO VipunenTK_DW..d_koulutuksen_kesto
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_koulutuksen_kesto] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_oppisopimuskoulutus_osallistuneet_ja_tutk_suorittaneet;
INSERT INTO VipunenTK_DW..d_oppisopimuskoulutus_osallistuneet_ja_tutk_suorittaneet
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_oppisopimuskoulutus_osallistuneet_ja_tutk_suorittaneet] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_jatko_opiskelu;
INSERT INTO VipunenTK_DW..d_jatko_opiskelu
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_jatko_opiskelu] WHERE virhetilanne = 'E';
	
TRUNCATE TABLE VipunenTK_DW..d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2;
INSERT INTO VipunenTK_DW..d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_opintojen_kulku_koulutusalan_2002_mukaan_versio2;
INSERT INTO VipunenTK_DW..d_opintojen_kulku_koulutusalan_2002_mukaan_versio2
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opintojen_kulku_koulutusalan_2002_mukaan_versio2] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_opintojen_kulku_opintoalan_2002_mukaan_versio2;
INSERT INTO VipunenTK_DW..d_opintojen_kulku_opintoalan_2002_mukaan_versio2
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opintojen_kulku_opintoalan_2002_mukaan_versio2] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_opintojen_kulku_oppilaitoksen_mukaan_versio2;
INSERT INTO VipunenTK_DW..d_opintojen_kulku_oppilaitoksen_mukaan_versio2
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_opintojen_kulku_oppilaitoksen_mukaan_versio2] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_yrityksen_koko_tthv;
INSERT INTO VipunenTK_DW..d_yrityksen_koko_tthv
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_yrityksen_koko_tthv] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_tyonantajasektori_sama_kuin_ed_vuonna;
INSERT INTO VipunenTK_DW..d_tyonantajasektori_sama_kuin_ed_vuonna
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_tyonantajasektori_sama_kuin_ed_vuonna] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_toimiala_tthv1_sama_kuin_ed_vuonna;
INSERT INTO VipunenTK_DW..d_toimiala_tthv1_sama_kuin_ed_vuonna
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_toimiala_tthv1_sama_kuin_ed_vuonna] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_toimiala_tthv2_sama_kuin_ed_vuonna;
INSERT INTO VipunenTK_DW..d_toimiala_tthv2_sama_kuin_ed_vuonna
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_toimiala_tthv2_sama_kuin_ed_vuonna] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_tutkimuksen_rahoituslahde
INSERT INTO VipunenTK_DW..d_tutkimuksen_rahoituslahde
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_tutkimuksen_rahoituslahde] WHERE virhetilanne = 'E';

TRUNCATE TABLE VipunenTK_DW..d_liikkuvuuden_kesto
INSERT INTO VipunenTK_DW..d_liikkuvuuden_kesto
	SELECT * FROM VipunenTK_lisatiedot.[dbo].[v_liikkuvuuden_kesto] WHERE virhetilanne = 'E';



GO


