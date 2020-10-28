USE [ANTERO]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_oiva_tutkinto_oikeudet]    Script Date: 28.10.2020 9:15:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [sa].[p_lataa_oiva_tutkinto_oikeudet] AS

DROP TABLE IF EXISTS sa.sa_amos_oiva_tutkinto_oikeudet

SELECT * 
INTO sa.sa_amos_oiva_tutkinto_oikeudet
FROM sa.v_amos_oiva_tutkinto_oikeudet
