USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_amos_tutkinnot_ja_tutkinnonosat_koko]    Script Date: 8.12.2019 17:53:55 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_amos_tutkinnot_ja_tutkinnonosat_koko]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_amos_opiskelijavuodet_koko]    Script Date: 8.12.2019 17:53:55 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_amos_opiskelijavuodet_koko]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_amos_opiskelijavuodet_koko]    Script Date: 8.12.2019 17:53:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_amos_opiskelijavuodet_koko]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_amos_opiskelijavuodet_koko] AS' 
END
GO




ALTER PROCEDURE [dw].[p_lataa_amos_opiskelijavuodet_koko] AS

DECLARE @minVuosi as int, @maxVuosi as int
SET @minVuosi = 2019
SET @maxVuosi = NULL

EXEC Koski_SA.dbo.p_lataa_opiskelijavuodet_valitaulu @minVuosi, @maxVuosi

EXEC Koski_SA.dbo.p_lataa_opiskelijavuodet_valitaulu_unpivot

EXEC ANTERO.dw.p_lataa_f_amos_opiskelijavuodet

EXEC ANTERO.dw.p_lataa_f_amos_opiskelijavuodet_painotetut

GO
/****** Object:  StoredProcedure [dw].[p_lataa_amos_tutkinnot_ja_tutkinnonosat_koko]    Script Date: 8.12.2019 17:53:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_amos_tutkinnot_ja_tutkinnonosat_koko]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_amos_tutkinnot_ja_tutkinnonosat_koko] AS' 
END
GO





ALTER PROCEDURE [dw].[p_lataa_amos_tutkinnot_ja_tutkinnonosat_koko] AS

DECLARE @minVuosi as int, @maxVuosi as int
SET @minVuosi = 2019
SET @maxVuosi = NULL


EXEC Koski_SA.dbo.p_lataa_tutkinnot_ja_tutkinnonosat_esivalmistelu @minVuosi,@maxVuosi

EXEC Koski_SA.dbo.p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu
EXEC Koski_SA.dbo.p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty

EXEC dw.p_lataa_f_amos_tutkinnot_ja_tutkinnonosat

EXEC sa.p_lataa_sa_amos_tutkinnot_pohjakoulutus_kaikki
EXEC sa.p_lataa_sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot

EXEC dw.p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut


GO
USE [ANTERO]