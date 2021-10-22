USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_haku_ja_valinta_hakeneet_korkea_aste]    Script Date: 27.9.2021 21:10:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_haku_ja_valinta_hakeneet_korkea_aste] AS

--EXEC [sa].[p_lataa_sa_hakeneet_kk_hakutoiveet]
--EXEC [sa].[p_lataa_sa_hakeneet_kk_pohjakoulutus]
--EXEC [sa].[p_lataa_sa_hakukohde_koulutus]
--EXEC [sa].[p_lataa_sa_hakukohde_kielet]

DECLARE @loadtime datetime = getdate()
;

IF EXISTS (SELECT * FROM sys.indexes WHERE name='NonClusteredIndex-henkiloOid_hakukohde_haku' AND object_id = OBJECT_ID('dw.f_haku_ja_valinta_hakeneet_korkea_aste'))
BEGIN
	DROP INDEX [NonClusteredIndex-henkiloOid_hakukohde_haku] ON [dw].[f_haku_ja_valinta_hakeneet_korkea_aste];
END
;

IF EXISTS (SELECT * FROM sys.indexes WHERE name='NC_sa_odw_hakeneet_valijoin' AND object_id = OBJECT_ID('sa.sa_odw_hakeneet_valijoin'))
BEGIN
	DROP INDEX IF EXISTS [NC_sa_odw_hakeneet_valijoin] ON [sa].[sa_odw_hakeneet_valijoin];
END
;


DROP TABLE IF EXISTS #valittuEkanKoulutusalalle1
;
SELECT * INTO #valittuEkanKoulutusalalle1
FROM (
	SELECT
		f.HakemusOid,
		CASE WHEN MIN(f.HakutoiveNumero) = 1 THEN 1 ELSE MIN(d3.id) END as id
	FROM sa.sa_odw_hakeneet f
	left join sa.sa_hakukohde_koulutus d1 on d1.hakukohde_oid = f.HakukohdeOID and hakukohdekoulutus_nro = 1
	left join dw.d_koulutusluokitus d2 on d2.koulutusluokitus_koodi = d1.hakukohdekoulutus_koodi
	left join (
		SELECT
			f.HakemusOid,
			d2.koulutusalataso1_koodi,
			CASE WHEN d2.koulutusalataso1_koodi = '-1' THEN '-1' ELSE '1' END as id
		FROM sa.sa_odw_hakeneet f
		left join sa.sa_hakukohde_koulutus d1 on d1.hakukohde_oid = f.HakukohdeOID and hakukohdekoulutus_nro = 1
		left join dw.d_koulutusluokitus d2 on d2.koulutusluokitus_koodi = d1.hakukohdekoulutus_koodi
		WHERE f.HakutoiveNumero = '1'
	) d3 on d3.koulutusalataso1_koodi = d2.koulutusalataso1_koodi and f.HakemusOid = d3.HakemusOid

	WHERE f.ValinnanTila in ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT')
	GROUP BY f.HakemusOid
) a
;


DROP TABLE IF EXISTS sa.sa_hakukohde_taso_sykli_TEMP
;
SELECT * INTO sa.sa_hakukohde_taso_sykli_TEMP
FROM sa.v_hakukohde_taso_sykli
;
CREATE NONCLUSTERED INDEX [NC_sa_hakukohde_taso_sykli_TEMP] ON [sa].[sa_hakukohde_taso_sykli_TEMP]
(
	[hakukohde_oid] ASC
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
;


TRUNCATE TABLE sa.sa_odw_hakeneet_valijoin
;
INSERT INTO sa.sa_odw_hakeneet_valijoin
SELECT d21.HakemusOid --f.HakemusOid
	,
	coalesce(d21b.id,'-1') as d_hakukohde_ensisijainen_id,
	coalesce(d21e.id,'-1') as d_koulutus_ensisijainen_hakukohde_id,
	coalesce(d21f.id,'-1') as d_organisaatioluokitus_ensisijainen_hakukohde_id,
	coalesce(d21g.id,'-1') as d_tutkinnon_aloitussykli_ensisijainen_hakukohde_id,
	coalesce(d22b.id,'-1') as d_hakukohde_toinen_hakukohde_id,
	coalesce(d22e.id,'-1') as d_koulutus_toinen_hakukohde_id,
	coalesce(d22f.id,'-1') as d_organisaatioluokitus_toinen_hakukohde_id,
	coalesce(d22g.id,'-1') as d_tutkinnon_aloitussykli_toinen_hakukohde_id,
	coalesce(d23b.id,'-1') as d_hakukohde_kolmas_hakukohde_id,
	coalesce(d23e.id,'-1') as d_koulutus_kolmas_hakukohde_id,
	coalesce(d23f.id,'-1') as d_organisaatioluokitus_kolmas_hakukohde_id,
	coalesce(d23g.id,'-1') as d_tutkinnon_aloitussykli_kolmas_hakukohde_id,
	coalesce(d24b.id,'-1') as d_hakukohde_neljas_hakukohde_id,
	coalesce(d24e.id,'-1') as d_koulutus_neljas_hakukohde__id,
	coalesce(d24f.id,'-1') as d_organisaatioluokitus_neljas_hakukohde_id,
	coalesce(d24g.id,'-1') as d_tutkinnon_aloitussykli_neljas_hakukohde_id,
	coalesce(d25b.id,'-1') as d_hakukohde_viides_hakukohde_id,
	coalesce(d25e.id,'-1') as d_koulutus_viides_hakukohde_id,
	coalesce(d25f.id,'-1') as d_organisaatioluokitus_viides_hakukohde_id,
	coalesce(d25g.id,'-1') as d_tutkinnon_aloitussykli_viides_hakukohde_id,
	coalesce(d26b.id,'-1') as d_hakukohde_kuudes_hakukohde_id,
	coalesce(d26e.id,'-1') as d_koulutus_kuudes_hakukohde_id,
	coalesce(d26f.id,'-1') as d_organisaatioluokitus_kuudes_hakukohde_id,
	coalesce(d26g.id,'-1') as d_tutkinnon_aloitussykli_kuudes_hakukohde_id

FROM --[sa].[sa_odw_hakeneet] f left join 
sa.sa_hakeneet_kk_hakutoiveet d21 --on d21.HakemusOid = f.HakemusOid
--
left join dw.d_hakukohde d21b on d21b.oid = d21.HakukohdeOID1
left join sa.sa_hakukohde_koulutus d21c on d21c.hakukohde_oid = d21.HakukohdeOID1 and d21c.hakukohdekoulutus_nro = 1
left join dw.d_koulutusluokitus d21e on d21e.koulutusluokitus_koodi = d21c.hakukohdekoulutus_koodi
left join dw.d_organisaatioluokitus d21f on d21f.organisaatio_oid = d21.organisaatioOID1
left join sa.sa_hakukohde_taso_sykli_TEMP d21d on d21d.hakukohde_oid = d21.hakukohdeOID1
left join dw.d_tutkinnon_aloitussykli_kk d21g on d21g.koodi = d21d.hakukohteen_tutkinnon_taso_kk_sykli
--
left join dw.d_hakukohde d22b on d22b.oid = d21.HakukohdeOID2
left join sa.sa_hakukohde_koulutus d22c on d22c.hakukohde_oid = d21.HakukohdeOID2 and d22c.hakukohdekoulutus_nro = 1
left join dw.d_koulutusluokitus d22e on d22e.koulutusluokitus_koodi = d22c.hakukohdekoulutus_koodi
left join dw.d_organisaatioluokitus d22f on d22f.organisaatio_oid = d21.organisaatioOID2
left join sa.sa_hakukohde_taso_sykli_TEMP d22d on d22d.hakukohde_oid = d21.hakukohdeOID2
left join dw.d_tutkinnon_aloitussykli_kk d22g on d22g.koodi = d22d.hakukohteen_tutkinnon_taso_kk_sykli
--
left join dw.d_hakukohde d23b on d23b.oid = d21.HakukohdeOID3
left join sa.sa_hakukohde_koulutus d23c on d23c.hakukohde_oid = d21.HakukohdeOID3 and d23c.hakukohdekoulutus_nro = 1
left join dw.d_koulutusluokitus d23e on d23e.koulutusluokitus_koodi = d23c.hakukohdekoulutus_koodi
left join dw.d_organisaatioluokitus d23f on d23f.organisaatio_oid = d21.organisaatioOID3
left join sa.sa_hakukohde_taso_sykli_TEMP d23d on d23d.hakukohde_oid = d21.hakukohdeOID3
left join dw.d_tutkinnon_aloitussykli_kk d23g on d23g.koodi = d23d.hakukohteen_tutkinnon_taso_kk_sykli
--
left join dw.d_hakukohde d24b on d24b.oid = d21.HakukohdeOID4
left join sa.sa_hakukohde_koulutus d24c on d24c.hakukohde_oid = d21.HakukohdeOID4 and d24c.hakukohdekoulutus_nro = 1
left join dw.d_koulutusluokitus d24e on d24e.koulutusluokitus_koodi = d24c.hakukohdekoulutus_koodi
left join dw.d_organisaatioluokitus d24f on d24f.organisaatio_oid = d21.organisaatioOID4
left join sa.sa_hakukohde_taso_sykli_TEMP d24d on d24d.hakukohde_oid = d21.hakukohdeOID4
left join dw.d_tutkinnon_aloitussykli_kk d24g on d24g.koodi = d24d.hakukohteen_tutkinnon_taso_kk_sykli
--
left join dw.d_hakukohde d25b on d25b.oid = d21.HakukohdeOID5
left join sa.sa_hakukohde_koulutus d25c on d25c.hakukohde_oid = d21.HakukohdeOID5 and d25c.hakukohdekoulutus_nro = 1
left join dw.d_koulutusluokitus d25e on d25e.koulutusluokitus_koodi = d25c.hakukohdekoulutus_koodi
left join dw.d_organisaatioluokitus d25f on d25f.organisaatio_oid = d21.organisaatioOID5
left join sa.sa_hakukohde_taso_sykli_TEMP d25d on d25d.hakukohde_oid = d21.hakukohdeOID5
left join dw.d_tutkinnon_aloitussykli_kk d25g on d25g.koodi = d25d.hakukohteen_tutkinnon_taso_kk_sykli
--
left join dw.d_hakukohde d26b on d26b.oid = d21.HakukohdeOID6
left join sa.sa_hakukohde_koulutus d26c on d26c.hakukohde_oid = d21.HakukohdeOID6 and d26c.hakukohdekoulutus_nro = 1
left join dw.d_koulutusluokitus d26e on d26e.koulutusluokitus_koodi = d26c.hakukohdekoulutus_koodi
left join dw.d_organisaatioluokitus d26f on d26f.organisaatio_oid = d21.organisaatioOID6
left join sa.sa_hakukohde_taso_sykli_TEMP d26d on d26d.hakukohde_oid = d21.hakukohdeOID6
left join dw.d_tutkinnon_aloitussykli_kk d26g on d26g.koodi = d26d.hakukohteen_tutkinnon_taso_kk_sykli
;

CREATE NONCLUSTERED INDEX [NC_sa_odw_hakeneet_valijoin] ON [sa].[sa_odw_hakeneet_valijoin]
(
	[hakemusoid] ASC
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
;


TRUNCATE TABLE dw.f_haku_ja_valinta_hakeneet_korkea_aste
;
INSERT INTO dw.f_haku_ja_valinta_hakeneet_korkea_aste (
	henkilo_oid,
	hakemus_oid,
	sa_haku_ja_valinta_vuosikello_korkea_aste_id,
	d_sukupuoli_id,
	d_kieli_aidinkieli_id,
	d_ika_id,
	d_alueluokitus_kotipaikka_id,
	d_maatjavaltiot_kansalaisuus_id,
	toisen_asteen_koulutuksen_suoritusvuosi,
	ylioppilastutkinnon_suoritusvuosi,
	d_kausi_ylioppilastutkinto_id,
	pohjakoulutuksen_paattovuosi,
	d_pohjakoulutuskk_id,
	d_kytkin_pohjakoulutuskk_ulkomaat_id,
	ensikertainen_hakija,
	d_haku_amk_yo_id,
	koulutuksen_alkamisvuosi,
	d_kausi_koulutuksen_alkamiskausi_id,
	d_haku_id,
	d_hakuaika_id,
	d_hakukohde_id,
	hakutoive,
	d_organisaatio_koulutuksen_jarjestaja_id,
	d_organisaatio_oppilaitos_id,
	d_organisaatio_toimipiste_id,
	d_alueluokitus_hakukohde_id,
	d_koulutusluokitus_hakukohde_id,
	d_tutkinnon_aloitussykli_kk_id,
	d_tutkinnon_taso_kk_id,
	d_kieli_koulutus_id,
	d_opintojen_laajuus_id,
	valinnan_tila,
	vastaanoton_tila,
	ilmoittautumisen_tila,
	d_hakukohde_ensisijainen_id,
	d_koulutus_ensisijainen_hakukohde_id,
	d_organisaatioluokitus_ensisijainen_hakukohde_id,
	d_tutkinnon_aloitussykli_ensisijainen_hakukohde_id,
	d_hakukohde_toinen_hakukohde_id,
	d_koulutus_toinen_hakukohde_id,
	d_organisaatioluokitus_toinen_hakukohde_id,
	d_tutkinnon_aloitussykli_toinen_hakukohde_id,
	d_hakukohde_kolmas_hakukohde_id,
	d_koulutus_kolmas_hakukohde_id,
	d_organisaatioluokitus_kolmas_hakukohde_id,
	d_tutkinnon_aloitussykli_kolmas_hakukohde_id,
	d_hakukohde_neljas_hakukohde_id,
	d_koulutus_neljas_hakukohde__id,
	d_organisaatioluokitus_neljas_hakukohde_id,
	d_tutkinnon_aloitussykli_neljas_hakukohde_id,
	d_hakukohde_viides_hakukohde_id,
	d_koulutus_viides_hakukohde_id,
	d_organisaatioluokitus_viides_hakukohde_id,
	d_tutkinnon_aloitussykli_viides_hakukohde_id,
	d_hakukohde_kuudes_hakukohde_id,
	d_koulutus_kuudes_hakukohde_id,
	d_organisaatioluokitus_kuudes_hakukohde_id,
	d_tutkinnon_aloitussykli_kuudes_hakukohde_id,
	d_valittu_ensisijaiseen_kohteeseen_id,
	d_valittu_ensisijaisen_kohteen_koulutusalalle_id,
	loadtime,
	source,
	username
)

SELECT
	f.HenkiloOID as henkilo_oid,
	f.HakemusOid as hakemus_oid,
	d0.id as sa_haku_ja_valinta_vuosikello_korkea_aste_id,
	coalesce(d1.id,'-1') as d_sukupuoli_id,
	coalesce(d2.id,'-1') as d_kieli_aidinkieli_id,
	coalesce(d5.id,'-1') as d_ika_id,
	coalesce(d3.id,'-1') as d_alueluokitus_kotipaikka_id,
	coalesce(d4.id,'-1') as d_maatjavaltiot_kansalaisuus_id,
	coalesce(nullif(d28.max_ToisenAsteenKoulutuksenSuoritusvuosi,'0'),'0') as toisen_asteen_koulutuksen_suoritusvuosi,
	coalesce(cast(d32.valmistumisvuosi as varchar(4)),'0') as ylioppilastutkinnon_suoritusvuosi,
	coalesce(d32b.id,'-1') as d_kausi_ylioppilastutkinto_id,
	case f.PohjakoulutuksenSuoritusvuosi when '0' then '0' else cast(f.PohjakoulutuksenSuoritusvuosi as nvarchar) end as pohjakoulutuksen_paattovuosi,
	coalesce(d7.id,'-1') as d_pohjakoulutuskk_id,
	coalesce(d9.id,'-1') as d_kytkin_pohjakoulutuskk_ulkomaat_id,
	case f.ensikertalainen when 1 then 'Ensikertainen hakija' when 0 then 'Ei ensikertainen hakija ' else 'Tuntematon' end as ensikertainen_hakija,
	coalesce(d29.id,'-1') as d_haku_amk_yo_id,
	d16.koulutuksen_alkamisvuosi,
	coalesce(d17.id,'-1') as d_kausi_koulutuksen_alkamiskausi_id,
	coalesce(d10.id,'-1') as d_haku_id,
	coalesce(d8.id,'-1') as d_hakuaika_id,
	coalesce(d11.id,'-1') as d_hakukohde_id,
	f.HakutoiveNumero as hakutoive,
	coalesce(d12.id,'-1') as d_organisaatio_koulutuksen_jarjestaja_id,
	coalesce(d13.id,'-1') as d_organisaatio_oppilaitos_id,
	coalesce(d14.id,'-1') as d_organisaatio_toimipiste_id,
	coalesce(d15.id,'-1') as d_alueluokitus_hakukohde_id,
	coalesce(d18.id,'-1') as d_koulutusluokitus_hakukohde_id,
	coalesce(d30.id,'-1') as d_tutkinnon_aloitussykli_kk,
	coalesce(d31.id,'-1') as d_tutkinnon_taso_kk,
	coalesce(d20.id,'-1') as d_kieli_koulutus_id,
	coalesce(d27.id,'-1') as d_opintojen_laajuus_id,
	f.ValinnanTila as valinnan_tila,
	f.VastaanotonTila as vastaanoton_tila,
	f.IlmoittautumisenTila as ilmoittautumisen_tila,
	hvj.d_hakukohde_ensisijainen_id,
	hvj.d_koulutus_ensisijainen_hakukohde_id,
	hvj.d_organisaatioluokitus_ensisijainen_hakukohde_id,
	hvj.d_tutkinnon_aloitussykli_ensisijainen_hakukohde_id,
	hvj.d_hakukohde_toinen_hakukohde_id,
	hvj.d_koulutus_toinen_hakukohde_id,
	hvj.d_organisaatioluokitus_toinen_hakukohde_id,
	hvj.d_tutkinnon_aloitussykli_toinen_hakukohde_id,
	hvj.d_hakukohde_kolmas_hakukohde_id,
	hvj.d_koulutus_kolmas_hakukohde_id,
	hvj.d_organisaatioluokitus_kolmas_hakukohde_id,
	hvj.d_tutkinnon_aloitussykli_kolmas_hakukohde_id,
	hvj.d_hakukohde_neljas_hakukohde_id,
	hvj.d_koulutus_neljas_hakukohde__id,
	hvj.d_organisaatioluokitus_neljas_hakukohde_id,
	hvj.d_tutkinnon_aloitussykli_neljas_hakukohde_id,
	hvj.d_hakukohde_viides_hakukohde_id,
	hvj.d_koulutus_viides_hakukohde_id,
	hvj.d_organisaatioluokitus_viides_hakukohde_id,
	hvj.d_tutkinnon_aloitussykli_viides_hakukohde_id,
	hvj.d_hakukohde_kuudes_hakukohde_id,
	hvj.d_koulutus_kuudes_hakukohde_id,
	hvj.d_organisaatioluokitus_kuudes_hakukohde_id,
	hvj.d_tutkinnon_aloitussykli_kuudes_hakukohde_id,
	coalesce(d35.id,'-1') as d_valittu_ensisijaiseen_kohteeseen_id,
	coalesce(#valittuEkanKoulutusalalle1.id,'0') as d_valittu_ensisijaisen_kohteen_koulutusalalle_id,
	@loadtime,
	'ETL: p_lataa_f_haku_ja_valinta_hakeneet_korkea_aste' AS source,
	suser_name()

FROM [sa].[sa_odw_hakeneet] f
inner join dw.d_haku d10 on d10.haku_oid = f.HakuOid and d10.korkeakouluhaku = 1
left join sa.sa_hakukohde_koulutus d16 on d16.hakukohde_oid = f.HakukohdeOID and hakukohdekoulutus_nro = 1
left join dw.d_kausi d17 on d17.koodi = d16.koulutuksen_alkamiskausi
--
left join sa.sa_haku_ja_valinta_vuosikello_korkea_aste d0 on 
((d0.haku_oid=d10.haku_oid and d0.haku_oid is not null) OR (d0.koulutuksen_alkamiskausi=cast(d16.koulutuksen_alkamisvuosi as varchar)+cast(d17.jarjestys as varchar) and d10.hakutapa_koodi <> '01' and d0.haku_oid is null))
and @loadtime >= d0.hakijat
--
left join dw.d_sukupuoli d1 on d1.sukupuoli_koodi = f.SukupuoliKoodi
left join dw.d_kieli d2 on d2.kieli_koodi = f.AidinkieliKoodi
-------
left join dw.d_alueluokitus d3 on d3.alueluokitus_avain = 'kunta_'+f.KotikuntaKoodi
left join (
	SELECT distinct
		f.HakemusOid,
		'1' as id
	FROM sa.sa_odw_hakeneet f
	WHERE f.ValinnanTila in ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT')
	and f.HakutoiveNumero = 1
) d35 on f.HakemusOid = d35.HakemusOid
--
left join #valittuEkanKoulutusalalle1 on f.HakemusOid = #valittuEkanKoulutusalalle1.HakemusOid
--
left join (
	SELECT
		henkiloOid
		,valmistumisvuosi
		,kausi = CASE WHEN month(valmistumispaivamaara) < 8 then 'K' else 'S' end
	FROM (
		SELECT
			henkiloOID
			,valmistumisvuosi = MAX(valmistumisvuosi)
			,valmistumispaivamaara = MAX(CAST(valmistumispaivamaara AS DATE))
		FROM ANTERO.dw.f_haku_ja_valinta_yoarvosanat
		GROUP BY henkiloOID
	) q
) d32 on d32.henkiloOID = f.HenkiloOID and d32.valmistumisvuosi <= d16.koulutuksen_alkamisvuosi

--left join VipunenTK.dbo.d_valtio d4 on d4.maa_koodi = right('00'+cast(f.KansalaisuusKoodi as varchar),3)--join Vipusen kantaan koska sieltä saa eu- ja eta-maa -tiedot
left join dw.d_maatjavaltiot2 d4 on d4.maatjavaltiot2_koodi = right('00'+cast(f.KansalaisuusKoodi as varchar),3)
left join dw.d_ika d5 on d5.ika_avain = f.Ika
left join sa.sa_hakukohde_taso_sykli_TEMP d6 on d6.hakukohde_oid = f.HakukohdeOID
left join dw.d_pohjakoulutus d7 on d7.koodi = f.PohjakoulutusKKLomakeKoodi
left join dw.d_hakuaika d8 on d8.hakuaikaId = f.HakuaikaId
left join dw.d_kytkin d9 on d9.kytkin_koodi = f.PohjakoulutusKKUlkomaat
left join dw.d_hakukohde d11 on d11.oid = f.HakukohdeOID
left join dw.d_organisaatioluokitus d12 ON d12.organisaatio_oid = f.KoulutusToimijaOID
left join dw.d_organisaatioluokitus d13 ON d13.organisaatio_oid = f.OppilaitosOID
left join dw.d_organisaatioluokitus d14 ON d14.organisaatio_oid = f.ToimipisteOID
left join dw.d_alueluokitus d15 on d15.alueluokitus_avain = 'kunta_' + f.OrganisaationKuntaKoodi

left join dw.d_koulutusluokitus d18 on d18.koulutusluokitus_koodi = d16.hakukohdekoulutus_koodi
left join sa.sa_hakukohde_kielet d19 on d19.hakukohde_oid = f.HakukohdeOID
left join dw.d_kieli d20 on d20.kieli_koodi = d19.kieli_avain
left join dw.d_opintojenlaajuus d27 on d27.koodi = NULLIF(d16.laajuus_koodi,'')
left join sa.sa_hakeneet_kk_pohjakoulutus d28 on d28.hakemusoid = f.HakemusOid
left join dw.d_haku_amk_yo d29 on d29.koodi = f.Yo_Amk_YoAmk
left join dw.d_tutkinnon_aloitussykli_kk d30 on d30.koodi = d6.hakukohteen_tutkinnon_taso_kk_sykli
left join dw.d_tutkinnon_taso_kk d31 on d31.koodi = d6.hakukohteen_tutkinnon_taso_kk
left join dw.d_kausi d32b on d32b.koodi=d32.kausi
--
left join sa.sa_odw_hakeneet_valijoin hvj on hvj.HakemusOid = f.HakemusOid
--
WHERE d16.koulutuksen_alkamisvuosi > 2014
;

DROP TABLE IF EXISTS #valittuEkanKoulutusalalle1
;

DROP TABLE IF EXISTS sa.sa_hakukohde_taso_sykli_TEMP
;

CREATE NONCLUSTERED INDEX [NonClusteredIndex-henkiloOid_hakukohde_haku] ON [dw].[f_haku_ja_valinta_hakeneet_korkea_aste]
(
	[henkilo_oid] ASC,
	[d_haku_id] ASC,
	[d_hakukohde_id] ASC
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
;


GO


