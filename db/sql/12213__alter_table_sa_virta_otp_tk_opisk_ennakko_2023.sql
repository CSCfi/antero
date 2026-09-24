USE [ANTERO]

IF NOT EXISTS (
  SELECT *
  FROM sys.columns
  WHERE object_id = OBJECT_ID(N'[sa].[sa_virta_otp_tk_opisk_ennakko_2023]')
  AND name = 'maksuvelk'
)

BEGIN
	
	ALTER TABLE [sa].[sa_virta_otp_tk_opisk_ennakko_2023] 
	ADD	
	maksuvelk int, 
	maksuvels int, 
	maksuk int,
	maksus int,
	apurahak int,
	apurahas int

END