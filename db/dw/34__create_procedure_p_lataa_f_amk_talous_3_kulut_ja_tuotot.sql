IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.p_lataa_f_amk_talous_3_kulut_ja_tuotot') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE dbo.p_lataa_f_amk_talous_3_kulut_ja_tuotot AS' 
END