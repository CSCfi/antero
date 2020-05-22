
IF NOT EXISTS (
  SELECT * 
  FROM   sys.columns 
  WHERE  object_id = OBJECT_ID(N'[dw].[d_haku]') AND name = 'hakutapa2_fi'
)

BEGIN 
	ALTER TABLE dw.d_haku
	ADD hakutapa2_fi varchar(50)
END

IF NOT EXISTS (
  SELECT * 
  FROM   sys.columns 
  WHERE  object_id = OBJECT_ID(N'[dw].[d_haku]') AND name = 'hakutapa2_sv'
)

BEGIN 
	ALTER TABLE dw.d_haku
	ADD hakutapa2_sv varchar(50)
END

IF NOT EXISTS (
  SELECT * 
  FROM   sys.columns 
  WHERE  object_id = OBJECT_ID(N'[dw].[d_haku]') AND name = 'hakutapa2_en'
)

BEGIN 
	ALTER TABLE dw.d_haku
	ADD hakutapa2_en varchar(50)
END

IF NOT EXISTS (
  SELECT * 
  FROM   sys.columns 
  WHERE  object_id = OBJECT_ID(N'[dw].[d_haku]') AND name = 'jarjestys_hakutapa2'
)

BEGIN 
	ALTER TABLE dw.d_haku
	ADD jarjestys_hakutapa2 int
END