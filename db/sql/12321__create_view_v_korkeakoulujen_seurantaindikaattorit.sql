USE [ANTERO]

GO

CREATE OR ALTER VIEW [dw].[v_korkeakoulujen_seurantaindikaattorit] AS

SELECT 
	f.tilastovuosi as Tilastovuosi,
	d1.organisaatio_fi as Korkeakoulu,
	d1.oppilaitostyyppi_fi as Sektori,
	d2.ohjauksenala_nimi_fi as 'OKM ohjauksen ala',

	aidosti_ensikertainen as apusarake_aidosti_ensikertainen,
	aiempi_tutkinto as apusarake_aiempi_tutkinto,
	alle_23_vuotta as apusarake_alle_23_vuotta,
	avoin_vayla as apusarake_avoin_vayla,
	ensisijainen_kohde as apusarake_ensisijainen_kohde,
	ika_vahintaan_30 as apusarake_ika_vahintaan_30,
	kv_opiskelija as apusarake_kv_opiskelija,
	sama_maakunta as apusarake_sama_maakunta,
	tilauskoulutus as apusarake_tilauskoulutus,
	tyollinen as apusarake_tyollinen,
	ulkomaalainen as apusarake_ulkomaalainen,
	uraporras as apusarake_uraporras,
	uusimaa as apusarake_uusimaa,
	valmistunut_tavoiteajassa as apusarake_valmistunut_tavoiteajassa,
	vastaanottanut_paikan as apusarake_vastaanottanut_paikan,

	CONVERT(VARCHAR(64),HASHBYTES('SHA2_256', vs.salt + f.master_oid),2) as apusarake_master_oid,
	CONVERT(VARCHAR(64),HASHBYTES('SHA2_256', vs.salt + f.vaihdossa_olleet_avain),2) as apusarake_vaihdossa_olleet_avain,
	horizon_projekti as apusarake_horizon_projekti,

	yli_55_op_suorittaneet as apusarake_yli_55_op_suorittaneet,
	opiskelijat_55_op as apusarake_opiskelijat_55_op,
	avop_ka_yli_4 as apusarake_avop_ka_yli_4,
	avop_vastanneet as apusarake_avop_vastanneet,
	opetus_tki_henkilokunta_htv as apusarake_opetus_tki_henkilokunta_htv,
	opetushenkilokunta_htv as apusarake_opetushenkilokunta_htv,
	tohtorintutkinto_opetus_tki_henkilokunta_htv as apusarake_tohtorintutkinto_opetus_tki_henkilokunta_htv,
	opetus_tutkimus_henkilokunta_htv as apusarake_opetus_tutkimus_henkilokunta_htv,
	avoimet_julkaisut as apusarake_avoimet_julkaisut,
	kv_yhteisjulkaisut as apusarake_kv_yhteisjulkaisut,
	jufo_1_3_julkaisut as apusarake_jufo_1_3_julkaisut,
	julkaisut as apusarake_julkaisut,
	yhteisjulkaisut_yritysten_kanssa as apusarake_yhteisjulkaisut_yritysten_kanssa,
	yhteisjulkaisut as apusarake_yhteisjulkaisut,
	kandipalaute_ka_yli_3 as apusarake_kandipalaute_ka_yli_3,
	kandipalaute_vastanneet as apusarake_kandipalaute_vastanneet,
	amk_tutkinnot as apusarake_amk_tutkinnot,
	ylemmat_amk_tutkinnot as apusarake_ylemmat_amk_tutkinnot,
	alemmat_kk_tutkinnot as apusarake_alemmat_kk_tutkinnot,
	ylemmat_kk_tutkinnot as apusarake_ylemmat_kk_tutkinnot,
	tohtorintutkinnot as apusarake_tohtorintutkinnot,
	amk_opiskelijat as apusarake_amk_opiskelijat,
	alempi_kk_opiskelijat as apusarake_alempi_kk_opiskelijat,
	ylempi_kk_opiskelijat as apusarake_ylempi_kk_opiskelijat,
	tohtoriopiskelijat as apusarake_tohtoriopiskelijat,
	aloittaneet_amk as apusarake_aloittaneet_amk,
	aloittaneet_alempi_kk as apusarake_aloittaneet_alempi_kk,
	ulkopuolinen_rahoitus as apusarake_ulkopuolinen_rahoitus,
	rakennerahastot as apusarake_rakennerahastot,
	taydentava_rahoitus as apusarake_taydentava_rahoitus,
	liikevaihto as apusarake_liikevaihto,
	yritysten_tk_rahoitus as apusarake_yritysten_tk_rahoitus,
	tutkimusmenot as apusarake_tutkimusmenot,
	top_10 as apusarake_top_10,
	julkaisut_top_10 as apusarake_julkaisut_top_10,
	yliopisto_vaihdossa_olleet as apusarake_yliopisto_vaihdossa_olleet,
	amk_vaihdossa_olleet as apusarake_amk_vaihdossa_olleet,

	tarkenne as apusarake_tarkenne

FROM ANTERO.dw.f_indikaattorit_kk_ohjauksen_ala f
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.organisaatio_koodi = f.organisaatio_koodi
LEFT JOIN ANTERO.dw.d_ohjauksenala d2 on d2.ohjauksenala_koodi = f.okmohjauksenala_koodi
LEFT JOIN ANTERO.dbo.view_salt vs on vs.[view] = 'v_korkeakoulujen_seurantaindikaattorit'