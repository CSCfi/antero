USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa__oiva_luvat]    Script Date: 3.9.2024 8:53:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dw].[p_lataa__oiva_luvat] AS
	
DECLARE @alkuvuosi INT = 2018
DECLARE @alku as date = '2018-01-01'


EXEC dw.p_lataa_f_oiva_luvat_amm @alku
EXEC dw.p_lataa_f_oiva_luvat_epo @alku
EXEC dw.p_lataa_f_oiva_luvat_vst @alkuvuosi
EXEC dw.p_lataa_f_oiva_luvat_tuva @alkuvuosi
EXEC dw.p_lataa_f_oiva_luvat_lukio @alku