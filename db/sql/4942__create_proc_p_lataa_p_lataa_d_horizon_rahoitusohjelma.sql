USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_horizon_rahoitusohjelma]   ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_horizon_rahoitusohjelma]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_horizon_rahoitusohjelma] AS' 
END
GO

ALTER PROCEDURE [dw].[p_lataa_d_horizon_rahoitusohjelma] AS

TRUNCATE TABLE dw.d_horizon_rahoitusohjelma
INSERT INTO dw.d_horizon_rahoitusohjelma (	
	rahoitusohjelma_koodi,
	Rahoitusohjelma,
	[loadtime],
	[username]
)
Select	
	code,
	coalesce(title, 'Missing information'),
	getdate(),
	suser_name()
FROM [ANTERO].[sa].[sa_horizon_rahoitusohjelma]


