USE ANTERO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_koulutusluokitus'
AND COLUMN_NAME ='tutkintonimikekoodi')
BEGIN
	ALTER TABLE [sa].[sa_koulutusluokitus]  ADD [tutkintonimikekoodi] nvarchar(200)  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_koulutusluokitus'
AND COLUMN_NAME ='tutkintonimike')
BEGIN
	ALTER TABLE [sa].[sa_koulutusluokitus]  ADD [tutkintonimike] nvarchar(200)  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_koulutusluokitus'
AND COLUMN_NAME ='tutkintonimike_sv')
BEGIN
	ALTER TABLE [sa].[sa_koulutusluokitus]  ADD [tutkintonimike_sv] nvarchar(200)  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_koulutusluokitus'
AND COLUMN_NAME ='tutkintonimike_en')
BEGIN
	ALTER TABLE [sa].[sa_koulutusluokitus]  ADD [tutkintonimike_en] nvarchar(200)  NULL
END
