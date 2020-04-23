USE ANTERO
GO


IF NOT EXISTS (
SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'f_virta_otp_kvliikkuvuus' AND COLUMN_NAME = 'd_ika_id')
BEGIN
    ALTER TABLE [dw].[f_virta_otp_kvliikkuvuus] ADD d_ika_id int
END

IF NOT EXISTS (
SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'f_virta_otp_kvliikkuvuus' AND COLUMN_NAME = 'opintojen_aloitusvuosi')
BEGIN
    ALTER TABLE [dw].[f_virta_otp_kvliikkuvuus] ADD opintojen_aloitusvuosi int
END