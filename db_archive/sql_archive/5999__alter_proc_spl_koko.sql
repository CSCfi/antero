USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_amos_tutkinnot_ja_tutkinnonosat_koko]    Script Date: 6.3.2022 18:55:08 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_amos_tutkinnot_ja_tutkinnonosat_koko]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_amos_opiskelijavuodet_koko]    Script Date: 6.3.2022 18:55:08 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_amos_opiskelijavuodet_koko]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_amos_opiskelijavuodet_koko]    Script Date: 6.3.2022 18:55:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_amos_opiskelijavuodet_koko]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_amos_opiskelijavuodet_koko] AS' 
END
GO





ALTER PROCEDURE [dw].[p_lataa_amos_opiskelijavuodet_koko] @minVuosi int = 2018, @maxVuosi int = NULL AS


EXEC Koski_SA.dbo.p_lataa_opiskelijavuodet_valitaulu @minVuosi, @maxVuosi
EXEC Koski_SA.dbo.p_lataa_opiskelijavuodet_valitaulu_unpivot
EXEC Koski_SA.dbo.p_lataa_opiskelijavuodet_valitaulu_unpivot_luvat

EXEC dw.p_lataa_f_amos_opiskelijavuodet
EXEC dw.p_lataa_f_amos_opiskelijavuodet_painotetut
EXEC dw.p_lataa_f_amos_opiskelijavuodet_painotetut_unpivot
EXEC dw.p_lataa_f_amos_opiskelijavuodet_painotetut_unpivot_generoi_hyvaksytty_korotustekija


GO
/****** Object:  StoredProcedure [dw].[p_lataa_amos_tutkinnot_ja_tutkinnonosat_koko]    Script Date: 6.3.2022 18:55:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_amos_tutkinnot_ja_tutkinnonosat_koko]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_amos_tutkinnot_ja_tutkinnonosat_koko] AS' 
END
GO




ALTER PROCEDURE [dw].[p_lataa_amos_tutkinnot_ja_tutkinnonosat_koko] @minVuosi int = 2018, @maxVuosi int = null AS


EXEC Koski_SA.dbo.p_lataa_tutkinnot_ja_tutkinnonosat_esivalmistelu @minVuosi,@maxVuosi

EXEC Koski_SA.dbo.p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu
EXEC Koski_SA.dbo.p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty
EXEC Koski_SA.dbo.p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty_luvat

EXEC dw.p_lataa_f_amos_tutkinnot_ja_tutkinnonosat

EXEC dw.p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut
EXEC dw.p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot
EXEC dw.p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot_generoi_hyvaksytty_korotustekija

