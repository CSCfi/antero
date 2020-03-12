USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_haku_ja_valinta_hakeneet_toinen_aste]    Script Date: 12.3.2020 10:18:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dw].[p_lataa_f_haku_ja_valinta_hakeneet_toinen_aste] AS

--EXEC [sa].[p_lataa_sa_hakukohde_kielet]
--EXEC [sa].[p_lataa_sa_hakukohde_koulutus]

TRUNCATE TABLE dw.f_haku_ja_valinta_hakeneet_toinen_aste

INSERT INTO dw.f_haku_ja_valinta_hakeneet_toinen_aste (
henkilo_oid,
hakemus_oid,
d_sukupuoli_id,
d_kieli_aidinkieli_id,
d_ika_id,
d_alueluokitus_kotipaikka_id,
d_maatjavaltiot_kansalaisuus_id,
d_organisaatio_lahtokoulu_koulutuksen_jarjestaja_id,
d_organisaatio_lahtokoulu_oppilaitos_id,
d_alueluokitus_lahtokoulun_kunta_id,
paattoluokka,
pohjakoulutuksen_paattovuosi,
d_pohjakoulutus_id,
d_kytkin_kiinnostunut_oppisopimuksesta_id,
koulutuksen_alkamisvuosi,
d_kausi_koulutuksen_alkamiskausi_id,
d_haku_id,
d_hakukohde_id,
hakutoive,
d_organisaatio_koulutuksen_jarjestaja_id,
d_organisaatio_oppilaitos_id,
d_organisaatio_toimipiste_id,
d_alueluokitus_hakukohde_id,
d_koulutusluokitus_hakukohde_id,
d_koulutustyyppi_id,
d_kieli_koulutus_id,
d_pohjakoulutusvaatimus_id,
valinnan_tila,
vastaanoton_tila,
ilmoittautumisen_tila,
loadtime,
source,
username
)


SELECT 
f.HenkiloOID as henkilo_oid,
f.HakemusOid as hakemus_oid,
coalesce(d1.id,'-1') as d_sukupuoli_id,
coalesce(d2.id,'-1') as d_kieli_aidinkieli_id,
coalesce(d22.id,'-1') as d_kieli_ika_id,
coalesce(d3.id,'-1') as d_alueluokitus_kotipaikka_id,
coalesce(d4.id,'-1') as d_maatjavaltiot_kansalaisuus_id,
coalesce(
	(case
		when d5a.organisaatio_avain like 'koulutustoimija_%' then d5a.id
		when d5b.organisaatio_avain like 'koulutustoimija_%' then d5b.id
		when d5c.organisaatio_avain like 'koulutustoimija_%' then d5c.id
		when d5d.organisaatio_avain like 'koulutustoimija_%' then d5d.id
	end)
,'-1') as d_organisaatio_lahtokoulu_koulutuksen_jarjestaja_id,
coalesce(
	(case
		when d5a.organisaatio_avain like 'oppilaitos_%' then d5a.id
		when d5b.organisaatio_avain like 'oppilaitos_%' then d5b.id
		when d5c.organisaatio_avain like 'oppilaitos_%' then d5c.id
		when d5d.organisaatio_avain like 'oppilaitos_%' then d5d.id
	end)
,'-1') as d_organisaatio_lahtokoulu_oppilaitos_id,
coalesce(d6.id,'-1') as d_alueluokitus_lahtokoulun_kunta_id,
f.Luokkataso as paattoluokka,
case f.PohjakoulutuksenSuoritusvuosi when '0' then 'Tieto puuttuu' else cast(f.PohjakoulutuksenSuoritusvuosi as nvarchar) end as pohjakoulutuksen_paattovuosi,
coalesce(d7.id,'-1') as d_pohjakoulutus_id,
coalesce(d21.id,'-1') as d_kytkin_kiinnostunut_oppisopimuksesta_id,
d16.koulutuksen_alkamisvuosi,
coalesce(d17.id,'-1') as d_kausi_koulutuksen_alkamiskausi_id,
coalesce(d10.id,'-1') as d_haku_id,
coalesce(d11.id,'-1') as d_hakukohde_id,
f.HakutoiveNumero as hakutoive,
coalesce(d12.id,'-1') as d_organisaatio_koulutuksen_jarjestaja_id,
coalesce(d13.id,'-1') as d_organisaatio_oppilaitos_id,
coalesce(d14.id,'-1') as d_organisaatio_toimipiste_id,
coalesce(d15.id,'-1') as d_alueluokitus_hakukohde_id,
coalesce(d18.id,'-1') as d_koulutusluokitus_hakukohde_id,
coalesce(d23.id,'-1') as d_koulutustyyppi_id,
coalesce(d20.id,'-1') as d_kieli_koulutus_id,
coalesce(d19.id,'-1') as d_pohjakoulutusvaatimus_id,
f.ValinnanTila as valinnan_tila,
f.VastaanotonTila as vastaanoton_tila,
f.IlmoittautumisenTila as ilmoittautumisen_tila,
getdate(),
'ETL: p_lataa_f_haku_ja_valinta_hakeneet_toinen_aste' AS source,
suser_name()

FROM [sa].[sa_odw_hakeneet] f
left join dw.d_sukupuoli d1 on d1.sukupuoli_koodi=f.SukupuoliKoodi
left join dw.d_kieli d2 on d2.kieli_koodi=f.AidinkieliKoodi
left join dw.d_alueluokitus d3 on d3.alueluokitus_avain='kunta_'+f.KotikuntaKoodi
left join dw.d_maatjavaltiot2 d4 on d4.maatjavaltiot2_koodi=right('00'+cast(f.KansalaisuusKoodi as varchar),3)
left join dw.d_organisaatioluokitus d5a on d5a.organisaatio_oid=f.LahtokouluOid  and d5a.organisaatio_avain not like 'tutkimusorganisaatio_%'
left join dw.d_organisaatioluokitus d5b ON d5b.organisaatio_oid = d5a.ylaorganisaatio_oid and d5b.organisaatio_avain not like 'tutkimusorganisaatio_%'
left join dw.d_organisaatioluokitus d5c ON d5c.organisaatio_oid = d5b.ylaorganisaatio_oid and d5c.organisaatio_avain not like 'tutkimusorganisaatio_%'
left join dw.d_organisaatioluokitus d5d ON d5d.organisaatio_oid = d5c.ylaorganisaatio_oid and d5d.organisaatio_avain not like 'tutkimusorganisaatio_%'
left join dw.d_alueluokitus d6 on d6.alueluokitus_avain='kunta_'+f.LahtokoulunKuntaKoodi
left join dw.d_pohjakoulutus d7 on d7.koodi=f.PohjakoulutusKoodi
left join sa.sa_hakukohde_kielet d8 on d8.hakukohde_oid=f.HakukohdeOID
left join dw.d_haku d10 on d10.haku_oid=f.HakuOid
left join dw.d_hakukohde d11 on d11.oid=f.HakukohdeOID
left join dw.d_organisaatioluokitus d12 ON d12.organisaatio_oid = f.KoulutusToimijaOID
left join dw.d_organisaatioluokitus d13 ON d13.organisaatio_oid = f.OppilaitosOID
left join dw.d_organisaatioluokitus d14 ON d14.organisaatio_oid = f.ToimipisteOID
left join dw.d_alueluokitus d15 on d15.alueluokitus_avain='kunta_' + f.OrganisaationKuntaKoodi
left join sa.sa_hakukohde_koulutus d16 on d16.hakukohde_oid=f.HakukohdeOID and d16.hakukohdekoulutus_nro=1
left join dw.d_kausi d17 on d17.koodi=d16.koulutuksen_alkamiskausi
left join dw.d_koulutusluokitus d18 on d18.koulutusluokitus_koodi=d16.hakukohdekoulutus_koodi
left join dw.d_pohjakoulutusvaatimus d19 on d19.koodi=d16.pohjakoulutusvaatimus_koodi
left join dw.d_kieli d20 on d20.kieli_koodi=d8.kieli_avain
left join dw.d_kytkin d21 on d21.kytkin_koodi=f.KiinnostunutOppisopimuksesta
left join dw.d_ika d22 on d22.ika_avain=f.Ika
left join dw.d_koulutustyyppi d23 on d23.koodi=d16.koulutustyyppi_koodi

where d10.korkeakouluhaku=0




