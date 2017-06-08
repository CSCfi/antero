IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'dw.v_virta_otp_liikennevalot'))
EXEC dbo.sp_executesql @statement = N'create view dw.v_virta_otp_liikennevalot as select 1 as a'
GO