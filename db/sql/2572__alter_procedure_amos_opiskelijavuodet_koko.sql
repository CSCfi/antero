USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_amos_opiskelijavuodet_koko]    Script Date: 25.10.2019 11:10:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dw].[p_lataa_amos_opiskelijavuodet_koko] AS


EXEC Koski_SA.dbo.p_lataa_opiskelijavuodet_valitaulu

EXEC Koski_SA.dbo.p_lataa_opiskelijavuodet_valitaulu_unpivot

EXEC ANTERO.dw.p_lataa_f_amos_opiskelijavuodet

EXEC ANTERO.dw.p_lataa_f_amos_opiskelijavuodet_painotetut
