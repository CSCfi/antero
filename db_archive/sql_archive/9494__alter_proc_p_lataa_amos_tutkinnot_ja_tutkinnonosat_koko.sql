USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_amos_tutkinnot_ja_tutkinnonosat_koko]    Script Date: 2.1.2024 14:51:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_amos_tutkinnot_ja_tutkinnonosat_koko] @minVuosi int = 2018, @maxVuosi int = null AS

EXEC Koski_SA.dbo.p_lataa_tutkinnot_ja_tutkinnonosat_esivalmistelu @minVuosi,@maxVuosi

EXEC Koski_SA.dbo.p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu
EXEC Koski_SA.dbo.p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu_duplikaatit
EXEC Koski_SA.dbo.p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu_duplikaatit_rahoituskausittain
EXEC Koski_SA.dbo.p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu_paallekkainen_tuva
EXEC Koski_SA.dbo.p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty
EXEC Koski_SA.dbo.p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty_luvat

EXEC dw.p_lataa_f_amos_tutkinnot_ja_tutkinnonosat

EXEC dw.p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut
EXEC dw.p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot
EXEC dw.p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot_generoi_hyvaksytty_korotustekija

GO
