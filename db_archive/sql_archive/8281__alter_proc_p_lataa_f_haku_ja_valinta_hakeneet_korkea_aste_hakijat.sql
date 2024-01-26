USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_haku_ja_valinta_hakeneet_korkea_aste_hakijat]    Script Date: 17.11.2023 16:56:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
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
	,[d_hakuaika_kouta_id]
	,[hakuaikaId]
	,[koulutuksen_alkamisvuosi]
	,[d_kausi_koulutuksen_alkamiskausi_id]
	,[d_haku_amk_yo_id]
	,[d_koulutusluokitus_vastaanottanut_id]
	,[d_kytkin_valittu_ensisijaiseen_hakukohteeseen_id]
	,[d_kytkin_valittu_ensisijaisen_hakukohteen_koulutusalalle_id]
	,[ensikertainen_hakija]
	,[pohjakoulutus_suomessa_priorisoitu]
	,[source]

) 

SELECT DISTINCT
	f.HenkiloOID as henkilo_oid,
	f.HakemusOid as hakemus_oid,
	coalesce(d10.id,'-1') as d_haku_id,
	coalesce(d8.id,'-1') as d_hakuaika_id,
	d8b.id as d_hakuaika_kouta_id,
	d8.hakuaikaId,
	d16.koulutuksen_alkamisvuosi,
	coalesce(d17.id,'-1') as d_kausi_koulutuksen_alkamiskausi_id,
	coalesce(d29.id,'-1') as d_haku_amk_yo_id,
	coalesce(d30.id,'-1') as d_koulutusluokitus_vastaanottanut_id,
	coalesce(d35.id,'2') as d_kytkin_valittu_ensisijaiseen_hakukohteeseen_id,
	coalesce(d36.id,'2') as d_kytkin_valittu_ensisijaisen_hakukohteen_koulutusalalle_id,
	f.ensikertalainen as ensikertainen_hakija,
	d20.pohjakoulutus_suomessa_priorisoitu,
	'ETL: p_lataa_f_haku_ja_valinta_hakeneet_korkea_aste' AS source
--INTO dw.f_haku_ja_valinta_hakeneet_korkea_aste_hakijat
FROM [sa].[sa_odw_hakeneet] f
left join dw.d_haku d10 on d10.haku_oid = f.HakuOid
left join dw.d_hakuaika d8 on d8.hakuaikaId = f.HakuaikaId
left join dw.d_hakuaika_kouta d8b on d8b.haku_oid = d10.haku_oid
left join sa.sa_hakukohde_koulutus d16 on d16.hakukohde_oid = f.HakukohdeOID and hakukohdekoulutus_nro = 1
left join dw.d_kausi d17 on d17.koodi = d16.koulutuksen_alkamiskausi
left join sa.sa_hakeneet_kk_pohjakoulutus d28 on d28.hakemusoid = f.HakemusOid
left join dw.d_haku_amk_yo d29 on d29.koodi = f.Yo_Amk_YoAmk
left join sa.sa_hakeneet_kk_pohjakoulutuksen_maa d20 on 
	d20.henkiloOID = f.henkiloOID 
	and d20.koulutuksen_alkamisvuosi = d16.koulutuksen_alkamisvuosi
	and d20.koulutuksen_alkamiskausi = d16.koulutuksen_alkamiskausi
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

WHERE d10.korkeakouluhaku = 1 AND d16.koulutuksen_alkamisvuosi > 2014


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

USE [ANTERO]