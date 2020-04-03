USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_horizon]   ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_horizon_maakoodit]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_horizon_maakoodit] AS' 
END
GO

ALTER PROCEDURE [dw].[p_lataa_d_horizon_maakoodit] AS

TRUNCATE TABLE dw.f_horizon
INSERT INTO dw.d_horizon_maakoodit (	
	eu_koodi,
	iso_koodi,
	maa
)
Select	
	eu_koodi,
	isoCode,
	[name]
FROM [ANTERO].[sa].[sa_horizon_maakoodit]


