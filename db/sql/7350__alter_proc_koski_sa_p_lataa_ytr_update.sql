USE [Koski_SA]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_ytr_update]    Script Date: 9.2.2023 10:56:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [sa].[p_lataa_ytr_update] AS


DROP TABLE IF EXISTS [Koski_SA].[sa].[sa_ytr_update]

SELECT 
	ytr.*, 
	d2.id as d_organisaatioluokitus_yo_id, 
	d2b.id as d_organisaatioluokitus_koulutustoimija_yo_id
INTO Koski_SA.sa.sa_ytr_update
FROM Koski_SA.sa.sa_ytr ytr
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d2 on ytr.school_oid = d2.organisaatio_oid and d2.organisaatio_avain not like 'koulutustoimija%'
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d2b on d2.ylaorganisaatio_oid = d2b.organisaatio_oid and d2b.organisaatio_avain like 'koulutustoimija%'

/*UPDATE 
    ytr
SET 
    ytr.school_oid = (SELECT organisaatio_oid FROM ANTERO.dw.d_organisaatioluokitus d WHERE d.organisaatio_vanha_fi = ytr.school_name and d.organisaatio_avain LIKE 'oppilaitos%')
FROM 
    [Koski_SA].[sa].[sa_ytr_update] ytr
    LEFT JOIN ANTERO.dw.d_organisaatioluokitus d2 on ytr.school_oid = d2.organisaatio_oid
WHERE d2.id is null

UPDATE [Koski_SA].[sa].[sa_ytr_update]
SET school_oid = '1.2.246.562.10.34551691784'
WHERE school_name = 'Ristiinan yhtenäiskoulu ja lukio' */

GO

USE [ANTERO]