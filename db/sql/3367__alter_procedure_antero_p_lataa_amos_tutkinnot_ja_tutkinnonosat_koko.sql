USE [ANTERO]
GO


/****** Object:  StoredProcedure [dw].[p_lataa_amos_tutkinnot_ja_tutkinnonosat_koko]    Script Date: 15.9.2020 9:07:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER PROCEDURE [dw].[p_lataa_amos_tutkinnot_ja_tutkinnonosat_koko] @minVuosi int = 2018, @maxVuosi int = null AS


EXEC Koski_SA.dbo.p_lataa_tutkinnot_ja_tutkinnonosat_esivalmistelu @minVuosi,@maxVuosi

EXEC Koski_SA.dbo.p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu
EXEC Koski_SA.dbo.p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty

EXEC dw.p_lataa_f_amos_tutkinnot_ja_tutkinnonosat

EXEC sa.p_lataa_sa_amos_tutkinnot_pohjakoulutus_kaikki
EXEC sa.p_lataa_sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot

EXEC dw.p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut
EXEC dw.p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut_generoi_hyvaksytty_korotustekija

EXEC dw.p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_uusi
EXEC dw.p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut_uusi


GO


