USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_haku_ja_valinta_hakeneet_korkea_aste_hakutoiveet]    Script Date: 28.9.2022 10:21:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dw].[p_lataa_f_haku_ja_valinta_hakeneet_korkea_aste_hakutoiveet] AS

--indeksit
IF EXISTS (SELECT * FROM sys.indexes WHERE name='NC__f_haku_ja_valinta_hakeneet_korkea_aste_hakutoiveet' AND object_id = OBJECT_ID('dw.f_haku_ja_valinta_hakeneet_korkea_aste_hakutoiveet'))
BEGIN
	DROP INDEX [NC__f_haku_ja_valinta_hakeneet_korkea_aste_hakutoiveet] ON [dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakutoiveet]
END

TRUNCATE TABLE dw.f_haku_ja_valinta_hakeneet_korkea_aste_hakutoiveet

INSERT INTO dw.f_haku_ja_valinta_hakeneet_korkea_aste_hakutoiveet (

	 [henkilo_oid]
	,[hakemus_oid]
	,[hakutoive]
	,[d_hakukohde_id]
	,[d_organisaatio_koulutuksen_jarjestaja_id]
	,[d_organisaatio_oppilaitos_id]
	,[d_organisaatio_toimipiste_id]
	,[d_alueluokitus_hakukohde_id]
	,[d_koulutusluokitus_hakukohde_id]
	,[d_tutkinnon_aloitussykli_kk_id]
	,[d_tutkinnon_taso_kk_id]
	,[d_kieli_koulutus_id]
	,[d_opintojen_laajuus_id]
	,[d_hakukohde_ensisijainen_id]
	,[d_koulutus_ensisijainen_hakukohde_id]
	,[d_organisaatioluokitus_ensisijainen_hakukohde_id]
	,[d_tutkinnon_aloitussykli_ensisijainen_hakukohde_id]
	,[d_hakukohde_toinen_hakukohde_id]
	,[d_koulutus_toinen_hakukohde_id]
	,[d_organisaatioluokitus_toinen_hakukohde_id]
	,[d_tutkinnon_aloitussykli_toinen_hakukohde_id]
	,[d_hakukohde_kolmas_hakukohde_id]
	,[d_koulutus_kolmas_hakukohde_id]
	,[d_organisaatioluokitus_kolmas_hakukohde_id]
	,[d_tutkinnon_aloitussykli_kolmas_hakukohde_id]
	,[d_hakukohde_neljas_hakukohde_id]
	,[d_koulutus_neljas_hakukohde__id]
	,[d_organisaatioluokitus_neljas_hakukohde_id]
	,[d_tutkinnon_aloitussykli_neljas_hakukohde_id]
	,[d_hakukohde_viides_hakukohde_id]
	,[d_koulutus_viides_hakukohde_id]
	,[d_organisaatioluokitus_viides_hakukohde_id]
	,[d_tutkinnon_aloitussykli_viides_hakukohde_id]
	,[d_hakukohde_kuudes_hakukohde_id]
	,[d_koulutus_kuudes_hakukohde_id]
	,[d_organisaatioluokitus_kuudes_hakukohde_id]
	,[d_tutkinnon_aloitussykli_kuudes_hakukohde_id]
	--,[d_valintatapajono_id]
	--,[valintatapajono_nimi]
	--,[kokonaispisteet]
	,[valinnan_tila]
	,[vastaanoton_tila]
	,[ilmoittautumisen_tila]
	,[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_id]
	,[loadtime]
	,[source]
	,[username]
) 

SELECT distinct
f.HenkiloOID as henkilo_oid,
f.HakemusOid as hakemus_oid,
f.HakutoiveNumero as hakutoive,
coalesce(d11.id,'-1') as d_hakukohde_id,
coalesce(d12.id,'-1') as d_organisaatio_koulutuksen_jarjestaja_id,
coalesce(d13.id,'-1') as d_organisaatio_oppilaitos_id,
coalesce(d14.id,'-1') as d_organisaatio_toimipiste_id,
coalesce(d15.id,'-1') as d_alueluokitus_hakukohde_id,
coalesce(d18.id,'-1') as d_koulutusluokitus_hakukohde_id,
coalesce(d30.id,'-1') as d_tutkinnon_aloitussykli_kk,
coalesce(d31.id,'-1') as d_tutkinnon_taso_kk,
coalesce(d20.id,'-1') as d_kieli_koulutus_id,
coalesce(d27.id,'-1') as d_opintojen_laajuus_id,
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
coalesce(d26g.id,'-1') as d_tutkinnon_aloitussykli_kuudes_hakukohde_id,
--coalesce(d34.id,'-1') as d_valintatapajono_id,
--d33.JonoNimi,
--d33.Kokonaispisteet as kokonaispisteet, 
f.ValinnanTila as valinnan_tila,
f.VastaanotonTila as vastaanoton_tila,
f.IlmoittautumisenTila as ilmoittautumisen_tila,
f2.id,
getdate(),
'ETL: p_lataa_f_haku_ja_valinta_hakeneet_korkea_aste' AS source,
suser_name()

FROM [sa].[sa_odw_hakeneet] f
left join dw.d_haku d10 on d10.haku_oid = f.HakuOid
left join dw.d_hakuaika_kouta d1 on d1.haku_oid = d10.haku_oid
left join dw.f_haku_ja_valinta_hakeneet_korkea_aste_hakijat f2 on f2.hakemus_oid = f.HakemusOid and (f2.hakuaikaId = f.HakuaikaId or d1.id = f2.d_hakuaika_kouta_id)
left join sa.v_hakukohde_taso_sykli d6 on d6.hakukohde_oid = f.HakukohdeOID
left join dw.d_hakukohde d11 on d11.oid = f.HakukohdeOID
left join dw.d_organisaatioluokitus d12 ON d12.organisaatio_oid = f.KoulutusToimijaOID
left join dw.d_organisaatioluokitus d13 ON d13.organisaatio_oid = f.OppilaitosOID
left join dw.d_organisaatioluokitus d14 ON d14.organisaatio_oid = f.ToimipisteOID
left join dw.d_alueluokitus d15 on d15.alueluokitus_avain = 'kunta_' + f.OrganisaationKuntaKoodi
left join sa.sa_hakukohde_koulutus d16 on d16.hakukohde_oid = f.HakukohdeOID and hakukohdekoulutus_nro = 1
left join dw.d_koulutusluokitus d18 on d18.koulutusluokitus_koodi = d16.hakukohdekoulutus_koodi
left join sa.sa_hakukohde_kielet d19 on d19.hakukohde_oid = f.HakukohdeOID
left join dw.d_kieli d20 on d20.kieli_koodi = d19.kieli_avain
left join sa.sa_hakeneet_kk_hakutoiveet d21 on d21.HakemusOid = f.HakemusOid
--1
left join dw.d_hakukohde d21b on d21b.oid = d21.HakukohdeOID1
left join sa.sa_hakukohde_koulutus d21c on d21c.hakukohde_oid = d21.HakukohdeOID1 and d21c.hakukohdekoulutus_nro = 1
left join dw.d_koulutusluokitus d21e on d21e.koulutusluokitus_koodi = d21c.hakukohdekoulutus_koodi
left join dw.d_organisaatioluokitus d21f on d21f.organisaatio_oid = d21.organisaatioOID1
left join sa.v_hakukohde_taso_sykli d21d on d21d.hakukohde_oid = d21.hakukohdeOID1
left join dw.d_tutkinnon_aloitussykli_kk d21g on d21g.koodi = d21d.hakukohteen_tutkinnon_taso_kk_sykli
--2
left join dw.d_hakukohde d22b on d22b.oid = d21.HakukohdeOID2
left join sa.sa_hakukohde_koulutus d22c on d22c.hakukohde_oid = d21.HakukohdeOID2 and d22c.hakukohdekoulutus_nro = 1
left join dw.d_koulutusluokitus d22e on d22e.koulutusluokitus_koodi = d22c.hakukohdekoulutus_koodi
left join dw.d_organisaatioluokitus d22f on d22f.organisaatio_oid = d21.organisaatioOID2
left join sa.v_hakukohde_taso_sykli d22d on d22d.hakukohde_oid = d21.hakukohdeOID2
left join dw.d_tutkinnon_aloitussykli_kk d22g on d22g.koodi = d22d.hakukohteen_tutkinnon_taso_kk_sykli
--3
left join dw.d_hakukohde d23b on d23b.oid = d21.HakukohdeOID3
left join sa.sa_hakukohde_koulutus d23c on d23c.hakukohde_oid = d21.HakukohdeOID3 and d23c.hakukohdekoulutus_nro = 1
left join dw.d_koulutusluokitus d23e on d23e.koulutusluokitus_koodi = d23c.hakukohdekoulutus_koodi
left join dw.d_organisaatioluokitus d23f on d23f.organisaatio_oid = d21.organisaatioOID3
left join sa.v_hakukohde_taso_sykli d23d on d23d.hakukohde_oid = d21.hakukohdeOID3
left join dw.d_tutkinnon_aloitussykli_kk d23g on d23g.koodi = d23d.hakukohteen_tutkinnon_taso_kk_sykli
--4
left join dw.d_hakukohde d24b on d24b.oid = d21.HakukohdeOID4
left join sa.sa_hakukohde_koulutus d24c on d24c.hakukohde_oid = d21.HakukohdeOID4 and d24c.hakukohdekoulutus_nro = 1 
left join dw.d_koulutusluokitus d24e on d24e.koulutusluokitus_koodi = d24c.hakukohdekoulutus_koodi
left join dw.d_organisaatioluokitus d24f on d24f.organisaatio_oid = d21.organisaatioOID4
left join sa.v_hakukohde_taso_sykli d24d on d24d.hakukohde_oid = d21.hakukohdeOID4
left join dw.d_tutkinnon_aloitussykli_kk d24g on d24g.koodi = d24d.hakukohteen_tutkinnon_taso_kk_sykli
--5
left join dw.d_hakukohde d25b on d25b.oid = d21.HakukohdeOID5
left join sa.sa_hakukohde_koulutus d25c on d25c.hakukohde_oid = d21.HakukohdeOID5 and d25c.hakukohdekoulutus_nro = 1 
left join dw.d_koulutusluokitus d25e on d25e.koulutusluokitus_koodi = d25c.hakukohdekoulutus_koodi
left join dw.d_organisaatioluokitus d25f on d25f.organisaatio_oid = d21.organisaatioOID5
left join sa.v_hakukohde_taso_sykli d25d on d25d.hakukohde_oid = d21.hakukohdeOID5
left join dw.d_tutkinnon_aloitussykli_kk d25g on d25g.koodi = d25d.hakukohteen_tutkinnon_taso_kk_sykli
--6
left join dw.d_hakukohde d26b on d26b.oid = d21.HakukohdeOID6
left join sa.sa_hakukohde_koulutus d26c on d26c.hakukohde_oid = d21.HakukohdeOID6 and d26c.hakukohdekoulutus_nro = 1
left join dw.d_koulutusluokitus d26e on d26e.koulutusluokitus_koodi = d26c.hakukohdekoulutus_koodi
left join dw.d_organisaatioluokitus d26f on d26f.organisaatio_oid = d21.organisaatioOID6
left join sa.v_hakukohde_taso_sykli d26d on d26d.hakukohde_oid = d21.hakukohdeOID6
left join dw.d_tutkinnon_aloitussykli_kk d26g on d26g.koodi = d26d.hakukohteen_tutkinnon_taso_kk_sykli
--
left join dw.d_opintojenlaajuus d27 on d27.koodi = NULLIF(d16.laajuus_koodi,'')
left join dw.d_tutkinnon_aloitussykli_kk d30 on d30.koodi = d6.hakukohteen_tutkinnon_taso_kk_sykli
left join dw.d_tutkinnon_taso_kk d31 on d31.koodi = d6.hakukohteen_tutkinnon_taso_kk
--
--left join sa.sa_odw_valintatapajono d33 on d33.HakuOID = f.HakuOid and d33.HakukohdeOID = f.HakukohdeOID and d33.HenkiloOID = f.HenkiloOID
--left join dw.d_valintatapajono d34 on d34.koodi = d33.JonoTyyppi

WHERE d10.korkeakouluhaku = 1



CREATE NONCLUSTERED INDEX [NC__f_haku_ja_valinta_hakeneet_korkea_aste_hakutoiveet] ON [dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakutoiveet]
(
	[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_id] ASC
)
INCLUDE ( 	[hakutoive],
	[d_hakukohde_id],
	[d_organisaatio_koulutuksen_jarjestaja_id],
	[d_organisaatio_oppilaitos_id],
	[d_organisaatio_toimipiste_id],
	[d_alueluokitus_hakukohde_id],
	[d_koulutusluokitus_hakukohde_id],
	[d_kieli_koulutus_id],
	[d_opintojen_laajuus_id],
	[d_hakukohde_ensisijainen_id],
	[d_koulutus_ensisijainen_hakukohde_id],
	[d_organisaatioluokitus_ensisijainen_hakukohde_id],
	[d_tutkinnon_aloitussykli_ensisijainen_hakukohde_id],
	[d_hakukohde_toinen_hakukohde_id],
	[d_koulutus_toinen_hakukohde_id],
	[d_organisaatioluokitus_toinen_hakukohde_id],
	[d_tutkinnon_aloitussykli_toinen_hakukohde_id],
	[d_hakukohde_kolmas_hakukohde_id],
	[d_koulutus_kolmas_hakukohde_id],
	[d_organisaatioluokitus_kolmas_hakukohde_id],
	[d_tutkinnon_aloitussykli_kolmas_hakukohde_id],
	[d_hakukohde_neljas_hakukohde_id],
	[d_koulutus_neljas_hakukohde__id],
	[d_organisaatioluokitus_neljas_hakukohde_id],
	[d_tutkinnon_aloitussykli_neljas_hakukohde_id],
	[d_hakukohde_viides_hakukohde_id],
	[d_koulutus_viides_hakukohde_id],
	[d_organisaatioluokitus_viides_hakukohde_id],
	[d_tutkinnon_aloitussykli_viides_hakukohde_id],
	[d_hakukohde_kuudes_hakukohde_id],
	[d_koulutus_kuudes_hakukohde_id],
	[d_organisaatioluokitus_kuudes_hakukohde_id],
	[d_tutkinnon_aloitussykli_kuudes_hakukohde_id],
	[d_tutkinnon_aloitussykli_kk_id],
	[d_tutkinnon_taso_kk_id],
	[valinnan_tila],
	[vastaanoton_tila],
	[ilmoittautumisen_tila]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


GO

USE [ANTERO]