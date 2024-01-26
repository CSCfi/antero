USE [ANTERO]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_amos_oiva_tutkintokielet]    Script Date: 6.3.2022 18:34:42 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_amos_oiva_tutkintokielet]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_amos_oiva_tutkinto_oikeudet]    Script Date: 6.3.2022 18:34:42 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_amos_oiva_tutkinto_oikeudet]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_amos_oiva_opetuskielet]    Script Date: 6.3.2022 18:34:42 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_amos_oiva_opetuskielet]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_amos_oiva_opetuskielet]    Script Date: 6.3.2022 18:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_amos_oiva_opetuskielet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_amos_oiva_opetuskielet] AS' 
END
GO


ALTER PROCEDURE [sa].[p_lataa_amos_oiva_opetuskielet] AS

IF EXISTS (SELECT TOP 1 1 FROM sa.v_amos_oiva_opetuskielet)

BEGIN

	DROP TABLE IF EXISTS sa.sa_amos_oiva_opetuskielet

	SELECT * 
	INTO sa.sa_amos_oiva_opetuskielet
	FROM sa.v_amos_oiva_opetuskielet
	
END




GO
/****** Object:  StoredProcedure [sa].[p_lataa_amos_oiva_tutkinto_oikeudet]    Script Date: 6.3.2022 18:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_amos_oiva_tutkinto_oikeudet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_amos_oiva_tutkinto_oikeudet] AS' 
END
GO

ALTER PROCEDURE [sa].[p_lataa_amos_oiva_tutkinto_oikeudet] AS

IF EXISTS (SELECT TOP 1 1 FROM sa.v_amos_oiva_tutkinto_oikeudet)

BEGIN

	DROP TABLE IF EXISTS sa.sa_amos_oiva_tutkinto_oikeudet

	SELECT * 
	INTO sa.sa_amos_oiva_tutkinto_oikeudet
	FROM sa.v_amos_oiva_tutkinto_oikeudet
	
END

GO
/****** Object:  StoredProcedure [sa].[p_lataa_amos_oiva_tutkintokielet]    Script Date: 6.3.2022 18:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_amos_oiva_tutkintokielet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_amos_oiva_tutkintokielet] AS' 
END
GO


ALTER PROCEDURE [sa].[p_lataa_amos_oiva_tutkintokielet] AS

IF EXISTS (SELECT TOP 1 1 FROM sa.v_amos_oiva_tutkintokielet)

BEGIN

	DROP TABLE IF EXISTS sa.sa_amos_oiva_tutkintokielet

	SELECT * 
	INTO sa.sa_amos_oiva_tutkintokielet
	FROM sa.v_amos_oiva_tutkintokielet
	
END


