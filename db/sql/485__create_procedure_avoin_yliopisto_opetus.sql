IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_f_yo_avoin_yliopisto_opetus') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE dw.p_lataa_f_yo_avoin_yliopisto_opetus AS' END
