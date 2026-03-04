USE [ANTERO]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_ovara]    Script Date: 4.3.2026 7.42.39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE  [sa].[p_lataa_ovara] as 

-----------------------------------------------------------------------------------------------------------
/* Proseduuri ajaa päivityksiä ovaran sa-tauluihin ja ajaa päivitetyt tiedot alla listattuihin tauluihin */
	-- sa_ovara_hakeneet
	-- sa_ovara_hakukohteet
	-- sa_ovara_yo_arvosanat
	-- d_pohjakoulutusvaatimus_toinen_aste
-----------------------------------------------------------------------------------------------------------

----------------------------------
/* SA- ja temp-taulujen pudotus */
----------------------------------

DROP TABLE IF EXISTS [ANTERO].[sa].[sa_ovara_hakeneet]
DROP TABLE IF EXISTS [ANTERO].[sa].[sa_ovara_hakukohteet]
DROP TABLE IF EXISTS [ANTERO].[sa].[sa_ovara_yo_arvosanat]
DROP TABLE IF EXISTS [ANTERO].[sa].[temp_ovara_hakukohteet]
DROP TABLE IF EXISTS [ANTERO].[sa].[temp_ovara_amk_yo]
DROP TABLE IF EXISTS [ANTERO].[sa].[temp_ovara_pohjakoulutusvaatimukset]
DROP TABLE IF EXISTS [ANTERO].[sa].[temp_ylinhyvaksyttypisteraja]
DROP TABLE IF EXISTS [ANTERO].[sa].[temp_ovara_valinnantulos_siistitty]
DROP TABLE IF EXISTS [ANTERO].[sa].[temp_virta_otp_varhaisin_tutkinto_tai_opiskeluoikeus]
DROP TABLE IF EXISTS [ANTERO].[sa].[temp_pohjakoulutukset_toinen_aste]
DROP TABLE IF EXISTS [ANTERO].[sa].[temp_pohjakoulutukset_toinen_aste_prio]

-----------------------------------
/* Korjauksia muihin SA_tuluihin */
-----------------------------------
EXEC [sa].[paivita_ovara]

-------------------------------------------------------------------------------------------
/* Hakijoiden ensimmäisen tutkinnon tai opiskeluoikeuden alkamispäivä omaan temp-tauluun */
-------------------------------------------------------------------------------------------
SELECT
	s.oid, 
	MIN(pvm) as min_pvm,
	-- Ensikertaisena kohdeltavien hakijoiden kohdalla ei tarkastella ennen 2014 syksyä alkaneita opiskeluoikeuksia
	MIN(CASE WHEN pvm < '2014-08-01' and opiskeluoikeus = 1 then NULL else pvm end) as min_pvm_ensikertaisena_kohdeltava
INTO [ANTERO].[sa].[temp_virta_otp_varhaisin_tutkinto_tai_opiskeluoikeus]
FROM (
	SELECT 
		(select d from ANTERO.dbo.biginttodate (alkamispaivamaara)) as pvm
		,[oid]
		,1 as tutkinto
		,0 as opiskeluoikeus
	FROM [ANTERO].[sa].[sa_virta_otp_korkeakouluhaut_hakijat_opiskeluoikeudet] t
	WHERE t.tavoitetutkinto not like '9%9'
	UNION ALL
	SELECT 
		(select d from ANTERO.dbo.biginttodate (suorituspaivamaara)) as pvm
		,[oid]
		,0 as tutkinto
		,1 as opiskeluoikeus
	FROM [ANTERO].[sa].[sa_virta_otp_korkeakouluhaut_hakijat_tutkinnot] t
	WHERE t.tutkinto not like '9%9'
) s
GROUP BY s.oid

---------------------------------------
/* Hakukohteiden tiedot temp-tauluun */
---------------------------------------

SELECT DISTINCT
	h.haku_oid,
	hk.hakukohde_oid,
	CASE 
		WHEN hk.hakukohteen_nimi_fi like '%Siirtohaku%' THEN 'Siirtohaku'
		WHEN hk.hakukohteen_nimi_fi like '%Jatkotutkintohaku%' THEN 'Jatkotutkintohaku'
		ELSE k.nimi END as haunkohdejoukontarkenne,
	h.paattymispvm as ensimmainen_hakuaika_paattyy,
	CASE
		WHEN hk.koulutuksenAlkamisvuosi is not null THEN hk.koulutuksenAlkamisvuosi
		WHEN hk.koulutuksenAlkamispaivamaara is not null THEN YEAR(hk.koulutuksenAlkamispaivamaara)
		WHEN h.koulutuksenAlkamisvuosi is not null THEN h.koulutuksenAlkamisvuosi
		WHEN h.koulutuksenAlkamispaivamaara is not null THEN YEAR(h.koulutuksenAlkamispaivamaara)
		WHEN t.koulutuksenAlkamisvuosi is not null THEN t.koulutuksenAlkamisvuosi
		WHEN t.koulutuksenAlkamispaivamaara is not null THEN YEAR(t.koulutuksenAlkamispaivamaara)
		ELSE NULL
	END as koulutuksen_alkamisvuosi,
	CASE
		WHEN hk.koulutuksenAlkamiskausiKoodi is not null THEN substring(hk.koulutuksenAlkamiskausiKoodi, charindex('_', hk.koulutuksenAlkamiskausiKoodi) + 1,1)
		WHEN hk.koulutuksenAlkamispaivamaara is not null and MONTH(hk.koulutuksenAlkamispaivamaara) < 8 THEN 'k'
		WHEN hk.koulutuksenAlkamispaivamaara is not null and MONTH(hk.koulutuksenAlkamispaivamaara) > 7 THEN 's'
		WHEN h.koulutuksenAlkamiskausiKoodi is not null THEN substring(h.koulutuksenAlkamiskausiKoodi, charindex('_', h.koulutuksenAlkamiskausiKoodi) + 1,1)
		WHEN h.koulutuksenAlkamispaivamaara is not null and MONTH(h.koulutuksenAlkamispaivamaara) < 8 THEN 'k'
		WHEN h.koulutuksenAlkamispaivamaara is not null and MONTH(h.koulutuksenAlkamispaivamaara) > 7 THEN 's'
		WHEN t.koulutuksenAlkamiskausiKoodi is not null THEN substring(t.koulutuksenAlkamiskausiKoodi, charindex('_', t.koulutuksenAlkamiskausiKoodi) + 1,1)
		WHEN t.koulutuksenAlkamispaivamaara is not null and MONTH(t.koulutuksenAlkamispaivamaara) < 8 THEN 'k'
		WHEN t.koulutuksenAlkamispaivamaara is not null and MONTH(t.koulutuksenAlkamispaivamaara) > 7 THEN 's'
		ELSE NULL
	END as koulutuksen_alkamiskausi,
	CASE WHEN hk.hakukohteen_nimi_fi like 'Ammatillinen%' THEN 1 ELSE 0 END as apusarake_kk_ammatillinen,
	CASE
		WHEN LEFT(o0.organisaatio_avain, CHARINDEX('_',o0.organisaatio_avain)) = 'toimipiste_' THEN o0.organisaatio_oid 
		WHEN LEFT(o1.organisaatio_avain, CHARINDEX('_',o1.organisaatio_avain)) = 'toimipiste_' THEN o1.organisaatio_oid 
		WHEN LEFT(o2.organisaatio_avain, CHARINDEX('_',o2.organisaatio_avain)) = 'toimipiste_' THEN o2.organisaatio_oid 
		WHEN LEFT(o3.organisaatio_avain, CHARINDEX('_',o3.organisaatio_avain)) = 'toimipiste_' THEN o3.organisaatio_oid 
		ELSE NULL
	END as toimipiste_oid,
	CASE
		WHEN LEFT(o0.organisaatio_avain, CHARINDEX('_',o0.organisaatio_avain)) = 'oppilaitos_' THEN o0.organisaatio_oid 
		WHEN LEFT(o4.organisaatio_avain, CHARINDEX('_',o4.organisaatio_avain)) = 'oppilaitos_' THEN o4.organisaatio_oid 
		WHEN LEFT(o5.organisaatio_avain, CHARINDEX('_',o5.organisaatio_avain)) = 'oppilaitos_' THEN o5.organisaatio_oid 
		WHEN LEFT(o1.organisaatio_avain, CHARINDEX('_',o1.organisaatio_avain)) = 'oppilaitos_' THEN o1.organisaatio_oid 
		WHEN LEFT(o2.organisaatio_avain, CHARINDEX('_',o2.organisaatio_avain)) = 'oppilaitos_' THEN o2.organisaatio_oid 
		WHEN LEFT(o3.organisaatio_avain, CHARINDEX('_',o3.organisaatio_avain)) = 'oppilaitos_' THEN o3.organisaatio_oid 
		ELSE NULL
	END as oppilaitos_oid,
	CASE	
		WHEN LEFT(o0.organisaatio_avain, CHARINDEX('_',o0.organisaatio_avain)) = 'koulutustoimija_' THEN o0.organisaatio_oid 
		WHEN LEFT(o5.organisaatio_avain, CHARINDEX('_',o5.organisaatio_avain)) = 'koulutustoimija_' THEN o5.organisaatio_oid 
		WHEN LEFT(o6.organisaatio_avain, CHARINDEX('_',o6.organisaatio_avain)) = 'koulutustoimija_' THEN o6.organisaatio_oid
		WHEN LEFT(o1.organisaatio_avain, CHARINDEX('_',o1.organisaatio_avain)) = 'koulutustoimija_' THEN o1.organisaatio_oid 
		WHEN LEFT(o2.organisaatio_avain, CHARINDEX('_',o2.organisaatio_avain)) = 'koulutustoimija_' THEN o2.organisaatio_oid 
		WHEN LEFT(o3.organisaatio_avain, CHARINDEX('_',o3.organisaatio_avain)) = 'koulutustoimija_' THEN o3.organisaatio_oid  
		ELSE NULL
	END as koulutustoimija_oid,
	CASE WHEN k2.nimi = 'Korkeakoulutus' THEN 1 ELSE 0 END as kk_haku,
	koulutuskoodi = MAX(CASE WHEN kk.jarjestysnro = 1 THEN kk.koulutuskoodi ELSE NULL END) OVER (PARTITION BY hk.hakukohde_oid),
	opintoala1995_koodi = MAX(CASE WHEN kk.jarjestysnro = 1 THEN d.opintoala1995_koodi ELSE NULL END) OVER (PARTITION BY hk.hakukohde_oid),
	opintoala2002_koodi = MAX(CASE WHEN kk.jarjestysnro = 1 THEN d.opintoala2002_koodi ELSE NULL END) OVER (PARTITION BY hk.hakukohde_oid),
	alempi_kk =
		MAX(
			CASE
				WHEN d.koulutusastetaso1_koodi = 6 or d.koulutusaste2002_koodi in (61,62,63) THEN 1
				ELSE 0
			END
		) OVER (PARTITION BY hk.hakukohde_oid),
	ylempi_kk =
		MAX(
			CASE
				WHEN d.koulutusastetaso1_koodi = 7 or d.koulutusaste2002_koodi in (71,72,73) THEN 1
				ELSE 0
			END
		) OVER (PARTITION BY hk.hakukohde_oid),
	jatkotutkinto_kk =
		MAX(
			CASE
				WHEN d.koulutusastetaso1_koodi = 8 or d.koulutusaste2002_koodi in (81,82) THEN 1
				ELSE 0
			END
		) OVER (PARTITION BY hk.hakukohde_oid),
	kk.koulutustyyppi,
	koulutusaste =
		MAX(
			CASE
				WHEN d.koulutusastetaso2_koodi in (62,71) or d.koulutusaste2002_koodi in (62,71) THEN 2
				WHEN d.koulutusastetaso2_koodi in (63,72,73,81,82) or d.koulutusaste2002_koodi in (63,72,73,81,82) THEN 1
				ELSE -1
			END
		) OVER (PARTITION BY hk.hakukohde_oid),
	ok.opetuksen_kieli,
	-- Opintojen laajuus opintopisteinä
	MAX(
		CASE
			WHEN kk.jarjestysnro = 1  and kk.opintojenlaajuusyksikkokoodiuri like 'opintojenlaajuusyksikko_2%' THEN kk.opintojenlaajuusnumero
			ELSE NULL
		END 
	) OVER (PARTITION BY hk.hakukohde_oid) as laajuus
INTO [ANTERO].[sa].[temp_ovara_hakukohteet]
FROM [ANTERO].[sa].[sa_ovara_kouta_haut] h
LEFT JOIN [ANTERO].[sa].[sa_ovara_kouta_hakukohteet] hk on h.haku_oid = hk.haku_oid
LEFT JOIN [ANTERO].[sa].[sa_ovara_kouta_toteutus] t on t.toteutus_oid = hk.toteutus_oid
LEFT JOIN [ANTERO].[sa].[sa_ovara_kouta_koulutus] kk on t.koulutus_oid = kk.koulutus_oid
LEFT JOIN ANTERO.sa.sa_koodistot k on k.koodisto = 'haunkohdejoukontarkenne' and k.koodi = SUBSTRING(h.kohdejoukontarkennekoodiuri,CHARINDEX('_', h.kohdejoukontarkennekoodiuri) + 1,CHARINDEX('#', h.kohdejoukontarkennekoodiuri) - CHARINDEX('_', h.kohdejoukontarkennekoodiuri) - 1)
LEFT JOIN ANTERO.sa.sa_koodistot k2 on k2.koodisto = 'haunkohdejoukko' and k2.koodi = LEFT(RIGHT(h.kohdejoukkokoodiuri,4),2)
LEFT JOIN ANTERO.dw.d_koulutusluokitus d on d.koulutusluokitus_koodi = kk.koulutuskoodi
LEFT JOIN ANTERO.dw.d_organisaatioluokitus o0 on o0.organisaatio_oid = hk.jarjestyspaikka_oid
LEFT JOIN ANTERO.dw.d_organisaatioluokitus o1 on o1.organisaatio_oid = hk.organisaatiooid
LEFT JOIN ANTERO.dw.d_organisaatioluokitus o2 on o2.organisaatio_oid = hk.organisaatio_oid
LEFT JOIN ANTERO.dw.d_organisaatioluokitus o3 on o3.organisaatio_oid = hk.jarjestyspaikka_oid
LEFT JOIN ANTERO.dw.d_organisaatioluokitus o4 on o4.organisaatio_oid = CASE WHEN LEFT(o0.organisaatio_avain, CHARINDEX('_',o0.organisaatio_avain)) = 'toimipiste_' THEN o0.ylaorganisaatio_oid WHEN LEFT(o1.organisaatio_avain, CHARINDEX('_',o1.organisaatio_avain)) = 'toimipiste_' THEN o1.ylaorganisaatio_oid WHEN LEFT(o2.organisaatio_avain, CHARINDEX('_',o2.organisaatio_avain)) = 'toimipiste_' THEN o2.ylaorganisaatio_oid WHEN LEFT(o3.organisaatio_avain, CHARINDEX('_',o3.organisaatio_avain)) = 'toimipiste_' THEN o3.ylaorganisaatio_oid END
LEFT JOIN ANTERO.dw.d_organisaatioluokitus o5 on o5.organisaatio_oid = CASE WHEN LEFT(o4.organisaatio_avain, CHARINDEX('_',o4.organisaatio_avain)) = 'toimipiste_' THEN o4.ylaorganisaatio_oid END
LEFT JOIN ANTERO.dw.d_organisaatioluokitus o6 on o6.organisaatio_oid = CASE WHEN LEFT(o0.organisaatio_avain, CHARINDEX('_',o0.organisaatio_avain)) = 'oppilaitos_' THEN o0.ylaorganisaatio_oid WHEN LEFT(o1.organisaatio_avain, CHARINDEX('_',o1.organisaatio_avain)) = 'oppilaitos_' THEN o1.ylaorganisaatio_oid WHEN LEFT(o2.organisaatio_avain, CHARINDEX('_',o2.organisaatio_avain)) = 'oppilaitos_' THEN o2.ylaorganisaatio_oid WHEN LEFT(o3.organisaatio_avain, CHARINDEX('_',o3.organisaatio_avain)) = 'oppilaitos_' THEN o3.ylaorganisaatio_oid WHEN LEFT(o4.organisaatio_avain, CHARINDEX('_',o4.organisaatio_avain)) = 'oppilaitos_' THEN o4.ylaorganisaatio_oid WHEN LEFT(o5.organisaatio_avain, CHARINDEX('_',o5.organisaatio_avain)) = 'oppilaitos_' THEN o5.ylaorganisaatio_oid END
LEFT JOIN ANTERO.sa.koulutustarjonta_haku kh on kh.oid = h.haku_oid
OUTER APPLY (
	SELECT 
		STRING_AGG(s.value, '') WITHIN GROUP (ORDER BY s.value) as opetuksen_kieli
	FROM ANTERO.sa.sa_ovara_kouta_toteutus kt
	CROSS APPLY STRING_SPLIT(kt.opetuskieli_koodit, ',') s
	WHERE kt.toteutus_oid = t.toteutus_oid
) ok
OPTION (MAXDOP 1)

------------------------------------------------------------------------------------
/* Temp-tauluun tieto siitä onko henkilö hakenut molemmille sektoreille kk-haussa */
------------------------------------------------------------------------------------

SELECT
	aht.hakemus_oid, 
	count(distinct hk.koulutustyyppi) as koulutustyypit_lkm
INTO [ANTERO].[sa].[temp_ovara_amk_yo]
FROM [ANTERO].[sa].[temp_ovara_hakukohteet] hk
LEFT JOIN [ANTERO].[sa].[sa_ovara_ataru_hakutoive] aht on aht.hakukohde_oid = hk.hakukohde_oid
WHERE kk_haku = 1
GROUP BY aht.hakemus_oid

------------------------------------------------------------------
/* Hakukohteiden pohjakoulutusvaatimuskombinaatiot temp-tauluun */
------------------------------------------------------------------

SELECT 
	hk.hakukohde_oid,
	STRING_AGG(s.value, '_') WITHIN GROUP (ORDER BY s.value) AS koodi,
	STRING_AGG(coalesce(k.nimi, k2.nimi), '; ')
		WITHIN GROUP (ORDER BY s.value) AS selite_fi,
	STRING_AGG(coalesce(k.nimi_sv, k2.nimi_sv, k.nimi, k2.nimi), '; ')
		WITHIN GROUP (ORDER BY s.value) AS selite_sv,
	STRING_AGG(coalesce(k.nimi_en, k2.nimi_en, k.nimi, k2.nimi), '; ')
		WITHIN GROUP (ORDER BY s.value) AS selite_en
INTO [ANTERO].[sa].[temp_ovara_pohjakoulutusvaatimukset]
FROM [ANTERO].[sa].[sa_ovara_kouta_hakukohteet] hk
CROSS APPLY STRING_SPLIT(hk.pohjakoulutusvaatimuskoodiurit, ',') s
LEFT JOIN ANTERO.sa.sa_koodistot k on k.koodisto = 'pohjakoulutusvaatimustoinenaste' and k.koodi = s.value
LEFT JOIN ANTERO.sa.sa_koodistot k2 on k2.koodisto = 'pohjakoulutusvaatimuskouta' and k2.koodi = s.value
WHERE s.value IS NOT NULL
GROUP BY hk.hakukohde_oid
OPTION (MAXDOP 1)

-------------------------------------------------------------------------------------
/* Temp-taluun hakukohteen alin ja ylin hyväsytty pistemäärä valintatapajonoittain */
-------------------------------------------------------------------------------------

SELECT
	js.hakukohde_oid,
	js.valintatapajono_oid,
	MAX(CASE WHEN js.Pisteet <= 0 THEN NULL ELSE js.Pisteet END) as ylinhyvaksyttypistemaara,
	MIN(
		CASE 
			WHEN vvt.alinhyvaksyttypistemaara <= 0 and js.Pisteet <= 0 THEN NULL 
			WHEN vvt.alinhyvaksyttypistemaara <= js.Pisteet THEN vvt.alinhyvaksyttypistemaara 
			ELSE js.Pisteet 
		END
	) as alinhyvaksyttypistemaara
INTO [ANTERO].[sa].[temp_ylinhyvaksyttypisteraja]
FROM [ANTERO].[sa].[sa_ovara_valintarekisteri_jonosija] js 
INNER JOIN ANTERO.sa.sa_ovara_valintarekisteri_valinnantulos vt on js.hakemus_oid = vt.hakemus_oid and js.hakukohde_oid = vt.hakukohde_oid and vt.valinnan_tila in ('VARASIJALTA_HYVAKSYTTY','HYVAKSYTTY','PERUNUT')
LEFT JOIN ANTERO.sa.sa_ovara_valintarekisteri_valintatapajono vvt on vvt.hakukohde_oid = js.hakukohde_oid and vvt.valintatapajono_oid = js.valintatapajono_oid
GROUP BY js.hakukohde_oid, js.valintatapajono_oid
OPTION (MAXDOP 1)

---------------------------------------------------------------------
/* Temp-tauluun vain yksi valintatapajono per hakemus ja hakukohde */
---------------------------------------------------------------------

SELECT
	hakemus_oid,
	hakukohde_oid,
	valintatapajono_oid,
	pisteet,
	-- Priorisointi valinnan tilan, jonosijan ja pisteiden perusteella
	rnk = ROW_NUMBER() OVER (PARTITION BY hakemus_oid, hakukohde_oid ORDER BY valinnan_tila, jonosija, pisteet desc, valinnantulos_id)
INTO [ANTERO].[sa].[temp_ovara_valinnantulos_siistitty] 
FROM (
	SELECT
		vt.valinnantulos_id,
		vt.hakemus_oid, 
		vt.hakukohde_oid, 
		vt.valintatapajono_oid,
		js.pisteet,
		CASE
			WHEN vt.valinnan_tila = 'HYVAKSYTTY' THEN 1
			WHEN vt.valinnan_tila = 'VARASIJALTA_HYVAKSYTTY' THEN 2
			WHEN vt.valinnan_tila = 'PERUNUT' THEN 3
			ELSE 4
		END as valinnan_tila,
		js.jonosija
	FROM [ANTERO].[sa].[sa_ovara_valintarekisteri_valinnantulos] vt
	LEFT JOIN [ANTERO].[sa].[sa_ovara_valintarekisteri_jonosija] js on js.hakemus_oid = vt.hakemus_oid and js.hakukohde_oid = vt.hakukohde_oid and js.valintatapajono_oid = vt.valintatapajono_oid
	LEFT JOIN [ANTERO].[sa].[sa_ovara_valintarekisteri_vastaanotto] vo on vo.hakukohde_oid = vt.hakukohde_oid and vo.master_oid = vt.master_oid
	LEFT JOIN [ANTERO].[sa].[sa_ovara_valintarekisteri_ilmoittautuminen] i on i.hakukohde_oid = vt.hakukohde_oid and i.master_oid = vt.master_oid
	-- Valintatapajonot vain valituille
	WHERE vt.valinnan_tila in ('VARASIJALTA_HYVAKSYTTY','HYVAKSYTTY','PERUNUT') OR 
	vo.operaatio in ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT','PERUNUT') OR
	i.tila in ('LASNA','LASNA_KOKO_LUKUVUOSI','LASNA_SYKSY')
) vt
OPTION (MAXDOP 1)

---------------------------------------
/* Toisen asteen pohjakoulutustiedot */
---------------------------------------

SELECT 
	s.resourceid,
	CASE
		WHEN komo = '1.2.246.562.13.62959769647' and yksilollistaminen = 'Ei' THEN '1'
		WHEN komo = '1.2.246.562.13.62959769647' and yksilollistaminen = 'Osittain' THEN '2'
		WHEN komo = '1.2.246.562.13.62959769647' and yksilollistaminen = 'Alueittain' THEN '3'
		WHEN komo = '1.2.246.562.13.62959769647' and yksilollistaminen = 'Kokonaan' THEN '6'
		WHEN komo in ('TODO lukio komo oid', '1.2.246.562.5.2013061010184237348007') THEN '9'
	END as pohjakoulutus,
	YEAR(s.valmistuminen) as pohjakoulutuksen_vuosi,
	s.vahvistettu,
	s.valmistuminen,
	s.master_oid
INTO ANTERO.sa.temp_pohjakoulutukset_toinen_aste
FROM ANTERO.sa.sa_ovara_sure_suoritus s
WHERE s.tila = 'VALMIS' and komo in ('TODO lukio komo oid', '1.2.246.562.5.2013061010184237348007','1.2.246.562.13.62959769647')

-- Priorisoidaan proxysuoritus-taulussa määritetty pohjakoulutus
SELECT 
	ps.pohjakoulutus, 
	ps2.pohjakoulutuksen_vuosi,
	ps.hakemus_oid
INTO ANTERO.sa.temp_pohjakoulutukset_toinen_aste_prio
FROM ANTERO.sa.sa_ovara_sure_proxysuoritus ps
OUTER APPLY (
	SELECT 
		*
	FROM (
		SELECT 
			s.pohjakoulutus,
			s.pohjakoulutuksen_vuosi,
			rank() OVER (PARTITION BY s.master_oid ORDER BY s.valmistuminen, s.vahvistettu DESC, s.resourceid) as rnk
		FROM ANTERO.sa.temp_pohjakoulutukset_toinen_aste s
		WHERE s.master_oid = ps.master_oid and s.pohjakoulutus = ps.pohjakoulutus
	) ps2 WHERE ps2.rnk = 1
) ps2
WHERE ps.pohjakoulutus is not null

--------------------------------------------------------------------
/* SA-tauluun hakeneiden tiedot hakemuksittain ja hakukohteittain */
--------------------------------------------------------------------

SELECT 
	ah.hakemus_oid, 
	coalesce(ah.master_oid, ah.henkilo_oid) as master_oid,
	ah.haku_oid,
	ah.luotu as hakemus_luotu,
	ah.muokattu as hakemus_muokattu,
	th.koulutuksen_alkamisvuosi,
	th.koulutuksen_alkamiskausi,
	aht.hakukohde_oid,
	cast(aht.hakutoivenumero as int) as hakutoive,
	e.isensikertalainen as ensikertalainen,
	case	
		when kk_haku = 0 then 0
		when e.isensikertalainen = 0 then 0
		when YEAR(vto.min_pvm) < th.koulutuksen_alkamisvuosi then 0 
		when YEAR(vto.min_pvm) = th.koulutuksen_alkamisvuosi and th.koulutuksen_alkamiskausi = 's' and MONTH(vto.min_pvm) < 8 then 0
		else 1
	end as aidosti_ensikertainen,
	case 
		when ah.asuinmaa in ('246','248','999') then ah.kotikunta
		else '200'
	end as kotikunta,
	ah.sukupuoli,
	h.aidinkieli,
	COALESCE(YEAR(th.ensimmainen_hakuaika_paattyy),th.koulutuksen_alkamisvuosi) - YEAR(h.syntymaaika) as ika,
	LEFT(ah.kansalaisuus,3) as kansalaisuus,
	th.kk_haku,
	th.koulutuskoodi,
	CASE
		WHEN th.kk_haku = 0 THEN NULL
		WHEN th.koulutustyyppi in ('kk-opintokokonaisuus', 'kk-opintojakso', 'erikoislaakari', 'ope-pedag-opinnot', 'erikoistumiskoulutus', 'amm-ope-erityisope-ja-opo') THEN 6
		WHEN th.koulutuskoodi like '9%' THEN 6
		WHEN th.haunkohdejoukontarkenne = 'Jatkotutkintohaku' THEN 5
		WHEN th.alempi_kk = 0 and th.ylempi_kk = 0 and th.jatkotutkinto_kk = 1 THEN 5 
		WHEN th.haunkohdejoukontarkenne = 'Siirtohaku' THEN
			CASE
				WHEN th.alempi_kk = 1 THEN 2
				WHEN th.alempi_kk = 0 and th.ylempi_kk = 1 and (th.opintoala1995_koodi in (90, 91) or th.opintoala2002_koodi in (704, 708))THEN 2
				WHEN th.ylempi_kk = 1 THEN 4
				ELSE -1
			END
		WHEN th.alempi_kk = 1 THEN 1
		WHEN th.alempi_kk = 0 and th.ylempi_kk = 1 and (th.opintoala1995_koodi in (90, 91) or th.opintoala2002_koodi in (704, 708))THEN 1
		WHEN th.ylempi_kk = 1 THEN 3
		WHEN th.apusarake_kk_ammatillinen = 1 THEN 6
		ELSE -1
	END as hakukohteen_tutkinnon_taso_kk_sykli,
	CASE
		WHEN th.kk_haku = 0 THEN NULL
		WHEN th.koulutustyyppi in ('kk-opintokokonaisuus', 'kk-opintojakso', 'erikoislaakari', 'ope-pedag-opinnot', 'erikoistumiskoulutus', 'amm-ope-erityisope-ja-opo') THEN 5
		WHEN th.koulutuskoodi like '9%' THEN 5
		WHEN th.alempi_kk = 1 and th.ylempi_kk = 0 THEN 1
		WHEN th.alempi_kk = 0 and th.ylempi_kk = 1 THEN 2
		WHEN th.alempi_kk = 1 and th.ylempi_kk = 1 THEN 3
		WHEN th.haunkohdejoukontarkenne = 'Jatkotutkintohaku' THEN 4
		WHEN th.alempi_kk = 0 and th.ylempi_kk = 0 and th.jatkotutkinto_kk = 1 THEN 4
		WHEN th.apusarake_kk_ammatillinen = 1 THEN 5
		ELSE -1
	END as hakukohteen_tutkinnon_taso_kk,
	CASE
		WHEN th.haunkohdejoukontarkenne = 'Jatkotutkintohaku' or (th.alempi_kk = 0 and th.ylempi_kk = 0 and th.jatkotutkinto_kk = 1) THEN 1
		ELSE 0
	END as jatkotutkintohaku,
	CASE
		WHEN th.kk_haku = 0 THEN NULL
		ELSE th.koulutusaste
	END as koulutusaste,
	coalesce(th.koulutustoimija_oid,'-1') as koulutustoimija_oid,
	coalesce(th.oppilaitos_oid,'-1') as oppilaitos_oid,
	coalesce(th.toimipiste_oid,'-1') as toimipiste_oid,
	coalesce(th.toimipiste_oid, th.oppilaitos_oid, th.koulutustoimija_oid,'-1') as organisaatio_oid,
	th.laajuus,
	th.opetuksen_kieli,
	CASE
		WHEN i.tila in ('LASNA','LASNA_KOKO_LUKUVUOSI','LASNA_SYKSY') THEN 1
		WHEN v.operaatio in ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT') THEN 1
		WHEN vt.hakemus_oid is not null THEN 1
		ELSE 0
	END as valittu,
	CASE
		WHEN i.tila in ('LASNA','LASNA_KOKO_LUKUVUOSI','LASNA_SYKSY') THEN 1
		WHEN v.operaatio in ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT') THEN 1
		ELSE 0
	END as vastaanottanut_paikan,
	CASE
		WHEN i.tila in ('LASNA','LASNA_KOKO_LUKUVUOSI','LASNA_SYKSY') THEN 1
		ELSE 0
	END as ilmoittautunut,
	CASE WHEN vt.pisteet <= 0 THEN NULL ELSE vt.pisteet END as pisteet,
	CASE WHEN coalesce(vtj.alinhyvaksyttypistemaara,0) <= 0 and yhp.alinhyvaksyttypistemaara > 0 THEN yhp.alinhyvaksyttypistemaara WHEN vtj.alinhyvaksyttypistemaara <= 0 THEN NULL ELSE vtj.alinhyvaksyttypistemaara END as alinhyvaksyttypistemaara,
	CASE WHEN yhp.ylinhyvaksyttypistemaara <= 0 THEN NULL ELSE yhp.ylinhyvaksyttypistemaara END as ylinhyvaksyttypistemaara,
	coalesce(ps.pohjakoulutus, ps2.pohjakoulutus) as pohjakoulutus,
	coalesce(ps.pohjakoulutuksen_vuosi, ps2.pohjakoulutuksen_vuosi) as pohjakoulutuksen_vuosi,
	CASE
		WHEN kk_haku = 1 THEN NULL 
		ELSE so.luokkataso
	END as luokkataso,
	so.oppilaitos_oid as lahtokoulu,
	CASE
		WHEN vt.hakemus_oid is null and v.operaatio not in ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT') and i.tila not in ('LASNA','LASNA_KOKO_LUKUVUOSI','LASNA_SYKSY') THEN 'ev'
		WHEN	kp.tyyppi is null AND (vtj.valintatapajono_nimi like 'Avoim%' OR vtj.valintatapajono_nimi like '%Avoin%' OR 
				kh.haun_nimi_fi like '%Avoi%' OR kh.haun_nimi_fi like '%Öppna%' OR kh.haun_nimi_fi like '%Öppen%' OR
				khk.hakukohteen_nimi_fi like '%Avoi%' OR khk.hakukohteen_nimi_fi like '%Öppen%' OR khk.hakukohteen_nimi_fi like '%Öppna%' OR khk.hakukohteen_nimi_fi like '%Open%')
		THEN 'av'
		WHEN	kp.tyyppi is null AND (khk.hakukohteen_nimi_fi like '%Rolling%admission%' OR khk.hakukohteen_nimi_fi like '%Jatkuva%haku%' OR
				kh.haun_nimi_fi like '%Rolling%admission%' OR kh.haun_nimi_fi like '%Jatkuva%haku') 
		THEN 'jh'
		ELSE RIGHT(kp.tyyppi, LEN(kp.tyyppi) - CHARINDEX('_', kp.tyyppi))
	END as valintatapajonon_tyyppi,
	vt.valintatapajono_oid,
	CASE
		WHEN th.kk_haku = 0 THEN NULL 
		WHEN ay.koulutustyypit_lkm > 1 THEN 3
		WHEN th.koulutustyyppi = 'amk' THEN 2
		WHEN th.koulutustyyppi = 'yo' THEN 1
		ELSE -1
	END as Yo_Amk_YoAmk,
	CASE 
		WHEN th.kk_haku = 0 THEN pkv.koodi 
		ELSE NULL
	END as pohjakoulutusvaatimus_koodi,
	ah.kiinnostunut_oppisopimuksesta,
	GETDATE() as loadtime,
	'etl: p_lataa_ovara' as source
INTO [ANTERO].[sa].[sa_ovara_hakeneet]
FROM [ANTERO].[sa].[sa_ovara_ataru_hakemus] ah
INNER JOIN [ANTERO].[sa].[sa_ovara_ataru_hakutoive] aht on aht.hakemus_oid = ah.hakemus_oid and aht.master_oid = ah.master_oid
LEFT JOIN [ANTERO].[sa].[sa_ovara_onr_henkilo] h on h.henkilo_oid = ah.henkilo_oid
OUTER APPLY (
	SELECT TOP 1 isensikertalainen 
	FROM [ANTERO].[sa].[sa_ovara_sure_ensikertalainen] e 
	WHERE e.master_oid = h.master_oid and e.haku_oid = ah.haku_oid
) e
LEFT JOIN [ANTERO].[sa].[temp_virta_otp_varhaisin_tutkinto_tai_opiskeluoikeus] vto on vto.oid = h.master_oid
LEFT JOIN [ANTERO].[sa].[temp_ovara_valinnantulos_siistitty] vt on vt.hakemus_oid = ah.hakemus_oid and vt.hakukohde_oid = aht.hakukohde_oid and vt.rnk = 1
LEFT JOIN [ANTERO].[sa].[sa_ovara_valintarekisteri_vastaanotto] v on v.master_oid = ah.master_oid and v.hakukohde_oid = aht.hakukohde_oid
LEFT JOIN [ANTERO].[sa].[sa_ovara_valintarekisteri_ilmoittautuminen] i on i.master_oid = ah.master_oid and i.hakukohde_oid = aht.hakukohde_oid
LEFT JOIN [ANTERO].[sa].[sa_ovara_valintarekisteri_valintatapajono] vtj on vtj.hakukohde_oid = aht.hakukohde_oid and vtj.valintatapajono_oid = vt.valintatapajono_oid
LEFT JOIN [ANTERO].[sa].[sa_ovara_kouta_pistehistoria] kp on kp.hakukohde_oid = aht.hakukohde_oid and kp.valintatapajono_oid = vtj.valintatapajono_oid and ah.haku_oid = kp.haku_oid
LEFT JOIN [ANTERO].[sa].[temp_ylinhyvaksyttypisteraja] yhp on yhp.hakukohde_oid = aht.hakukohde_oid and yhp.valintatapajono_oid = vtj.valintatapajono_oid
LEFT JOIN [ANTERO].[sa].[temp_ovara_hakukohteet] th on th.hakukohde_oid = aht.hakukohde_oid 
LEFT JOIN [ANTERO].[sa].[temp_ovara_amk_yo] ay on ay.hakemus_oid = ah.hakemus_oid
LEFT JOIN [ANTERO].[sa].[temp_ovara_pohjakoulutusvaatimukset] pkv on pkv.hakukohde_oid = aht.hakukohde_oid
LEFT JOIN [ANTERO].[sa].[sa_ovara_kouta_haut] kh on kh.haku_oid = ah.haku_oid
LEFT JOIN [ANTERO].[sa].[sa_ovara_kouta_hakukohteet] khk on khk.hakukohde_oid = aht.hakukohde_oid
OUTER APPLY (
	SELECT 
		so.luokkataso, 
		so.oppilaitos_oid, 
		so.master_oid, 
		rank() OVER (PARTITION BY so.master_oid ORDER BY CASE WHEN so.luokkataso = 'OPPIAINE' THEN 1 ELSE 0 END, so.loppupaiva DESC, so.luokkataso, so.resourceid) rnk
	FROM [ANTERO].[sa].[sa_ovara_sure_opiskelija] so
	WHERE so.master_oid = ah.master_oid and (YEAR(so.loppupaiva) < th.koulutuksen_alkamisvuosi or (YEAR(so.loppupaiva) = th.koulutuksen_alkamisvuosi) and th.koulutuksen_alkamiskausi = 's' and MONTH(so.loppupaiva) < 8)
) so
-- Pohjakolutus, ensisijaisesti proxysuoritus-taulusta
LEFT JOIN ANTERO.sa.temp_pohjakoulutukset_toinen_aste_prio ps on ps.hakemus_oid = ah.hakemus_oid
OUTER APPLY (
	SELECT 
		s.pohjakoulutus,
		s.pohjakoulutuksen_vuosi,
		rank() OVER (PARTITION BY s.master_oid ORDER BY s.valmistuminen DESC, s.vahvistettu DESC, resourceid) as rnk
	FROM ANTERO.sa.temp_pohjakoulutukset_toinen_aste s
	WHERE s.master_oid = ah.master_oid and (
		s.pohjakoulutuksen_vuosi < th.koulutuksen_alkamisvuosi or (
			s.pohjakoulutuksen_vuosi = th.koulutuksen_alkamisvuosi and 
			th.koulutuksen_alkamiskausi = 's' and MONTH(s.valmistuminen) < 8
		)
	)
) ps2
WHERE ah.poistettu = 0 and aht.poistettu = 0 and (so.rnk = 1 or so.rnk is null) and (ps2.rnk = 1 or ps2.rnk is null) and th.koulutuksen_alkamisvuosi >= 2025
and khk.tila IN ('JULKAISTU', 'ARKISTOITU')

----------------------------------------
/* ODW:n tiedot hakeneiden SA-tauluun */
----------------------------------------

INSERT INTO [ANTERO].[sa].[sa_ovara_hakeneet]
SELECT
	h.hakemus_oid, 
	h.master_oid,
	h.haku_oid,
	h.hakemus_luotu,
	h.hakemus_muokattu,
	h.koulutuksen_alkamisvuosi,
	h.koulutuksen_alkamiskausi,
	h.hakukohde_oid,
	h.hakutoive,
	h.ensikertalainen,
	case	
		when h.kk_haku = 0 then 0
		when ensikertalainen = 0 then 0
		when YEAR(vto.min_pvm) < h.koulutuksen_alkamisvuosi then 0 
		when YEAR(vto.min_pvm) = h.koulutuksen_alkamisvuosi and h.koulutuksen_alkamiskausi = 's' and MONTH(vto.min_pvm) < 8 then 0
		else 1
	end as aidosti_ensikertainen,
	h.kotikunta,
	h.sukupuoli,
	h.aidinkieli,
	h.ika,
	h.kansalaisuus,
	h.kk_haku,
	h.koulutuskoodi,
	h.hakukohteen_tutkinnon_taso_kk_sykli,
	h.hakukohteen_tutkinnon_taso_kk,
	h.jatkotutkintohaku,
	h.koulutusaste,
	h.koulutustoimija_oid,
	h.oppilaitos_oid,
	h.toimipiste_oid,
	coalesce(h.toimipiste_oid,h.oppilaitos_oid,h.koulutustoimija_oid) as organisaatio_oid,
	h.laajuus,
	h.opetuksen_kieli,
	h.valittu,
	h.vastaanottanut_paikan,
	h.ilmoittautunut,
	h.pisteet,
	h.alinhyvaksyttypistemaara,
	h.ylinhyvaksyttypistemaara,
	h.pohjakoulutus,
	h.pohjakoulutuksen_vuosi,
	h.luokkataso,
	h.lahtokoulu,
	h.valintatapajonon_tyyppi,
	h.valintatapajono_oid,
	h.Yo_Amk_YoAmk,
	h.pohjakoulutusvaatimus_koodi,
	h.kiinnostunut_oppisopimuksesta,
	GETDATE() as loadtime,
	'etl: p_lataa_ovara' as source
FROM ANTERO.sa.sa_odw_hakeneet_updated h
LEFT JOIN [ANTERO].[sa].[temp_virta_otp_varhaisin_tutkinto_tai_opiskeluoikeus] vto on vto.oid = h.master_oid
WHERE rnk = 1 and koulutuksen_alkamisvuosi < 2025

-------------------------------------
/* Hakukohteiden tiedot SA-tauluun */
-------------------------------------

SELECT DISTINCT
	h.hakukohde_oid,
	h.haku_oid,
	h.koulutuksen_alkamisvuosi,
	h.koulutuksen_alkamiskausi,
	h.toimipiste_oid,
	h.oppilaitos_oid,
	h.koulutustoimija_oid,
	h.organisaatio_oid,
	h.koulutuskoodi,
	k.koulutustyyppi,
	h.hakukohteen_tutkinnon_taso_kk_sykli,
	h.hakukohteen_tutkinnon_taso_kk,
	h.kk_haku,
	h.opetuksen_kieli,
	h.laajuus,
	h.pohjakoulutusvaatimus_koodi,
	t.ammatillinenperustutkintoerityisopetuksena,
	t.jarjestetaanerityisopetuksena,
	MIN(h.alinhyvaksyttypistemaara) OVER (PARTITION BY h.hakukohde_oid) as alinhyvaksyttypistemaara,
	hk.aloituspaikat,
	hk.aloituspaikat_ensikertalaisille,
	GETDATE() as loadtime,
	'etl: p_lataa_ovara' as source
INTO [ANTERO].[sa].[sa_ovara_hakukohteet]
FROM [ANTERO].[sa].[sa_ovara_hakeneet] h
LEFT JOIN [ANTERO].[sa].[sa_ovara_kouta_hakukohteet] hk on h.hakukohde_oid = hk.hakukohde_oid
LEFT JOIN [ANTERO].[sa].[sa_ovara_kouta_toteutus] t on t.toteutus_oid = hk.toteutus_oid
LEFT JOIN [ANTERO].[sa].[sa_ovara_kouta_koulutus] k on k.koulutus_oid = t.koulutus_oid and k.jarjestysnro = 1
-- Myös hakukohteet, joihin ei ole hakijoita
UNION ALL
SELECT 
	hk.hakukohde_oid,
	hk.haku_oid,
	hk.koulutuksen_alkamisvuosi,
	hk.koulutuksen_alkamiskausi,
	coalesce(hk.toimipiste_oid, '-1'),
	coalesce(hk.oppilaitos_oid, '-1'),
	coalesce(hk.koulutustoimija_oid, '-1'),
	coalesce(hk.toimipiste_oid, hk.oppilaitos_oid, hk.koulutustoimija_oid, '-1') as organisaatio_oid,
	hk.koulutuskoodi,
	k.koulutustyyppi,
	CASE
		WHEN hk.kk_haku = 0 THEN NULL
		WHEN hk.koulutustyyppi in ('kk-opintokokonaisuus', 'kk-opintojakso', 'erikoislaakari', 'ope-pedag-opinnot', 'erikoistumiskoulutus', 'amm-ope-erityisope-ja-opo') THEN 6
		WHEN hk.koulutuskoodi like '9%' THEN 6
		WHEN hk.haunkohdejoukontarkenne = 'Jatkotutkintohaku' THEN 5
		WHEN hk.alempi_kk = 0 and hk.ylempi_kk = 0 and hk.jatkotutkinto_kk = 1 THEN 5 
		WHEN hk.haunkohdejoukontarkenne = 'Siirtohaku' THEN
			CASE
				WHEN hk.alempi_kk = 1 THEN 2
				WHEN hk.alempi_kk = 0 and hk.ylempi_kk = 1 and (hk.opintoala1995_koodi in (90, 91) or hk.opintoala2002_koodi in (704, 708))THEN 2
				WHEN hk.ylempi_kk = 1 THEN 4
				ELSE -1
			END
		WHEN hk.alempi_kk = 1 THEN 1
		WHEN hk.alempi_kk = 0 and hk.ylempi_kk = 1 and (hk.opintoala1995_koodi in (90, 91) or hk.opintoala2002_koodi in (704, 708))THEN 1
		WHEN hk.ylempi_kk = 1 THEN 3
		WHEN hk.apusarake_kk_ammatillinen = 1 THEN 6
		ELSE -1
	END as hakukohteen_tutkinnon_taso_kk_sykli,
	CASE
		WHEN hk.kk_haku = 0 THEN NULL
		WHEN hk.koulutustyyppi in ('kk-opintokokonaisuus', 'kk-opintojakso', 'erikoislaakari', 'ope-pedag-opinnot', 'erikoistumiskoulutus', 'amm-ope-erityisope-ja-opo') THEN 5
		WHEN hk.koulutuskoodi like '9%' THEN 5
		WHEN hk.alempi_kk = 1 and hk.ylempi_kk = 0 THEN 1
		WHEN hk.alempi_kk = 0 and hk.ylempi_kk = 1 THEN 2
		WHEN hk.alempi_kk = 1 and hk.ylempi_kk = 1 THEN 3
		WHEN hk.haunkohdejoukontarkenne = 'Jatkotutkintohaku' THEN 4
		WHEN hk.alempi_kk = 0 and hk.ylempi_kk = 0 and hk.jatkotutkinto_kk = 1 THEN 4
		WHEN hk.apusarake_kk_ammatillinen = 1 THEN 5
		ELSE -1
	END as hakukohteen_tutkinnon_taso_kk,
	hk.kk_haku,
	hk.opetuksen_kieli,
	hk.laajuus,
	pkv.koodi as pohjakoulutusvaatimus_koodi,
	t.ammatillinenperustutkintoerityisopetuksena,
	t.jarjestetaanerityisopetuksena,
	NULL as alinhyvaksyttypistemaara,
	khk.aloituspaikat,
	khk.aloituspaikat_ensikertalaisille,
	GETDATE() as loadtime,
	'etl: p_lataa_ovara' as source
FROM [ANTERO].[sa].[temp_ovara_hakukohteet] hk
LEFT JOIN [ANTERO].[sa].[sa_ovara_kouta_hakukohteet] khk on hk.hakukohde_oid = khk.hakukohde_oid
LEFT JOIN [ANTERO].[sa].[sa_ovara_kouta_toteutus] t on t.toteutus_oid = khk.toteutus_oid
LEFT JOIN [ANTERO].[sa].[sa_ovara_kouta_koulutus] k on k.koulutus_oid = t.koulutus_oid and k.jarjestysnro = 1
LEFT JOIN [ANTERO].[sa].[temp_ovara_pohjakoulutusvaatimukset] pkv on pkv.hakukohde_oid = hk.hakukohde_oid
WHERE khk.tila IN ('JULKAISTU', 'ARKISTOITU') and NOT EXISTS (
	SELECT TOP 1 hakukohde_oid 
	FROM [ANTERO].[sa].[sa_ovara_hakeneet] h 
	WHERE h.hakukohde_oid = hk.hakukohde_oid
) and NOT EXISTS (
	SELECT TOP 1 hakukohde_oid 
	FROM ANTERO.sa.sa_koulutustarjonta h
	WHERE h.hakukohde_oid = hk.hakukohde_oid
)
UNION ALL
SELECT 
	k.hakukohde_oid,
	k.haku_oid,
	k.koulutuksen_alkamisvuosi,
	k.koulutuksen_alkamiskausi,
	coalesce(k.toimipiste_oid, '-1'),
	coalesce(k.oppilaitos_oid, '-1'),
	coalesce(k.koulutustoimija_oid, '-1'),
	coalesce(k.toimipiste_oid, k.oppilaitos_oid, k.koulutustoimija_oid, '-1') as organisaatio_oid,
	k.koulutus_koodi as koulutuskoodi,
	k.koulutustyyppi,
	NULL as hakukohteen_tutkinnon_taso_kk_sykli,
	NULL as hakukohteen_tutkinnon_taso_kk,
	k.kk_haku,
	k.opetuksen_kieli,
	NULL as laajuus,
	NULL as pohjakoulutusvaatimus_koodi,
	NULL ammatillinenperustutkintoerityisopetuksena,
	NULL jarjestetaanerityisopetuksena,
	NULL as alinhyvaksyttypistemaara,
	k.aloituspaikatLkm as aloituspaikat,
	k.ensikertalaistenAloituspaikat as aloituspaikat_ensikertalaisille,
	GETDATE() as loadtime,
	'etl: p_lataa_ovara' as source
FROM ANTERO.sa.sa_koulutustarjonta k
WHERE NOT EXISTS (
	SELECT TOP 1 hakukohde_oid 
	FROM [ANTERO].[sa].[sa_ovara_hakeneet] h 
	WHERE h.hakukohde_oid = k.hakukohde_oid
)

-- Aloituspaikkojen päivitys koulutustarjonnan datalla

UPDATE hk
SET 
	aloituspaikat = khk.aloituspaikatLkm,
	aloituspaikat_ensikertalaisille = khk.ensikertalaistenAloituspaikat
FROM ANTERO.sa.sa_ovara_hakukohteet hk
LEFT JOIN ANTERO.sa.sa_koulutustarjonta khk on khk.hakukohde_oid = hk.hakukohde_oid
WHERE khk.hakukohde_oid is not null

----------------------------------------
/* Hakeneiden yo-arvosanat SA-tauluun */
----------------------------------------

SELECT 
	s.master_oid,
	CAST(s.valmistuminen as date) as valmistumispaivamaara,
	a.sure_arvosana_id as arvosana_id,
	a.arvosana,
	CASE
		WHEN a.arvosana = 'L' THEN 10
		WHEN a.arvosana = 'E' THEN 9
		WHEN a.arvosana = 'M' THEN 8
		WHEN a.arvosana = 'C' THEN 7
		WHEN a.arvosana = 'B' THEN 6
		WHEN a.arvosana = 'A' THEN 5
		WHEN a.arvosana = 'I+' THEN 4
		WHEN a.arvosana = 'I' THEN 3
		WHEN a.arvosana = 'I-' THEN 2
		WHEN a.arvosana = 'I=' THEN 1
		ELSE NULL
	END as arvosana_asteikko,
	a.pisteet,
	a.aine,
	a.yo_aine as koetunnus,
	a.lisatieto,
	valinnainen,
	CAST(myonnetty as date) as myonnetty,
	GETDATE() as loadtime,
	'etl: p_lataa_ovara' as source
INTO [ANTERO].[sa].[sa_ovara_yo_arvosanat]
FROM [ANTERO].[sa].[sa_ovara_sure_suoritus] s
LEFT JOIN [ANTERO].[sa].[sa_ovara_sure_arvosana] a on a.suoritus = s.resourceid and a.asteikko = 'YO'
WHERE s.komo = '1.2.246.562.5.2013061010184237348007'

UNION ALL
-- Täydennetään Ovaran tietoja ODW:n tiedoilla
SELECT
	s.HenkiloOID as master_oid,
	CAST(s.Valmistumispaivamaara as date) as valmistumispaivamaara,
	s.ArvosanaUuid as arvosana_id,
	s.arvosana,
	s.ArvosanaAsteikko as arvosana_asteikko,
	s.pisteet,
	s.aine,
	s.koetunnus,
	s.lisatieto,
	s.valinnainen,
	CAST(s.myonnetty as date) as myonnetty,
	GETDATE() as loadtime,
	'etl: p_lataa_ovara' as source
FROM ANTERO.sa.sa_odw_yoarvosanat s
WHERE NOT EXISTS (
	SELECT top 1 ss.master_oid FROM [ANTERO].[sa].[sa_ovara_sure_suoritus] ss
	LEFT JOIN [ANTERO].[sa].[sa_ovara_sure_arvosana] a on a.suoritus = ss.resourceid
	WHERE ss.master_oid = s.HenkiloOID and ss.komo = '1.2.246.562.5.2013061010184237348007' and a.asteikko = 'YO'
)

------------------------------------------------------------------------------------------
/* Poistetaan SA-taulusta rivit, joilla ei ole ainetietoja, jos henkilöltä löytyy niitä */
------------------------------------------------------------------------------------------

DELETE a
FROM [ANTERO].[sa].[sa_ovara_yo_arvosanat] a
OUTER APPLY	(
	SELECT 
		COUNT(*) as lkm 
	FROM [ANTERO].[sa].[sa_ovara_yo_arvosanat] a2
	WHERE a.master_oid = a2.master_oid and a2.aine is not null
) lkm
WHERE lkm.lkm >= 1 and a.aine is null

--------------------------------------------
/* Pohjakoulutusvaatimus-dimension lataus */
--------------------------------------------

TRUNCATE TABLE ANTERO.dw.d_pohjakoulutusvaatimus_toinen_aste

SET IDENTITY_INSERT ANTERO.dw.d_pohjakoulutusvaatimus_toinen_aste ON
INSERT ANTERO.dw.d_pohjakoulutusvaatimus_toinen_aste (
	id
	,koodi
	,selite_fi
	,selite_sv
	,selite_en
	,source
	)
VALUES (
	N'-1'
	,N'-1'
	,N'Tieto puuttuu'
	,N'Information saknas'
	,N'Missing data'
	,N'etl: p_lataa_ovara'
	)
SET IDENTITY_INSERT ANTERO.dw.d_pohjakoulutusvaatimus_toinen_aste OFF


MERGE ANTERO.dw.d_pohjakoulutusvaatimus_toinen_aste AS target
USING (
	SELECT DISTINCT
		pkv.koodi,
		pkv.selite_fi,
		pkv.selite_sv,
		pkv.selite_en,
		'etl: p_lataa_ovara' as source
	FROM ANTERO.sa.temp_ovara_pohjakoulutusvaatimukset pkv
	LEFT JOIN ANTERO.sa.sa_ovara_hakukohteet hk on hk.hakukohde_oid = pkv.hakukohde_oid
	WHERE hk.kk_haku = 0 and pkv.selite_fi is not null
	UNION ALL
	SELECT DISTINCT 
		koodi,
		nimi as selite_fi,
		coalesce(nimi_sv,nimi) as selite_sv,
		coalesce(nimi_en,nimi) as selite_en,
		'etl: p_lataa_ovara' as source
	FROM ANTERO.sa.sa_koodistot k
	WHERE koodisto = 'pohjakoulutusvaatimustoinenaste' and 
	NOT EXISTS (
		SELECT TOP 1 koodi 
		FROM ANTERO.sa.temp_ovara_pohjakoulutusvaatimukset k2
		WHERE k.koodi = k2.koodi
	)
) AS src
ON target.koodi = src.koodi
WHEN MATCHED
	THEN
		UPDATE
		SET selite_fi = src.selite_fi
			,selite_sv = src.selite_sv
			,selite_en = src.selite_en
			,target.source = src.source
WHEN NOT MATCHED
	THEN
		INSERT (
			koodi
			,selite_fi
			,selite_sv
			,selite_en
			,source
			)
		VALUES (
			src.koodi
			,src.selite_fi
			,src.selite_sv
			,src.selite_en
			,src.source
		);

---------------------------
/* Temp-taulujen pudotus */
---------------------------

DROP TABLE IF EXISTS [ANTERO].[sa].[temp_ovara_hakukohteet]
DROP TABLE IF EXISTS [ANTERO].[sa].[temp_ovara_amk_yo]
DROP TABLE IF EXISTS [ANTERO].[sa].[temp_ovara_pohjakoulutusvaatimukset]
DROP TABLE IF EXISTS [ANTERO].[sa].[temp_ylinhyvaksyttypisteraja]
DROP TABLE IF EXISTS [ANTERO].[sa].[temp_ovara_valinnantulos_siistitty]
DROP TABLE IF EXISTS [ANTERO].[sa].[temp_virta_otp_varhaisin_tutkinto_tai_opiskeluoikeus]
DROP TABLE IF EXISTS [ANTERO].[sa].[temp_pohjakoulutukset_toinen_aste]
DROP TABLE IF EXISTS [ANTERO].[sa].[temp_pohjakoulutukset_toinen_aste_prio]

-- Haetaan väliaikaisesti valintatapajonon tyypit ODW:sta
UPDATE h
SET 
	valintatapajonon_tyyppi = h2.valintatapajonon_tyyppi,
	valintatapajono_oid = h2.valintatapajono_oid
FROM ANTERO.sa.sa_ovara_hakeneet h
LEFT JOIN ANTERO.sa.sa_odw_hakeneet_updated h2 on h2.hakemus_oid = h.hakemus_oid and h2.hakukohde_oid = h.hakukohde_oid
WHERE h.valittu = 1 and h.kk_haku = 1 and h.valintatapajonon_tyyppi is null and h.koulutuksen_alkamisvuosi >= 2025 and h2.valittu = 1

UPDATE ANTERO.sa.sa_ovara_hakeneet
SET 
	valintatapajonon_tyyppi = 'ev'
WHERE valittu = 0 and kk_haku = 1 and coalesce(valintatapajonon_tyyppi,'') <> 'ev'