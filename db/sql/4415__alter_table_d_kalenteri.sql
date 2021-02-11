use antero
go

IF NOT EXISTS (
  SELECT *
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_CATALOG = 'ANTERO' 
  AND TABLE_SCHEMA = 'dw' 
  AND TABLE_NAME = 'd_kalenteri' 
  AND COLUMN_NAME like '%luku%'
)

BEGIN
  ALTER TABLE [ANTERO].[dw].[d_kalenteri]
  ADD lukukausi_fi nvarchar(20) NULL
	,lukukausi_sv nvarchar(20) NULL
	,lukukausi_en nvarchar(20) NULL
	,lukuvuosi nvarchar(20) NULL
	,jarjestys_lukukausi_reverse int NULL
END