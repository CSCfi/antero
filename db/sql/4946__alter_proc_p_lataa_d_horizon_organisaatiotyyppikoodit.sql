USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_horizon_organisaatiotyyppikoodit]    Script Date: 25.10.2021 8:58:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_d_horizon_organisaatiotyyppikoodit] AS

TRUNCATE TABLE dw.d_horizon_organisaatiotyyppikoodit
INSERT INTO dw.d_horizon_organisaatiotyyppikoodit (	
	organisaatiotyyppi_koodi,
	Organisaatiotyyppi,
	[loadtime],
	[username]
)
Select	
	Code,
	Title,
	getdate(),
	suser_name()
FROM [ANTERO].[sa].[sa_horizon_organisaatiotyypit]






GO


