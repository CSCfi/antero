IF NOT EXISTS (
  select *
  from INFORMATION_SCHEMA.ROUTINES
  where ROUTINE_TYPE='PROCEDURE'
  and ROUTINE_SCHEMA='dw'
  and ROUTINE_NAME='p_lataa_f_kotimaiset_julkaisut_tilasto'
) BEGIN
-- wrap in exec as create procedure must be first call in batch... (the if and begin is too much)
exec('
CREATE PROCEDURE dw.p_lataa_f_kotimaiset_julkaisut_tilasto AS
')
END
