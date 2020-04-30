USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_horizon_organisaatiotyyppikoodit]    Script Date: 30.4.2020 11:46:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_d_horizon_organisaatiotyyppikoodit] AS

TRUNCATE TABLE dw.d_horizon_organisaatiotyyppikoodit
INSERT INTO dw.d_horizon_organisaatiotyyppikoodit (	
	organisaatiotyyppi_koodi,
	Organisaatiotyyppi
)
Select	
	Code,
	Title
FROM [ANTERO].[sa].[sa_horizon_organisaatiotyypit]





