if not exists (select * from sys.objects where object_id = object_id('dw.p_lataa_f_virta_otp_opintopiste_pvm_yo') and type in ('p', 'pc'))
begin
exec dbo.sp_executesql @statement = N'create procedure dw.p_lataa_f_virta_otp_opintopiste_pvm_yo as'end
go

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_f_virta_otp_opintopiste_pvm_yo') AND type in (N'P', N'PC'))
BEGIN EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE dw.p_lataa_f_virta_otp_opintopiste_pvm_yo AS' END
