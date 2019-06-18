-- OKM opettajatiedonkeruu tulostaulu
USE ANTERO
GO
IF EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_virta_otp_opettajapatevyydet'
) 
BEGIN
	DROP TABLE sa.sa_virta_otp_opettajapatevyydet
END
