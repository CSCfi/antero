USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_haku_ja_valinta_korkea_aste_valintatapajonot]    Script Date: 30.7.2025 12.06.42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [sa].[paivita_haku_ja_valinta_henkilo_oidit] AS

UPDATE h 
SET HenkiloOID = h2.master_oid
FROM ANTERO.sa.sa_odw_hakeneet  h
INNER JOIN Koski_SA.sa.sa_koski_henkilo h2 on h2.oppija_oid = h.HenkiloOID

UPDATE y 
SET HenkiloOID = h2.master_oid
FROM ANTERO.sa.sa_odw_yoarvosanat y
INNER JOIN Koski_SA.sa.sa_koski_henkilo h2 on h2.oppija_oid = y.HenkiloOID

UPDATE v
SET HenkiloOID = h2.master_oid
FROM ANTERO.sa.sa_odw_valintatapajono v
INNER JOIN Koski_SA.sa.sa_koski_henkilo h2 on h2.oppija_oid = v.HenkiloOID

UPDATE o
SET oid = h2.master_oid
FROM ANTERO.sa.sa_virta_otp_korkeakouluhaut_hakijat_opiskeluoikeudet o
INNER JOIN Koski_SA.sa.sa_koski_henkilo h2 on h2.oppija_oid = o.oid

UPDATE t
SET oid = h2.master_oid
FROM ANTERO.sa.sa_virta_otp_korkeakouluhaut_hakijat_tutkinnot t
INNER JOIN Koski_SA.sa.sa_koski_henkilo h2 on h2.oppija_oid = t.oid

GO


