-- Ikä sarake 55 op  livedata tauluun

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_virta_otp_viisviis' AND COLUMN_NAME='ika' and DATA_TYPE='smallint' )

BEGIN
	ALTER TABLE sa.sa_virta_otp_viisviis 
	ADD ika smallint NULL     
END


