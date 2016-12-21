IF EXISTS (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_SCHEMA='dbo' and TABLE_NAME='f_virta_jtp_tilasto' and COLUMN_NAME='d_sektori_id') BEGIN
EXECUTE sp_rename N'dbo.f_virta_jtp_tilasto.d_sektori_id', N'd_virtajtpsektori_id', 'COLUMN'
END
