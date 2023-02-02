USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_amm_opiskelijat_ja_tutkinnot_yhdistetty]    Script Date: 2.2.2023 19:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





if (@@SERVERNAME = 'DWIPVIPUSQL16') --ajo käynnissä testissä
begin 

ALTER PROCEDURE [dw].[p_lataa_f_koski_amm_opiskelijat_ja_tutkinnot_yhdistetty] AS

/*
Yhdistetään näkymän käyttämät faktataulut etukäteen, jotta kuution prosessointi ei takkua union allien takia.
Tarvittaessa luodaan kohdetaulun skeema tarkemmilla tietotyypeillä ja vaihdetaan insertiksi myös ensimmäinen select into.
JS 22.12.2022
*/

/*
Siirrytty skeeman tarkempaan määrittelyyn, koska nettoluku olikin tässä jo keskiarvo (float). JS 2.2.2023
*/

--HUOM! Kolme erillistä insertiä.

TRUNCATE TABLE dw.f_koski_amm_opiskelijat_ja_tutkinnot_yhdistetty

--netto
INSERT dw.f_koski_amm_opiskelijat_ja_tutkinnot_yhdistetty
SELECT 
	tilastovuosi
	,oo_alkamisajankohta = cast(null as [varchar](33))
	,d_sukupuoli_id
	,d_kieli_aidinkieli_id
	,d_ika_id
	,d_maatjavaltiot2_kansalaisuus_id
	,d_koulutusluokitus_id
	,d_organisaatioluokitus_oppilaitos_id
	,d_organisaatioluokitus_jarj_id
	,d_organisaatioluokitus_toimipiste_id
	,d_kytkin_oppisopimuskoulutus_id
	,d_kytkin_koulutussopimus_id
	,d_amm_sopimusjaksot_id
	,d_kytkin_vankilaopetus_id
	,d_kytkin_henkilostokoulutus_id
	,d_kytkin_tyovoimakoulutus_id
	,d_erityisopetus_id
	,d_kalenteri_id
	,d_majoitus_id
	,d_osa_aikaisuus_id
	,d_suorituksen_tyyppi_id
	,d_kustannusryhma_id
	,d_opintojenrahoitus_id
	,d_osaamisala_id
	,d_kieli_suorituskieli_id
	,d_kytkin_muu_ammatillinen_id
	,oppisopimus_osuus = 'Tieto puuttuu'
	,koulutussopimus_osuus = 'Tieto puuttuu'
	,oppija_oid = cast(null as [varchar](100))
	,opiskeluoikeus_oid = cast(null as [varchar](100))
	,d_ika_oo_alk_id
	,d_ika_oo_alk_tarkka_id
	,d_oo_aloitus_id
	,d_kytkin_oo_alkanut_kuussa_id = -1
	,d_ika_opsoj_alk_id
	,d_ika_opsoj_alk_tarkka_id
	,d_opsoj_aloitus_id
	,opiskelijat = 0
	,uudet_opiskelijat = 0
	,uudet_opiskelijat_rahoitus = 0
	,eronnut = 0
	,[jatkaa_kj] = 0
	,[jatkaa_oppilaitos] = 0
	,[jatkaa_tutkintotyyppi] = 0
	,[jatkaa_ammatillinen] = 0
	,[jatkaa_yleissivistava] = 0
	,[jatkaa_valmentava] = 0
	,[jatkaa_lukio_valmentava] = 0
	,[jatkaa_amm_valmentava] = 0
	,[jatkaa_muu_ammatillinen] = 0
	,[jatkaa_amm_tutkintokoulutus] = 0
	,d_keskeyttaminen_vaiheittainen_id = -1
	,valmentava_koodi
	,opiskelijat_netto = opiskelijat
	,tutkinnot = 0
	,opiskelijavuodet = 0
	,ryhma = cast('netto' as [varchar](50))
FROM dw.f_koski_amm_opiskelijat_netto
;


--opisk
INSERT dw.f_koski_amm_opiskelijat_ja_tutkinnot_yhdistetty
SELECT 
	tilastovuosi
	,oo_alkamisajankohta
	,d_sukupuoli_id
	,d_kieli_aidinkieli_id
	,d_ika_id
	,d_maatjavaltiot2_kansalaisuus_id
	,d_koulutusluokitus_id
	,d_organisaatioluokitus_oppilaitos_id
	,d_organisaatioluokitus_jarj_id
	,d_organisaatioluokitus_toimipiste_id
	,d_kytkin_oppisopimuskoulutus_id
	,d_kytkin_koulutussopimus_id
	,d_amm_sopimusjaksot_id
	,d_kytkin_vankilaopetus_id
	,d_kytkin_henkilostokoulutus_id
	,d_kytkin_tyovoimakoulutus_id
	,d_erityisopetus_id
	,d_kalenteri_id
	,d_majoitus_id
	,d_osa_aikaisuus_id
	,d_suorituksen_tyyppi_id
	,d_kustannusryhma_id
	,d_opintojenrahoitus_id
	,d_osaamisala_id
	,d_kieli_suorituskieli_id
	,d_kytkin_muu_ammatillinen_id
	,oppisopimus_osuus = 'Tieto puuttuu'
	,koulutussopimus_osuus = 'Tieto puuttuu'
	,oppija_oid
	,opiskeluoikeus_oid
	,d_ika_oo_alk_id = null
	,d_ika_oo_alk_tarkka_id = null
	,d_oo_aloitus_id = d_kalenteri_oo_id
	,d_kytkin_oo_alkanut_kuussa_id
	,d_ika_opsoj_alk_id = null
	,d_ika_opsoj_alk_tarkka_id = null
	,d_opsoj_aloitus_id = null
	,opiskelijat = 1
	,uudet_opiskelijat = uusi
	,uudet_opiskelijat_rahoitus = uusi_rahoitus
	,eronnut
	,[jatkaa_kj]
	,[jatkaa_oppilaitos]
	,[jatkaa_tutkintotyyppi]
	,[jatkaa_ammatillinen]
	,[jatkaa_yleissivistava]
	,[jatkaa_valmentava]
	,[jatkaa_lukio_valmentava]
	,[jatkaa_amm_valmentava]
	,[jatkaa_muu_ammatillinen]
	,[jatkaa_amm_tutkintokoulutus]
	,d_keskeyttaminen_vaiheittainen_id
	,valmentava_koodi
	,opiskelijat_netto = 0
	,tutkinnot = 0
	,opiskelijavuodet = 0
	,ryhma = 'opiskelijat'
FROM dw.f_koski_amm_opiskelijat
;


--tutk
INSERT dw.f_koski_amm_opiskelijat_ja_tutkinnot_yhdistetty
SELECT 
	tilastovuosi
	,oo_alkamisajankohta = null
	,d_sukupuoli_id
	,d_kieli_aidinkieli_id
	,d_ika_id
	,d_maatjavaltiot2_kansalaisuus_id
	,d_koulutusluokitus_id
	,d_organisaatioluokitus_oppilaitos_id
	,d_organisaatioluokitus_jarj_id
	,d_organisaatioluokitus_toimipiste_id
	,d_kytkin_oppisopimuskoulutus_id
	,d_kytkin_koulutussopimus_id
	,d_amm_sopimusjaksot_id
	,d_kytkin_vankilaopetus_id
	,d_kytkin_henkilostokoulutus_id
	,d_kytkin_tyovoimakoulutus_id
	,d_erityisopetus_id
	,d_kalenteri_id
	,d_majoitus_id
	,d_osa_aikaisuus_id
	,d_suorituksen_tyyppi_id
	,d_kustannusryhma_id
	,d_opintojenrahoitus_id
	,d_osaamisala_id
	,d_kieli_suorituskieli_id
	,d_kytkin_muu_ammatillinen_id
	,oppisopimus_osuus
	,koulutussopimus_osuus
	,oppija_oid
	,opiskeluoikeus_oid
	,d_ika_oo_alk_id = null
	,d_ika_oo_alk_tarkka_id = null
	,d_oo_aloitus_id = null
	,d_kytkin_oo_alkanut_kuussa_id = -1
	,d_ika_opsoj_alk_id = null
	,d_ika_opsoj_alk_tarkka_id = null
	,d_opsoj_aloitus_id = null
	,opiskelijat = 0
	,uudet_opiskelijat = 0
	,uudet_opiskelijat_rahoitus = 0
	,eronnut = 0
	,[jatkaa_kj] = 0
	,[jatkaa_oppilaitos] = 0
	,[jatkaa_tutkintotyyppi] = 0
	,[jatkaa_ammatillinen] = 0
	,[jatkaa_yleissivistava] = 0
	,[jatkaa_valmentava] = 0
	,[jatkaa_lukio_valmentava] = 0
	,[jatkaa_amm_valmentava] = 0
	,[jatkaa_muu_ammatillinen] = 0
	,[jatkaa_amm_tutkintokoulutus] = 0
	,d_keskeyttaminen_vaiheittainen_id = -1
	,valmentava_koodi 
	,opiskelijat_netto = 0
	,tutkinnot = 1
	,opiskelijavuodet = 0
	,ryhma = 'tutkinnot'
FROM dw.f_koski_amm_tutkinnot
;

end