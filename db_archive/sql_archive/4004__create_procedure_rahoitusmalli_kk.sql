USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa__rahoitusmalli_kk]    Script Date: 29.9.2020 13:34:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa__rahoitusmalli_kk]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa__rahoitusmalli_kk] AS' 
END
GO

ALTER PROCEDURE [dw].[p_lataa__rahoitusmalli_kk] AS

--dimensiot
EXEC [dw].[p_lataa_d_rahoitusmalli_amk]
EXEC [dw].[p_lataa_d_rahoitusmalli_yo]
EXEC [dw].[p_lataa_d_amk_rahoitusmalliala]
EXEC [dw].[p_lataa_d_yo_rahoitusmalliala]

--sa-taulut
EXEC [sa].[p_lataa_rahoitusmalli_amk_koulutus]
EXEC [sa].[p_lataa_rahoitusmalli_amk_tutkimus]
EXEC [sa].[p_lataa_rahoitusmalli_yo_koulutus]
EXEC [sa].[p_lataa_rahoitusmalli_yo_tutkimus]

--faktataulut
EXEC [dw].[p_lataa_f_rahoitusmalli] 2019, 2021, 'amk'
EXEC [dw].[p_lataa_f_rahoitusmalli] 2019, 2021, 'yo'
