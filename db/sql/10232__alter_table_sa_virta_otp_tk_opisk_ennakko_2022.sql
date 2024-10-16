USE [ANTERO]
GO

IF EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'sa_virta_otp_tk_opisk_ennakko_2022' AND COLUMN_NAME = 'aloitusvuosi' AND TABLE_SCHEMA = 'sa'
	)
BEGIN
    ALTER TABLE sa.sa_virta_otp_tk_opisk_ennakko_2022 DROP COLUMN aloitusvuosi
END

IF EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'sa_virta_otp_tk_opisk_ennakko_2022' AND COLUMN_NAME = 'ensikertalainen' AND TABLE_SCHEMA = 'sa'
	)
BEGIN
    ALTER TABLE sa.sa_virta_otp_tk_opisk_ennakko_2022 DROP COLUMN ensikertalainen
END

ALTER TABLE [sa].[sa_virta_otp_tk_opisk_ennakko_2022]
ADD aloitusvuosi int, ensikertalainen int

USE [ANTERO]
