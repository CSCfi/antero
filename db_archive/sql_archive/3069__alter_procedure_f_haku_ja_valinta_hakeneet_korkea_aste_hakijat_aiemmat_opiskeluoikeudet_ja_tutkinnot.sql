USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_aiemmat_opiskeluoikeudet_ja_tutkinnot]    Script Date: 15.5.2020 19:23:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
		,(select d from dbo.biginttodate (alkamispaivamaara)) as opisk_alkamisPvm
		,(select d from dbo.biginttodate (paattymispaivamaara)) as opisk_paattymisPvm
		,case when (select d from dbo.biginttodate (alkamispaivamaara)) >= '2014-08-01' then 1 else 0 end as op_kytkin
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
		,(select d from dbo.biginttodate (suorituspaivamaara)) as tutk_suoritusPvm
	FROM [ANTERO].[sa].[sa_virta_otp_korkeakouluhaut_hakijat_tutkinnot]

) AS TU ON TU.henkilo_oid = f.henkilo_oid AND TU.tutk_suoritusPvm <= d4.loppuPvm

LEFT JOIN dw.d_organisaatioluokitus d6 on d6.organisaatio_koodi=OP.korkeakoulu 
LEFT JOIN dw.d_organisaatioluokitus d7 on d7.organisaatio_koodi=TU.korkeakoulu 
LEFT JOIN dw.d_koulutusluokitus d8 on d8.koulutusluokitus_koodi=OP.tavoitetutkinto 
LEFT JOIN dw.d_koulutusluokitus d9 on d9.koulutusluokitus_koodi=TU.tutkinto 

WHERE 1=1
--AND f.loadtime >= d3.hakijat
--AND koulutuksen_alkamisvuosi >= 2018
