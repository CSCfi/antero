USE [Koski_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_ytr_update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_ytr_update] AS' 
END
GO

ALTER PROCEDURE [sa].[p_lataa_ytr_update] AS


DROP TABLE IF EXISTS [Koski_SA].[sa].[sa_ytr_update]

SELECT *
INTO Koski_SA.sa.sa_ytr_update
FROM Koski_SA.sa.sa_ytr

UPDATE 
    ytr
SET 
    ytr.school_oid = (SELECT organisaatio_oid FROM ANTERO.dw.d_organisaatioluokitus d WHERE d.organisaatio_vanha_fi = ytr.school_name and d.organisaatio_avain LIKE 'oppilaitos%')
FROM 
    [Koski_SA].[sa].[sa_ytr_update] ytr
    LEFT JOIN ANTERO.dw.d_organisaatioluokitus d2 on ytr.school_oid = d2.organisaatio_oid
WHERE d2.id is null

UPDATE [Koski_SA].[sa].[sa_ytr_update]
SET school_oid = '1.2.246.562.10.34551691784'
WHERE school_name = 'Ristiinan yhtenäiskoulu ja lukio'

GO

USE [ANTERO]