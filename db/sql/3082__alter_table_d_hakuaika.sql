
IF NOT EXISTS (
  SELECT * 
  FROM   sys.columns 
  WHERE  object_id = OBJECT_ID(N'[dw].[d_hakuaika]') AND name = 'selite2_fi'
)

BEGIN 
	ALTER TABLE dw.d_hakuaika
	ADD selite2_fi varchar(100)
END

IF NOT EXISTS (
  SELECT * 
  FROM   sys.columns 
  WHERE  object_id = OBJECT_ID(N'[dw].[d_hakuaika]') AND name = 'selite2_sv'
)

BEGIN 
	ALTER TABLE dw.d_hakuaika
	ADD selite2_sv varchar(100)
END

IF NOT EXISTS (
  SELECT * 
  FROM   sys.columns 
  WHERE  object_id = OBJECT_ID(N'[dw].[d_hakuaika]') AND name = 'selite2_en'
)

BEGIN 
	ALTER TABLE dw.d_hakuaika
	ADD selite2_en varchar(100)
END

IF NOT EXISTS (
  SELECT * 
  FROM   sys.columns 
  WHERE  object_id = OBJECT_ID(N'[dw].[d_hakuaika]') AND name = 'jarjestys2'
)

BEGIN 
	ALTER TABLE dw.d_hakuaika
	ADD jarjestys2 int
END