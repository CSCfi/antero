USE ANTERO
GO
IF NOT EXISTS (
    SELECT * FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='f_virta_otp_55_suppea' AND COLUMN_NAME='suorittanut55ilmanPankkia')

BEGIN
    ALTER TABLE dw.f_virta_otp_55_suppea ADD suorittanut55ilmanPankkia INT 
    
END


IF NOT EXISTS (
    SELECT * FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='f_virta_otp_55_suppea' AND COLUMN_NAME='suorittanut55pankinAvulla')

BEGIN
    ALTER TABLE dw.f_virta_otp_55_suppea ADD suorittanut55pankinAvulla INT 
    
END

IF NOT EXISTS (
    SELECT * FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='f_virta_otp_55_suppea' AND COLUMN_NAME='suorittanut27')

BEGIN
    ALTER TABLE dw.f_virta_otp_55_suppea ADD suorittanut27 INT 

END
