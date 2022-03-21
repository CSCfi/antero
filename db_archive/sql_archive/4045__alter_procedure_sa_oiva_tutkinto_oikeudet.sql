USE [ANTERO]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_oiva_tutkinto_oikeudet]    Script Date: 25.10.2020 19:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_oiva_tutkinto_oikeudet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_oiva_tutkinto_oikeudet] AS' 
END
GO

ALTER PROCEDURE [sa].[p_lataa_oiva_tutkinto_oikeudet] AS

DROP TABLE sa.sa_amos_oiva_tutkinto_oikeudet

SELECT * 
INTO sa.sa_amos_oiva_tutkinto_oikeudet
FROM sa.v_amos_oiva_tutkinto_oikeudet
