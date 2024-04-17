USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_indikaattorit_kk]    Script Date: 17.4.2024 12:09:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [dw].[p_lataa_d_indikaattorit_kk] AS

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
('ulk_y_kk', 'Ulkomaalaisten suorittamien ylempien kk-tutkintojen osuus', 'Koulutusindikaattorit', 10, 1, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('ulk_amk', 'Ulkomaalaisten suorittamien amk-tutkintojen osuus', 'Koulutusindikaattorit', 11, 1, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('ulk_y_kk_tyol', 'Ulk. ylemmän kk-tutkinnon suorittaneiden työllistyminen', 'Koulutusindikaattorit', 12, 1, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('ulk_amk_tyol', 'Ulk. AMK-tutkinnon suorittaneiden työllistyminen', 'Koulutusindikaattorit', 13, 1, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('y_kk_vaihdossa', 'Ylemmän kk-tutkinnon suorittaneista vaihdossa olleita', 'Koulutusindikaattorit', 14, 1, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('amk_vaihdossa', 'AMK-tutkinnon suorittaneista vaihdossa olleita', 'Koulutusindikaattorit', 15, 1, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('pv_sama_maak', 'Paikan vastaanottaneita samasta maakunnasta', 'Koulutusindikaattorit', 16, 1, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('pv_uusimaa', 'Paikan vastaanottaneita Uudeltamaalta', 'Koulutusindikaattorit', 17, 1, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('ens_hakijat_pv', 'Ens. hakijat suhteessa paikan vastaanottaneisiin', 'Koulutusindikaattorit', 18, 1, 'suhde', 'ETL: p_lataa_d_indikaattorit_kk'),
('aid_ensik', 'Aidosti ensikertalaiset', 'Koulutusindikaattorit', 19, 1, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('pv_23', 'Paikan vastaanottaneista alle 23 vuotiaita', 'Koulutusindikaattorit', 20, 1, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('avoin_vayla', 'Avoimen väylän kautta valittujen osuus', 'Koulutusindikaattorit', 21, 1, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('yli_55_op', 'Yli 55 op suorittaneiden osuus', 'Koulutusindikaattorit', 22, 1, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('avop_yli_4','AVOP Opiskelutyytyväisyys osioon yli 4 arvosanan vastanneiden osuus', 'Koulutusindikaattorit', 23, 1, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('opisk_opetus_tutkimus_henkilosto', 'Opiskelija opetus- ja tutkimushenkilöstö -suhde', 'Koulutusindikaattorit', 24, 1, 'suhde', 'ETL: p_lataa_d_indikaattorit_kk'),
('opisk_opetus_henkilosto', 'Opiskelija opetushenkilöstö -suhde', 'Koulutusindikaattorit', 25, 1, 'suhde', 'ETL: p_lataa_d_indikaattorit_kk'),
('ulk_opetus_henkilosto', 'Ulkomaalaisen opetus- ja tutkimushenkilökunnan osuus', 'Tutkimusindikaattorit', 26, 2, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('ulk_opetus_tki_henkilosto', 'Ulkomaalaisen opetus- ja tki- henkilöstön osuus', 'Tutkimusindikaattorit', 27, 2, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('yamk_amk', 'Ylempien amk-tutkintojen suhde amk-tutkintoihin', 'Tutkimusindikaattorit', 28, 2, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('kv_yj', 'Kansainväliset yhteisjulkaisut', 'Tutkimusindikaattorit', 29, 2, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('avoimet_julk', 'Avoimet julkaisut', 'Tutkimusindikaattorit', 30, 2, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('toht_per_iv', 'Tohtorin tutkinnot per IV htv', 'Tutkimusindikaattorit', 31, 2, 'suhde', 'ETL: p_lataa_d_indikaattorit_kk'),
('top10', 'Top-10 indikaattori (Scopus)', 'Tutkimusindikaattorit', 32, 2, 'suhde', 'ETL: p_lataa_d_indikaattorit_kk'),
('rakennerah', 'Rakennerahastojen osuus täydentävästä rahoituksesta', 'Tutkimusindikaattorit', 33, 2, 'osuus', 'ETL: p_lataa_d_indikaattorit_kk'),
('ulkop_tk_rahoitus', 'Ulkopuolisen tk-rahoituksen määrä (miljoonaa euroa)', 'Tutkimusindikaattorit', 34, 2, 'luku', 'ETL: p_lataa_d_indikaattorit_kk')

GO

USE [ANTERO]
