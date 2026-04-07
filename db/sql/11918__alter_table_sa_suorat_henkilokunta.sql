USE [ANTERO]

IF NOT EXISTS (
  SELECT *
  FROM sys.columns
  WHERE object_id = OBJECT_ID(N'[sa].[sa_suorat_amk1_henkilokunta]')
  AND name = 'tohtorintutkinnon_lahde'
)
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk1_henkilokunta] ADD tohtorintutkinnon_lahde varchar(50)

END
IF NOT EXISTS (
  SELECT *
  FROM sys.columns
  WHERE object_id = OBJECT_ID(N'[sa].[sa_suorat_yo1_henkilon_tyo]')
  AND name = 'tohtorintutkinnon_lahde'
)
BEGIN
	ALTER TABLE [sa].[sa_suorat_yo1_henkilon_tyo] ADD tohtorintutkinnon_lahde varchar(50)

END
