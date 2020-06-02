IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_f_amk_talous_vanha_koodisto') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE dw.p_lataa_f_amk_talous_vanha_koodisto AS' END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_d_yo_talous_vanha_koodisto') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE dw.p_lataa_f_yo_talous_vanha_koodisto AS' END
