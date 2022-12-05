USE KOSKI_SA

IF NOT EXISTS (
  SELECT *
  FROM   sys.columns
  WHERE  object_id = OBJECT_ID(N'[sa].[sa_koski_koodisto_koodi]')
         AND name = 'nimi_sv'
)

BEGIN
	ALTER TABLE  [sa].[sa_koski_koodisto_koodi]
	ADD [nimi_sv] VARCHAR(MAX) NULL
END
