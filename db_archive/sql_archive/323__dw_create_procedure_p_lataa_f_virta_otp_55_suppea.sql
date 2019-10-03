IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_f_virta_otp_55_suppea') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE dw.p_lataa_f_virta_otp_55_suppea AS' 
END