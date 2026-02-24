USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_ovara_haku_ja_valinta_hakeneet_toinen_aste]    Script Date: 5.2.2026 7.39.06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER   PROCEDURE [dw].[p_lataa_f_haku_ja_valinta_hakeneet_toinen_aste] AS

DROP TABLE IF EXISTS ANTERO.dw.f_haku_ja_valinta_hakeneet_toinen_aste

DECLARE @loadtime datetime = getdate()

SELECT
	h.master_oid,
	h.hakemus_oid,
	vk.id as sa_haku_ja_valinta_vuosikello_toinen_aste_id,
	h.koulutuksen_alkamisvuosi,
	coalesce(d9.id,-1) as d_kausi_koulutuksen_alkamiskausi_id,
	coalesce(d1.id,-1) as d_haku_id,
	coalesce(d11.id,-1) as d_hakukohde_id,
	coalesce(d2.id,-1) as d_sukupuoli_id,
	coalesce(d3.id,-1) as d_kieli_aidinkieli_id,
	coalesce(d4.id,-1) as d_ika_id,
	coalesce(d5.id,-1) as d_alueluokitus_kotikunta_id,
	coalesce(d6.id,-1) as d_maatjavaltiot_kansalaisuus_id,
	coalesce(
	(case
		when d7a.organisaatio_avain like 'koulutustoimija_%' then d7a.id
		when d7b.organisaatio_avain like 'koulutustoimija_%' then d7b.id
		when d7c.organisaatio_avain like 'koulutustoimija_%' then d7c.id
		when d7d.organisaatio_avain like 'koulutustoimija_%' then d7d.id
	end)
	,'-1') as d_organisaatioluokitus_lahtokoulu_koulutuksen_jarjestaja_id,
	coalesce(
		(case
			when d7a.organisaatio_avain like 'oppilaitos_%' then d7a.id
			when d7b.organisaatio_avain like 'oppilaitos_%' then d7b.id
			when d7c.organisaatio_avain like 'oppilaitos_%' then d7c.id
			when d7d.organisaatio_avain like 'oppilaitos_%' then d7d.id
		end)
	,'-1') as d_organisaatioluokitus_lahtokoulu_oppilaitos_id,
	coalesce(d8.id,-1) as d_alueluokitus_lahtokoulun_kunta_id,
	h.luokkataso as paattoluokka,
	coalesce(d12.id,-1) as d_organisaatioluokitus_koulutuksen_jarjestaja_id,
	coalesce(d13.id,-1) as d_organisaatioluokitus_oppilaitos_id,
	coalesce(d14.id,-1) as d_organisaatioluokitus_toimipiste_id,
	coalesce(d15.id,-1) as d_alueluokitus_hakukohde_id,
	coalesce(d16.id,-1) as d_koulutusluokitus_hakukohde_id,
	coalesce(d19.id,-1) as d_koulutustyyppi_id,
	coalesce(d17.id,-1) as d_pohjakoulutusvaatimus_toinen_aste_id,
	coalesce(d18.id,-1) as d_oppilaitoksenopetuskieli_id,
	coalesce(d20.id,-1) as d_pohjakoulutus_id,
	h.pohjakoulutuksen_vuosi,
	coalesce(d21.id,-1) as d_kytkin_kiinnostunut_oppisopimuksesta_id,
	h.hakutoive,
	h.valittu,
	h.vastaanottanut_paikan,
	h.ilmoittautunut,
	NULL as pisteraja,
	NULL as aloituspaikat,
	'etl: p_lataa_f_haku_ja_valinta_hakeneet_toinen_aste' as source,
	SUSER_SNAME() as username,
	@loadtime as loadtime
INTO ANTERO.dw.f_haku_ja_valinta_hakeneet_toinen_aste
FROM ANTERO.sa.sa_ovara_hakeneet h
LEFT JOIN ANTERO.sa.sa_ovara_hakukohteet hk on hk.hakukohde_oid = h.hakukohde_oid
LEFT JOIN ANTERO.dw.d_haku d1 on d1.haku_oid = h.haku_oid
LEFT JOIN ANTERO.sa.sa_haku_ja_valinta_vuosikello_toinen_aste vk on vk.haku_oid = d1.haku_oid and vk.haku_oid is not null and @loadtime >= vk.hakijat
LEFT JOIN ANTERO.dw.d_sukupuoli d2 on d2.sukupuoli_koodi = h.sukupuoli
LEFT JOIN ANTERO.dw.d_kieli d3 on d3.kieli_koodi = h.aidinkieli
LEFT JOIN ANTERO.dw.d_ika d4 on d4.ika_avain = h.ika
LEFT JOIN ANTERO.dw.d_alueluokitus d5 on d5.kunta_koodi = h.kotikunta
LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d6 on d6.maatjavaltiot2_koodi = h.kansalaisuus
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d7a on d7a.organisaatio_oid = h.lahtokoulu  and d7a.organisaatio_avain not like 'tutkimusorganisaatio_%'
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d7b ON d7b.organisaatio_oid = d7a.ylaorganisaatio_oid and d7b.organisaatio_avain not like 'tutkimusorganisaatio_%'
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d7c ON d7c.organisaatio_oid = d7b.ylaorganisaatio_oid and d7c.organisaatio_avain not like 'tutkimusorganisaatio_%'
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d7d ON d7d.organisaatio_oid = d7c.ylaorganisaatio_oid and d7d.organisaatio_avain not like 'tutkimusorganisaatio_%'
LEFT JOIN ANTERO.dw.d_alueluokitus d8 on d8.kunta_koodi = d7a.kunta_koodi
LEFT JOIN ANTERO.dw.d_kausi d9 on d9.koodi = h.koulutuksen_alkamiskausi
LEFT JOIN ANTERO.dw.d_hakukohde d11 on d11.oid = h.hakukohde_oid
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d12 ON d12.organisaatio_oid = h.koulutustoimija_oid
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d13 ON d13.organisaatio_oid = h.oppilaitos_oid
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d14 ON d14.organisaatio_oid = h.toimipiste_oid
LEFT JOIN ANTERO.dw.d_alueluokitus d15 on d15.kunta_koodi = coalesce(d12.kunta_koodi,d13.kunta_koodi,d14.kunta_koodi)
LEFT JOIN ANTERO.dw.d_koulutusluokitus d16 on d16.koulutusluokitus_koodi = h.koulutuskoodi
LEFT JOIN ANTERO.dw.d_pohjakoulutusvaatimus_toinen_aste d17 on d17.koodi = h.pohjakoulutusvaatimus_koodi
LEFT JOIN ANTERO.dw.d_oppilaitoksenopetuskieli d18 on d18.koodi = h.opetuksen_kieli
LEFT JOIN ANTERO.dw.d_koulutustyyppi d19 on d19.koodi = hk.koulutustyyppi
LEFT JOIN ANTERO.dw.d_pohjakoulutus d20 on d20.koodi = cast(h.pohjakoulutus as varchar)
LEFT JOIN ANTERO.dw.d_kytkin d21 on d21.kytkin_koodi = h.kiinnostunut_oppisopimuksesta
WHERE h.kk_haku = 0

UNION ALL

SELECT
	NULL as master_oid,
	NULL as hakemus_oid,
	vk.id as sa_haku_ja_valinta_vuosikello_toinen_aste_id,
	h.koulutuksen_alkamisvuosi,
	coalesce(d9.id,-1) as d_kausi_koulutuksen_alkamiskausi_id,
	coalesce(d1.id,-1) as d_haku_id,
	coalesce(d11.id,-1) as d_hakukohde_id,
	NULL as d_sukupuoli_id,
	NULL as d_kieli_aidinkieli_id,
	NULL as d_ika_id,
	NULL as d_alueluokitus_kotikunta_id,
	NULL as d_maatjavaltiot_kansalaisuus_id,
	NULL as d_organisaatioluokitus_lahtokoulu_koulutuksen_jarjestaja_id,
	NULL as d_organisaatioluokitus_lahtokoulu_oppilaitos_id,
	NULL as d_alueluokitus_lahtokoulun_kunta_id,
	NULL as paattoluokka,
	coalesce(d12.id,-1) as d_organisaatioluokitus_koulutuksen_jarjestaja_id,
	coalesce(d13.id,-1) as d_organisaatioluokitus_oppilaitos_id,
	coalesce(d14.id,-1) as d_organisaatioluokitus_toimipiste_id,
	coalesce(d15.id,-1) as d_alueluokitus_hakukohde_id,
	coalesce(d16.id,-1) as d_koulutusluokitus_hakukohde_id,
	coalesce(d19.id,-1) as d_koulutustyyppi_id,
	coalesce(d17.id,-1) as d_pohjakoulutusvaatimus_toinen_koodi_id,
	coalesce(d18.id,-1) as d_oppilaitoksenopetuskieli_id,
	NULL as d_pohjakoulutus_id,
	NULL as pohjakoulutuksen_vuosi,
	NULL as d_kytkin_kiinnostunut_oppisopimuksesta_id,
	NULL as hakutoive,
	NULL as valittu,
	NULL as vastaanottanut_paikan,
	NULL as ilmoittautunut,
	h.alinhyvaksyttypistemaara as pisteraja,
	h.aloituspaikat,
	'etl: p_lataa_f_haku_ja_valinta_hakeneet_toinen_aste' as source,
	SUSER_SNAME() as username,
	@loadtime as loadtime
FROM ANTERO.sa.sa_ovara_hakukohteet h
LEFT JOIN ANTERO.dw.d_haku d1 on d1.haku_oid = h.haku_oid
LEFT JOIN ANTERO.sa.sa_haku_ja_valinta_vuosikello_toinen_aste vk on vk.haku_oid = d1.haku_oid and vk.haku_oid is not null and @loadtime >= vk.hakijat
LEFT JOIN ANTERO.dw.d_kausi d9 on d9.koodi = h.koulutuksen_alkamiskausi
LEFT JOIN ANTERO.dw.d_hakukohde d11 on d11.oid = h.hakukohde_oid
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d12 ON d12.organisaatio_oid = h.koulutustoimija_oid
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d13 ON d13.organisaatio_oid = h.oppilaitos_oid
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d14 ON d14.organisaatio_oid = h.toimipiste_oid
LEFT JOIN ANTERO.dw.d_alueluokitus d15 on d15.kunta_koodi = coalesce(d12.kunta_koodi,d13.kunta_koodi,d14.kunta_koodi)
LEFT JOIN ANTERO.dw.d_koulutusluokitus d16 on d16.koulutusluokitus_koodi = h.koulutuskoodi
LEFT JOIN ANTERO.dw.d_pohjakoulutusvaatimus_toinen_aste d17 on d17.koodi = h.pohjakoulutusvaatimus_koodi
LEFT JOIN ANTERO.dw.d_oppilaitoksenopetuskieli d18 on d18.koodi = h.opetuksen_kieli
LEFT JOIN ANTERO.dw.d_koulutustyyppi d19 on d19.koodi = h.koulutustyyppi
WHERE kk_haku = 0