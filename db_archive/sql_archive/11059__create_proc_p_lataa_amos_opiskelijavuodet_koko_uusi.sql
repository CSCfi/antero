USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROCEDURE [dw].[p_lataa_amos_opiskelijavuodet_koko_uusi] @minVuosi int = 2023, @maxVuosi int = NULL AS

EXEC Koski_SA.[sa].[p_lataa_perusopetuksen_keskiarvot]

EXEC Koski_SA.dbo.p_lataa_opiskelijavuodet_valitaulu @minVuosi, @maxVuosi, 0.0 --pv-rajoite opva-päättelyitä varten
EXEC Koski_SA.dbo.p_lataa_opiskelijavuodet_valitaulu_unpivot_uusi --heinäkuun ja lomien osalta erilainen laskenta
EXEC Koski_SA.dbo.p_lataa_opiskelijavuodet_valitaulu_unpivot_luvat

EXEC dw.p_lataa_f_amos_opiskelijavuodet
EXEC dw.p_lataa_f_amos_opiskelijavuodet_uusi --limittäisten rahoituskausien muodostus; huom. tutkinnon osien osaamispisteleikkurissa hyödynnetään tämän lopputulosta
EXEC dw.p_lataa_f_amos_opiskelijavuodet_painotetut_uusi 0
EXEC dw.p_lataa_f_amos_opiskelijavuodet_painotetut_uusi 1 --estimaattikauden muodostus
EXEC dw.p_lataa_f_amos_opiskelijavuodet_painotetut_uusi_unpivot --korotustekijöiden suodatusten erottelemiseksi

GO
