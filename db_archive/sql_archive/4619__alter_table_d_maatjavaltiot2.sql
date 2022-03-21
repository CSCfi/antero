IF NOT EXISTS (
  SELECT * 
  FROM   sys.columns 
  WHERE  object_id = OBJECT_ID(N'[dw].[d_maatjavaltiot2]') 
         AND name = 'maanosa1_koodi'
)

BEGIN
    ALTER TABLE [dw].[d_maatjavaltiot2]
    ADD maanosa1_koodi varchar(200)
END


IF NOT EXISTS (
  SELECT * 
  FROM   sys.columns 
  WHERE  object_id = OBJECT_ID(N'[dw].[d_maatjavaltiot2]') 
         AND name = 'maanosa1_fi'
)

BEGIN
    ALTER TABLE [dw].[d_maatjavaltiot2]
    ADD maanosa1_fi varchar(200)
END


IF NOT EXISTS (
  SELECT * 
  FROM   sys.columns 
  WHERE  object_id = OBJECT_ID(N'[dw].[d_maatjavaltiot2]') 
         AND name = 'maanosa1_sv'
)

BEGIN
    ALTER TABLE [dw].[d_maatjavaltiot2]
    ADD maanosa1_sv varchar(200)
END


IF NOT EXISTS (
  SELECT * 
  FROM   sys.columns 
  WHERE  object_id = OBJECT_ID(N'[dw].[d_maatjavaltiot2]') 
         AND name = 'maanosa1_en'
)

BEGIN
    ALTER TABLE [dw].[d_maatjavaltiot2]
    ADD maanosa1_en varchar(200)
END