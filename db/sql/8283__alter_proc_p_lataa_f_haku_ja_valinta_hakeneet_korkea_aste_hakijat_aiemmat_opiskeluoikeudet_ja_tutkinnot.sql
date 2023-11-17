USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_aiemmat_opiskeluoikeudet_ja_tutkinnot]    Script Date: 17.11.2023 16:59:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dw].[p_lataa_f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_aiemmat_opiskeluoikeudet_ja_tutkinnot] AS


DROP TABLE IF EXISTS ANTERO.sa.temp_haku_ja_valinta_oo
SELECT distinct
	oid as henkilo_oid,
	korkeakoulu,
	tavoitetutkinto,
	(select d from dbo.biginttodate (alkamispaivamaara)) as opisk_alkamisPvm,
	(select d from dbo.biginttodate (paattymispaivamaara)) as opisk_paattymisPvm,
	case when (select d from dbo.biginttodate (alkamispaivamaara)) >= '2014-08-01' then 1 else 0 end as op_kytkin,
	MIN((select d from dbo.biginttodate (alkamispaivamaara))) OVER (partition by oid) as opisk_alkamisPvm_min
INTO ANTERO.sa.temp_haku_ja_valinta_oo
FROM [ANTERO].[sa].[sa_virta_otp_korkeakouluhaut_hakijat_opiskeluoikeudet] 

-- Aiemmat opiskeluoikeudet
DROP TABLE IF EXISTS ANTERO.sa.temp_haku_ja_valinta_aiempi_oo
SELECT
	*
INTO ANTERO.sa.temp_haku_ja_valinta_aiempi_oo
FROM (
	SELECT 
		HakemusOid,
		henkilo_oid,
		korkeakoulu,
		tavoitetutkinto,
		opisk_alkamisPvm,
		opisk_paattymisPvm,
		op_kytkin = 1,
		MAX(
			CASE 
				WHEN t.tavoitetutkinto = hkk.hakukohdekoulutus_koodi AND YEAR(t.opisk_alkamisPvm) < YEAR(h.HakuaikaAlku) AND VastaanotonTila in ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT') THEN 1
				WHEN t.tavoitetutkinto = hkk.hakukohdekoulutus_koodi AND t.opisk_alkamisPvm < h.HakuaikaAlku AND COALESCE(VastaanotonTila, '') not in ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT') THEN 1
				WHEN t.tavoitetutkinto <> hkk.hakukohdekoulutus_koodi AND t.opisk_alkamisPvm < h.HakuaikaAlku THEN 1
				ELSE 0
			END
		) OVER (partition by HakemusOid, t.opisk_alkamisPvm) as aiempi_oo
	FROM ANTERO.sa.sa_odw_hakeneet h
	INNER JOIN ANTERO.dw.d_haku d on d.haku_oid = h.HakuOid and d.korkeakouluhaku = 1
	LEFT JOIN ANTERO.sa.sa_hakukohde_koulutus hkk on hkk.hakukohde_oid = h.HakukohdeOID and hkk.hakukohdekoulutus_nro = 1
	LEFT JOIN ANTERO.sa.temp_haku_ja_valinta_oo t on t.henkilo_oid = h.HenkiloOID
) a

DROP TABLE ANTERO.dw.f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_aiemmat_opiskeluoikeudet_ja_tutkinnot

SELECT DISTINCT --top 10000
	 f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_id = f.id

	,f.henkilo_oid
    ,f.hakemus_oid
    ,d_haku_id
    ,d_hakuaika_id
    ,f.koulutuksen_alkamisvuosi
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
	,f.pohjakoulutus_suomessa_priorisoitu

	,ensi_kertaa_hakeva = 
		CASE
			WHEN f.ensikertainen_hakija = 0 THEN 0
			ELSE COALESCE(EKH.ensi_kertaa_hakeva,0)
		END
	,vastaanottaa_paikan_3v = COALESCE(VKKP3.vastaanottaa_paikan_3v,0)
	,muu_paattymispvm_prio = MAX(case when op.opisk_alkamisPvm is not null then coalesce(OP.opisk_paattymisPvm,'9999-01-01') else op.opisk_paattymisPvm end) OVER (
					PARTITION BY f.hakemus_oid)
	,f.loadtime

INTO dw.f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_aiemmat_opiskeluoikeudet_ja_tutkinnot

FROM [ANTERO].[dw].[f_haku_ja_valinta_hakeneet_korkea_aste_hakijat] f
LEFT JOIN dw.d_haku d1 ON d1.id = f.d_haku_id
LEFT JOIN dw.d_kausi d2 ON d2.id = f.d_kausi_koulutuksen_alkamiskausi_id
--INNER JOIN sa.sa_haku_ja_valinta_vuosikello_korkea_aste d3 on ((d3.haku_oid=d1.haku_oid and d3.haku_oid is not null) OR (d3.koulutuksen_alkamiskausi=cast(f.koulutuksen_alkamisvuosi as varchar)+cast(d2.jarjestys as varchar) and d1.hakutapa_koodi <> '01' and d3.haku_oid is null))
LEFT JOIN dw.d_hakuaika d4 on d4.id=f.d_hakuaika_id
LEFT JOIN dw.d_hakuaika_kouta d4b on d4b.haku_oid=d1.haku_oid
LEFT JOIN dw.d_koulutusluokitus d5 on d5.id = f.d_koulutusluokitus_vastaanottanut_id
--opiskeluoikeudet
LEFT JOIN ANTERO.sa.temp_haku_ja_valinta_aiempi_oo OP ON OP.HakemusOid = f.hakemus_oid and OP.aiempi_oo = 1
--tutkinnot
LEFT JOIN (

	SELECT distinct
		--id
		oid as henkilo_oid
		,korkeakoulu
		,tutkinto
		,'1' as tu_kytkin
		,(select d from dbo.biginttodate (suorituspaivamaara)) as tutk_suoritusPvm
	FROM [ANTERO].[sa].[sa_virta_otp_korkeakouluhaut_hakijat_tutkinnot]

) AS TU ON TU.henkilo_oid = f.henkilo_oid AND TU.tutk_suoritusPvm <= coalesce(d4b.alkuPvm,d4.alkuPvm)

LEFT JOIN dw.d_organisaatioluokitus d6 on d6.organisaatio_koodi=OP.korkeakoulu 
LEFT JOIN dw.d_organisaatioluokitus d7 on d7.organisaatio_koodi=TU.korkeakoulu 
LEFT JOIN dw.d_koulutusluokitus d8 on d8.koulutusluokitus_koodi=OP.tavoitetutkinto 
LEFT JOIN dw.d_koulutusluokitus d9 on d9.koulutusluokitus_koodi=TU.tutkinto 

--ensi kertaa hakevat
LEFT JOIN (
	SELECT
		HenkiloOID, 
		1 as ensi_kertaa_hakeva, 
		MIN(f.HakuaikaAlku) as HakuaikaAlku
	FROM [ANTERO].[sa].[sa_odw_hakeneet] f
	INNER JOIN dw.d_haku d1 on d1.haku_oid = f.HakuOid and d1.korkeakouluhaku = 1
	WHERE f.Ensikertalainen <> 0 
	GROUP BY HenkiloOID
) AS EKH ON EKH.HenkiloOID = f.henkilo_oid and EKH.HakuaikaAlku >= coalesce(d4b.alkuPvm,d4.alkuPvm)

--vastaanottaa korkeakoulupaikan kolmen vuoden sisällä
LEFT JOIN (
	SELECT DISTINCT 
		[HenkiloOID],
		d2.koulutuksen_alkamisvuosi,
		1 as vastaanottaa_paikan_3v
	FROM [ANTERO].[sa].[sa_odw_hakeneet] f
	INNER JOIN dw.d_haku d1 on d1.haku_oid = f.HakuOid and d1.korkeakouluhaku = 1
	LEFT JOIN sa.sa_hakukohde_koulutus d2 on d2.hakukohde_oid = f.HakukohdeOID and hakukohdekoulutus_nro = 1
	WHERE f.VastaanotonTila in ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT')
) AS VKKP3 ON VKKP3.HenkiloOID = f.henkilo_oid and (VKKP3.koulutuksen_alkamisvuosi = f.koulutuksen_alkamisvuosi or VKKP3.koulutuksen_alkamisvuosi = f.koulutuksen_alkamisvuosi + 1 or VKKP3.koulutuksen_alkamisvuosi = f.koulutuksen_alkamisvuosi + 2)

WHERE 1=1 
--AND f.loadtime >= d3.hakijat
--AND koulutuksen_alkamisvuosi >= 2018

DROP TABLE IF EXISTS ANTERO.sa.temp_haku_ja_valinta_oo
DROP TABLE IF EXISTS ANTERO.sa.temp_haku_ja_valinta_aiempi_oo

GO

USE [ANTERO]