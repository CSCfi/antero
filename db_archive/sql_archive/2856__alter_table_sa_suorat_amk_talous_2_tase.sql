
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_2_tase'
  AND COLUMN_NAME ='KLIIKEAR')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_2_tase] ADD KLIIKEAR bigint null 
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_2_tase'
  AND COLUMN_NAME ='PERUSPO')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_2_tase] ADD PERUSPO bigint  null  
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_2_tase'
  AND COLUMN_NAME ='PORAH')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_2_tase] ADD PORAH bigint  null  
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_2_tase'
  AND COLUMN_NAME ='YKRAH')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_2_tase] ADD YKRAH bigint  null  
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_2_tase'
  AND COLUMN_NAME ='SIJVAPRAH')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_2_tase] ADD SIJVAPRAH bigint  null  
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_2_tase'
  AND COLUMN_NAME ='VARARAH')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_2_tase] ADD VARARAH bigint  null  
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_2_tase'
  AND COLUMN_NAME ='YJRAH')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_2_tase] ADD YJRAH bigint  null  
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_2_tase'
  AND COLUMN_NAME ='TOIMPO')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_2_tase] ADD TOIMPO bigint  null  
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_2_tase'
  AND COLUMN_NAME ='EDJAAMA')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_2_tase] ADD EDJAAMA bigint  null  
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_2_tase'
  AND COLUMN_NAME ='TKJAAMA')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_2_tase] ADD TKJAAMA bigint  null  
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_2_tase'
  AND COLUMN_NAME ='TAVAHEM')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_2_tase] ADD TAVAHEM bigint  null  
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_2_tase'
  AND COLUMN_NAME ='VEROPVARA')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_2_tase] ADD VEROPVARA bigint  null  
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_2_tase'
  AND COLUMN_NAME ='KRESERVI')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_2_tase] ADD KRESERVI bigint  null  
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_2_tase'
  AND COLUMN_NAME ='OKRVELAT')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_2_tase] ADD OKRVELAT bigint  null  
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_2_tase'
  AND COLUMN_NAME ='Emo_konserni')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_2_tase] ADD Emo_konserni nvarchar(10)  null  
END
