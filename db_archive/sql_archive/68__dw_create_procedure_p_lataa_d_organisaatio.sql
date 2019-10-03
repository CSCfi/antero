IF NOT EXISTS (
  select *
  from INFORMATION_SCHEMA.ROUTINES
  where ROUTINE_TYPE='PROCEDURE'
  and ROUTINE_SCHEMA='dw'
  and ROUTINE_NAME='p_lataa_d_organisaatio'
) BEGIN
-- wrap in exec as create procedure must be first call in batch...
exec('
CREATE PROCEDURE dw.p_lataa_d_organisaatio AS
')
END
