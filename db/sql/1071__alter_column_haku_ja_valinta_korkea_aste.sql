USE [ANTERO]

GO


IF EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='f_haku_ja_valinta_hakeneet_korkea_aste' AND COLUMN_NAME='d_maatjavaltiot_pohjakoulutuksen_maa_kk')
BEGIN
ALTER TABLE [dw].[f_haku_ja_valinta_hakeneet_korkea_aste]
DROP COLUMN d_maatjavaltiot_pohjakoulutuksen_maa_kk;
END
GO
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='f_haku_ja_valinta_hakeneet_korkea_aste' AND COLUMN_NAME='d_kytkin_pohjakoulutuskk_ulkomaat_id')
BEGIN
ALTER TABLE [dw].[f_haku_ja_valinta_hakeneet_korkea_aste]
ADD d_kytkin_pohjakoulutuskk_ulkomaat_id INT NULL;
END