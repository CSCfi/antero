IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_f_amk_talous_4_tilikauden_tutkimusmenot_ja_rahoitus') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE dw.p_lataa_f_amk_talous_4_tilikauden_tutkimusmenot_ja_rahoitus AS' 
END