USE ANTERO;
IF NOT EXISTS(
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'sa_odw_hakeneet' AND TABLE_SCHEMA = 'sa' AND COLUMN_NAME = 'AlinLaskettuValintapistemaara'
)
BEGIN 
	ALTER TABLE sa.sa_odw_hakeneet
	add [AlinLaskettuValintapistemaara] [decimal](18, 0) NULL
END;