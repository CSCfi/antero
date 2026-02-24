USE [ANTERO]

GO

CREATE OR ALTER PROCEDURE dw.p_lataa_f_haku_ja_valinta_korkea_aste_hakijat_aiemmat_opiskeluoikeudet_ja_tutkinnot as

-- Aiemmat opiskeluoikeudet (ja tutkinnot)
DROP TABLE IF EXISTS ANTERO.sa.temp_haku_ja_valinta_oo
SELECT distinct
	master_oid,
	korkeakoulu,
	tavoitetutkinto,
	opisk_alkamisPvm,
	opisk_paattymisPvm,
	case when opisk_alkamisPvm >= '2014-08-01' then 1 else 0 end as op_kytkin,
	MIN(opisk_alkamisPvm) OVER (partition by master_oid) as opisk_alkamisPvm_min
INTO ANTERO.sa.temp_haku_ja_valinta_oo
FROM (
	SELECT
		f.*, LAG(opisk_paattymisPvm) OVER (partition by master_oid, korkeakoulu, tavoitetutkinto ORDER BY opisk_alkamisPvm, opisk_paattymisPvm) as paattymisPvmEdellinen
	FROM (
		SELECT
			oid as master_oid,
			korkeakoulu,
			tavoitetutkinto,
			(select d from dbo.biginttodate (alkamispaivamaara)) as opisk_alkamisPvm,
			(select d from dbo.biginttodate (paattymispaivamaara)) as opisk_paattymisPvm,
			case when (select d from dbo.biginttodate (alkamispaivamaara)) >= '2014-08-01' then 1 else 0 end as op_kytkin
		FROM [ANTERO].[sa].[sa_virta_otp_korkeakouluhaut_hakijat_opiskeluoikeudet] t
		WHERE t.tavoitetutkinto not like '9%9'
		UNION ALL
		SELECT 
			[oid],
			korkeakoulu,
			tutkinto as tavoitetutkinto,
			(select d from dbo.biginttodate (suorituspaivamaara)) as opisk_alkamisPvm,
			(select d from dbo.biginttodate (suorituspaivamaara)) as opisk_paattymisPvm,
			case when (select d from dbo.biginttodate (suorituspaivamaara)) >= '2014-08-01' then 1 else 0 end as op_kytkin
		FROM [ANTERO].[sa].[sa_virta_otp_korkeakouluhaut_hakijat_tutkinnot] t
		WHERE t.tutkinto not like '9%9'
	) f
) f
WHERE f.paattymisPvmEdellinen is null OR f.paattymisPvmEdellinen < opisk_paattymisPvm

DROP TABLE IF EXISTS ANTERO.sa.temp_haku_ja_valinta_aiempi_oo
SELECT
	*
INTO ANTERO.sa.temp_haku_ja_valinta_aiempi_oo
FROM (
	SELECT 
		h.hakemus_oid,
		h.master_oid,
		oo.korkeakoulu,
		tavoitetutkinto,
		oo.opisk_alkamisPvm,
		oo.opisk_paattymisPvm,
		op_kytkin = 1,
		tutk.korkeakoulu as tutkinnon_korkeakoulu,
		tutk.tutkinto,
		tutk.tutk_suoritusPvm,
		tutk.tu_kytkin
	FROM ANTERO.sa.sa_ovara_hakeneet h
	LEFT JOIN ANTERO.sa.temp_haku_ja_valinta_oo oo on oo.master_oid = h.master_oid
	OUTER APPLY (
		SELECT distinct
			oid as master_oid
			,korkeakoulu
			,tutkinto
			,'1' as tu_kytkin
			,(select d from dbo.biginttodate (suorituspaivamaara)) as tutk_suoritusPvm
		FROM [ANTERO].[sa].[sa_virta_otp_korkeakouluhaut_hakijat_tutkinnot] t
		LEFT JOIN ANTERO.dw.d_koulutusluokitus d1 on t.tutkinto = d1.koulutusluokitus_koodi
		WHERE d1.koulutusastetaso1_koodi <> '9' and t.oid = h.master_oid and
		(YEAR((select d from dbo.biginttodate (suorituspaivamaara))) < h.koulutuksen_alkamisvuosi or
		(YEAR((select d from dbo.biginttodate (suorituspaivamaara))) = h.koulutuksen_alkamisvuosi and h.koulutuksen_alkamiskausi = 's' and MONTH((select d from dbo.biginttodate (suorituspaivamaara))) < 8))
	) tutk
	WHERE h.kk_haku = 1 and h.aidosti_ensikertainen = 0
) a

DROP TABLE IF EXISTS ANTERO.sa.temp_haku_ja_valinta_aiempi_oo2
SELECT DISTINCT 
	 f.master_oid
    ,f.hakemus_oid
	,f.d_hakukohde_id
	,f.d_koulutusluokitus_id
	,f.d_organisaatioluokitus_oppilaitos_id
	,cast(concat(f.koulutuksen_alkamisvuosi,'.', case when d1.koodi = 'S' then '5' else 0 end) as float) as kausi
	,d_organisaatioluokitus_muu_korkeakoulu_id = d6.id
	,d_koulutusluokitus_muu_tutkinto_id = d8.id
	,muu_alkamispvm = OP.opisk_alkamisPvm
	,muu_paattymispvm = OP.opisk_paattymisPvm
	,d_organisaatioluokitus_aiempi_tutkinto_korkeakoulu_id = d7.id
	,d_koulutusluokitus_aiempi_tutkinto_id = d9.id
	,aiempi_tutkinto_suorituspvm = OP.tutk_suoritusPvm
	,op_oikeus_tai_tutkinto =
		CASE 
			WHEN op_kytkin=1 or tu_kytkin=1 then 1
			else 0
		END
	,ensi_kertaa_hakeva = 0
	,vastaanottaa_paikan_3v = 0
	,f.loadtime
INTO ANTERO.sa.temp_haku_ja_valinta_aiempi_oo2
FROM [ANTERO].[dw].[f_haku_ja_valinta_hakeneet_korkea_aste] f
--opiskeluoikeudet
LEFT JOIN ANTERO.sa.temp_haku_ja_valinta_aiempi_oo OP ON OP.hakemus_oid = f.hakemus_oid 
LEFT JOIN ANTERO.dw.d_kausi d1 on d1.id = f.d_kausi_koulutuksen_alkamiskausi_id
LEFT JOIN dw.d_organisaatioluokitus d6 on d6.organisaatio_koodi=OP.korkeakoulu 
LEFT JOIN dw.d_organisaatioluokitus d7 on d7.organisaatio_koodi=OP.tutkinnon_korkeakoulu
LEFT JOIN dw.d_koulutusluokitus d8 on d8.koulutusluokitus_koodi=OP.tavoitetutkinto 
LEFT JOIN dw.d_koulutusluokitus d9 on d9.koulutusluokitus_koodi=OP.tutkinto
LEFT JOIN dw.d_koulutusluokitus d10 on d10.id = f.d_koulutusluokitus_id
LEFT JOIN dw.d_organisaatioluokitus d11 on d11.id = f.d_organisaatioluokitus_oppilaitos_id
WHERE 
(
	YEAR(op.opisk_alkamisPvm) < f.koulutuksen_alkamisvuosi or (
		YEAR(op.opisk_alkamisPvm) = f.koulutuksen_alkamisvuosi and 
		d1.selite_fi = 's' and MONTH(op.opisk_alkamisPvm) < 8
	)
)

--Ensi kertaa hakevat
UPDATE oo 
SET ensi_kertaa_hakeva = case when ekh.hakukerta_kk = 1 and aidosti_ensikertainen = 1 then 1 else 0 end
FROM ANTERO.sa.temp_haku_ja_valinta_aiempi_oo2 oo
OUTER APPLY (
	SELECT
		ekh.hakemus_oid,
		ekh.master_oid,
		ekh.aidosti_ensikertainen,
		RANK() OVER (PARTITION BY master_oid ORDER BY ekh.koulutuksen_alkamisvuosi, ekh.koulutuksen_alkamiskausi, ekh.hakemus_luotu) as hakukerta_kk
	FROM ANTERO.sa.sa_ovara_hakeneet ekh
	WHERE ekh.kk_haku = 1 and ekh.hakemus_oid = oo.hakemus_oid
) AS ekh 

-- Vastaanottaa korkeakoulupaikan kolmen vuoden sisällä
UPDATE oo 
SET vastaanottaa_paikan_3v = coalesce(vkkp3.vastaanottanut_paikan,0)
FROM ANTERO.sa.temp_haku_ja_valinta_aiempi_oo2 oo
OUTER APPLY (
	SELECT TOP 1 vastaanottanut_paikan
	FROM ANTERO.sa.sa_ovara_hakeneet vkkp3
	WHERE vkkp3.kk_haku = 1 and vkkp3.vastaanottanut_paikan = 1 and vkkp3.master_oid = oo.master_oid
	and cast(concat(vkkp3.koulutuksen_alkamisvuosi,'.', case when vkkp3.koulutuksen_alkamiskausi = 's' then '5' else 0 end) as float) between oo.kausi and oo.kausi + 2
) AS vkkp3 

DROP TABLE IF EXISTS ANTERO.dw.f_haku_ja_valinta_korkea_aste_hakijat_aiemmat_opiskeluoikeudet_ja_tutkinnot

SELECT 
	 f.master_oid
    ,f.hakemus_oid
	,f.d_hakukohde_id
	,f.d_organisaatioluokitus_muu_korkeakoulu_id
	,f.d_koulutusluokitus_muu_tutkinto_id
	,f.muu_alkamispvm
	,f.muu_paattymispvm
	,f.d_organisaatioluokitus_aiempi_tutkinto_korkeakoulu_id
	,f.d_koulutusluokitus_aiempi_tutkinto_id
	,f.aiempi_tutkinto_suorituspvm
	,f.op_oikeus_tai_tutkinto
	,f.ensi_kertaa_hakeva
	,f.vastaanottaa_paikan_3v
	,muu_paattymispvm_prio = MAX(coalesce(f.muu_paattymispvm,'9999-01-01')) OVER (PARTITION BY f.hakemus_oid)
	-- CSCVIPUNEN-3367
	,muu_oo_koulutusala_taso_1_sama_kuin_hakukohde = 
		MAX(CASE WHEN d10.koulutusalataso1_koodi = d8.koulutusalataso1_koodi THEN 1 ELSE 0 END)
			OVER (PARTITION BY f.master_oid, f.hakemus_oid, f.d_hakukohde_id) 
	,muu_oo_koulutusala_taso_2_sama_kuin_hakukohde = 
		MAX(CASE WHEN d10.koulutusalataso2_koodi = d8.koulutusalataso2_koodi THEN 1 ELSE 0 END)
			OVER (PARTITION BY f.master_oid, f.hakemus_oid, f.d_hakukohde_id) 
	,muu_oo_koulutusala_taso_3_sama_kuin_hakukohde = 
		MAX(CASE WHEN d10.koulutusalataso3_koodi = d8.koulutusalataso3_koodi THEN 1 ELSE 0 END)
			OVER (PARTITION BY f.master_oid, f.hakemus_oid, f.d_hakukohde_id) 
	,muu_oo_koulutusaste_taso_2_sama_kuin_hakukohde = 
		MAX(CASE WHEN d10.koulutusastetaso2_koodi = d8.koulutusastetaso2_koodi THEN 1 ELSE 0 END)
			OVER (PARTITION BY f.master_oid, f.hakemus_oid, f.d_hakukohde_id)
	,muu_oo_tavoitetutkinto_sama_kuin_hakukohde = 
		MAX(CASE WHEN d10.koulutusluokitus_koodi = d8.koulutusluokitus_koodi THEN 1 ELSE 0 END)
			OVER (PARTITION BY f.master_oid, f.hakemus_oid, f.d_hakukohde_id) 
	,muu_oo_korkeakoulu_sama_kuin_hakukohde =
		MAX(CASE WHEN d11.organisaatio_nykyinen_koodi = d6.organisaatio_nykyinen_koodi THEN 1 ELSE 0 END)
			OVER (PARTITION BY f.master_oid, f.hakemus_oid, f.d_hakukohde_id) 
	,aiempi_tutk_koulutusala_taso_1_sama_kuin_hakukohde = 
		MAX(CASE WHEN d10.koulutusalataso1_koodi = d9.koulutusalataso1_koodi THEN 1 ELSE 0 END)
			OVER (PARTITION BY f.master_oid, f.hakemus_oid, f.d_hakukohde_id) 
	,aiempi_tutk_koulutusala_taso_2_sama_kuin_hakukohde = 
		MAX(CASE WHEN d10.koulutusalataso2_koodi = d9.koulutusalataso2_koodi THEN 1 ELSE 0 END)
			OVER (PARTITION BY f.master_oid, f.hakemus_oid, f.d_hakukohde_id) 
	,aiempi_tutk_koulutusala_taso_3_sama_kuin_hakukohde = 
		MAX(CASE WHEN d10.koulutusalataso3_koodi = d9.koulutusalataso3_koodi THEN 1 ELSE 0 END)
			OVER (PARTITION BY f.master_oid, f.hakemus_oid, f.d_hakukohde_id) 
	,aiempi_tutk_koulutusaste_taso_2_sama_kuin_hakukohde = 
		MAX(CASE WHEN d10.koulutusastetaso2_koodi = d9.koulutusastetaso2_koodi THEN 1 ELSE 0 END)
			OVER (PARTITION BY f.master_oid, f.hakemus_oid, f.d_hakukohde_id)
	,aiempi_tutk_tavoitetutkinto_sama_kuin_hakukohde = 
		MAX(CASE WHEN d10.koulutusluokitus_koodi = d9.koulutusluokitus_koodi THEN 1 ELSE 0 END)
			OVER (PARTITION BY f.master_oid, f.hakemus_oid, f.d_hakukohde_id) 
	,aiempi_tutk_korkeakoulu_sama_kuin_hakukohde =
		MAX(CASE WHEN d11.organisaatio_nykyinen_koodi = d7.organisaatio_nykyinen_koodi THEN 1 ELSE 0 END)
			OVER (PARTITION BY f.master_oid, f.hakemus_oid, f.d_hakukohde_id) 
	,tuorein_aiempi_tutkinto_suorituspvm = 
		MAX(f.aiempi_tutkinto_suorituspvm)
			OVER (PARTITION BY f.master_oid, f.hakemus_oid)
	,tuorein_muu_oo_alkamispvm =
		MAX(f.muu_alkamispvm)
			OVER (PARTITION BY f.master_oid, f.hakemus_oid)
	,muun_opintooikeuden_vertailu =
		MAX(CASE
				WHEN d10.koulutusluokitus_koodi = d8.koulutusluokitus_koodi AND d11.organisaatio_nykyinen_koodi = d6.organisaatio_nykyinen_koodi THEN 6
				WHEN d10.koulutusalataso1_koodi = d8.koulutusalataso1_koodi AND d11.organisaatio_nykyinen_koodi = d6.organisaatio_nykyinen_koodi THEN 5
				WHEN d10.koulutusalataso1_koodi <> d8.koulutusalataso1_koodi AND d11.organisaatio_nykyinen_koodi = d6.organisaatio_nykyinen_koodi THEN 4
				WHEN d10.koulutusalataso1_koodi = d8.koulutusalataso1_koodi AND d11.organisaatio_nykyinen_koodi <> d6.organisaatio_nykyinen_koodi THEN 3
				WHEN d10.koulutusalataso1_koodi <> d8.koulutusalataso1_koodi AND  d11.organisaatio_nykyinen_koodi <> d6.organisaatio_nykyinen_koodi THEN 2
				WHEN d6.id is null THEN 1 
			END)
			OVER (PARTITION BY f.master_oid, f.hakemus_oid, f.d_hakukohde_id) 
	,aiemman_tutkinnon_vertailu = 
		MAX(CASE
				WHEN d10.koulutusluokitus_koodi = d9.koulutusluokitus_koodi AND d11.organisaatio_nykyinen_koodi = d7.organisaatio_nykyinen_koodi THEN 6
				WHEN d10.koulutusalataso1_koodi = d9.koulutusalataso1_koodi AND d11.organisaatio_nykyinen_koodi = d7.organisaatio_nykyinen_koodi THEN 5
				WHEN d10.koulutusalataso1_koodi <> d9.koulutusalataso1_koodi AND d11.organisaatio_nykyinen_koodi = d7.organisaatio_nykyinen_koodi THEN 4
				WHEN d10.koulutusalataso1_koodi = d9.koulutusalataso1_koodi AND d11.organisaatio_nykyinen_koodi <> d7.organisaatio_nykyinen_koodi THEN 3
				WHEN d10.koulutusalataso1_koodi <> d9.koulutusalataso1_koodi AND  d11.organisaatio_nykyinen_koodi <> d7.organisaatio_nykyinen_koodi THEN 2
				WHEN d7.id is null THEN 1 
			END)
			OVER (PARTITION BY f.master_oid, f.hakemus_oid, f.d_hakukohde_id)
	,f.loadtime
INTO ANTERO.dw.f_haku_ja_valinta_korkea_aste_hakijat_aiemmat_opiskeluoikeudet_ja_tutkinnot
FROM ANTERO.sa.temp_haku_ja_valinta_aiempi_oo2 f
LEFT JOIN dw.d_organisaatioluokitus d6 on d6.id = f.d_organisaatioluokitus_muu_korkeakoulu_id 
LEFT JOIN dw.d_organisaatioluokitus d7 on d7.id = f.d_organisaatioluokitus_aiempi_tutkinto_korkeakoulu_id
LEFT JOIN dw.d_koulutusluokitus d8 on d8.id = f.d_koulutusluokitus_muu_tutkinto_id
LEFT JOIN dw.d_koulutusluokitus d9 on d9.id = f.d_koulutusluokitus_aiempi_tutkinto_id
LEFT JOIN dw.d_koulutusluokitus d10 on d10.id = f.d_koulutusluokitus_id
LEFT JOIN dw.d_organisaatioluokitus d11 on d11.id = f.d_organisaatioluokitus_oppilaitos_id

DROP TABLE IF EXISTS ANTERO.sa.temp_haku_ja_valinta_oo
DROP TABLE IF EXISTS ANTERO.sa.temp_haku_ja_valinta_aiempi_oo
DROP TABLE IF EXISTS ANTERO.sa.temp_haku_ja_valinta_aiempi_oo2