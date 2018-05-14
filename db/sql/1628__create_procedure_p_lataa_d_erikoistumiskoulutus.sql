IF NOT EXISTS (
  select *
  from INFORMATION_SCHEMA.ROUTINES
  where ROUTINE_TYPE='PROCEDURE'
  and ROUTINE_SCHEMA='dw'
  and ROUTINE_NAME='p_lataa_d_erikoistumiskoulutus'
) BEGIN


exec('CREATE PROCEDURE dw.p_lataa_d_erikoistumiskoulutus AS') END
GO
