USE [ANTERO]
GO

/****** Object:  StoredProcedure [sa].[paivita_ovara]    Script Date: 4.2.2026 8.40.25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [sa].[paivita_ovara] AS

--------------------------------------------------------
/* Priorisoidaan Suomi muiden kansalaisuuksien edelle */
--------------------------------------------------------

UPDATE [ANTERO].[sa].[sa_ovara_ataru_hakemus]
set kansalaisuus = concat('246,', replace(kansalaisuus, ',246', ''))
WHERE kansalaisuus like '%,246%'

UPDATE [ANTERO].[sa].[sa_ovara_onr_henkilo]
set kansalaisuus = concat('246,', replace(kansalaisuus, ',246', ''))
WHERE kansalaisuus like '%,246%'

---------------------------------
/* Henkilötiedot master-oidista*/
---------------------------------

UPDATE h 
set 
	syntymaaika = h2.syntymaaika,
	aidinkieli = h2.aidinkieli,
	kansalaisuus = h2.kansalaisuus,
	sukupuoli = h2.sukupuoli
FROM [ANTERO].[sa].[sa_ovara_onr_henkilo] h
LEFT JOIN [ANTERO].[sa].[sa_ovara_onr_henkilo] h2 on h2.henkilo_oid = h.master_oid
WHERE h.henkilo_oid <> h2.master_oid

------------------------------------------
/* Populoidaan/Päivitetään master OID:t */
------------------------------------------

UPDATE s
SET master_oid = coalesce(h.master_oid, s.master_oid)
FROM ANTERO.sa.sa_odw_hakeneet_updated s
LEFT JOIN ANTERO.sa.sa_ovara_onr_henkilo h on s.master_oid = h.henkilo_oid
WHERE h.henkilo_oid is not null

UPDATE s
set HenkiloOID = h.master_oid
FROM ANTERO.sa.sa_odw_yoarvosanat s
LEFT JOIN ANTERO.sa.sa_ovara_onr_henkilo h on s.HenkiloOID = h.henkilo_oid
WHERE h.henkilo_oid is not null

UPDATE o
set master_oid = coalesce(h.master_oid, o.henkilo_oid)
FROM ANTERO.sa.sa_ovara_sure_ensikertalainen o
LEFT JOIN ANTERO.sa.sa_ovara_onr_henkilo h on o.henkilo_oid = h.henkilo_oid

UPDATE o
set master_oid = coalesce(h.master_oid, o.henkilo_oid)
FROM ANTERO.sa.sa_ovara_ataru_hakemus o
LEFT JOIN ANTERO.sa.sa_ovara_onr_henkilo h on o.henkilo_oid = h.henkilo_oid

UPDATE o
set master_oid = coalesce(h.master_oid, o.henkilo_oid)
FROM ANTERO.sa.sa_ovara_ataru_hakutoive o
LEFT JOIN ANTERO.sa.sa_ovara_onr_henkilo h on o.henkilo_oid = h.henkilo_oid

UPDATE o
set master_oid = coalesce(h.master_oid, o.henkilo_oid)
FROM ANTERO.sa.sa_ovara_sure_opiskelija o
LEFT JOIN ANTERO.sa.sa_ovara_onr_henkilo h on o.henkilo_oid = h.henkilo_oid

UPDATE o
set master_oid = coalesce(h.master_oid, o.henkilo_oid)
FROM ANTERO.sa.sa_ovara_sure_proxysuoritus o
LEFT JOIN ANTERO.sa.sa_ovara_onr_henkilo h on o.henkilo_oid = h.henkilo_oid

UPDATE o
set master_oid = coalesce(h.master_oid, o.henkilo_oid)
FROM ANTERO.sa.sa_ovara_sure_suoritus o
LEFT JOIN ANTERO.sa.sa_ovara_onr_henkilo h on o.henkilo_oid = h.henkilo_oid

UPDATE o
set master_oid = coalesce(h.master_oid, o.henkilo_oid)
FROM ANTERO.sa.sa_ovara_valintarekisteri_vastaanotto o
LEFT JOIN ANTERO.sa.sa_ovara_onr_henkilo h on o.henkilo_oid = h.henkilo_oid

UPDATE o
set master_oid = coalesce(h.master_oid, o.henkilo_oid)
FROM ANTERO.sa.sa_ovara_valintarekisteri_valinnantulos o
LEFT JOIN ANTERO.sa.sa_ovara_onr_henkilo h on o.henkilo_oid = h.henkilo_oid

UPDATE o
set master_oid = coalesce(h.master_oid, o.henkilo_oid)
FROM ANTERO.sa.sa_ovara_valintarekisteri_ilmoittautuminen o
LEFT JOIN ANTERO.sa.sa_ovara_onr_henkilo h on o.henkilo_oid = h.henkilo_oid

---------------------------------
/* Päivitetään kotikuntakoodit */
---------------------------------

UPDATE ah
	set kotikunta = d.kunta_koodi
FROM ANTERO.sa.sa_ovara_ataru_hakemus ah
OUTER APPLY ( 
	SELECT 
		kunta_koodi, 
		rank() OVER(PARTITION BY d.vanha_kunta_fi ORDER BY alkupvm DESC) as rnk  
	FROM ANTERO.dw.d_alueluokitus d
	WHERE d.vanha_kunta_fi = ah.kotikunta or d.vanha_kunta_sv = ah.kotikunta
) d
WHERE d.kunta_koodi is not null and d.rnk = 1

--------------------------------------------------------------------------------------------------
/* Hakukohteille merkittyjen tuntemattomien hakuoidien päivitys hakemusten tietojen perusteella */
--------------------------------------------------------------------------------------------------

update hk 
	set haku_oid = coalesce(h.haku_oid,'-1')
FROM [ANTERO].[sa].[sa_ovara_kouta_hakukohteet] hk
OUTER APPLY (
	SELECT TOP 1 h.haku_oid FROM [ANTERO].[sa].[sa_ovara_ataru_hakemus] h
	LEFT JOIN [ANTERO].[sa].[sa_ovara_ataru_hakutoive] aht on aht.hakemus_oid = h.hakemus_oid
	WHERE aht.hakukohde_oid = hk.hakukohde_oid
) h
WHERE hk.haku_oid = '-1'

-----------------------------------
/* Päivitetään Virta-OTP:n oid:t */
-----------------------------------

UPDATE oo 
SET oid = master_oid
FROM [ANTERO].[sa].[sa_virta_otp_korkeakouluhaut_hakijat_opiskeluoikeudet] oo
LEFT JOIN [ANTERO].[sa].[sa_ovara_onr_henkilo] h on h.henkilo_oid = oo.oid
WHERE h.master_oid is not null and h.master_oid <> h.henkilo_oid

UPDATE t
SET oid = master_oid
FROM [ANTERO].[sa].[sa_virta_otp_korkeakouluhaut_hakijat_tutkinnot] t
LEFT JOIN [ANTERO].[sa].[sa_ovara_onr_henkilo] h on h.henkilo_oid = t.oid
WHERE h.master_oid is not null and h.master_oid <> h.henkilo_oid