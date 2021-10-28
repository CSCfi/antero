USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_horizon_maakoodit]    Script Date: 25.10.2021 8:57:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_d_horizon_maakoodit] AS

TRUNCATE TABLE dw.d_horizon_maakoodit
INSERT INTO dw.d_horizon_maakoodit (	
	eu_koodi,
	iso_koodi,
	maa,
	[loadtime],
	[username]
)
Select	
	eu_koodi,
	isoCode,
	[name],
	getdate(),
	suser_name()
FROM [ANTERO].[sa].[sa_horizon_maakoodit]





GO


