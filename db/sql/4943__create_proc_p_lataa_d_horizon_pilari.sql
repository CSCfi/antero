USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_horizon_pilari]   ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_horizon_pilari]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_horizon_pilari] AS' 
END
GO

ALTER PROCEDURE [dw].[p_lataa_d_horizon_pilari] AS

TRUNCATE TABLE dw.d_horizon_pilari
INSERT INTO dw.d_horizon_pilari (	
	[ohjelma_koodi],
	[Pilari],
	[loadtime],
	[username]
)
SELECT  
	programme_id, 
	coalesce(shortTitle, title) as Pilari,
	getdate(),
	suser_name()
FROM [ANTERO].[sa].[sa_horizon_ohjelmat]
WHERE 
	((LEN(programme_id) - LEN(REPLACE(programme_id, '.', ''))) = 2 AND programme_id not like '%Euratom%') OR 
	programme_id in ('H2020-Euratom', 'H2020-EC')


