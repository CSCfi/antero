USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_ovara_haku_ja_valinta_hakeneet_korkea_aste]    Script Date: 5.2.2026 7.35.06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_f_haku_ja_valinta_hakeneet_korkea_aste] AS

DECLARE @loadtime as date
SET @loadtime = GETDATE()

DROP TABLE IF EXISTS ANTERO.sa.temp_haku_ja_valinta_valitut
DROP TABLE IF EXISTS ANTERO.sa.temp_haku_ja_valinta_pohjakoulutukset
DROP TABLE IF EXISTS ANTERO.sa.temp_haku_ja_valinta_pohjakoulutuksen_maa_priorisoitu
DROP TABLE IF EXISTS ANTERO.sa.temp_hakeneet_kk_hakutoiveet
DROP TABLE IF EXISTS ANTERO.sa.temp_haku_ja_valinta_pohjakoulutukset_yhdistetty

SELECT 
	h.hakemus_oid, 
	h.pohjakoulutus_koodi, 
	MAX(h.pohjakoulutusvuosi) as pohjakoulutusvuosi
INTO ANTERO.sa.temp_haku_ja_valinta_pohjakoulutukset_yhdistetty
FROM (
	SELECT 
		h.hakemus_oid, h.pohjakoulutus_koodi, h.pohjakoulutusvuosi
	FROM ANTERO.sa.sa_ovara_pohjakoulutus_kk h
	LEFT JOIN ANTERO.sa.sa_ovara_ataru_hakutoive ht on ht.hakemus_oid = h.hakemus_oid
	LEFT JOIN ANTERO.sa.sa_ovara_hakukohteet hk on hk.hakukohde_oid = ht.hakukohde_oid
	WHERE hk.koulutuksen_alkamisvuosi >= 2024
	UNION ALL
	SELECT DISTINCT h.hakemus_oid, h.PohjakoulutusKKLomakeKoodi, h.ToisenAsteenKoulutuksenSuoritusvuosi
	FROM ANTERO.sa.sa_odw_hakeneet_updated h
	WHERE h.koulutuksen_alkamisvuosi < 2024 and h.kk_haku = 1 
) h
GROUP BY h.hakemus_oid, h.pohjakoulutus_koodi

SELECT
	h.hakemus_oid,
	h.valittu as valittu_ensisijaiseen_kohteeseen,
	CASE
		WHEN h3.vastaanottanut_paikan_kaudella = 1 THEN 0
		ELSE 1
	END ei_vastaanottoa_kaudella,
	CASE
		WHEN d2a.koulutusalataso1_koodi = d2b.koulutusalataso2_koodi THEN 1
		ELSE 0
	END as valittu_ensisijaisen_kohteen_koulutusalalle,
	vk.valitut_indikaattori,
	vk.vastaanottaneet_indikaattori
INTO ANTERO.sa.temp_haku_ja_valinta_valitut
FROM ANTERO.sa.sa_ovara_hakeneet h
LEFT JOIN ANTERO.sa.sa_ovara_hakeneet h2 on h.hakemus_oid = h2.hakemus_oid and h2.valittu = 1
LEFT JOIN ANTERO.dw.d_koulutusluokitus d2a on d2a.koulutusluokitus_koodi = h.koulutuskoodi
LEFT JOIN ANTERO.dw.d_koulutusluokitus d2b on d2b.koulutusluokitus_koodi = h2.koulutuskoodi
OUTER APPLY (
	SELECT 
		MAX(vastaanottanut_paikan) as vastaanottanut_paikan_kaudella 
	FROM ANTERO.sa.sa_ovara_hakeneet h3
	WHERE h3.kk_haku = 1 and h3.master_oid = h.master_oid and h3.koulutuksen_alkamisvuosi = h.koulutuksen_alkamisvuosi and h3.koulutuksen_alkamiskausi = h.koulutuksen_alkamiskausi
) h3
OUTER APPLY (
	SELECT 
		max(valitut) as valitut_indikaattori,
		max(vastaanottaneet) as vastaanottaneet_indikaattori
	FROM ANTERO.sa.sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt vk
	WHERE vk.haku_oid = h.haku_oid
) vk
WHERE h.hakutoive = 1 and h.kk_haku = 1

-- Varmista lisätäänkö pohjakoulutus_yo, jos yo-tutkinto on suoritettu, mutta pohjakoulutusta ei ole merkattu. Esim. hakemus 1.2.246.562.11.00000000000000998128
SELECT
	hakemus_oid,
	MAX(CASE WHEN h.pohjakoulutus_koodi = 'pohjakoulutus_kk_ulk' THEN 1 ELSE 0 END) as pohjakoulutus_kk_ulk,
	MAX(CASE WHEN h.pohjakoulutus_koodi = 'pohjakoulutus_amv' THEN 1 ELSE 0 END) as pohjakoulutus_amv,
	MAX(CASE WHEN h.pohjakoulutus_koodi = 'pohjakoulutus_kk' THEN 1 ELSE 0 END) as pohjakoulutus_kk,
	MAX(CASE WHEN h.pohjakoulutus_koodi = 'pohjakoulutus_yo_ulkomainen' THEN 1 ELSE 0 END) as pohjakoulutus_yo_ulkomainen,
	MAX(CASE WHEN h.pohjakoulutus_koodi = 'pohjakoulutus_avoin' THEN 1 ELSE 0 END) as pohjakoulutus_avoin,
	MAX(CASE WHEN h.pohjakoulutus_koodi = 'pohjakoulutus_lk' THEN 1 ELSE 0 END) as pohjakoulutus_lk,
	MAX(CASE WHEN h.pohjakoulutus_koodi = 'pohjakoulutus_am' THEN 1 ELSE 0 END) as pohjakoulutus_am,
	MAX(CASE WHEN h.pohjakoulutus_koodi = 'pohjakoulutus_amp' THEN 1 ELSE 0 END) as pohjakoulutus_amp,
	MAX(CASE WHEN h.pohjakoulutus_koodi = 'pohjakoulutus_yo_ammatillinen' THEN 1 ELSE 0 END) as pohjakoulutus_yo_ammatillinen,
	MAX(CASE WHEN h.pohjakoulutus_koodi = 'pohjakoulutus_yo_kansainvalinen_suomessa' THEN 1 ELSE 0 END) as pohjakoulutus_yo_kansainvalinen_suomessa,
	MAX(CASE WHEN h.pohjakoulutus_koodi = 'pohjakoulutus_amt' THEN 1 ELSE 0 END) as pohjakoulutus_amt,
	MAX(CASE WHEN h.pohjakoulutus_koodi = 'pohjakoulutus_ulk' THEN 1 ELSE 0 END) as pohjakoulutus_ulk,
	MAX(CASE WHEN h.pohjakoulutus_koodi = 'pohjakoulutus_yo' THEN 1 ELSE 0 END) as pohjakoulutus_yo,
	MAX(CASE WHEN h.pohjakoulutus_koodi = 'pohjakoulutus_muu' THEN 1 ELSE 0 END) as pohjakoulutus_muu,
	MAX(CASE WHEN h.pohjakoulutus_koodi in ('pohjakoulutus_am','pohjakoulutus_amp','pohjakoulutus_amt','pohjakoulutus_ulk','pohjakoulutus_yo','pohjakoulutus_yo_ammatillinen','pohjakoulutus_yo_kansainvalinen_suomessa','pohjakoulutus_yo_ulkomainen') THEN h.pohjakoulutusvuosi ELSE NULL END) as pohjakoulutuksen_vuosi
INTO ANTERO.sa.temp_haku_ja_valinta_pohjakoulutukset
FROM ANTERO.sa.temp_haku_ja_valinta_pohjakoulutukset_yhdistetty h
GROUP BY h.hakemus_oid

SELECT
	h.master_oid,
	h.koulutuksen_alkamisvuosi,
	h.koulutuksen_alkamiskausi,
	a.ylioppilastutkinnon_suorituspaivamaara,
	MAX(
		case
			when a.ylioppilastutkinnon_suorituspaivamaara is not null then 1
			when pk.pohjakoulutus_koodi <> 'pohjakoulutus_muu' and pk.pohjakoulutus_koodi not like '%_ulk%' then 1
			when pk.pohjakoulutus_koodi like '%_ulk%' then 0
		end
	) as pohjakoulutus_suomessa_priorisoitu	
INTO ANTERO.sa.temp_haku_ja_valinta_pohjakoulutuksen_maa_priorisoitu
FROM ANTERO.sa.sa_ovara_hakeneet h
OUTER APPLY (
	SELECT 
		MIN(a.valmistumispaivamaara) as ylioppilastutkinnon_suorituspaivamaara
	FROM [ANTERO].[sa].[sa_ovara_yo_arvosanat] a
	WHERE h.master_oid = a.master_oid and YEAR(a.valmistumispaivamaara) <= h.koulutuksen_alkamisvuosi
) a
LEFT JOIN ANTERO.sa.temp_haku_ja_valinta_pohjakoulutukset_yhdistetty pk on pk.hakemus_oid = h.hakemus_oid 
WHERE h.kk_haku = 1
GROUP BY h.master_oid,h.koulutuksen_alkamisvuosi,h.koulutuksen_alkamiskausi, a.ylioppilastutkinnon_suorituspaivamaara

SELECT 
	hakemus_oid,
    coalesce(d1a.id,-1) as d_organisaatioluokitus_hakukohde1_id,
	coalesce(d1b.id,-1) as d_koulutusluokitus_hakukohde1_id,
	coalesce(d1c.id,-1) as d_tutkinnon_aloitussykli_kk_hakukohde1_id,
	coalesce(d1d.id,-1) as d_hakukohde_hakukohde1_id,
	coalesce(d2a.id,-1) as d_organisaatioluokitus_hakukohde2_id,
	coalesce(d2b.id,-1) as d_koulutusluokitus_hakukohde2_id,
	coalesce(d2c.id,-1) as d_tutkinnon_aloitussykli_kk_hakukohde2_id,
	coalesce(d2d.id,-1) as d_hakukohde_hakukohde2_id,
	coalesce(d3a.id,-1) as d_organisaatioluokitus_hakukohde3_id,
	coalesce(d3b.id,-1) as d_koulutusluokitus_hakukohde3_id,
	coalesce(d3c.id,-1) as d_tutkinnon_aloitussykli_kk_hakukohde3_id,
	coalesce(d3d.id,-1) as d_hakukohde_hakukohde3_id,
	coalesce(d4a.id,-1) as d_organisaatioluokitus_hakukohde4_id,
	coalesce(d4b.id,-1) as d_koulutusluokitus_hakukohde4_id,
	coalesce(d4c.id,-1) as d_tutkinnon_aloitussykli_kk_hakukohde4_id,
	coalesce(d4d.id,-1) as d_hakukohde_hakukohde4_id,
	coalesce(d5a.id,-1) as d_organisaatioluokitus_hakukohde5_id,
	coalesce(d5b.id,-1) as d_koulutusluokitus_hakukohde5_id,
	coalesce(d5c.id,-1) as d_tutkinnon_aloitussykli_kk_hakukohde5_id,
	coalesce(d5d.id,-1) as d_hakukohde_hakukohde5_id,
	coalesce(d6a.id,-1) as d_organisaatioluokitus_hakukohde6_id,
	coalesce(d6b.id,-1) as d_koulutusluokitus_hakukohde6_id,
	coalesce(d6c.id,-1) as d_tutkinnon_aloitussykli_kk_hakukohde6_id,
	coalesce(d6d.id,-1) as d_hakukohde_hakukohde6_id
INTO ANTERO.sa.temp_hakeneet_kk_hakutoiveet
FROM (
	SELECT 
		hakemus_oid, 
		MAX([1]) as hakukohde1,
		MAX([2]) as hakukohde2,
		MAX([3]) as hakukohde3,
		MAX([4]) as hakukohde4,
		MAX([5]) as hakukohde5,
		MAX([6]) as hakukohde6
	FROM (	
		SELECT
			h.hakemus_oid,
			h.hakutoive,
			concat(coalesce(h.oppilaitos_oid, h.koulutustoimija_oid),'|', h.koulutuskoodi, '|', h.hakukohde_oid, '|', h.hakukohteen_tutkinnon_taso_kk_sykli) as avain
		FROM ANTERO.sa.sa_ovara_hakeneet h
		WHERE h.kk_haku = 1
	) as p
	PIVOT (MAX(avain) FOR hakutoive IN ([1],[2],[3],[4],[5],[6])) AS pivot_table
	GROUP BY hakemus_oid
) p
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1a on d1a.organisaatio_oid = LEFT(hakukohde1,CHARINDEX('|', hakukohde1)-1)
LEFT JOIN ANTERO.dw.d_koulutusluokitus d1b on d1b.koulutusluokitus_koodi = SUBSTRING(hakukohde1, CHARINDEX('|', hakukohde1) + 1, CHARINDEX('|', hakukohde1, CHARINDEX('|', hakukohde1) + 1) - CHARINDEX('|', hakukohde1) - 1)
LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d1c on d1c.koodi = RIGHT(hakukohde1, CHARINDEX('|', REVERSE(hakukohde1)) - 1)
LEFT JOIN ANTERO.dw.d_hakukohde d1d on d1d.oid = SUBSTRING(hakukohde1, CHARINDEX('|', hakukohde1, CHARINDEX('|', hakukohde1) + 1) + 1, CHARINDEX('|', hakukohde1, CHARINDEX('|', hakukohde1, CHARINDEX('|', hakukohde1) + 1) + 1) - CHARINDEX('|', hakukohde1, CHARINDEX('|', hakukohde1) + 1) - 1)
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d2a on d2a.organisaatio_oid = LEFT(hakukohde2,CHARINDEX('|', hakukohde2)-1)
LEFT JOIN ANTERO.dw.d_koulutusluokitus d2b on d2b.koulutusluokitus_koodi = SUBSTRING(hakukohde2, CHARINDEX('|', hakukohde2) + 1, CHARINDEX('|', hakukohde2, CHARINDEX('|', hakukohde2) + 1) - CHARINDEX('|', hakukohde2) - 1)
LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d2c on d2c.koodi = RIGHT(hakukohde2, CHARINDEX('|', REVERSE(hakukohde2)) - 1)
LEFT JOIN ANTERO.dw.d_hakukohde d2d on d2d.oid = SUBSTRING(hakukohde2, CHARINDEX('|', hakukohde2, CHARINDEX('|', hakukohde2) + 1) + 1, CHARINDEX('|', hakukohde2, CHARINDEX('|', hakukohde2, CHARINDEX('|', hakukohde2) + 1) + 1) - CHARINDEX('|', hakukohde2, CHARINDEX('|', hakukohde2) + 1) - 1)
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d3a on d3a.organisaatio_oid = LEFT(hakukohde3,CHARINDEX('|', hakukohde3)-1)
LEFT JOIN ANTERO.dw.d_koulutusluokitus d3b on d3b.koulutusluokitus_koodi = SUBSTRING(hakukohde3, CHARINDEX('|', hakukohde3) + 1, CHARINDEX('|', hakukohde3, CHARINDEX('|', hakukohde3) + 1) - CHARINDEX('|', hakukohde3) - 1)
LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d3c on d3c.koodi = RIGHT(hakukohde3, CHARINDEX('|', REVERSE(hakukohde3)) - 1)
LEFT JOIN ANTERO.dw.d_hakukohde d3d on d3d.oid = SUBSTRING(hakukohde3, CHARINDEX('|', hakukohde3, CHARINDEX('|', hakukohde3) + 1) + 1, CHARINDEX('|', hakukohde3, CHARINDEX('|', hakukohde3, CHARINDEX('|', hakukohde3) + 1) + 1) - CHARINDEX('|', hakukohde3, CHARINDEX('|', hakukohde3) + 1) - 1)
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d4a on d4a.organisaatio_oid = LEFT(hakukohde4,CHARINDEX('|', hakukohde4)-1)
LEFT JOIN ANTERO.dw.d_koulutusluokitus d4b on d4b.koulutusluokitus_koodi = SUBSTRING(hakukohde4, CHARINDEX('|', hakukohde4) + 1, CHARINDEX('|', hakukohde4, CHARINDEX('|', hakukohde4) + 1) - CHARINDEX('|', hakukohde4) - 1)
LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d4c on d4c.koodi = RIGHT(hakukohde4, CHARINDEX('|', REVERSE(hakukohde4)) - 1)
LEFT JOIN ANTERO.dw.d_hakukohde d4d on d4d.oid = SUBSTRING(hakukohde4, CHARINDEX('|', hakukohde4, CHARINDEX('|', hakukohde4) + 1) + 1, CHARINDEX('|', hakukohde4, CHARINDEX('|', hakukohde4, CHARINDEX('|', hakukohde4) + 1) + 1) - CHARINDEX('|', hakukohde4, CHARINDEX('|', hakukohde4) + 1) - 1)
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d5a on d5a.organisaatio_oid = LEFT(hakukohde5,CHARINDEX('|', hakukohde5)-1)
LEFT JOIN ANTERO.dw.d_koulutusluokitus d5b on d5b.koulutusluokitus_koodi = SUBSTRING(hakukohde5, CHARINDEX('|', hakukohde5) + 1, CHARINDEX('|', hakukohde5, CHARINDEX('|', hakukohde5) + 1) - CHARINDEX('|', hakukohde5) - 1)
LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d5c on d5c.koodi = RIGHT(hakukohde5, CHARINDEX('|', REVERSE(hakukohde5)) - 1)
LEFT JOIN ANTERO.dw.d_hakukohde d5d on d5d.oid = SUBSTRING(hakukohde5, CHARINDEX('|', hakukohde5, CHARINDEX('|', hakukohde5) + 1) + 1, CHARINDEX('|', hakukohde5, CHARINDEX('|', hakukohde5, CHARINDEX('|', hakukohde5) + 1) + 1) - CHARINDEX('|', hakukohde5, CHARINDEX('|', hakukohde5) + 1) - 1)
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d6a on d6a.organisaatio_oid = LEFT(hakukohde6,CHARINDEX('|', hakukohde6)-1)
LEFT JOIN ANTERO.dw.d_koulutusluokitus d6b on d6b.koulutusluokitus_koodi = SUBSTRING(hakukohde6, CHARINDEX('|', hakukohde6) + 1, CHARINDEX('|', hakukohde6, CHARINDEX('|', hakukohde6) + 1) - CHARINDEX('|', hakukohde6) - 1)
LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d6c on d6c.koodi = RIGHT(hakukohde6, CHARINDEX('|', REVERSE(hakukohde6)) - 1)
LEFT JOIN ANTERO.dw.d_hakukohde d6d on d6d.oid = SUBSTRING(hakukohde6, CHARINDEX('|', hakukohde6, CHARINDEX('|', hakukohde6) + 1) + 1, CHARINDEX('|', hakukohde6, CHARINDEX('|', hakukohde6, CHARINDEX('|', hakukohde6) + 1) + 1) - CHARINDEX('|', hakukohde6, CHARINDEX('|', hakukohde6) + 1) - 1)

DROP TABLE IF EXISTS ANTERO.dw.f_haku_ja_valinta_hakeneet_korkea_aste

SELECT 
	h.koulutuksen_alkamisvuosi,
	h.master_oid,
	h.hakemus_oid,
	vk.id as sa_haku_ja_valinta_vuosikello_korkea_aste_id,
	coalesce(d3.id,-1) as d_kausi_koulutuksen_alkamiskausi_id,
	coalesce(d4.id,-1) as d_sukupuoli_id,
	coalesce(d5.id,-1) as d_kieli_aidinkieli_id,
	coalesce(d6.id,-1) as d_ika_id,
	coalesce(d7.id,-1) as d_maatjavaltiot2_kansalaisuus_id,
	coalesce(d8.id,-1) as d_alueluokitus_kotikunta_id,
	coalesce(d9.id,-1) as d_organisaatioluokitus_koulutustoimija_id,
	coalesce(d10.id,-1) as d_organisaatioluokitus_oppilaitos_id,
	coalesce(d11.id,-1) as d_organisaatioluokitus_toimipiste_id,
	coalesce(d1.id,-1) as d_haku_id,
	coalesce(d13.id,-1) as d_hakukohde_id,
	coalesce(d14.id,-1) as d_koulutusluokitus_id,
	coalesce(d15.id,-1) as d_haku_amk_yo_id,
	coalesce(d16.id,-1) as d_tutkinnon_aloitussykli_kk_id,
	coalesce(d17.id,-1) as d_tutkinnon_taso_kk_id,
	-- K/E pohjakoulutukset
	d18a.id as d_kytkin_pohjakoulutus_am_id,
	d18b.id as d_kytkin_pohjakoulutus_amp_id,
	d18c.id as d_kytkin_pohjakoulutus_amt_id,
	d18d.id as d_kytkin_pohjakoulutus_amv_id,
	d18e.id as d_kytkin_pohjakoulutus_avoin_id,
	d18f.id as d_kytkin_pohjakoulutus_kk_id,
	d18g.id as d_kytkin_pohjakoulutus_kk_ulk_id,
	d18h.id as d_kytkin_pohjakoulutus_lk_id,
	d18i.id as d_kytkin_pohjakoulutus_ulk_id,
	d18j.id as d_kytkin_pohjakoulutus_yo_id,
	d18k.id as d_kytkin_pohjakoulutus_yo_ammatillinen_id,
	d18l.id as d_kytkin_pohjakoulutus_yo_kansainvalinen_suomessa_id,
	d18m.id as d_kytkin_pohjakoulutus_yo_ulkomainen_id,
	d18n.id as d_kytkin_pohjakoulutus_muu_id,
	coalesce(pk.pohjakoulutuksen_vuosi, 0) as toisen_asteen_koulutuksen_suoritusvuosi,
	coalesce(d19.id,-1) as d_pohjakoulutus_id,
	pk2.pohjakoulutusvuosi as pohjakoulutuksen_paattovuosi,
	coalesce(d20.id,-1) as d_kytkin_pohjakoulutus_ulkomaat_id,
	pkmp.pohjakoulutus_suomessa_priorisoitu,
	coalesce(d21.id,-1) as d_kalenteri_ylioppilastutkinnon_suorituspaivamaara_id,
	coalesce(d23.id,-1) as d_oppilaitoksenopetuskieli_koulutuksen_kieli_id,
	coalesce(d24.id,-1) as d_valintatapajonon_tyyppi_id,
	coalesce(d26.id,-1) as d_alueluokitus_hakukohde_id,
	coalesce(d27.id,-1) as d_valintatapajono_id,

	-- Hakutoivetiedot
	ht.d_organisaatioluokitus_hakukohde1_id,
	ht.d_koulutusluokitus_hakukohde1_id,
	ht.d_tutkinnon_aloitussykli_kk_hakukohde1_id,
	ht.d_hakukohde_hakukohde1_id,
	ht.d_organisaatioluokitus_hakukohde2_id,
	ht.d_koulutusluokitus_hakukohde2_id,
	ht.d_tutkinnon_aloitussykli_kk_hakukohde2_id,
	ht.d_hakukohde_hakukohde2_id,
	ht.d_organisaatioluokitus_hakukohde3_id,
	ht.d_koulutusluokitus_hakukohde3_id,
	ht.d_tutkinnon_aloitussykli_kk_hakukohde3_id,
	ht.d_hakukohde_hakukohde3_id,
	ht.d_organisaatioluokitus_hakukohde4_id,
	ht.d_koulutusluokitus_hakukohde4_id,
	ht.d_tutkinnon_aloitussykli_kk_hakukohde4_id,
	ht.d_hakukohde_hakukohde4_id,
	ht.d_organisaatioluokitus_hakukohde5_id,
	ht.d_koulutusluokitus_hakukohde5_id,
	ht.d_tutkinnon_aloitussykli_kk_hakukohde5_id,
	ht.d_hakukohde_hakukohde5_id,
	ht.d_organisaatioluokitus_hakukohde6_id,
	ht.d_koulutusluokitus_hakukohde6_id,
	ht.d_tutkinnon_aloitussykli_kk_hakukohde6_id,
	ht.d_hakukohde_hakukohde6_id,
	-- Muuta
	h.hakutoive,
	h.valittu,
	h.vastaanottanut_paikan,
	h.ilmoittautunut,
	h.ensikertalainen,
	v.valittu_ensisijaiseen_kohteeseen,
	v.valittu_ensisijaisen_kohteen_koulutusalalle,
	v.ei_vastaanottoa_kaudella,
	h.aidosti_ensikertainen,
	case 
		when h.ensikertalainen = 0 and h.source = 'ODW' then 1
		when h.ensikertalainen = 0 then 2
		else 3
	end as ensikertaisuuden_lahde,
	ROW_NUMBER() OVER (partition by h.hakemus_oid ORDER BY pk2.pohjakoulutus_koodi) as pk_rnk,
	case
		when pkmp.pohjakoulutus_suomessa_priorisoitu = 1 then 0 
		when pkmp.pohjakoulutus_suomessa_priorisoitu = 0 then 1 
		when d7.maatjavaltiot2_fi in ('Ahvenanmaa','Suomi') then 0
		when d7.maatjavaltiot2_fi not in ('Ahvenanmaa','Suomi') then 1
		else -1
	end as kansainvalinen_opiskelija,
	case 
		when h.koulutuksen_alkamiskausi = 'k' and pkmp.ylioppilastutkinnon_suorituspaivamaara is not null then case when d21.vuosi = h.koulutuksen_alkamisvuosi-1 then 1 else 0 end
		when h.koulutuksen_alkamiskausi = 's' and pkmp.ylioppilastutkinnon_suorituspaivamaara is not null then case when (d21.vuosi = h.koulutuksen_alkamisvuosi and d21.kuukausi < 8) or (d21.vuosi = h.koulutuksen_alkamisvuosi-1 and d21.kuukausi > 7) then 1 else 0 end
		else 0
	end as uusi_ylioppilas,
	case
		when h.ilmoittautunut = 1 and pk.pohjakoulutuksen_vuosi is null and pkmp.ylioppilastutkinnon_suorituspaivamaara is null then -1 
		when h.ilmoittautunut = 1 and (pk.pohjakoulutuksen_vuosi = h.koulutuksen_alkamisvuosi or d21.vuosi = h.koulutuksen_alkamisvuosi) then 1
		else 0
	end as aloittanut_opinnot_toisen_asteen_koulutuksen_suoritusvuonna,
	case
		when h.ilmoittautunut = 1 and pk2.pohjakoulutusvuosi = h.koulutuksen_alkamisvuosi then 1
		else 0
	end as aloittanut_opinnot_ilmoittamansa_pohjakoulutuksen_suoritusvuonna,
	h.laajuus,
	v.valitut_indikaattori,
	v.vastaanottaneet_indikaattori,
	case when h.pisteet < h.alinhyvaksyttypistemaara then h.alinhyvaksyttypistemaara else h.pisteet end as pisteet,
	NULL as alpa,
	NULL as pisteraja,
	h.hakemus_luotu,
	'etl: p_lataa_f_haku_ja_valinta_hakeneet_korkea_aste' as source,
	SUSER_SNAME() as username,
	@loadtime as loadtime
INTO ANTERO.dw.f_haku_ja_valinta_hakeneet_korkea_aste
FROM ANTERO.sa.sa_ovara_hakeneet h
LEFT JOIN ANTERO.dw.d_haku d1 on d1.haku_oid = h.haku_oid 
LEFT JOIN ANTERO.dw.d_kausi d3 on d3.koodi = h.koulutuksen_alkamiskausi
LEFT JOIN ANTERO.sa.sa_haku_ja_valinta_vuosikello_korkea_aste vk on ((vk.haku_oid=h.haku_oid and vk.haku_oid is not null) OR (vk.koulutuksen_alkamiskausi=cast(h.koulutuksen_alkamisvuosi as varchar)+cast(d3.jarjestys as varchar) and d1.hakutapa_koodi <> '01' and vk.haku_oid is null)) and @loadtime >= vk.hakijat
LEFT JOIN ANTERO.dw.d_sukupuoli d4 on d4.sukupuoli_koodi = h.sukupuoli
LEFT JOIN ANTERO.dw.d_kieli d5 on d5.kieli_koodi = h.aidinkieli
LEFT JOIN ANTERO.dw.d_ika d6 on d6.ika_avain = h.ika
LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d7 on d7.maatjavaltiot2_koodi = h.kansalaisuus
LEFT JOIN ANTERO.dw.d_alueluokitus d8 on d8.kunta_koodi = h.kotikunta
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d9 ON d9.organisaatio_oid = h.koulutustoimija_oid
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d10 ON d10.organisaatio_oid = h.oppilaitos_oid
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d11 ON d11.organisaatio_oid = h.toimipiste_oid
LEFT JOIN ANTERO.dw.d_hakukohde d13 on d13.oid = h.hakukohde_oid
LEFT JOIN ANTERO.dw.d_koulutusluokitus d14 on d14.koulutusluokitus_koodi = h.koulutuskoodi
LEFT JOIN ANTERO.dw.d_haku_amk_yo d15 on d15.koodi = h.Yo_Amk_YoAmk
LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d16 on d16.koodi = h.hakukohteen_tutkinnon_taso_kk_sykli
LEFT JOIN ANTERO.dw.d_tutkinnon_taso_kk d17 on d17.koodi = h.hakukohteen_tutkinnon_taso_kk
LEFT JOIN ANTERO.sa.temp_haku_ja_valinta_valitut v on v.hakemus_oid = h.hakemus_oid
LEFT JOIN ANTERO.sa.temp_haku_ja_valinta_pohjakoulutukset pk on pk.hakemus_oid = h.hakemus_oid
LEFT JOIN ANTERO.dw.d_kytkin d18a on d18a.kytkin_koodi = coalesce(pk.pohjakoulutus_am,0)
LEFT JOIN ANTERO.dw.d_kytkin d18b on d18b.kytkin_koodi = coalesce(pk.pohjakoulutus_amp,0)
LEFT JOIN ANTERO.dw.d_kytkin d18c on d18c.kytkin_koodi = coalesce(pk.pohjakoulutus_amt,0)
LEFT JOIN ANTERO.dw.d_kytkin d18d on d18d.kytkin_koodi = coalesce(pk.pohjakoulutus_amv,0)
LEFT JOIN ANTERO.dw.d_kytkin d18e on d18e.kytkin_koodi = coalesce(pk.pohjakoulutus_avoin,0)
LEFT JOIN ANTERO.dw.d_kytkin d18f on d18f.kytkin_koodi = coalesce(pk.pohjakoulutus_kk,0)
LEFT JOIN ANTERO.dw.d_kytkin d18g on d18g.kytkin_koodi = coalesce(pk.pohjakoulutus_kk_ulk,0)
LEFT JOIN ANTERO.dw.d_kytkin d18h on d18h.kytkin_koodi = coalesce(pk.pohjakoulutus_lk,0)
LEFT JOIN ANTERO.dw.d_kytkin d18i on d18i.kytkin_koodi = coalesce(pk.pohjakoulutus_ulk,0)
LEFT JOIN ANTERO.dw.d_kytkin d18j on d18j.kytkin_koodi = coalesce(pk.pohjakoulutus_yo,0)
LEFT JOIN ANTERO.dw.d_kytkin d18k on d18k.kytkin_koodi = coalesce(pk.pohjakoulutus_yo_ammatillinen,0)
LEFT JOIN ANTERO.dw.d_kytkin d18l on d18l.kytkin_koodi = coalesce(pk.pohjakoulutus_yo_kansainvalinen_suomessa,0)
LEFT JOIN ANTERO.dw.d_kytkin d18m on d18m.kytkin_koodi = coalesce(pk.pohjakoulutus_yo_ulkomainen,0)
LEFT JOIN ANTERO.dw.d_kytkin d18n on d18n.kytkin_koodi = coalesce(pk.pohjakoulutus_muu,0)
-- Varmista lisätäänkö pohjakoulutus_yo, jos yo-tutkinto on suoritettu, mutta pohjakoulutusta ei ole merkattu.
LEFT JOIN ANTERO.sa.temp_haku_ja_valinta_pohjakoulutukset_yhdistetty pk2 on pk2.hakemus_oid = h.hakemus_oid
LEFT JOIN ANTERO.dw.d_pohjakoulutus d19 on d19.koodi = pk2.pohjakoulutus_koodi
LEFT JOIN ANTERO.dw.d_kytkin d20 on d20.kytkin_koodi = case when pk2.pohjakoulutus_koodi like '%_ulk%' then 1 when pk2.pohjakoulutus_koodi <> 'pohjakoulutus_muu' then 0 end
LEFT JOIN ANTERO.sa.temp_haku_ja_valinta_pohjakoulutuksen_maa_priorisoitu pkmp on pkmp.master_oid = h.master_oid and pkmp.koulutuksen_alkamisvuosi = h.koulutuksen_alkamisvuosi and pkmp.koulutuksen_alkamiskausi = h.koulutuksen_alkamiskausi
LEFT JOIN ANTERO.dw.d_kalenteri d21 on d21.kalenteri_avain = pkmp.ylioppilastutkinnon_suorituspaivamaara
LEFT JOIN ANTERO.sa.temp_hakeneet_kk_hakutoiveet ht on ht.hakemus_oid = h.hakemus_oid
LEFT JOIN ANTERO.dw.d_oppilaitoksenopetuskieli d23 on d23.koodi = h.opetuksen_kieli
LEFT JOIN ANTERO.dw.d_valintatapajonon_tyyppi d24 on d24.koodi = h.valintatapajonon_tyyppi
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d25 on d25.organisaatio_oid = h.organisaatio_oid
LEFT JOIN ANTERO.dw.d_alueluokitus d26 on d26.kunta_koodi = d25.kunta_koodi
LEFT JOIN ANTERO.dw.d_valintatapajono d27 on d27.valintatapajono_oid = h.valintatapajono_oid
LEFT JOIN ANTERO.dw.d_oppilaitoksenopetuskieli d28 on d28.koodi = h.opetuksen_kieli
WHERE h.kk_haku = 1 and (h.koulutuksen_alkamisvuosi > 2015 or (h.koulutuksen_alkamisvuosi = 2015 and h.koulutuksen_alkamiskausi = 's'))

UNION ALL

SELECT
	h.koulutuksen_alkamisvuosi,
	NULL as master_oid,
	NULL AS hakemus_oid,
	vk.id as sa_haku_ja_valinta_vuosikello_korkea_aste_id,
	coalesce(d3.id,-1) as d_kausi_koulutuksen_alkamiskausi_id,
	NULL as d_sukupuoli_id,
	NULL as d_kieli_aidinkieli_id,
	NULL as d_ika_id,
	NULL as d_maatjavaltiot2_kansalaisuus_id,
	NULL as d_alueluokitus_kotikunta_id,
	coalesce(d9.id,-1) as d_organisaatioluokitus_koulutustoimija_id,
	coalesce(d10.id,-1) as d_organisaatioluokitus_oppilaitos_id,
	coalesce(d11.id,-1) as d_organisaatioluokitus_toimipiste_id,
	coalesce(d1.id,-1) as d_haku_id,
	coalesce(d13.id,-1) as d_hakukohde_id,
	coalesce(d14.id,-1) as d_koulutusluokitus_id,
	NULL as d_haku_amk_yo_id,
	coalesce(d16.id,-1) as d_tutkinnon_aloitussykli_kk_id,
	coalesce(d17.id,-1) as d_tutkinnon_taso_kk_id,
	NULL as d_kytkin_pohjakoulutus_am_id,
	NULL as d_kytkin_pohjakoulutus_amp_id,
	NULL as d_kytkin_pohjakoulutus_amt_id,
	NULL as d_kytkin_pohjakoulutus_amv_id,
	NULL as d_kytkin_pohjakoulutus_avoin_id,
	NULL as d_kytkin_pohjakoulutus_kk_id,
	NULL as d_kytkin_pohjakoulutus_kk_ulk_id,
	NULL as d_kytkin_pohjakoulutus_lk_id,
	NULL as d_kytkin_pohjakoulutus_ulk_id,
	NULL as d_kytkin_pohjakoulutus_yo_id,
	NULL as d_kytkin_pohjakoulutus_yo_ammatillinen_id,
	NULL as d_kytkin_pohjakoulutus_yo_kansainvalinen_suomessa_id,
	NULL as d_kytkin_pohjakoulutus_yo_ulkomainen_id,
	NULL as d_kytkin_pohjakoulutus_muu_id,
	NULL as toisen_asteen_koulutuksen_suoritusvuosi,
	NULL as d_pohjakoulutus_id,
	NULL as pohjakoulutuksen_paattovuosi,
	NULL as d_kytkin_pohjakoulutus_ulkomaat_id,
	NULL as pohjakoulutus_suomessa_priorisoitu,
	NULL as d_kalenteri_ylioppilastutkinnon_suorituspaivamaara_id,
	coalesce(d23.id,-1) as d_oppilaitoksenopetuskieli_koulutuksen_kieli_id,
	NULL as d_valintatapajonon_tyyppi_id,
	coalesce(d26.id,-1) as d_alueluokitus_hakukohde_id,
	NULL as d_valintatapajono_id,
	NULL as d_organisaatioluokitus_hakukohde1_id,
	NULL as d_koulutusluokitus_hakukohde1_id,
	NULL as d_tutkinnon_aloitussykli_kk_hakukohde1_id,
	NULL as d_hakukohde_hakukohde1_id,
	NULL as d_organisaatioluokitus_hakukohde2_id,
	NULL as d_koulutusluokitus_hakukohde2_id,
	NULL as d_tutkinnon_aloitussykli_kk_hakukohde2_id,
	NULL as d_hakukohde_hakukohde2_id,
	NULL as d_organisaatioluokitus_hakukohde3_id,
	NULL as d_koulutusluokitus_hakukohde3_id,
	NULL as d_tutkinnon_aloitussykli_kk_hakukohde3_id,
	NULL as d_hakukohde_hakukohde3_id,
	NULL as d_organisaatioluokitus_hakukohde4_id,
	NULL as d_koulutusluokitus_hakukohde4_id,
	NULL as d_tutkinnon_aloitussykli_kk_hakukohde4_id,
	NULL as d_hakukohde_hakukohde4_id,
	NULL as d_organisaatioluokitus_hakukohde5_id,
	NULL as d_koulutusluokitus_hakukohde5_id,
	NULL as d_tutkinnon_aloitussykli_kk_hakukohde5_id,
	NULL as d_hakukohde_hakukohde5_id,
	NULL as d_organisaatioluokitus_hakukohde6_id,
	NULL as d_koulutusluokitus_hakukohde6_id,
	NULL as d_tutkinnon_aloitussykli_kk_hakukohde6_id,
	NULL as d_hakukohde_hakukohde6_id,
	NULL as hakutoive,
	NULL as valittu,
	NULL as vastaanottanut_paikan,
	NULL as ilmoittautunut,
	NULL as ensikertalainen,
	NULL as valittu_ensisijaiseen_kohteeseen,
	NULL as valittu_ensisijaisen_kohteen_koulutusalalle,
	NULL as ei_vastaanottoa_kaudella,
	NULL as aidosti_ensikertainen,
	null as ensikertaisuuden_lahde,
	NULL as pk_rnk,
	NULL as kansainvalinen_opiskelija,
	NULL uusi_ylioppilas,
	NULL as aloittanut_opinnot_toisen_asteen_koulutuksen_suoritusvuonna,
	NULL as aloittanut_opinnot_ilmoittamansa_pohjakoulutuksen_suoritusvuonna,
	h.laajuus,
	NULL as valitut_indikaattori,
	NULL as vastaanottaneet_indikaattori,
	NULL as pisteet,
	h.aloituspaikat as alpa,
	h.alinhyvaksyttypistemaara as pisteraja,
	NULL as hakemus_luotu,
	'etl: p_lataa_f_haku_ja_valinta_hakeneet_korkea_aste' as source,
	SUSER_SNAME() as username,
	@loadtime as loadtime
FROM ANTERO.sa.sa_ovara_hakukohteet h
LEFT JOIN ANTERO.dw.d_haku d1 on d1.haku_oid = h.haku_oid 
LEFT JOIN ANTERO.dw.d_kausi d3 on d3.koodi = h.koulutuksen_alkamiskausi
LEFT JOIN ANTERO.sa.sa_haku_ja_valinta_vuosikello_korkea_aste vk on ((vk.haku_oid=h.haku_oid and vk.haku_oid is not null) OR (vk.koulutuksen_alkamiskausi=cast(h.koulutuksen_alkamisvuosi as varchar)+cast(d3.jarjestys as varchar) and d1.hakutapa_koodi <> '01' and vk.haku_oid is null)) and @loadtime >= vk.hakijat
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d9 ON d9.organisaatio_oid = h.koulutustoimija_oid
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d10 ON d10.organisaatio_oid = h.oppilaitos_oid
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d11 ON d11.organisaatio_oid = h.toimipiste_oid
LEFT JOIN ANTERO.dw.d_hakukohde d13 on d13.oid = h.hakukohde_oid
LEFT JOIN ANTERO.dw.d_koulutusluokitus d14 on d14.koulutusluokitus_koodi = h.koulutuskoodi
LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d16 on d16.koodi = h.hakukohteen_tutkinnon_taso_kk_sykli
LEFT JOIN ANTERO.dw.d_tutkinnon_taso_kk d17 on d17.koodi = h.hakukohteen_tutkinnon_taso_kk
LEFT JOIN ANTERO.dw.d_oppilaitoksenopetuskieli d23 on d23.koodi = h.opetuksen_kieli
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d25 on d25.organisaatio_oid = h.organisaatio_oid
LEFT JOIN ANTERO.dw.d_alueluokitus d26 on d26.kunta_koodi = d25.kunta_koodi
WHERE h.kk_haku = 1 and (h.koulutuksen_alkamisvuosi > 2016 or (h.koulutuksen_alkamisvuosi = 2016 and h.koulutuksen_alkamiskausi = 's'))

DROP TABLE IF EXISTS ANTERO.sa.temp_haku_ja_valinta_valitut
DROP TABLE IF EXISTS ANTERO.sa.temp_haku_ja_valinta_pohjakoulutukset
DROP TABLE IF EXISTS ANTERO.sa.temp_haku_ja_valinta_pohjakoulutuksen_maa_priorisoitu
DROP TABLE IF EXISTS ANTERO.sa.temp_hakeneet_kk_hakutoiveet
DROP TABLE IF EXISTS ANTERO.sa.temp_haku_ja_valinta_pohjakoulutukset_yhdistetty

CREATE NONCLUSTERED INDEX [test_index]
ON [dw].[f_haku_ja_valinta_hakeneet_korkea_aste] ([koulutuksen_alkamisvuosi])
INCLUDE ([master_oid],[hakemus_oid],[sa_haku_ja_valinta_vuosikello_korkea_aste_id],[d_kausi_koulutuksen_alkamiskausi_id],[d_sukupuoli_id],[d_kieli_aidinkieli_id],[d_ika_id],[d_maatjavaltiot2_kansalaisuus_id],[d_alueluokitus_kotikunta_id],[d_organisaatioluokitus_koulutustoimija_id],[d_organisaatioluokitus_oppilaitos_id],[d_organisaatioluokitus_toimipiste_id],[d_haku_id],[d_hakukohde_id],[d_koulutusluokitus_id],[d_haku_amk_yo_id],[d_tutkinnon_aloitussykli_kk_id],[d_tutkinnon_taso_kk_id],[d_kytkin_pohjakoulutus_am_id],[d_kytkin_pohjakoulutus_amp_id],[d_kytkin_pohjakoulutus_amt_id],[d_kytkin_pohjakoulutus_amv_id],[d_kytkin_pohjakoulutus_avoin_id],[d_kytkin_pohjakoulutus_kk_id],[d_kytkin_pohjakoulutus_kk_ulk_id],[d_kytkin_pohjakoulutus_lk_id],[d_kytkin_pohjakoulutus_ulk_id],[d_kytkin_pohjakoulutus_yo_id],[d_kytkin_pohjakoulutus_yo_ammatillinen_id],[d_kytkin_pohjakoulutus_yo_kansainvalinen_suomessa_id],[d_kytkin_pohjakoulutus_yo_ulkomainen_id],[d_kytkin_pohjakoulutus_muu_id],[toisen_asteen_koulutuksen_suoritusvuosi],[d_pohjakoulutus_id],[d_kytkin_pohjakoulutus_ulkomaat_id],[pohjakoulutus_suomessa_priorisoitu],[d_kalenteri_ylioppilastutkinnon_suorituspaivamaara_id],[d_oppilaitoksenopetuskieli_koulutuksen_kieli_id],[d_valintatapajonon_tyyppi_id],[d_alueluokitus_hakukohde_id],[d_valintatapajono_id],[d_organisaatioluokitus_hakukohde1_id],[d_koulutusluokitus_hakukohde1_id],[d_tutkinnon_aloitussykli_kk_hakukohde1_id],[d_hakukohde_hakukohde1_id],[d_organisaatioluokitus_hakukohde2_id],[d_koulutusluokitus_hakukohde2_id],[d_tutkinnon_aloitussykli_kk_hakukohde2_id],[d_hakukohde_hakukohde2_id],[d_organisaatioluokitus_hakukohde3_id],[d_koulutusluokitus_hakukohde3_id],[d_tutkinnon_aloitussykli_kk_hakukohde3_id],[d_hakukohde_hakukohde3_id],[d_organisaatioluokitus_hakukohde4_id],[d_koulutusluokitus_hakukohde4_id],[d_tutkinnon_aloitussykli_kk_hakukohde4_id],[d_hakukohde_hakukohde4_id],[d_organisaatioluokitus_hakukohde5_id],[d_koulutusluokitus_hakukohde5_id],[d_tutkinnon_aloitussykli_kk_hakukohde5_id],[d_hakukohde_hakukohde5_id],[d_organisaatioluokitus_hakukohde6_id],[d_koulutusluokitus_hakukohde6_id],[d_tutkinnon_aloitussykli_kk_hakukohde6_id],[d_hakukohde_hakukohde6_id],[hakutoive],[valittu],[vastaanottanut_paikan],[ilmoittautunut],[ensikertalainen],[ei_vastaanottoa_kaudella],[aidosti_ensikertainen],[ensikertaisuuden_lahde],[pk_rnk],[kansainvalinen_opiskelija],[uusi_ylioppilas],[aloittanut_opinnot_toisen_asteen_koulutuksen_suoritusvuonna],[aloittanut_opinnot_ilmoittamansa_pohjakoulutuksen_suoritusvuonna],[laajuus],[valitut_indikaattori],[vastaanottaneet_indikaattori],[pisteet],[alpa],[pisteraja],[loadtime])

CREATE NONCLUSTERED INDEX [test_index2]
ON [dw].[f_haku_ja_valinta_hakeneet_korkea_aste] ([sa_haku_ja_valinta_vuosikello_korkea_aste_id],[koulutuksen_alkamisvuosi])
INCLUDE ([master_oid],[hakemus_oid],[d_kausi_koulutuksen_alkamiskausi_id],[d_sukupuoli_id],[d_kieli_aidinkieli_id],[d_ika_id],[d_maatjavaltiot2_kansalaisuus_id],[d_alueluokitus_kotikunta_id],[d_organisaatioluokitus_koulutustoimija_id],[d_organisaatioluokitus_oppilaitos_id],[d_organisaatioluokitus_toimipiste_id],[d_haku_id],[d_hakukohde_id],[d_koulutusluokitus_id],[d_haku_amk_yo_id],[d_tutkinnon_aloitussykli_kk_id],[d_tutkinnon_taso_kk_id],[d_kytkin_pohjakoulutus_am_id],[d_kytkin_pohjakoulutus_amp_id],[d_kytkin_pohjakoulutus_amt_id],[d_kytkin_pohjakoulutus_amv_id],[d_kytkin_pohjakoulutus_avoin_id],[d_kytkin_pohjakoulutus_kk_id],[d_kytkin_pohjakoulutus_kk_ulk_id],[d_kytkin_pohjakoulutus_lk_id],[d_kytkin_pohjakoulutus_ulk_id],[d_kytkin_pohjakoulutus_yo_id],[d_kytkin_pohjakoulutus_yo_ammatillinen_id],[d_kytkin_pohjakoulutus_yo_kansainvalinen_suomessa_id],[d_kytkin_pohjakoulutus_yo_ulkomainen_id],[d_kytkin_pohjakoulutus_muu_id],[toisen_asteen_koulutuksen_suoritusvuosi],[d_pohjakoulutus_id],[d_kytkin_pohjakoulutus_ulkomaat_id],[pohjakoulutus_suomessa_priorisoitu],[d_kalenteri_ylioppilastutkinnon_suorituspaivamaara_id],[d_oppilaitoksenopetuskieli_koulutuksen_kieli_id],[d_valintatapajonon_tyyppi_id],[d_alueluokitus_hakukohde_id],[d_valintatapajono_id],[d_organisaatioluokitus_hakukohde1_id],[d_koulutusluokitus_hakukohde1_id],[d_tutkinnon_aloitussykli_kk_hakukohde1_id],[d_hakukohde_hakukohde1_id],[d_organisaatioluokitus_hakukohde2_id],[d_koulutusluokitus_hakukohde2_id],[d_tutkinnon_aloitussykli_kk_hakukohde2_id],[d_hakukohde_hakukohde2_id],[d_organisaatioluokitus_hakukohde3_id],[d_koulutusluokitus_hakukohde3_id],[d_tutkinnon_aloitussykli_kk_hakukohde3_id],[d_hakukohde_hakukohde3_id],[d_organisaatioluokitus_hakukohde4_id],[d_koulutusluokitus_hakukohde4_id],[d_tutkinnon_aloitussykli_kk_hakukohde4_id],[d_hakukohde_hakukohde4_id],[d_organisaatioluokitus_hakukohde5_id],[d_koulutusluokitus_hakukohde5_id],[d_tutkinnon_aloitussykli_kk_hakukohde5_id],[d_hakukohde_hakukohde5_id],[d_organisaatioluokitus_hakukohde6_id],[d_koulutusluokitus_hakukohde6_id],[d_tutkinnon_aloitussykli_kk_hakukohde6_id],[d_hakukohde_hakukohde6_id],[hakutoive],[valittu],[vastaanottanut_paikan],[ilmoittautunut],[ensikertalainen],[ei_vastaanottoa_kaudella],[aidosti_ensikertainen],[ensikertaisuuden_lahde],[pk_rnk],[kansainvalinen_opiskelija],[uusi_ylioppilas],[aloittanut_opinnot_toisen_asteen_koulutuksen_suoritusvuonna],[aloittanut_opinnot_ilmoittamansa_pohjakoulutuksen_suoritusvuonna],[laajuus],[valitut_indikaattori],[vastaanottaneet_indikaattori],[pisteet],[alpa],[pisteraja],[loadtime])

