IF NOT EXISTS (
  select *
  from INFORMATION_SCHEMA.ROUTINES
  where ROUTINE_TYPE='PROCEDURE'
  and ROUTINE_SCHEMA='dw'
  and ROUTINE_NAME='p_lataa_d_virtajtpsektori'
) BEGIN
-- wrap in exec as create procedure must be first call in batch... (the if and begin is too much)
exec('
CREATE PROCEDURE dw.p_lataa_d_virtajtpsektori AS
');
END
