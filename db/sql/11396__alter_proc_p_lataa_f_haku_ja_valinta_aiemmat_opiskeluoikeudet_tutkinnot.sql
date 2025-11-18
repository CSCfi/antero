USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_haku_ja_valinta_aiemmat_opiskeluoikeudet_tutkinnot]    Script Date: 18.11.2025 10.34.20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE  [dw].[p_lataa_f_haku_ja_valinta_aiemmat_opiskeluoikeudet_tutkinnot] AS

TRUNCATE TABLE [dw].[f_haku_ja_valinta_aiemmat_opiskeluoikeudet_tutkinnot]

INSERT INTO [dw].[f_haku_ja_valinta_aiemmat_opiskeluoikeudet_tutkinnot]

SELECT

	/* Hakumuuttujat */
	d1.id as d_haku_id,
	f.d_kausi_koulutuksen_alkamiskausi_id,
	d5.id as d_hakuaika_id,
	d5b.id as d_hakuaika_kouta_id,
	d10.id as d_hakukohde_id, 
	f.[hakemus_oid],

	/* Hakutoivemuuttujat */
	ht.hakutoive,

	d32.id as d_hakukohde_1_hakukohde_id,
	d33.id as d_koulutusluokitus_1_hakukohde_id,
	d33b.id as d_aloitussykli_1_hakukohde_id,
	d33a.id as d_organisaatioluokitus_1_hakukohde_id,

	d34.id as d_hakukohde_2_hakukohde_id,
	d35.id as d_koulutusluokitus_2_hakukohde_id,
	d35b.id as d_aloitussykli_2_hakukohde_id,
	d35a.id as d_organisaatioluokitus_2_hakukohde_id,

	d36.id as d_hakukohde_3_hakukohde_id,
	d37.id as d_koulutusluokitus_3_hakukohde_id,
	d37b.id as d_aloitussykli_3_hakukohde_id,
	d37a.id as d_organisaatioluokitus_3_hakukohde_id,
	 
	d38.id as d_hakukohde_4_hakukohde_id,
	d39.id as d_koulutusluokitus_4_hakukohde_id,
	d39b.id as d_aloitussykli_4_hakukohde_id,
	d39a.id as d_organisaatioluokitus_4_hakukohde_id,

	d40.id as d_hakukohde_5_hakukohde_id,
	d41.id as d_koulutusluokitus_5_hakukohde_id,
	d41b.id as d_aloitussykli_5_hakukohde_id,
	d41a.id as d_organisaatioluokitus_5_hakukohde_id,

	d42.id as d_hakukohde_6_hakukohde_id,
	d43.id as d_koulutusluokitus_6_hakukohde_id,
	d43b.id as d_aloitussykli_6_hakukohde_id,
	d43a.id as d_organisaatioluokitus_6_hakukohde_id,

	/* Henkilömuuttujat */
	d4.id as d_haku_amk_yo_id,
	f.henkilo_oid,
	d26.id as d_ika_id,
	d28.id as d_kansalaisuus_id,
	d11.id as d_kytkin_pohjakoulutuksen_maa_id,
	d11b.id as d_kytkin_pohjakoulutuksen_maa_priorisoitu_id,
	d22.id as d_pohjakoulutus_id,
	d7.id as d_sukupuoli_id,
	htt.toisen_asteen_koulutuksen_suoritusvuosi,
	d8.id as d_aidinkieli_id,
	f.vastaanottaa_paikan_3v,

	/* Koulutusmuuttujat */
	d19.id as d_alueluokitus_hakukohde_id, 
	d16b.id as d_organisaatioluokitus_hakukohde_id,
	d20.id as d_koulutusluokitus_hakukohde_id,
	d18.id as d_tutkinnon_taso_hakukohde_id,
	f.koulutuksen_alkamisvuosi,
	d27.id as d_koulutuksen_kieli_id,
	d21.id as d_opiskelun_laajuus_id,
	d23.id as d_aloitussykli_hakukohde_id,

	/* Organisaatiomuuttujat */
	d16a.id as d_organisaatioluokitus_koulutustoimija_hakukohde_id,
	d16b.id as d_organisaatioluokitus_oppilaitos_hakukohde_id,
	coalesce(d16c.id, d16b.id) as d_organisaatioluokitus_toimipiste_hakukohde_id,

	/* Muut opiskeluoikeudet */
	d53.id as d_koulutusluokitus_muu_oo_id,
	f.muu_alkamispvm,
	f.muu_paattymispvm,
	f.muu_paattymispvm_prio,
	d51.id as d_organisaatioluokitus_muu_oo_id,

	/* Aiemmat tutkinnot */
	d54.id as d_koulutusluokitus_aiempi_tutk_id,
	f.aiempi_tutkinto_suorituspvm,
	d52.id as d_organisaatioluokitus_aiempi_tutk_id,

	/* Apumuuttujat */
	ensi_kertaa_hakeva = case when f.muu_alkamispvm is not null or f.aiempi_tutkinto_suorituspvm is not null then 0 else f.ensi_kertaa_hakeva end,
	[aidosti_ensikertainen] = case when f.ensikertainen_hakija = 0 then 0 when f.op_oikeus_tai_tutkinto = 0 then 1 else 0 end,
	[ensikertaisena_kohdeltava] = f.ensikertainen_hakija,
	d55.op_oikeus_tai_tutkinto,

	/* Mittarit */
	[Valitut2] = case when f.loadtime >= d44.valitut and ht.valinnan_tila IN ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT') then 1 else 0 end,
	[Paikan vastaanottaneet2] = case when f.loadtime >= d44.vastaanottaneet and ht.vastaanoton_tila IN ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT') then 1 else 0 end,		
	[Aloittaneet2] = case when f.loadtime >= d44.aloittaneet and ht.ilmoittautumisen_tila IN ('LASNA','LASNA_KOKO_LUKUVUOSI','LASNA_SYKSY') then 1 else 0 end,
	
	/* CSCVIPUNEN-3367 */
	MAX(CASE WHEN d20.koulutusalataso1_koodi = d53.koulutusalataso1_koodi THEN 1 ELSE 0 END)
		OVER (
				PARTITION BY f.henkilo_oid, f.hakemus_oid, d10.id, coalesce(d5b.loppuPvm, d5.loppuPvm)) as muu_oo_koulutusala_taso_1_sama_kuin_hakukohde,
	MAX(CASE WHEN d20.koulutusalataso2_koodi = d53.koulutusalataso2_koodi THEN 1 ELSE 0 END)
		OVER (
				PARTITION BY f.henkilo_oid, f.hakemus_oid, d10.id, coalesce(d5b.loppuPvm, d5.loppuPvm)) as muu_oo_koulutusala_taso_2_sama_kuin_hakukohde,
	MAX(CASE WHEN d20.koulutusalataso3_koodi = d53.koulutusalataso3_koodi THEN 1 ELSE 0 END)
		OVER (
				PARTITION BY f.henkilo_oid, f.hakemus_oid, d10.id, coalesce(d5b.loppuPvm, d5.loppuPvm)) as muu_oo_koulutusala_taso_3_sama_kuin_hakukohde,
	MAX(CASE WHEN d20.koulutusastetaso2_koodi = d53.koulutusastetaso2_koodi THEN 1 ELSE 0 END)
		OVER (
				PARTITION BY f.henkilo_oid, f.hakemus_oid, d10.id, coalesce(d5b.loppuPvm, d5.loppuPvm)) as muu_oo_koulutusaste_taso_2_sama_kuin_hakukohde,
	MAX(CASE WHEN d20.koulutusluokitus_koodi = d53.koulutusluokitus_koodi THEN 1 ELSE 0 END)
		OVER (
				PARTITION BY f.henkilo_oid, f.hakemus_oid, d10.id, coalesce(d5b.loppuPvm, d5.loppuPvm)) as muu_oo_tavoitetutkinto_sama_kuin_hakukohde,
	MAX(CASE WHEN d16b.organisaatio_nykyinen_koodi = d51.organisaatio_nykyinen_koodi THEN 1 ELSE 0 END)
		OVER (
				PARTITION BY f.henkilo_oid, f.hakemus_oid, d10.id, coalesce(d5b.loppuPvm, d5.loppuPvm)) as muu_oo_korkeakoulu_sama_kuin_hakukohde,

	MAX(CASE WHEN d20.koulutusalataso1_koodi = d54.koulutusalataso1_koodi THEN 1 ELSE 0 END)
		OVER (
				PARTITION BY f.henkilo_oid, f.hakemus_oid, d10.id, coalesce(d5b.loppuPvm, d5.loppuPvm)) as aiempi_tutk_koulutusala_taso_1_sama_kuin_hakukohde,
	MAX(CASE WHEN d20.koulutusalataso2_koodi = d54.koulutusalataso2_koodi THEN 1 ELSE 0 END)
		OVER (
				PARTITION BY f.henkilo_oid, f.hakemus_oid, d10.id, coalesce(d5b.loppuPvm, d5.loppuPvm)) as aiempi_tutk_koulutusala_taso_2_sama_kuin_hakukohde,
	MAX(CASE WHEN d20.koulutusalataso3_koodi = d54.koulutusalataso3_koodi THEN 1 ELSE 0 END)
		OVER (
				PARTITION BY f.henkilo_oid, f.hakemus_oid, d10.id, coalesce(d5b.loppuPvm, d5.loppuPvm)) as aiempi_tutk_koulutusala_taso_3_sama_kuin_hakukohde,
	MAX(CASE WHEN d20.koulutusastetaso2_koodi = d54.koulutusastetaso2_koodi THEN 1 ELSE 0 END)
		OVER (
				PARTITION BY f.henkilo_oid, f.hakemus_oid, d10.id, coalesce(d5b.loppuPvm, d5.loppuPvm)) as aiempi_tutk_koulutusaste_taso_2_sama_kuin_hakukohde,
	MAX(CASE WHEN d20.koulutusluokitus_koodi = d54.koulutusluokitus_koodi THEN 1 ELSE 0 END)
		OVER (
				PARTITION BY f.henkilo_oid, f.hakemus_oid, d10.id, coalesce(d5b.loppuPvm, d5.loppuPvm)) as aiempi_tutk_tavoitetutkinto_sama_kuin_hakukohde,
	MAX(CASE WHEN d16b.organisaatio_nykyinen_koodi = d52.organisaatio_nykyinen_koodi THEN 1 ELSE 0 END)
		OVER (
				PARTITION BY f.henkilo_oid, f.hakemus_oid, d10.id, coalesce(d5b.loppuPvm, d5.loppuPvm)) as aiempi_tutk_korkeakoulu_sama_kuin_hakukohde,

	MAX(f.aiempi_tutkinto_suorituspvm)
		OVER (
				PARTITION BY f.henkilo_oid, f.hakemus_oid, coalesce(d5b.loppuPvm, d5.loppuPvm)) as tuorein_aiempi_tutkinto_suorituspvm,
	MAX(f.muu_alkamispvm)
		OVER (
				PARTITION BY f.henkilo_oid, f.hakemus_oid, coalesce(d5b.loppuPvm, d5.loppuPvm)) as tuorein_muu_oo_alkamispvm,

	MAX(CASE
			WHEN d20.koulutusluokitus_koodi = d53.koulutusluokitus_koodi AND d16b.organisaatio_nykyinen_koodi = d51.organisaatio_nykyinen_koodi THEN 6
			WHEN d20.koulutusalataso1_koodi = d53.koulutusalataso1_koodi AND d16b.organisaatio_nykyinen_koodi = d51.organisaatio_nykyinen_koodi THEN 5
			WHEN d20.koulutusalataso1_koodi <> d53.koulutusalataso1_koodi AND d16b.organisaatio_nykyinen_koodi = d51.organisaatio_nykyinen_koodi THEN 4
			WHEN d20.koulutusalataso1_koodi = d53.koulutusalataso1_koodi AND d16b.organisaatio_nykyinen_koodi <> d51.organisaatio_nykyinen_koodi THEN 3
			WHEN d20.koulutusalataso1_koodi <> d53.koulutusalataso1_koodi AND  d16b.organisaatio_nykyinen_koodi <> d51.organisaatio_nykyinen_koodi THEN 2
			WHEN d51.id is null THEN 1 
		END)
			OVER (
					PARTITION BY f.henkilo_oid, f.hakemus_oid, d10.id, coalesce(d5b.loppuPvm, d5.loppuPvm)) as muun_opintooikeuden_vertailu,
	MAX(CASE
			WHEN d20.koulutusluokitus_koodi = d54.koulutusluokitus_koodi AND d16b.organisaatio_nykyinen_koodi = d52.organisaatio_nykyinen_koodi THEN 6
			WHEN d20.koulutusalataso1_koodi = d54.koulutusalataso1_koodi AND d16b.organisaatio_nykyinen_koodi = d52.organisaatio_nykyinen_koodi THEN 5
			WHEN d20.koulutusalataso1_koodi <> d54.koulutusalataso1_koodi AND d16b.organisaatio_nykyinen_koodi = d52.organisaatio_nykyinen_koodi THEN 4
			WHEN d20.koulutusalataso1_koodi = d54.koulutusalataso1_koodi AND d16b.organisaatio_nykyinen_koodi <> d52.organisaatio_nykyinen_koodi THEN 3
			WHEN d20.koulutusalataso1_koodi <> d54.koulutusalataso1_koodi AND  d16b.organisaatio_nykyinen_koodi <> d52.organisaatio_nykyinen_koodi THEN 2
			WHEN d52.id is null THEN 1 
		END)
			OVER (
					PARTITION BY f.henkilo_oid, f.hakemus_oid, d10.id, coalesce(d5b.loppuPvm, d5.loppuPvm)) as aiemman_tutkinnon_vertailu
FROM dw.f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_aiemmat_opiskeluoikeudet_ja_tutkinnot f
LEFT JOIN dw.d_haku d1 ON d1.id = f.d_haku_id
LEFT JOIN dw.d_kausi d2 ON d2.id = f.d_kausi_koulutuksen_alkamiskausi_id
LEFT JOIN dw.d_haku_amk_yo d4 on d4.id = f.d_haku_amk_yo_id
LEFT JOIN dw.d_hakuaika_kouta d5b on d5b.haku_oid=d1.haku_oid
LEFT JOIN dw.d_hakuaika d5 on d5.id=f.d_hakuaika_id and d5b.id is null
--muu opiskeluoikeus ja aiempi tutkinto
LEFT JOIN dw.d_organisaatioluokitus d51 on d51.id=f.d_organisaatioluokitus_muu_korkeakoulu_id
LEFT JOIN dw.d_organisaatioluokitus d52 on d52.id=f.d_organisaatioluokitus_aiempi_tutkinto_korkeakoulu_id
LEFT JOIN dw.d_koulutusluokitus d53 on d53.id=f.d_koulutusluokitus_muu_tutkinto_id
LEFT JOIN dw.d_koulutusluokitus d54 on d54.id=f.d_koulutusluokitus_aiempi_tutkinto_id
LEFT JOIN (
	SELECT 
		hakemus_oid
		,d_hakuaika_id
		,op_oikeus_tai_tutkinto = MAX(op_oikeus_tai_tutkinto) 
	FROM dw.f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_aiemmat_opiskeluoikeudet_ja_tutkinnot
	GROUP BY hakemus_oid,d_hakuaika_id
) d55 on d55.hakemus_oid = f.hakemus_oid and d55.d_hakuaika_id = f.d_hakuaika_id
LEFT JOIN dw.d_kytkin d56 on d56.kytkin_koodi = f.ensi_kertaa_hakeva

--taustatiedot
LEFT JOIN dw.f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_taustatiedot htt on htt.f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_id = f.f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_id
LEFT JOIN dw.d_sukupuoli d7 ON d7.id = htt.d_sukupuoli_id
LEFT JOIN dw.d_kieli d8 ON d8.id = htt.d_kieli_aidinkieli_id
LEFT JOIN dw.d_pohjakoulutus d22 ON d22.id = htt.d_pohjakoulutuskk_id
LEFT JOIN dw.d_kytkin d11 ON d11.id=htt.d_kytkin_pohjakoulutuskk_ulkomaat_id
LEFT JOIN dw.d_kytkin d11b ON d11b.kytkin_koodi=f.pohjakoulutus_suomessa_priorisoitu
LEFT JOIN dw.d_ika d26 ON d26.id=htt.d_ika_id
LEFT JOIN dw.d_maatjavaltiot2 d30 ON d30.id=htt.d_maatjavaltiot_kansalaisuus_id
LEFT JOIN VipunenTK.dbo.d_valtio d28 ON d28.valtio_avain=d30.maatjavaltiot2_koodi
--hakukohde
LEFT JOIN dw.f_haku_ja_valinta_hakeneet_korkea_aste_hakutoiveet ht on ht.hakemus_oid = f.hakemus_oid
LEFT JOIN dw.d_hakukohde d10 ON d10.id = ht.d_hakukohde_id
LEFT JOIN dw.d_organisaatioluokitus d16a ON d16a.id = ht.d_organisaatio_koulutuksen_jarjestaja_id
LEFT JOIN dw.d_organisaatioluokitus d16b ON d16b.id = ht.d_organisaatio_oppilaitos_id
LEFT JOIN dw.d_organisaatioluokitus d16c ON d16c.id = ht.d_organisaatio_toimipiste_id
LEFT JOIN dw.d_tutkinnon_taso_kk d18 ON d18.id = ht.d_tutkinnon_taso_kk_id
LEFT JOIN dw.d_alueluokitus d19 ON d19.id = ht.d_alueluokitus_hakukohde_id
LEFT JOIN dw.d_koulutusluokitus d20 ON d20.id = ht.d_koulutusluokitus_hakukohde_id
LEFT JOIN dw.d_opintojenlaajuus d21 ON d21.id = ht.d_opintojen_laajuus_id
LEFT JOIN dw.d_tutkinnon_aloitussykli_kk d23 ON d23.id = ht.d_tutkinnon_aloitussykli_kk_id
LEFT JOIN dw.d_kieli d27 ON d27.id=ht.d_kieli_koulutus_id
--hakutoiveet
--1
LEFT JOIN dw.d_hakukohde d32 ON d32.id=ht.d_hakukohde_ensisijainen_id
LEFT JOIN dw.d_koulutusluokitus d33 ON d33.id=ht.d_koulutus_ensisijainen_hakukohde_id
LEFT JOIN dw.d_organisaatioluokitus d33a ON d33a.id=ht.d_organisaatioluokitus_ensisijainen_hakukohde_id
LEFT JOIN dw.d_tutkinnon_aloitussykli_kk d33b ON d33b.id=ht.d_tutkinnon_aloitussykli_ensisijainen_hakukohde_id
--2
LEFT JOIN dw.d_hakukohde d34 ON d34.id=ht.d_hakukohde_toinen_hakukohde_id
LEFT JOIN dw.d_koulutusluokitus d35 ON d35.id=ht.d_koulutus_toinen_hakukohde_id
LEFT JOIN dw.d_organisaatioluokitus d35a ON d35a.id=ht.d_organisaatioluokitus_toinen_hakukohde_id
LEFT JOIN dw.d_tutkinnon_aloitussykli_kk d35b ON d35b.id=ht.d_tutkinnon_aloitussykli_toinen_hakukohde_id
--3
LEFT JOIN dw.d_hakukohde d36 ON d36.id=ht.d_hakukohde_kolmas_hakukohde_id
LEFT JOIN dw.d_koulutusluokitus d37 ON d37.id=ht.d_koulutus_kolmas_hakukohde_id
LEFT JOIN dw.d_organisaatioluokitus d37a ON d37a.id=ht.d_organisaatioluokitus_kolmas_hakukohde_id
LEFT JOIN dw.d_tutkinnon_aloitussykli_kk d37b ON d37b.id=ht.d_tutkinnon_aloitussykli_kolmas_hakukohde_id
--4
LEFT JOIN dw.d_hakukohde d38 ON d38.id=ht.d_hakukohde_neljas_hakukohde_id
LEFT JOIN dw.d_koulutusluokitus d39 ON d39.id=ht.d_koulutus_neljas_hakukohde__id
LEFT JOIN dw.d_organisaatioluokitus d39a ON d39a.id=ht.d_organisaatioluokitus_neljas_hakukohde_id
LEFT JOIN dw.d_tutkinnon_aloitussykli_kk d39b ON d39b.id=ht.d_tutkinnon_aloitussykli_neljas_hakukohde_id
--5
LEFT JOIN dw.d_hakukohde d40 ON d40.id=ht.d_hakukohde_viides_hakukohde_id
LEFT JOIN dw.d_koulutusluokitus d41 ON d41.id=ht.d_koulutus_viides_hakukohde_id
LEFT JOIN dw.d_organisaatioluokitus d41a ON d41a.id=ht.d_organisaatioluokitus_viides_hakukohde_id
LEFT JOIN dw.d_tutkinnon_aloitussykli_kk d41b ON d41b.id=ht.d_tutkinnon_aloitussykli_viides_hakukohde_id
--6
LEFT JOIN dw.d_hakukohde d42 ON d42.id=ht.d_hakukohde_kuudes_hakukohde_id
LEFT JOIN dw.d_koulutusluokitus d43 ON d43.id=ht.d_koulutus_kuudes_hakukohde_id
LEFT JOIN dw.d_organisaatioluokitus d43a ON d43a.id=ht.d_organisaatioluokitus_kuudes_hakukohde_id
LEFT JOIN dw.d_tutkinnon_aloitussykli_kk d43b ON d43b.id=ht.d_tutkinnon_aloitussykli_kuudes_hakukohde_id
--vuosikello
LEFT JOIN sa.sa_haku_ja_valinta_vuosikello_korkea_aste d44 on 
((d44.haku_oid=d1.haku_oid and d44.haku_oid is not null) OR (d44.koulutuksen_alkamiskausi=cast(f.koulutuksen_alkamisvuosi as varchar)+cast(d2.jarjestys as varchar) and d1.hakutapa_koodi <> '01' and d44.haku_oid is null))


WHERE f.loadtime >= COALESCE(d44.hakijat, '9999-12-31') 

GO


