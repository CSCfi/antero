USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_amm_opiskelijavuodet]    Script Date: 10.10.2019 16:15:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_koski_amm_opiskelijavuodet] AS

--opiskelijavuodet opiskeluoikeuksittain
EXEC dw.p_lataa_f_koski_amm_opiskelijavuodet_vaihe1

--taulun unpivotointi
EXEC dw.p_lataa_f_koski_amm_opiskelijavuodet_vaihe2

--yhdistäminen dimensioihin ja ryhmittely (group by)
EXEC dw.p_lataa_f_koski_amm_opiskelijavuodet_vaihe3

--painotusten laskennassa tarvittavat pohjakoulutustiedot
EXEC sa.p_lataa_sa_amos_tutkinnot_pohjakoulutus_kaikki
EXEC sa.p_lataa_sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot

--painotettujen muuttujien laskenta
EXEC dw.p_lataa_f_koski_amm_opiskelijavuodet_vaihe4



