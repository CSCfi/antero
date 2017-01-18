IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_f_kotimaiset_julkaisut_tilasto') AND type in (N'P', N'PC'))
BEGIN
  EXEC dbo.sp_executesql @statement = N'DROP PROCEDURE dw.p_lataa_f_kotimaiset_julkaisut_tilasto'
END
