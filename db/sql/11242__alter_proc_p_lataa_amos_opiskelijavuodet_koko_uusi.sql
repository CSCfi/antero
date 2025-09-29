USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_amos_opiskelijavuodet_koko_uusi] AS

EXEC Koski_SA.[sa].[p_lataa_perusopetuksen_keskiarvot]

--huom. vanha malli käyttää samoja kohdetauluja
EXEC Koski_SA.dbo.p_lataa_opiskelijavuodet_valitaulu_uusi --lasketaan aikajaksot yhteisesti lasna/loma/valmistunut ilman opva-rajoitteita
EXEC Koski_SA.dbo.p_lataa_opiskelijavuodet_valitaulu_unpivot_uusi --heinäkuun ja lomien osalta erilainen laskenta
EXEC Koski_SA.dbo.p_lataa_opiskelijavuodet_valitaulu_unpivot_luvat

EXEC dw.p_lataa_f_amos_opiskelijavuodet
--
EXEC dw.p_lataa_f_amos_opiskelijavuodet_uusi --limittäisten rahoituskausien monistus; huom. tutkinnon osien osaamispisteleikkurissa hyödynnetään tämän lopputulosta
EXEC dw.p_lataa_f_amos_opiskelijavuodet_painotetut_uusi 0
EXEC dw.p_lataa_f_amos_opiskelijavuodet_painotetut_uusi 1 --estimaattikauden muodostus
EXEC dw.p_lataa_f_amos_opiskelijavuodet_painotetut_uusi_unpivot --lähinnä korotustekijöiden suodatusten erottelemiseksi

GO
