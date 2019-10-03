USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_haku_ja_valinta_aloituspaikat_ja_pistemaarat]    Script Date: 7.12.2017 17:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_haku_ja_valinta_aloituspaikat_ja_pistemaarat]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_haku_ja_valinta_aloituspaikat_ja_pistemaarat] AS' 
END
GO
ALTER PROCEDURE [dw].[p_lataa_f_haku_ja_valinta_aloituspaikat_ja_pistemaarat] AS


TRUNCATE TABLE dw.f_haku_ja_valinta_aloituspaikat_ja_pistemaarat

INSERT INTO dw.f_haku_ja_valinta_aloituspaikat_ja_pistemaarat (
	 
      koulutuksen_alkamisvuosi
	  ,d_kausi_koulutuksen_alkamiskausi_id
	  ,[d_haku_id]
	  ,[d_hakuaika_id]
      ,[d_hakukohde_id]
	  ,[d_organisaatio_koulutuksen_jarjestaja_id]
	  ,[d_organisaatio_oppilaitos_id]
	  ,[d_organisaatio_toimipiste_id]
      ,[d_alueluokitus_hakukohde_id]
      ,[d_koulutusluokitus_hakukohde_id]
	  ,[d_koulutustyyppi_id]
	  ,[hakukohteen_tutkinnon_taso_kk_sykli]
	  ,[hakukohteen_tutkinnon_taso_kk]
      ,[d_kieli_koulutus_id]
	  ,[d_opintojen_laajuus_id]
      ,[d_pohjakoulutusvaatimus_id] 
	  ,[aloituspaikat]
      ,[valintojen_aloituspaikat]
      ,[ensikertalaisten_aloituspaikat]
      ,[alin_laskettuvalintapistemaara]
	  ,loadtime
	  ,source
	  ,username
)


SELECT distinct
d3.koulutuksen_alkamisvuosi,
coalesce(d4.id,'-1'),
coalesce(d11.id,'-1') as d_haku_id,
coalesce(d15.id,'-1') as d_hakuaika_id,
coalesce(d12.id,'-1') as d_hakukohde_id,
coalesce(
	(case
		when d5a.organisaatio_avain like 'koulutustoimija_%' then d5a.id
		when d5b.organisaatio_avain like 'koulutustoimija_%' then d5b.id
		when d5c.organisaatio_avain like 'koulutustoimija_%' then d5c.id
		when d5d.organisaatio_avain like 'koulutustoimija_%' then d5d.id
	end)
,'-1') as d_organisaatio_koulutuksen_jarjestaja_id,
coalesce(
	(case
		when d5a.organisaatio_avain like 'oppilaitos_%' then d5a.id
		when d5b.organisaatio_avain like 'oppilaitos_%' then d5b.id
		when d5c.organisaatio_avain like 'oppilaitos_%' then d5c.id
		when d5d.organisaatio_avain like 'oppilaitos_%' then d5d.id
	end)
,'-1') as d_organisaatio_oppilaitos_id,
coalesce(
	(case
		when d5a.organisaatio_avain like 'toimipiste_%' then d5a.id
		when d5b.organisaatio_avain like 'toimipiste_%' then d5b.id
		when d5c.organisaatio_avain like 'toimipiste_%' then d5c.id
		when d5d.organisaatio_avain like 'toimipiste_%' then d5d.id
	end)
,'-1') as d_organisaatio_toimipiste_id,
coalesce(d6.id,'-1') as d_alueluokitus_hakukohde_id,
coalesce(d7.id,'-1') as d_koulutusluokitus_hakukohde_id,
coalesce(d16.id,'-1') as d_koulutustyyppi_id,
coalesce(d8.hakukohteen_tutkinnon_taso_kk_sykli,'Tieto puuttuu') as hakukohteen_tutkinnon_taso_kk_sykli,
coalesce(d8.hakukohteen_tutkinnon_taso_kk,'Tieto puuttuu') as hakukohteen_tutkinnon_taso_kk,
coalesce(d10.id,'-1') as d_kieli_koulutus_id,
coalesce(d14.id,'-1') as d_opintojen_laajuus_id,
coalesce(d13.id,'-1') as d_pohjakoulutusvaatimus_id,
aloituspaikatLkm as aloituspaikat,
valintojenAloituspaikatLkm as valintojen_aloituspaikat,
ensikertalaistenAloituspaikat as ensikertalaisten_aloituspaikat,
alinValintaPistemaara as alin_laskettuvalintapistemaara,
getdate(),
'ETL: p_lataa_f_haku_ja_valinta_aloituspaikat_ja_pistemaarat' AS source,
suser_name()

FROM [sa].[koulutustarjonta_haku] d1
left join sa.koulutustarjonta_hakukohde d2 on d1.oid=d2.hakuOid
left join sa.sa_hakukohde_koulutus d3 on d3.hakukohde_oid=d2.oid and d3.hakukohdekoulutus_nro=1
left join dw.d_kausi d4 on d4.koodi=d3.koulutuksen_alkamiskausi
left join dw.d_organisaatioluokitus d5a ON d5a.organisaatio_oid = d3.organisaatio_oid
left join dw.d_organisaatioluokitus d5b ON d5b.organisaatio_oid = d5a.ylaorganisaatio_oid
left join dw.d_organisaatioluokitus d5c ON d5c.organisaatio_oid = d5b.ylaorganisaatio_oid
left join dw.d_organisaatioluokitus d5d ON d5d.organisaatio_oid = d5c.ylaorganisaatio_oid
left join dw.d_alueluokitus d6 on d6.alueluokitus_avain='kunta_'+coalesce(d5a.kunta_koodi,d5b.kunta_koodi,d5c.kunta_koodi,d5d.kunta_koodi)
left join dw.d_koulutusluokitus d7 on d7.koulutusluokitus_koodi=d3.hakukohdekoulutus_koodi
left join sa.v_hakukohde_taso_sykli d8 on d8.hakukohde_oid=d2.oid
left join sa.sa_hakukohde_kielet d9 on d9.hakukohde_oid=d2.oid
left join dw.d_kieli d10 on d10.kieli_koodi=d9.kieli_avain
left join dw.d_haku d11 on d11.haku_oid=d1.oid
left join dw.d_hakukohde d12 on d12.oid=d2.oid
left join dw.d_pohjakoulutusvaatimus d13 on d13.koodi=d3.pohjakoulutusvaatimus_koodi
left join dw.d_opintojenlaajuus d14 on d14.koodi=d3.laajuus_koodi
left join dw.d_hakuaika d15 on d15.hakuaikaId=d2.hakuaikaId
left join dw.d_koulutustyyppi d16 on d16.koodi=d3.koulutustyyppi_koodi
where d2.tila='JULKAISTU' and (d1.tila = 'JULKAISTU' OR (d1.tila='VALMIS' AND d11.kohdejoukontarkenne_fi = 'Jatkotutkintohaku'))






GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_haku_ja_valinta_hakeneet_korkea_aste]    Script Date: 7.12.2017 17:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_haku_ja_valinta_hakeneet_korkea_aste]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_haku_ja_valinta_hakeneet_korkea_aste] AS' 
END
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
d_maatjavaltiot_pohjakoulutuksen_maa_kk,
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
coalesce(d9.id,'-1') as d_maatjavaltiot_pohjakoulutuksen_maa_kk,
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
left join dw.d_maatjavaltiot2 d9 on d9.maatjavaltiot2_koodi=f.PohjakoulutuksenMaaKoodi
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





		
		




		
		
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_haku_ja_valinta_hakeneet_toinen_aste]    Script Date: 7.12.2017 17:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_haku_ja_valinta_hakeneet_toinen_aste]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_haku_ja_valinta_hakeneet_toinen_aste] AS' 
END
GO
ALTER PROCEDURE [dw].[p_lataa_f_haku_ja_valinta_hakeneet_toinen_aste] AS


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
left join dw.d_maatjavaltiot2 d9 on d9.maatjavaltiot2_koodi=f.PohjakoulutuksenMaaKoodi
left join dw.d_haku d10 on d10.haku_oid=f.HakuOid
left join dw.d_hakukohde d11 on d11.oid=f.HakukohdeOID
left join dw.d_organisaatioluokitus d12 ON d12.organisaatio_oid = f.KoulutusToimijaOID
left join dw.d_organisaatioluokitus d13 ON d13.organisaatio_oid = f.OppilaitosOID
left join dw.d_organisaatioluokitus d14 ON d14.organisaatio_oid = f.ToimipisteOID
left join dw.d_alueluokitus d15 on d15.alueluokitus_avain='kunta_'+f.OrganisaationKuntaKoodi
left join sa.sa_hakukohde_koulutus d16 on d16.hakukohde_oid=f.HakukohdeOID and d16.hakukohdekoulutus_nro=1
left join dw.d_kausi d17 on d17.koodi=d16.koulutuksen_alkamiskausi
left join dw.d_koulutusluokitus d18 on d18.koulutusluokitus_koodi=d16.hakukohdekoulutus_koodi
left join dw.d_pohjakoulutusvaatimus d19 on d19.koodi=d16.pohjakoulutusvaatimus_koodi
left join dw.d_kieli d20 on d20.kieli_koodi=d8.kieli_avain
left join dw.d_kytkin d21 on d21.kytkin_koodi=f.KiinnostunutOppisopimuksesta
left join dw.d_ika d22 on d22.ika_avain=f.Ika
left join dw.d_koulutustyyppi d23 on d23.koodi=d16.koulutustyyppi_koodi
where d10.korkeakouluhaku=0





GO
/****** Object:  StoredProcedure [dw].[p_lataa_haku_ja_valinta]    Script Date: 7.12.2017 17:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_haku_ja_valinta]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_haku_ja_valinta] AS' 
END
GO

ALTER PROCEDURE [dw].[p_lataa_haku_ja_valinta] AS

--valmistelevat ajot
EXEC [sa].[p_lataa_sa_hakeneet_kk_hakutoiveet]
EXEC [sa].[p_lataa_sa_hakeneet_kk_pohjakoulutus]
EXEC [sa].[p_lataa_sa_hakukohde_koulutus]
EXEC [sa].[p_lataa_sa_hakukohde_kielet]

--dimensiot
EXEC [dw].[p_lataa_d_haku]
EXEC [dw].[p_lataa_d_hakuaika]
EXEC [dw].[p_lataa_d_hakukohde]
EXEC [dw].[p_lataa_d_kieli]
EXEC [dw].[p_lataa_d_koulutustyyppi]
EXEC [dw].[p_lataa_d_opintojenlaajuus]
EXEC [dw].[p_lataa_d_pohjakoulutus]
EXEC [dw].[p_lataa_d_pohjakoulutusvaatimus]

--faktat
EXEC [dw].[p_lataa_f_haku_ja_valinta_aloituspaikat_ja_pistemaarat]
EXEC [dw].[p_lataa_f_haku_ja_valinta_hakeneet_toinen_aste]
EXEC [dw].[p_lataa_f_haku_ja_valinta_hakeneet_korkea_aste]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_sa_hakeneet_kk_hakutoiveet]    Script Date: 7.12.2017 17:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_sa_hakeneet_kk_hakutoiveet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_sa_hakeneet_kk_hakutoiveet] AS' 
END
GO
ALTER PROCEDURE [sa].[p_lataa_sa_hakeneet_kk_hakutoiveet] as

truncate table sa.sa_hakeneet_kk_hakutoiveet 

insert into sa.sa_hakeneet_kk_hakutoiveet 

select 
	hakemusoid
	,[1] as hakukohdeOID1
	,[2] as hakukohdeOID2
	,[3] as hakukohdeOID3
	,[4] as hakukohdeOID4
	,[5] as hakukohdeOID5
	,[6] as hakukohdeOID6

from 
(
	select 
		HakemusOid
		,HakukohdeOID
		,HakutoiveNumero
	from sa.sa_odw_hakeneet f
	where f.koulutusaste in ('1','2') 
) as query
PIVOT (MAX(HakukohdeOID) FOR HakutoiveNumero IN ([1],[2],[3],[4],[5],[6]))
AS PIVOTTABLE;


GO
/****** Object:  StoredProcedure [sa].[p_lataa_sa_hakeneet_kk_pohjakoulutus]    Script Date: 7.12.2017 17:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_sa_hakeneet_kk_pohjakoulutus]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_sa_hakeneet_kk_pohjakoulutus] AS' 
END
GO

ALTER PROCEDURE [sa].[p_lataa_sa_hakeneet_kk_pohjakoulutus] as

truncate table sa.sa_hakeneet_kk_pohjakoulutus 

insert into sa.sa_hakeneet_kk_pohjakoulutus 
(
hakemusoid
,max_ToisenAsteenKoulutuksenSuoritusvuosi
)

select 
	HakemusOid
	,max(ToisenAsteenKoulutuksenSuoritusvuosi) as max_ToisenAsteenKoulutuksenSuoritusvuosi

from ANTERO.sa.sa_odw_hakeneet
where PohjakoulutusKKLomakeKoodi in (
'pohjakoulutus_yo_ulkomainen'
,'pohjakoulutus_amt'
,'pohjakoulutus_yo_kansainvalinen_suomessa'
,'pohjakoulutus_yo_ammatillinen'
,'pohjakoulutus_yo'
,'pohjakoulutus_am'
,'pohjakoulutus_ulk'
)
group by HakemusOid



GO
/****** Object:  StoredProcedure [sa].[p_lataa_sa_hakukohde_kielet]    Script Date: 7.12.2017 17:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_sa_hakukohde_kielet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_sa_hakukohde_kielet] AS' 
END
GO









ALTER PROCEDURE [sa].[p_lataa_sa_hakukohde_kielet] as 

TRUNCATE TABLE sa.sa_hakukohde_kielet

INSERT INTO sa.sa_hakukohde_kielet

SELECT 
	hakukohde_oid
	,UPPER([1]) as kieli1_koodi
	,UPPER([2]) as kieli2_koodi
	,UPPER([3]) as kieli3_koodi
	,kieli_avain = 

		CASE 
			/* 2 kielikoodia per hakukohde */
			WHEN [1] < [2] AND [3] IS NULL THEN UPPER(concat([1], [2])) 
			WHEN [2] < [1] AND [3] IS NULL THEN UPPER(concat([2], [1]))

			/* 3 kielikoodia per hakukohde */
			WHEN [1] < [2] AND [1] < [3] and [2] < [3] THEN UPPER(concat([1], [2], [3]))
			WHEN [1] < [2] AND [1] < [3] and [3] < [2] THEN UPPER(concat([1], [3], [2]))

			WHEN [2] < [1] AND [2] < [3] and [1] < [3] THEN UPPER(concat([2], [1], [3]))
			WHEN [2] < [1] AND [2] < [3] and [3] < [1] THEN UPPER(concat([2], [3], [1]))

			WHEN [3] < [2] AND [3] < [1] and [1] < [2] THEN UPPER(concat([3], [1], [2]))
			WHEN [3] < [2] AND [3] < [1] and [2] < [1] THEN UPPER(concat([3], [1], [2]))

			ELSE UPPER([1])

		END


FROM (

SELECT distinct
	oid as hakukohde_oid
	,REPLACE(LTRIM(REPLACE(REPLACE(REPLACE(REPLACE(pilkotut.value, '"', ''), '[',''),']',''), ', ',',')),'kieli_','') as kieli_koodi
	,ROW_NUMBER()OVER(PARTITION BY oid ORDER BY LTRIM(REPLACE(REPLACE(REPLACE(REPLACE(pilkotut.value, '"', ''), '[',''),']',''), ', ',','))) as kieli_nro
FROM [ANTERO].[sa].[koulutustarjonta_hakukohde]

cross apply string_split(cast(opetusKielet as varchar(max)), ',') pilkotut

group by oid,LTRIM(REPLACE(REPLACE(REPLACE(REPLACE(pilkotut.value, '"', ''), '[',''),']',''), ', ',','))
) s1

PIVOT
(
min(kieli_koodi) FOR kieli_nro IN ([1],[2],[3])
)
AS PIVOTTABLE;








GO
/****** Object:  StoredProcedure [sa].[p_lataa_sa_hakukohde_koulutus]    Script Date: 7.12.2017 17:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_sa_hakukohde_koulutus]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_sa_hakukohde_koulutus] AS' 
END
GO






ALTER PROCEDURE [sa].[p_lataa_sa_hakukohde_koulutus] as 

TRUNCATE TABLE [sa].[sa_hakukohde_koulutus]

INSERT INTO [sa].[sa_hakukohde_koulutus]
(
hakukohde_oid
,koulutuksen_alkamisvuosi
,koulutuksen_alkamiskausi
,hakukohdekoulutus_oid
,hakukohdekoulutus_koodi
,koulutustyyppi_koodi
,laajuus_koodi
,pohjakoulutusvaatimus_koodi
,organisaatio_oid
,hakukohdekoulutus_nro

)

SELECT 
	f.hakukohde_oid
	,f.koulutuksen_alkamisvuosi
	,f.koulutuksen_alkamiskausi
	,f.hakukohdekoulutus_oid
	,k.koulutuskoodi_arvo as hakukohdekoulutus_koodi
	,k.koulutustyyppi_arvo as koulutustyyppi_koodi
	,opintojenLaajuusarvo_arvo as laajuus_koodi
	,pohjakoulutusvaatimus_arvo as pohjakoulutusvaatimus_koodi
	,f.organisaatio_oid
	,f.hakukohdekoulutus_nro
	
FROM

(
SELECT distinct
	oid as hakukohde_oid
	,koulutuksenAlkamisvuosi as koulutuksen_alkamisvuosi
	,substring(koulutuksenAlkamiskausiUri,charindex('_',koulutuksenAlkamiskausiUri)+1,1) as koulutuksen_alkamiskausi
	,LTRIM(REPLACE(REPLACE(REPLACE(REPLACE(pilkotut.value, '"', ''), '[',''),']',''), ', ',',')) as hakukohdekoulutus_oid
	,LTRIM(REPLACE(REPLACE(REPLACE(REPLACE(pilkotut2.value, '"', ''), '[',''),']',''), ', ',',')) as organisaatio_oid
	,ROW_NUMBER()OVER(PARTITION BY oid ORDER BY LTRIM(REPLACE(REPLACE(REPLACE(REPLACE(pilkotut.value, '"', ''), '[',''),']',''), ', ',','))) as hakukohdekoulutus_nro
FROM [ANTERO].[sa].[koulutustarjonta_hakukohde]

cross apply string_split(cast(hakukohdekoulutusoids as varchar(max)), ',') pilkotut
cross apply string_split(cast(tarjoajaOids as varchar(max)), ',') pilkotut2

group by 
oid
,LTRIM(REPLACE(REPLACE(REPLACE(REPLACE(pilkotut.value, '"', ''), '[',''),']',''), ', ',','))
,LTRIM(REPLACE(REPLACE(REPLACE(REPLACE(pilkotut2.value, '"', ''), '[',''),']',''), ', ',','))
,koulutuksenAlkamisvuosi 
,substring(koulutuksenAlkamiskausiUri,charindex('_',koulutuksenAlkamiskausiUri)+1,1)
) f

left join sa.koulutustarjonta_koulutus k on k.oid=hakukohdekoulutus_oid
 



