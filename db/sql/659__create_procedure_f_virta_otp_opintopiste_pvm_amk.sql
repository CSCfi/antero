IF NOT EXISTS (
  select *
  from INFORMATION_SCHEMA.ROUTINES
  where ROUTINE_TYPE='PROCEDURE'
  and ROUTINE_SCHEMA='dw'
  and ROUTINE_NAME='p_lataa_f_virta_otp_opintopiste_pvm_amk'
) BEGIN
 
 
exec('CREATE PROCEDURE dw.p_lataa_f_virta_otp_opintopiste_pvm_amk AS') END
GO

