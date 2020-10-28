USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_amos_opiskelijavuodet_koko]    Script Date: 28.10.2020 9:04:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





ALTER PROCEDURE [dw].[p_lataa_amos_opiskelijavuodet_koko] @minVuosi int = 2018, @maxVuosi int = NULL AS


EXEC Koski_SA.dbo.p_lataa_opiskelijavuodet_valitaulu @minVuosi, @maxVuosi

EXEC Koski_SA.dbo.p_lataa_opiskelijavuodet_valitaulu_unpivot

EXEC ANTERO.sa.p_lataa_oiva_tutkinto_oikeudet
EXEC ANTERO.dw.p_lataa_f_amos_opiskelijavuodet

EXEC ANTERO.dw.p_lataa_f_amos_opiskelijavuodet_painotetut
EXEC ANTERO.dw.p_lataa_f_amos_opiskelijavuodet_painotetut_generoi_hyvaksytty_korotustekija

EXEC ANTERO.dw.p_lataa_f_amos_opiskelijavuodet_uusi
EXEC ANTERO.dw.p_lataa_f_amos_opiskelijavuodet_painotetut_uusi
