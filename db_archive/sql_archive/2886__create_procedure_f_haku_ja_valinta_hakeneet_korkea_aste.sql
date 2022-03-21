USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_haku_ja_valinta_hakeneet_korkea_aste_hakijat]    Script Date: 15.3.2020 15:14:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_haku_ja_valinta_hakeneet_korkea_aste_hakijat]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_haku_ja_valinta_hakeneet_korkea_aste_hakijat] AS' 
END
GO





ALTER PROCEDURE [dw].[p_lataa_f_haku_ja_valinta_hakeneet_korkea_aste_hakijat] AS

--indeksit
IF EXISTS (SELECT * FROM sys.indexes WHERE name='NC__f_haku_ja_valinta_hakeneet_korkea_aste_hakijat' AND object_id = OBJECT_ID('dw.f_haku_ja_valinta_hakeneet_korkea_aste_hakijat'))
BEGIN
	DROP INDEX [NC__f_haku_ja_valinta_hakeneet_korkea_aste_hakijat] ON [dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat]
END

IF EXISTS (SELECT * FROM sys.indexes WHERE name='NC__f_haku_ja_valinta_hakeneet_korkea_aste_hakijat2' AND object_id = OBJECT_ID('dw.f_haku_ja_valinta_hakeneet_korkea_aste_hakijat'))
BEGIN
	DROP INDEX [NC__f_haku_ja_valinta_hakeneet_korkea_aste_hakijat2] ON [dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat]
END


TRUNCATE TABLE dw.f_haku_ja_valinta_hakeneet_korkea_aste_hakijat

INSERT INTO dw.f_haku_ja_valinta_hakeneet_korkea_aste_hakijat (

	 [henkilo_oid]
	,[hakemus_oid]
	,[d_haku_id]
	,[d_hakuaika_id]
	,[hakuaikaId]
	,[koulutuksen_alkamisvuosi]
	,[d_kausi_koulutuksen_alkamiskausi_id]
	,[d_haku_amk_yo_id]
	,[d_koulutusluokitus_vastaanottanut_id]
	,[d_kytkin_valittu_ensisijaiseen_hakukohteeseen_id]
	,[d_kytkin_valittu_ensisijaisen_hakukohteen_koulutusalalle_id]
	,[ensikertainen_hakija]
	,[source]

) 

SELECT DISTINCT
	f.HenkiloOID as henkilo_oid,
	f.HakemusOid as hakemus_oid,
	coalesce(d10.id,'-1') as d_haku_id,
	coalesce(d8.id,'-1') as d_hakuaika_id,
	f.hakuaikaId,
	d16.koulutuksen_alkamisvuosi,
	coalesce(d17.id,'-1') as d_kausi_koulutuksen_alkamiskausi_id,
	coalesce(d29.id,'-1') as d_haku_amk_yo_id,
	coalesce(d30.id,'-1') as d_koulutusluokitus_vastaanottanut_id,
	coalesce(d35.id,'2') as d_kytkin_valittu_ensisijaiseen_hakukohteeseen_id,
	coalesce(d36.id,'2') as d_kytkin_valittu_ensisijaisen_hakukohteen_koulutusalalle_id,
	case f.ensikertalainen when 1 then 'Ensikertainen hakija' when 0 then 'Ei ensikertainen hakija ' else 'Tuntematon' end as ensikertainen_hakija,
	'ETL: p_lataa_f_haku_ja_valinta_hakeneet_korkea_aste' AS source
--INTO dw.f_haku_ja_valinta_hakeneet_korkea_aste_hakijat
FROM [sa].[sa_odw_hakeneet] f
left join dw.d_haku d10 on d10.haku_oid = f.HakuOid
left join dw.d_hakuaika d8 on d8.hakuaikaId = f.HakuaikaId
left join sa.sa_hakukohde_koulutus d16 on d16.hakukohde_oid = f.HakukohdeOID and hakukohdekoulutus_nro = 1
left join dw.d_kausi d17 on d17.koodi = d16.koulutuksen_alkamiskausi
left join sa.sa_hakeneet_kk_pohjakoulutus d28 on d28.hakemusoid = f.HakemusOid
left join dw.d_haku_amk_yo d29 on d29.koodi = f.Yo_Amk_YoAmk

--vastaanotetun hakukohteen tutkinto
left join (

	SELECT 
		HakemusOid
		,HakuOid
		,d.id
	FROM (
		SELECT
			HakemusOid
			,HakuOid
			,tutkintokoodi = d16.hakukohdekoulutus_koodi
			,rn = ROW_NUMBER() over (partition by hakemusOid order by hakutoivenumero)
		FROM sa.sa_odw_hakeneet sa
		left join sa.sa_hakukohde_koulutus d16 on d16.hakukohde_oid = sa.HakukohdeOID and hakukohdekoulutus_nro = 1
		WHERE VastaanotonTila IN ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT') 
		OR ValinnanTila IN ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT')
	) q
	LEFT JOIN dw.d_koulutusluokitus d on d.koulutusluokitus_koodi = q.tutkintokoodi
	WHERE rn=1

) d30 on d30.HakemusOid = f.HakemusOid


--valittu ensisijaiseen hakukohteeseen
left join (
	SELECT distinct
		f.HakemusOid,
		'1' as id
	FROM sa.sa_odw_hakeneet f
	WHERE f.ValinnanTila in ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT') 
	and f.HakutoiveNumero = 1
) d35 on f.HakemusOid = d35.HakemusOid

--valittu ensisijaiselle koulutusalalle
left join (

	SELECT
		f.HakemusOid,
		CASE WHEN MIN(f.HakutoiveNumero) = '1' THEN '1' ELSE Min(d3.id) END as id
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

) d36 on f.HakemusOid = d36.HakemusOid

WHERE d10.korkeakouluhaku = 1


CREATE NONCLUSTERED INDEX [NC__f_haku_ja_valinta_hakeneet_korkea_aste_hakijat] ON [dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat]
(
	[henkilo_oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


CREATE NONCLUSTERED INDEX [NC__f_haku_ja_valinta_hakeneet_korkea_aste_hakijat2] ON [dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat]
(
	[loadtime] ASC
)
INCLUDE ( 	[id],
	[d_haku_id],
	[d_hakuaika_id],
	[koulutuksen_alkamisvuosi],
	[d_kausi_koulutuksen_alkamiskausi_id],
	[d_haku_amk_yo_id],
	[ensikertainen_hakija]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]





GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_aiemmat_opiskeluoikeudet_ja_tutkinnot]    Script Date: 15.3.2020 15:14:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_aiemmat_opiskeluoikeudet_ja_tutkinnot]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_aiemmat_opiskeluoikeudet_ja_tutkinnot] AS' 
END
GO


ALTER PROCEDURE [dw].[p_lataa_f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_aiemmat_opiskeluoikeudet_ja_tutkinnot] AS

DROP TABLE ANTERO.dw.f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_aiemmat_opiskeluoikeudet_ja_tutkinnot

SELECT --top 10000
	 f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_id = f.id

	,f.henkilo_oid
    ,f.hakemus_oid
    ,d_haku_id
    ,d_hakuaika_id
    ,koulutuksen_alkamisvuosi
    ,d_kausi_koulutuksen_alkamiskausi_id
    ,d_haku_amk_yo_id
    ,ensikertainen_hakija
	 
	--,valitut
	--,vastaanottaneet
	--,aloittaneet
	
	,d_organisaatioluokitus_muu_korkeakoulu_id = d6.id
	,d_koulutusluokitus_muu_tutkinto_id = d8.id
	--,d_kytkin_muu_voimassa_id = null
	,muu_alkamispvm = OP.opisk_alkamisPvm
	,muu_paattymispvm = OP.opisk_paattymisPvm
	,d_organisaatioluokitus_aiempi_tutkinto_korkeakoulu_id = d7.id
	,d_koulutusluokitus_aiempi_tutkinto_id = d9.id
	,aiempi_tutkinto_suorituspvm = TU.tutk_suoritusPvm
	,op_oikeus_tai_tutkinto =
		CASE 
			WHEN op_kytkin=1 or tu_kytkin=1 then 1
			else 0
		END

	,f.loadtime

INTO dw.f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_aiemmat_opiskeluoikeudet_ja_tutkinnot

FROM [ANTERO].[dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat] f
LEFT JOIN dw.d_haku d1 ON d1.id = f.d_haku_id
LEFT JOIN dw.d_kausi d2 ON d2.id = f.d_kausi_koulutuksen_alkamiskausi_id
--INNER JOIN sa.sa_haku_ja_valinta_vuosikello_korkea_aste d3 on ((d3.haku_oid=d1.haku_oid and d3.haku_oid is not null) OR (d3.koulutuksen_alkamiskausi=cast(f.koulutuksen_alkamisvuosi as varchar)+cast(d2.jarjestys as varchar) and d1.hakutapa_koodi <> '01' and d3.haku_oid is null))
LEFT JOIN dw.d_hakuaika d4 on d4.id=f.d_hakuaika_id
LEFT JOIN dw.d_koulutusluokitus d5 on d5.id = f.d_koulutusluokitus_vastaanottanut_id
--opiskeluoikeudet
LEFT JOIN ( 
	
	SELECT distinct
		 --id
		oid as henkilo_oid
		,korkeakoulu
		,tavoitetutkinto
		,convert(date,dateadd(day, convert(bigint, alkamispaivamaara) / 86400000, convert(datetime, '1-1-1970'))) as opisk_alkamisPvm
		,convert(date,dateadd(day, convert(bigint, paattymispaivamaara) / 86400000, convert(datetime, '1-1-1970'))) as opisk_paattymisPvm
		,case when convert(date,dateadd(day, convert(bigint, alkamispaivamaara) / 86400000, convert(datetime, '1-1-1970'))) >= '2014-08-01' then 1 else 0 end as op_kytkin
	FROM [ANTERO].[sa].[sa_virta_otp_korkeakouluhaut_hakijat_opiskeluoikeudet] 
	
) AS OP ON OP.henkilo_oid = f.henkilo_oid AND OP.opisk_alkamisPvm <= d4.loppuPvm AND NOT (OP.tavoitetutkinto = d5.koulutusluokitus_koodi AND OP.opisk_alkamisPvm >= d4.alkuPvm)
--tutkinnot
LEFT JOIN (

	SELECT distinct
		--id
		oid as henkilo_oid
		,korkeakoulu
		,tutkinto
		,'1' as tu_kytkin
		,convert(date,dateadd(day, convert(bigint, suorituspaivamaara) / 86400000, convert(datetime, '1-1-1970'))) as tutk_suoritusPvm
	FROM [ANTERO].[sa].[sa_virta_otp_korkeakouluhaut_hakijat_tutkinnot]

) AS TU ON TU.henkilo_oid = f.henkilo_oid AND TU.tutk_suoritusPvm <= d4.loppuPvm

LEFT JOIN dw.d_organisaatioluokitus d6 on d6.organisaatio_koodi=OP.korkeakoulu 
LEFT JOIN dw.d_organisaatioluokitus d7 on d7.organisaatio_koodi=TU.korkeakoulu 
LEFT JOIN dw.d_koulutusluokitus d8 on d8.koulutusluokitus_koodi=OP.tavoitetutkinto 
LEFT JOIN dw.d_koulutusluokitus d9 on d9.koulutusluokitus_koodi=TU.tutkinto 

WHERE 1=1
--AND f.loadtime >= d3.hakijat
--AND koulutuksen_alkamisvuosi >= 2018

GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_taustatiedot]    Script Date: 15.3.2020 15:14:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_taustatiedot]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_taustatiedot] AS' 
END
GO






ALTER PROCEDURE [dw].[p_lataa_f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_taustatiedot] AS

--indeksit
IF EXISTS (SELECT * FROM sys.indexes WHERE name='NC__f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_taustatiedot' AND object_id = OBJECT_ID('dw.f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_taustatiedot'))
BEGIN
	DROP INDEX [NC__f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_taustatiedot] ON [dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_taustatiedot]
END

TRUNCATE TABLE dw.f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_taustatiedot

INSERT INTO dw.f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_taustatiedot (
	 [henkilo_oid]
	,[hakemus_oid]
	,[d_sukupuoli_id]
	,[d_kieli_aidinkieli_id]
	,[d_ika_id]
	,[d_alueluokitus_kotipaikka_id]
	,[d_maatjavaltiot_kansalaisuus_id]
	,[d_pohjakoulutuskk_id]
	,[d_kytkin_pohjakoulutuskk_ulkomaat_id]
	,[toisen_asteen_koulutuksen_suoritusvuosi]
	,[pohjakoulutuksen_paattovuosi]
	,[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_id]
	,[source]

) 

SELECT DISTINCT
	f.HenkiloOID as henkilo_oid,
	f.HakemusOid as hakemus_oid,
	coalesce(d1.id,'-1') as d_sukupuoli_id,
	coalesce(d2.id,'-1') as d_kieli_aidinkieli_id,
	coalesce(d5.id,'-1') as d_ika_id,
	coalesce(d3.id,'-1') as d_alueluokitus_kotipaikka_id,
	coalesce(d4.id,'-1') as d_maatjavaltiot_kansalaisuus_id,
	coalesce(d7.id,'-1') as d_pohjakoulutuskk_id,
	coalesce(d9.id,'-1') as d_kytkin_pohjakoulutuskk_ulkomaat_id,
	coalesce(nullif(d28.max_ToisenAsteenKoulutuksenSuoritusvuosi,'0'),'Tieto puuttuu') as toisen_asteen_koulutuksen_suoritusvuosi,
	case f.PohjakoulutuksenSuoritusvuosi when '0' then 'Tieto puuttuu' else cast(f.PohjakoulutuksenSuoritusvuosi as nvarchar) end as pohjakoulutuksen_paattovuosi,
	f2.id,
	'ETL: p_lataa_f_haku_ja_valinta_hakeneet_korkea_aste' AS source
--INTO dw.f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_taustatiedot
FROM [sa].[sa_odw_hakeneet] f
left join dw.d_haku d10 on d10.haku_oid = f.HakuOid
left join dw.d_sukupuoli d1 on d1.sukupuoli_koodi = f.SukupuoliKoodi
left join dw.d_kieli d2 on d2.kieli_koodi = f.AidinkieliKoodi
left join dw.d_alueluokitus d3 on d3.alueluokitus_avain = 'kunta_'+f.KotikuntaKoodi
left join dw.d_maatjavaltiot2 d4 on d4.maatjavaltiot2_koodi = right('00'+cast(f.KansalaisuusKoodi as varchar),3)
left join dw.d_ika d5 on d5.ika_avain = f.Ika
left join dw.d_pohjakoulutus d7 on d7.koodi = f.PohjakoulutusKKLomakeKoodi
left join dw.d_kytkin d9 on d9.kytkin_koodi = f.PohjakoulutusKKUlkomaat
left join sa.sa_hakeneet_kk_pohjakoulutus d28 on d28.hakemusoid = f.HakemusOid
left join dw.f_haku_ja_valinta_hakeneet_korkea_aste_hakijat f2 on f2.hakemus_oid = f.HakemusOid and f2.hakuaikaId = f.HakuaikaId
WHERE d10.korkeakouluhaku = 1



CREATE NONCLUSTERED INDEX [NC__f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_taustatiedot] ON [dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_taustatiedot]
(
	[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_id] ASC
)
INCLUDE ( 	[d_kieli_aidinkieli_id],
	[d_ika_id],
	[d_maatjavaltiot_kansalaisuus_id]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_haku_ja_valinta_hakeneet_korkea_aste_hakutoiveet]    Script Date: 15.3.2020 15:14:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_haku_ja_valinta_hakeneet_korkea_aste_hakutoiveet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_haku_ja_valinta_hakeneet_korkea_aste_hakutoiveet] AS' 
END
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
left join dw.f_haku_ja_valinta_hakeneet_korkea_aste_hakijat f2 on f2.hakemus_oid = f.HakemusOid and f2.hakuaikaId = f.HakuaikaId
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

