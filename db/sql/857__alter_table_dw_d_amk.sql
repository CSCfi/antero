USE [ANTERO]
GO
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_amk' AND COLUMN_NAME='jarjestys_amk_tunnus')

BEGIN
	ALTER TABLE dw.d_amk ADD jarjestys_amk_tunnus AS
  case when amk_tunnus = -1 then  '99999' else cast(amk_tunnus as varchar(10))
  END
END
GO
