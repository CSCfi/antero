IF NOT EXISTS (
  SELECT * 
  FROM   sys.columns 
  WHERE  object_id = OBJECT_ID(N'[dw].[d_maatjavaltiot2]') AND name = 'maanosa5_koodi'
)

BEGIN 
	ALTER TABLE dw.d_maatjavaltiot2
	ADD maanosa5_koodi varchar(5)
END

IF NOT EXISTS (
  SELECT * 
  FROM   sys.columns 
  WHERE  object_id = OBJECT_ID(N'[dw].[d_maatjavaltiot2]') AND name = 'maanosa5_fi'
)

BEGIN 
	ALTER TABLE dw.d_maatjavaltiot2
	ADD maanosa5_fi varchar(100)
END

IF NOT EXISTS (
  SELECT * 
  FROM   sys.columns 
  WHERE  object_id = OBJECT_ID(N'[dw].[d_maatjavaltiot2]') AND name = 'maanosa5_sv'
)

BEGIN 
	ALTER TABLE dw.d_maatjavaltiot2
	ADD maanosa5_sv varchar(100)
END

IF NOT EXISTS (
  SELECT * 
  FROM   sys.columns 
  WHERE  object_id = OBJECT_ID(N'[dw].[d_maatjavaltiot2]') AND name = 'maanosa5_en'
)

BEGIN 
	ALTER TABLE dw.d_maatjavaltiot2
	ADD maanosa5_en varchar(100)
END

IF NOT EXISTS (
  SELECT * 
  FROM   sys.columns 
  WHERE  object_id = OBJECT_ID(N'[dw].[d_maatjavaltiot2]') AND name = 'jarjestys_maanosa5_koodi'
)

BEGIN 
	ALTER TABLE dw.d_maatjavaltiot2
	ADD jarjestys_maanosa5_koodi int
END



IF NOT EXISTS (
  SELECT * 
  FROM   sys.columns 
  WHERE  object_id = OBJECT_ID(N'[dw].[d_maatjavaltiot2]') AND name = 'maanosa6_koodi'
)

BEGIN 
	ALTER TABLE dw.d_maatjavaltiot2
	ADD maanosa6_koodi varchar(5)
END

IF NOT EXISTS (
  SELECT * 
  FROM   sys.columns 
  WHERE  object_id = OBJECT_ID(N'[dw].[d_maatjavaltiot2]') AND name = 'maanosa6_fi'
)

BEGIN 
	ALTER TABLE dw.d_maatjavaltiot2
	ADD maanosa6_fi varchar(100)
END

IF NOT EXISTS (
  SELECT * 
  FROM   sys.columns 
  WHERE  object_id = OBJECT_ID(N'[dw].[d_maatjavaltiot2]') AND name = 'maanosa6_sv'
)

BEGIN 
	ALTER TABLE dw.d_maatjavaltiot2
	ADD maanosa6_sv varchar(100)
END

IF NOT EXISTS (
  SELECT * 
  FROM   sys.columns 
  WHERE  object_id = OBJECT_ID(N'[dw].[d_maatjavaltiot2]') AND name = 'maanosa6_en'
)

BEGIN 
	ALTER TABLE dw.d_maatjavaltiot2
	ADD maanosa6_en varchar(100)
END

IF NOT EXISTS (
  SELECT * 
  FROM   sys.columns 
  WHERE  object_id = OBJECT_ID(N'[dw].[d_maatjavaltiot2]') AND name = 'jarjestys_maanosa6_koodi'
)

BEGIN 
	ALTER TABLE dw.d_maatjavaltiot2
	ADD jarjestys_maanosa6_koodi int
END