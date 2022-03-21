USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_amos_opiskelijavuodet_koko]    Script Date: 30.3.2021 14:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





ALTER PROCEDURE [dw].[p_lataa_amos_opiskelijavuodet_koko] @minVuosi int = 2018, @maxVuosi int = NULL AS


EXEC Koski_SA.dbo.p_lataa_opiskelijavuodet_valitaulu @minVuosi, @maxVuosi
EXEC Koski_SA.dbo.p_lataa_opiskelijavuodet_valitaulu_unpivot
EXEC Koski_SA.dbo.p_lataa_opiskelijavuodet_valitaulu_unpivot_luvat

EXEC dw.p_lataa_f_amos_opiskelijavuodet
EXEC dw.p_lataa_f_amos_opiskelijavuodet_painotetut
EXEC dw.p_lataa_f_amos_opiskelijavuodet_painotetut_generoi_hyvaksytty_korotustekija

EXEC dw.p_lataa_f_amos_opiskelijavuodet_uusi
EXEC dw.p_lataa_f_amos_opiskelijavuodet_painotetut_uusi
EXEC dw.p_lataa_f_amos_opiskelijavuodet_painotetut_generoi_hyvaksytty_korotustekija_uusi
