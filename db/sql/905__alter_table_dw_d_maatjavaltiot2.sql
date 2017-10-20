USE [ANTERO]
GO
IF  EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_maatjavaltiot2' AND COLUMN_NAME='jarjestys_maanosa_koodi')

BEGIN
	ALTER TABLE dw.d_maatjavaltiot2 DROP COLUMN jarjestys_maanosa_koodi
END

IF  EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_maatjavaltiot2' AND COLUMN_NAME='jarjestys_maanosa2_koodi')

BEGIN
	ALTER TABLE dw.d_maatjavaltiot2 DROP COLUMN jarjestys_maanosa2_koodi
END

IF  EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_maatjavaltiot2' AND COLUMN_NAME='jarjestys_maanosa3_koodi')

BEGIN
	ALTER TABLE dw.d_maatjavaltiot2 DROP COLUMN jarjestys_maanosa3_koodi
END

IF  EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_maatjavaltiot2' AND COLUMN_NAME='jarjestys_maatjavaltiot2_koodi')

BEGIN
	ALTER TABLE dw.d_maatjavaltiot2 DROP COLUMN jarjestys_maatjavaltiot2_koodi
END



IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_maatjavaltiot2' AND COLUMN_NAME='jarjestys_maanosa_koodi')

BEGIN
	ALTER TABLE dw.d_maatjavaltiot2 ADD jarjestys_maanosa_koodi AS case when maanosa_koodi = '-1' then 'ZZZZZ'  else cast(maanosa_koodi as varchar(10))
  END
END

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_maatjavaltiot2' AND COLUMN_NAME='jarjestys_maanosa2_koodi')

BEGIN
	ALTER TABLE dw.d_maatjavaltiot2 ADD jarjestys_maanosa2_koodi AS case when maanosa2_koodi = '-1' then 'ZZZZZ'  else cast(maanosa2_koodi as varchar(10))
  END
END

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_maatjavaltiot2' AND COLUMN_NAME='jarjestys_maanosa3_koodi')

BEGIN
	ALTER TABLE dw.d_maatjavaltiot2 ADD jarjestys_maanosa3_koodi AS case when maanosa3_koodi = '-1' then 'ZZZZZ' else cast(maanosa3_koodi as varchar(10))
  END
END

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_maatjavaltiot2' AND COLUMN_NAME='jarjestys_maatjavaltiot2_koodi')

BEGIN
	ALTER TABLE dw.d_maatjavaltiot2 ADD jarjestys_maatjavaltiot2_koodi AS case when maatjavaltiot2_koodi = '-1' then 'ZZZZZ' else cast(maatjavaltiot2_koodi as varchar(10))
  END
END
