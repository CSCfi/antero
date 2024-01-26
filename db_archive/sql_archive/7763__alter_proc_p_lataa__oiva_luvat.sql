USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa__oiva_luvat]    Script Date: 2.6.2023 10:21:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER PROCEDURE [dw].[p_lataa__oiva_luvat] AS
	
DECLARE @alkuvuosi INT = 2018


EXEC dw.p_lataa_f_oiva_luvat_amm @alkuvuosi
EXEC dw.p_lataa_f_oiva_luvat_epo @alkuvuosi
EXEC dw.p_lataa_f_oiva_luvat_vst @alkuvuosi
EXEC dw.p_lataa_f_oiva_luvat_tuva @alkuvuosi



GO


