USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_indikaattorit_kk]    Script Date: 23.8.2024 7:58:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER   PROCEDURE  [dw].[p_lataa_d_indikaattorit_kk] AS

TRUNCATE TABLE dw.d_indikaattorit_kk

INSERT INTO [ANTERO].[dw].[d_indikaattorit_kk] (
	[koodi],
    [selite_fi],
    [indikaattorityyppi_fi],
    [jarjestys],
    [jarjestys_indikaattorityyppi],
	[tyyppi],
    [source]
)
VALUES
('tavoiteaika_y_kk', 'Tavoiteajassa ylemmän kk-tutkinnon suorittaneet', 'Koulutusindikaattorit', 1, 1, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('tavoiteaika_a_kk', 'Tavoiteajassa alemman kk-tutkinnon suorittaneet', 'Koulutusindikaattorit', 2, 1, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('tavoiteaika_amk', 'Tavoiteajassa amk-tutkinnon suorittaneet', 'Koulutusindikaattorit', 3, 1, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('7_v_lapaisy', '7 vuoden läpäisy', 'Koulutusindikaattorit', 4, 1, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('5_v_lapaisy', '5 vuoden läpäisy', 'Koulutusindikaattorit', 5, 1, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('aiempi_y_kk', 'Aiemmin suoritettujen ylempien kk-tutkintojen osuus', 'Koulutusindikaattorit', 6, 1, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('aiempi_a_kk', 'Aiemmin suoritettujen alempien kk-tutkintojen osuus', 'Koulutusindikaattorit', 7, 1, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('y_kk_30', 'Ylemmän kk-tutkinnon suorittaneista yli 30 vuotiaita', 'Koulutusindikaattorit', 8, 1, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('amk_30', 'AMK-tutkinnon suorittaneista yli 30 vuotiaita', 'Koulutusindikaattorit', 9, 1, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('y_kk_tyol_uusimaa', 'Ylemmän kk-tutkinnon suorittaneista Uudellemaalle sijoittuneet', 'Koulutusindikaattorit', 10, 1, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('kv_y_kk', 'Kv-opiskelijoiden suorittamien ylempien kk-tutkintojen osuus', 'Koulutusindikaattorit', 11, 1, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('ulk_amk', 'Ulkomaalaisten suorittamien amk-tutkintojen osuus', 'Koulutusindikaattorit', 12, 1, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('ulk_y_kk_tyol', 'Ulk. ylemmän kk-tutkinnon suorittaneiden työllistyminen', 'Koulutusindikaattorit', 13, 1, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('ulk_amk_tyol', 'Ulk. AMK-tutkinnon suorittaneiden työllistyminen', 'Koulutusindikaattorit', 14, 1, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('a_y_kk_vaihdossa', 'Korkeakoulututkinnon suorittaneista vaihdossa olleita', 'Koulutusindikaattorit', 15, 1, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('amk_vaihdossa', 'AMK-tutkinnon suorittaneista vaihdossa olleita', 'Koulutusindikaattorit', 16, 1, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('pv_sama_maak', 'Paikan vastaanottaneita samasta maakunnasta', 'Koulutusindikaattorit', 17, 1, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('pv_uusimaa', 'Paikan vastaanottaneita Uudeltamaalta', 'Koulutusindikaattorit', 18, 1, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('ens_hakijat_pv', 'Ens. hakijat suhteessa paikan vastaanottaneisiin', 'Koulutusindikaattorit', 19, 1, 'suhde', 'ETL: p_lataa_d_indikaattorit_kk'),
('aid_ensik', 'Ensikertalaiset paikan vastaanottaneet', 'Koulutusindikaattorit', 20, 1, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('pv_23', 'Paikan vastaanottaneista alle 23 vuotiaita', 'Koulutusindikaattorit', 21, 1, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('avoin_vayla', 'Avoimen väylän kautta valittujen osuus', 'Koulutusindikaattorit', 22, 1, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('yli_55_op', 'Yli 55 op suorittaneiden osuus', 'Koulutusindikaattorit', 23, 1, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('avop_yli_4','AVOP Opiskelutyytyväisyys osioon yli 4 arvosanan vastanneiden osuus', 'Koulutusindikaattorit', 24, 1, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('kandi_yli_3','Kandipalautteen rahoitusmallikysymyksiin 3 tai yli vastanneiden osuus', 'Koulutusindikaattorit', 25, 1, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('y_kk_a_kk','Ylemmät kk-tutkinnot per alemmat kk-tutkinnot', 'Koulutusindikaattorit', 26, 1, 'suhde', 'ETL: p_lataa_d_indikaattorit_kk'),
('opisk_opetus_tutkimus_henkilosto', 'Opiskelija opetus- ja tutkimushenkilöstö -suhde', 'Koulutusindikaattorit', 27, 1, 'suhde', 'ETL: p_lataa_d_indikaattorit_kk'),
('opisk_opetus_henkilosto', 'Opiskelija opetushenkilöstö -suhde', 'Koulutusindikaattorit', 28, 1, 'suhde', 'ETL: p_lataa_d_indikaattorit_kk'),
('ulk_opetus_tki_henkilosto', 'Ulkomaalaisen opetus- ja tki- henkilöstön osuus', 'Tutkimusindikaattorit', 29, 2, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('yamk_amk', 'Ylempien amk-tutkintojen suhde amk-tutkintoihin', 'Tutkimusindikaattorit', 30, 2, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('toht_per_iv', 'Tohtorin tutkinnot per IV htv', 'Tutkimusindikaattorit', 31, 2, 'suhde', 'ETL: p_lataa_d_indikaattorit_kk'),
('toht_y_kk', 'Tohtorin tutkinnot per ylemmät kk-tutkinnot', 'Tutkimusindikaattorit', 32, 2, 'suhde', 'ETL: p_lataa_d_indikaattorit_kk'),
('ulk_opetus_i_ii', 'Ulk. opetus- ja tutkimushenkilökunnan osuus uraportaat I-II', 'Tutkimusindikaattorit', 33, 2, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('ulk_opetus_iii_iv', 'Ulk. opetus- ja tutkimushenkilökunnan osuus uraportaat III-IV', 'Tutkimusindikaattorit', 34, 2, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('kv_toht', 'Kansainvälisten tohtoritutkinto-opiskelijoiden osuus', 'Tutkimusindikaattorit', 35, 2, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('kv_yj', 'Kansainväliset yhteisjulkaisut', 'Tutkimusindikaattorit', 36, 2, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('avoimet_julk', 'Avoimet julkaisut', 'Tutkimusindikaattorit', 37, 2, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('yj_yritykset', 'Yhteisjulkaisut yritysten kanssa', 'Tutkimusindikaattorit', 38, 2, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('tutkimusmenot_liikevaihto', 'Tutkimusmenot suhteessa liikevaihtoon', 'Tutkimusindikaattorit', 39, 2, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'), 
('koti_ulkom_yritykset_tk', 'Kotimaisten ja ulkomaisten yritysten tk-rahoitus', 'Tutkimusindikaattorit', 40, 2, 'luku', 'ETL: p_lataa_d_indikaattorit_kk'), 
('ulkop_rahoitus_opetus_tutkimus_htv', 'Ulkopuolinen tutkimusrahoitus per opetus- ja tutkimushenkilöstön htv', 'Tutkimusindikaattorit', 41, 2, 'luku', 'ETL: p_lataa_d_indikaattorit_kk'), 
('erc_rahoitus', 'ERC-rahoitukset', 'Tutkimusindikaattorit', 42, 2, 'luku', 'ETL: p_lataa_d_indikaattorit_kk'),
('top10', 'Top-10 indikaattori (WoS)', 'Tutkimusindikaattorit', 43, 2, 'suhde', 'ETL: p_lataa_d_indikaattorit_kk'),
('rakennerah', 'Rakennerahastojen osuus täydentävästä rahoituksesta', 'Tutkimusindikaattorit', 44, 2, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('ulkop_tk_rahoitus', 'Ulkopuolisen tk-rahoituksen määrä (miljoonaa euroa)', 'Tutkimusindikaattorit', 45, 2, 'luku', 'ETL: p_lataa_d_indikaattorit_kk')

GO
