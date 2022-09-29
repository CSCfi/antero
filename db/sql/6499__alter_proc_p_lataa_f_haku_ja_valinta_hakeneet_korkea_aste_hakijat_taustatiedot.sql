USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_taustatiedot]    Script Date: 29.9.2022 8:57:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
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
	,[ylioppilastutkinnon_suoritusvuosi]
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
	d32.valmistumisvuosi as ylioppilastutkinnon_suoritusvuosi,
	f2.id,
	'ETL: p_lataa_f_haku_ja_valinta_hakeneet_korkea_aste' AS source
--INTO dw.f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_taustatiedot
FROM [sa].[sa_odw_hakeneet] f
left join dw.d_haku d10 on d10.haku_oid = f.HakuOid
left join dw.d_hakuaika_kouta d11 on d11.haku_oid = f.HakuOid
left join dw.d_sukupuoli d1 on d1.sukupuoli_koodi = f.SukupuoliKoodi
left join dw.d_kieli d2 on d2.kieli_koodi = f.AidinkieliKoodi
left join dw.d_alueluokitus d3 on d3.alueluokitus_avain = 'kunta_'+f.KotikuntaKoodi
left join dw.d_maatjavaltiot2 d4 on d4.maatjavaltiot2_koodi = right('00'+cast(f.KansalaisuusKoodi as varchar),3)
left join dw.d_ika d5 on d5.ika_avain = f.Ika
left join dw.d_pohjakoulutus d7 on d7.koodi = f.PohjakoulutusKKLomakeKoodi
left join dw.d_kytkin d9 on d9.kytkin_koodi = f.PohjakoulutusKKUlkomaat
left join sa.sa_hakeneet_kk_pohjakoulutus d28 on d28.hakemusoid = f.HakemusOid
left join (
	SELECT
		henkiloOID
		,valmistumisvuosi = MAX(valmistumisvuosi)
	FROM ANTERO.dw.f_haku_ja_valinta_yoarvosanat
	GROUP BY henkiloOID
) d32 on d32.henkiloOID = f.HenkiloOID
left join dw.f_haku_ja_valinta_hakeneet_korkea_aste_hakijat f2 on f2.hakemus_oid = f.HakemusOid and (f2.hakuaikaId = f.HakuaikaId or d11.id = f2.d_hakuaika_kouta_id)
WHERE d10.korkeakouluhaku = 1



CREATE NONCLUSTERED INDEX [NC__f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_taustatiedot] ON [dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_taustatiedot]
(
	[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_id] ASC
)
INCLUDE ( 	[d_kieli_aidinkieli_id],
	[d_ika_id],
	[d_maatjavaltiot_kansalaisuus_id]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO

USE [ANTERO]