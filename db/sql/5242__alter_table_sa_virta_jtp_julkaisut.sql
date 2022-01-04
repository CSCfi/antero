USE ANTERO

IF NOT EXISTS (
  SELECT
    *
  FROM
    INFORMATION_SCHEMA.COLUMNS
  WHERE
   TABLE_SCHEMA='sa' AND TABLE_NAME = 'sa_virta_jtp_julkaisut' AND COLUMN_NAME = 'jufoTunnusJaadytys')
BEGIN
  ALTER TABLE sa.sa_virta_jtp_julkaisut
    ADD jufoTunnusJaadytys NVARCHAR(10) NULL
END

IF NOT EXISTS (
  SELECT
    *
  FROM
    INFORMATION_SCHEMA.COLUMNS
  WHERE
   TABLE_SCHEMA='sa' AND TABLE_NAME = 'sa_virta_jtp_julkaisut' AND COLUMN_NAME = 'jufoLuokkaJaadytys')
BEGIN
  ALTER TABLE sa.sa_virta_jtp_julkaisut
    ADD jufoLuokkaJaadytys NVARCHAR(10) NULL
END
