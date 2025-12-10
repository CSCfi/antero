USE [ANTERO]

GO

IF (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sa_virta_otp_viisviis_2016'  AND COLUMN_NAME = 'kansalaisuus' AND TABLE_SCHEMA = 'sa') = 0

BEGIN

ALTER TABLE sa.sa_virta_otp_viisviis_2016
ADD [kansalaisuus] [nvarchar](50) NULL

END

GO

IF (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sa_virta_otp_viisviis_2016'  AND COLUMN_NAME = 'rahoituslahde' AND TABLE_SCHEMA = 'sa') = 0

BEGIN

ALTER TABLE sa.sa_virta_otp_viisviis_2016
ADD [rahoituslahde] [nvarchar](20) NULL
END

GO

IF (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sa_virta_otp_viisviis_2016'  AND COLUMN_NAME = 'kunta' AND TABLE_SCHEMA = 'sa') = 0

BEGIN

ALTER TABLE sa.sa_virta_otp_viisviis_2016
ADD [kunta] [nvarchar](20) NULL

END

GO

IF (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sa_virta_otp_viisviis_2016'  AND COLUMN_NAME = 'kieli' AND TABLE_SCHEMA = 'sa') = 0

BEGIN

ALTER TABLE sa.sa_virta_otp_viisviis_2016
ADD [kieli] [nvarchar](20) NULL

END

GO

IF (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sa_virta_otp_viisviis_2017'  AND COLUMN_NAME = 'kansalaisuus' AND TABLE_SCHEMA = 'sa') = 0

BEGIN

ALTER TABLE sa.sa_virta_otp_viisviis_2017
ADD [kansalaisuus] [nvarchar](50) NULL

END

GO

IF (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sa_virta_otp_viisviis_2017'  AND COLUMN_NAME = 'rahoituslahde' AND TABLE_SCHEMA = 'sa') = 0

BEGIN

ALTER TABLE sa.sa_virta_otp_viisviis_2017
ADD [rahoituslahde] [nvarchar](20) NULL
END

GO

IF (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sa_virta_otp_viisviis_2017'  AND COLUMN_NAME = 'kunta' AND TABLE_SCHEMA = 'sa') = 0

BEGIN

ALTER TABLE sa.sa_virta_otp_viisviis_2017
ADD [kunta] [nvarchar](20) NULL

END

GO

IF (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sa_virta_otp_viisviis_2017'  AND COLUMN_NAME = 'kieli' AND TABLE_SCHEMA = 'sa') = 0

BEGIN

ALTER TABLE sa.sa_virta_otp_viisviis_2017
ADD [kieli] [nvarchar](20) NULL

END

GO

IF (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sa_virta_otp_viisviis_2018'  AND COLUMN_NAME = 'kansalaisuus' AND TABLE_SCHEMA = 'sa') = 0

BEGIN

ALTER TABLE sa.sa_virta_otp_viisviis_2018
ADD [kansalaisuus] [nvarchar](50) NULL

END

GO

IF (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sa_virta_otp_viisviis_2018'  AND COLUMN_NAME = 'rahoituslahde' AND TABLE_SCHEMA = 'sa') = 0

BEGIN

ALTER TABLE sa.sa_virta_otp_viisviis_2018
ADD [rahoituslahde] [nvarchar](20) NULL
END

GO

IF (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sa_virta_otp_viisviis_2018'  AND COLUMN_NAME = 'kunta' AND TABLE_SCHEMA = 'sa') = 0

BEGIN

ALTER TABLE sa.sa_virta_otp_viisviis_2018
ADD [kunta] [nvarchar](20) NULL

END

GO

IF (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sa_virta_otp_viisviis_2018'  AND COLUMN_NAME = 'kieli' AND TABLE_SCHEMA = 'sa') = 0

BEGIN

ALTER TABLE sa.sa_virta_otp_viisviis_2018
ADD [kieli] [nvarchar](20) NULL

END

GO

IF (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sa_virta_otp_viisviis_2019'  AND COLUMN_NAME = 'kansalaisuus' AND TABLE_SCHEMA = 'sa') = 0

BEGIN

ALTER TABLE sa.sa_virta_otp_viisviis_2019
ADD [kansalaisuus] [nvarchar](50) NULL

END

GO

IF (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sa_virta_otp_viisviis_2019'  AND COLUMN_NAME = 'rahoituslahde' AND TABLE_SCHEMA = 'sa') = 0

BEGIN

ALTER TABLE sa.sa_virta_otp_viisviis_2019
ADD [rahoituslahde] [nvarchar](20) NULL
END

GO

IF (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sa_virta_otp_viisviis_2019'  AND COLUMN_NAME = 'kunta' AND TABLE_SCHEMA = 'sa') = 0

BEGIN

ALTER TABLE sa.sa_virta_otp_viisviis_2019
ADD [kunta] [nvarchar](20) NULL

END

GO

IF (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sa_virta_otp_viisviis_2019'  AND COLUMN_NAME = 'kieli' AND TABLE_SCHEMA = 'sa') = 0

BEGIN

ALTER TABLE sa.sa_virta_otp_viisviis_2019
ADD [kieli] [nvarchar](20) NULL

END

GO

IF (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sa_virta_otp_viisviis_2020'  AND COLUMN_NAME = 'kansalaisuus' AND TABLE_SCHEMA = 'sa') = 0

BEGIN

ALTER TABLE sa.sa_virta_otp_viisviis_2020
ADD [kansalaisuus] [nvarchar](50) NULL

END

GO

IF (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sa_virta_otp_viisviis_2020'  AND COLUMN_NAME = 'rahoituslahde' AND TABLE_SCHEMA = 'sa') = 0

BEGIN

ALTER TABLE sa.sa_virta_otp_viisviis_2020
ADD [rahoituslahde] [nvarchar](20) NULL
END

GO

IF (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sa_virta_otp_viisviis_2020'  AND COLUMN_NAME = 'kunta' AND TABLE_SCHEMA = 'sa') = 0

BEGIN

ALTER TABLE sa.sa_virta_otp_viisviis_2020
ADD [kunta] [nvarchar](20) NULL

END

GO

IF (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sa_virta_otp_viisviis_2020'  AND COLUMN_NAME = 'kieli' AND TABLE_SCHEMA = 'sa') = 0

BEGIN

ALTER TABLE sa.sa_virta_otp_viisviis_2020
ADD [kieli] [nvarchar](20) NULL

END

GO

IF (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sa_virta_otp_viisviis_2021'  AND COLUMN_NAME = 'kansalaisuus' AND TABLE_SCHEMA = 'sa') = 0

BEGIN

ALTER TABLE sa.sa_virta_otp_viisviis_2021
ADD [kansalaisuus] [nvarchar](50) NULL

END

GO

IF (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sa_virta_otp_viisviis_2021'  AND COLUMN_NAME = 'rahoituslahde' AND TABLE_SCHEMA = 'sa') = 0

BEGIN

ALTER TABLE sa.sa_virta_otp_viisviis_2021
ADD [rahoituslahde] [nvarchar](20) NULL
END

GO

IF (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sa_virta_otp_viisviis_2021'  AND COLUMN_NAME = 'kunta' AND TABLE_SCHEMA = 'sa') = 0

BEGIN

ALTER TABLE sa.sa_virta_otp_viisviis_2021
ADD [kunta] [nvarchar](20) NULL

END

GO

IF (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sa_virta_otp_viisviis_2021'  AND COLUMN_NAME = 'kieli' AND TABLE_SCHEMA = 'sa') = 0

BEGIN

ALTER TABLE sa.sa_virta_otp_viisviis_2021
ADD [kieli] [nvarchar](20) NULL

END

GO

IF (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sa_virta_otp_viisviis_2022'  AND COLUMN_NAME = 'kansalaisuus' AND TABLE_SCHEMA = 'sa') = 0

BEGIN

ALTER TABLE sa.sa_virta_otp_viisviis_2022
ADD [kansalaisuus] [nvarchar](50) NULL

END

GO

IF (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sa_virta_otp_viisviis_2022'  AND COLUMN_NAME = 'rahoituslahde' AND TABLE_SCHEMA = 'sa') = 0

BEGIN

ALTER TABLE sa.sa_virta_otp_viisviis_2022
ADD [rahoituslahde] [nvarchar](20) NULL
END

GO

IF (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sa_virta_otp_viisviis_2022'  AND COLUMN_NAME = 'kunta' AND TABLE_SCHEMA = 'sa') = 0

BEGIN

ALTER TABLE sa.sa_virta_otp_viisviis_2022
ADD [kunta] [nvarchar](20) NULL

END

GO

IF (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sa_virta_otp_viisviis_2022'  AND COLUMN_NAME = 'kieli' AND TABLE_SCHEMA = 'sa') = 0

BEGIN

ALTER TABLE sa.sa_virta_otp_viisviis_2022
ADD [kieli] [nvarchar](20) NULL

END

GO

IF (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sa_virta_otp_viisviis_2023'  AND COLUMN_NAME = 'kansalaisuus' AND TABLE_SCHEMA = 'sa') = 0

BEGIN

ALTER TABLE sa.sa_virta_otp_viisviis_2023
ADD [kansalaisuus] [nvarchar](50) NULL

END

GO

IF (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sa_virta_otp_viisviis_2023'  AND COLUMN_NAME = 'rahoituslahde' AND TABLE_SCHEMA = 'sa') = 0

BEGIN

ALTER TABLE sa.sa_virta_otp_viisviis_2023
ADD [rahoituslahde] [nvarchar](20) NULL
END

GO

IF (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sa_virta_otp_viisviis_2023'  AND COLUMN_NAME = 'kunta' AND TABLE_SCHEMA = 'sa') = 0

BEGIN

ALTER TABLE sa.sa_virta_otp_viisviis_2023
ADD [kunta] [nvarchar](20) NULL

END

GO

IF (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sa_virta_otp_viisviis_2023'  AND COLUMN_NAME = 'kieli' AND TABLE_SCHEMA = 'sa') = 0

BEGIN

ALTER TABLE sa.sa_virta_otp_viisviis_2023
ADD [kieli] [nvarchar](20) NULL

END

GO

IF (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sa_virta_otp_viisviis_2024'  AND COLUMN_NAME = 'kansalaisuus' AND TABLE_SCHEMA = 'sa') = 0

BEGIN

ALTER TABLE sa.sa_virta_otp_viisviis_2024
ADD [kansalaisuus] [nvarchar](50) NULL

END

GO

IF (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sa_virta_otp_viisviis_2024'  AND COLUMN_NAME = 'rahoituslahde' AND TABLE_SCHEMA = 'sa') = 0

BEGIN

ALTER TABLE sa.sa_virta_otp_viisviis_2024
ADD [rahoituslahde] [nvarchar](20) NULL
END

GO

IF (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sa_virta_otp_viisviis_2024'  AND COLUMN_NAME = 'kunta' AND TABLE_SCHEMA = 'sa') = 0

BEGIN

ALTER TABLE sa.sa_virta_otp_viisviis_2024
ADD [kunta] [nvarchar](20) NULL

END

GO

IF (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sa_virta_otp_viisviis_2024'  AND COLUMN_NAME = 'kieli' AND TABLE_SCHEMA = 'sa') = 0

BEGIN

ALTER TABLE sa.sa_virta_otp_viisviis_2024
ADD [kieli] [nvarchar](20) NULL

END

GO