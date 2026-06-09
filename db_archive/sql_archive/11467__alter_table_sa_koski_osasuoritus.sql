USE Koski_SA
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (
  SELECT *
  FROM   sys.columns
  WHERE  object_id = OBJECT_ID(N'[sa].[sa_koski_osasuoritus]')
         AND name = 'liittyy_tutkintoon_koodiarvo'
)

BEGIN
	ALTER TABLE [sa].[sa_koski_osasuoritus] ADD liittyy_tutkintoon_koodiarvo VARCHAR(15);
END
GO
USE ANTERO
