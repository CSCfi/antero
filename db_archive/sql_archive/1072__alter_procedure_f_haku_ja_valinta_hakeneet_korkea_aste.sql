USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_haku_ja_valinta_hakeneet_korkea_aste]    Script Date: 14.12.2017 14:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dw].[p_lataa_f_haku_ja_valinta_hakeneet_korkea_aste] AS


TRUNCATE TABLE dw.f_haku_ja_valinta_hakeneet_korkea_aste

INSERT INTO dw.f_haku_ja_valinta_hakeneet_korkea_aste (

henkilo_oid,
hakemus_oid,
d_sukupuoli_id,
d_kieli_aidinkieli_id,
d_ika_id,
d_alueluokitus_kotipaikka_id,
d_maatjavaltiot_kansalaisuus_id,
toisen_asteen_koulutuksen_suoritusvuosi,
pohjakoulutuksen_paattovuosi,
d_pohjakoulutuskk_id,
d_kytkin_pohjakoulutuskk_ulkomaat_id,
ensikertainen_hakija,
haku_amk_yo,
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
hakukohteen_tutkinnon_taso_kk_sykli,
hakukohteen_tutkinnon_taso_kk,
d_kieli_koulutus_id,
d_opintojen_laajuus_id,
valinnan_tila,
vastaanoton_tila,
ilmoittautumisen_tila,
d_hakukohde_ensisijainen_id,
d_koulutus_ensisijainen_hakukohde_id,
d_hakukohde_toinen_hakukohde_id,
d_koulutus_toinen_hakukohde_id,
d_hakukohde_kolmas_hakukohde_id,
d_koulutus_kolmas_hakukohde_id,
d_hakukohde_neljas_hakukohde_id,
d_koulutus_neljas_hakukohde__id,
d_hakukohde_viides_hakukohde_id,
d_koulutus_viides_hakukohde_id,
d_hakukohde_kuudes_hakukohde_id,
d_koulutus_kuudes_hakukohde_id,
loadtime,
source,
username


) 

SELECT
f.HenkiloOID as henkilo_oid,
f.HakemusOid as hakemus_oid,
coalesce(d1.id,'-1') as d_sukupuoli_id,
coalesce(d2.id,'-1') as d_kieli_aidinkieli_id,
coalesce(d5.id,'-1') as d_ika_id,
coalesce(d3.id,'-1') as d_alueluokitus_kotipaikka_id,
coalesce(d4.id,'-1') as d_maatjavaltiot_kansalaisuus_id,
coalesce(d28.max_ToisenAsteenKoulutuksenSuoritusvuosi,'Tieto puuttuu') as toisen_asteen_koulutuksen_suoritusvuosi,
case f.PohjakoulutuksenSuoritusvuosi when '0' then 'Tieto puuttuu' else cast(f.PohjakoulutuksenSuoritusvuosi as nvarchar) end as pohjakoulutuksen_paattovuosi,
coalesce(d7.id,'-1') as d_pohjakoulutuskk_id,
coalesce(d9.id,'-1') as d_kytkin_pohjakoulutuskk_ulkomaat_id,
case f.ensikertalainen when 1 then 'Ensikertainen hakija' when 0 then 'Ei ensikertainen hakija ' else 'Tuntematon' end as ensikertainen_hakija,
case f.Yo_Amk_YoAmk when 1 then 'Hakenut vain yliopistokoulutukseen' when 2 then 'Hakenut vain ammattikorkeakoulutukseen' when 3 then 'Hakenut yliopisto- ja ammattikorkeakoulutukseen' else 'Tieto puuttuu' end as haku_amk_yo,
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
d6.hakukohteen_tutkinnon_taso_kk_sykli,
d6.hakukohteen_tutkinnon_taso_kk,
coalesce(d20.id,'-1') as d_kieli_koulutus_id,
coalesce(d27.id,'-1') as d_opintojen_laajuus_id,
f.ValinnanTila as valinnan_tila,
f.VastaanotonTila as vastaanoton_tila,
f.IlmoittautumisenTila as ilmoittautumisen_tila,
coalesce(d21b.id,'-1') as d_hakukohde_ensisijainen_id,
coalesce(d21e.id,'-1') as d_koulutus_ensisijainen_hakukohde_id,
coalesce(d22b.id,'-1') AS d_hakukohde_toinen_hakukohde_id,
coalesce(d22e.id,'-1') as d_koulutus_toinen_hakukohde_id,
coalesce(d23b.id,'-1') AS d_hakukohde_kolmas_hakukohde_id,
coalesce(d23e.id,'-1') as d_koulutus_kolmas_hakukohde_id,
coalesce(d24b.id,'-1') AS d_hakukohde_neljas_hakukohde_id,
coalesce(d24e.id,'-1') as d_koulutus_neljas_hakukohde__id,
coalesce(d25b.id,'-1') AS d_hakukohde_viides_hakukohde_id,
coalesce(d25e.id,'-1') as d_koulutus_viides_hakukohde_id,
coalesce(d26b.id,'-1') AS d_hakukohde_kuudes_hakukohde_id,
coalesce(d26e.id,'-1') as d_koulutus_kuudes_hakukohde_id,
getdate(),
'ETL: p_lataa_f_haku_ja_valinta_hakeneet_korkea_aste' AS source,
suser_name()

FROM [sa].[sa_odw_hakeneet] f
left join dw.d_sukupuoli d1 on d1.sukupuoli_koodi=f.SukupuoliKoodi
left join dw.d_kieli d2 on d2.kieli_koodi=f.AidinkieliKoodi
left join dw.d_alueluokitus d3 on d3.alueluokitus_avain='kunta_'+f.KotikuntaKoodi
left join VipunenTK.dbo.d_valtio d4 on d4.maa_koodi=right('00'+cast(f.KansalaisuusKoodi as varchar),3)--join Vipusen kantaan koska sieltä saa eu- ja eta-maa -tiedot
left join dw.d_ika d5 on d5.ika_avain=f.Ika
left join sa.v_hakukohde_taso_sykli d6 on d6.hakukohde_oid=f.HakukohdeOID
left join dw.d_pohjakoulutus d7 on d7.koodi=f.PohjakoulutusKKLomakeKoodi
left join dw.d_hakuaika d8 on d8.hakuaikaId=f.HakuaikaId
left join dw.d_kytkin d9 on d9.kytkin_koodi=f.PohjakoulutusKKUlkomaat
left join dw.d_haku d10 on d10.haku_oid=f.HakuOid
left join dw.d_hakukohde d11 on d11.oid=f.HakukohdeOID
left join dw.d_organisaatioluokitus d12 ON d12.organisaatio_oid = f.KoulutusToimijaOID
left join dw.d_organisaatioluokitus d13 ON d13.organisaatio_oid = f.OppilaitosOID
left join dw.d_organisaatioluokitus d14 ON d14.organisaatio_oid = f.ToimipisteOID
left join dw.d_alueluokitus d15 on d15.alueluokitus_avain='kunta_'+f.OrganisaationKuntaKoodi
left join sa.sa_hakukohde_koulutus d16 on d16.hakukohde_oid=f.HakukohdeOID and hakukohdekoulutus_nro=1
left join dw.d_kausi d17 on d17.koodi=d16.koulutuksen_alkamiskausi
left join dw.d_koulutusluokitus d18 on d18.koulutusluokitus_koodi=d16.hakukohdekoulutus_koodi
left join sa.sa_hakukohde_kielet d19 on d19.hakukohde_oid=f.HakukohdeOID
left join dw.d_kieli d20 on d20.kieli_koodi=d19.kieli_avain
left join sa.sa_hakeneet_kk_hakutoiveet d21 on d21.HakemusOid=f.HakemusOid
left join dw.d_hakukohde d21b on d21b.oid=d21.HakukohdeOID1
left join sa.sa_hakukohde_koulutus d21c on d21c.hakukohde_oid=d21.HakukohdeOID1 and d21c.hakukohdekoulutus_nro=1
left join dw.d_koulutusluokitus d21e on d21e.koulutusluokitus_koodi=d21c.hakukohdekoulutus_koodi
left join dw.d_hakukohde d22b on d22b.oid=d21.HakukohdeOID2
left join sa.sa_hakukohde_koulutus d22c on d22c.hakukohde_oid=d21.HakukohdeOID2 and d22c.hakukohdekoulutus_nro=1
left join dw.d_koulutusluokitus d22e on d22e.koulutusluokitus_koodi=d22c.hakukohdekoulutus_koodi
left join dw.d_hakukohde d23b on d23b.oid=d21.HakukohdeOID3
left join sa.sa_hakukohde_koulutus d23c on d23c.hakukohde_oid=d21.HakukohdeOID3 and d23c.hakukohdekoulutus_nro=1
left join dw.d_koulutusluokitus d23e on d23e.koulutusluokitus_koodi=d23c.hakukohdekoulutus_koodi
left join dw.d_hakukohde d24b on d24b.oid=d21.HakukohdeOID4
left join sa.sa_hakukohde_koulutus d24c on d24c.hakukohde_oid=d21.HakukohdeOID4 and d24c.hakukohdekoulutus_nro=1 
left join dw.d_koulutusluokitus d24e on d24e.koulutusluokitus_koodi=d24c.hakukohdekoulutus_koodi
left join dw.d_hakukohde d25b on d25b.oid=d21.HakukohdeOID5
left join sa.sa_hakukohde_koulutus d25c on d25c.hakukohde_oid=d21.HakukohdeOID5 and d25c.hakukohdekoulutus_nro=1 
left join dw.d_koulutusluokitus d25e on d25e.koulutusluokitus_koodi=d25c.hakukohdekoulutus_koodi
left join dw.d_hakukohde d26b on d26b.oid=d21.HakukohdeOID6
left join sa.sa_hakukohde_koulutus d26c on d26c.hakukohde_oid=d21.HakukohdeOID6 and d26c.hakukohdekoulutus_nro=1
left join dw.d_koulutusluokitus d26e on d26e.koulutusluokitus_koodi=d26c.hakukohdekoulutus_koodi
left join dw.d_opintojenlaajuus d27 on d27.koodi=NULLIF(d16.laajuus_koodi,'')
left join sa.sa_hakeneet_kk_pohjakoulutus d28 on d28.hakemusoid=f.HakemusOid

where d10.korkeakouluhaku=1





		
		




		
		