ALTER PROCEDURE [dw].[p_lataa_d_toiminto] AS

TRUNCATE TABLE dw.d_toiminto

SET IDENTITY_INSERT dw.d_toiminto ON
INSERT dw.d_toiminto (id, toiminto_koodi, toiminto_nimi_fi, toiminto_nimi_sv, toiminto_nimi_en, loadtime, source, username)
VALUES
(-1, N'-1', N'Tieto puuttuu', N'Information saknas', N'Missing data', GETDATE(), N'p_lataa_d_toiminto',SUSER_NAME()),
(1, N'Koulutustoiminta', N'Koulutustoiminta', N'Koulutustoiminta', N'Koulutustoiminta', GETDATE(), N'p_lataa_d_toiminto',SUSER_NAME()),
(2, N'Muu yhteiskunnallinen toiminta', N'Muu yhteiskunnallinen toiminta', N'Muu yhteiskunnallinen toiminta', N'Muu yhteiskunnallinen toiminta', GETDATE(), N'p_lataa_d_toiminto',SUSER_NAME()),
(3, N'Toiminnot yhteensä', N'Toiminnot yhteensä', N'Toiminnot yhteensä', N'Toiminnot yhteensä', GETDATE(), N'p_lataa_d_toiminto',SUSER_NAME()),
(4, N'Tutkimus- ja kehitystoiminta', N'Tutkimus- ja kehitystoiminta', N'Tutkimus- ja kehitystoiminta', N'Tutkimus- ja kehitystoiminta', GETDATE(), N'p_lataa_d_toiminto',SUSER_NAME()),
(5, N'Yhteiskulut', N'Yhteiskulut', N'Yhteiskulut', N'Yhteiskulut', GETDATE(), N'p_lataa_d_toiminto',SUSER_NAME()),
(6, N'Tutkimustoiminta', N'Tutkimustoiminta', N'Tutkimustoiminta', N'Tutkimustoiminta', GETDATE(), N'p_lataa_d_toiminto',SUSER_NAME()),
(7, N'Taiteellinen toiminta', N'Taiteellinen toiminta', N'Taiteellinen toiminta', N'Taiteellinen toiminta', GETDATE(), N'p_lataa_d_toiminto',SUSER_NAME()),
(8, N'Harjoittelukoulu', N'Harjoittelukoulu', N'Harjoittelukoulu', N'Harjoittelukoulu', GETDATE(), N'p_lataa_d_toiminto',SUSER_NAME()),
(9, N'Kansalliskirjasto', N'Kansalliskirjasto', N'Kansalliskirjasto', N'Kansalliskirjasto', GETDATE(), N'p_lataa_d_toiminto',SUSER_NAME())
SET IDENTITY_INSERT dw.d_toiminto OFF

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_toiminto' AND COLUMN_NAME='jarjestys_toiminto_koodi')

BEGIN
	ALTER TABLE dw.d_toiminto ADD jarjestys_toiminto_koodi AS case when toiminto_koodi = '-1' then 'ZZZZZ' else cast(toiminto_koodi as varchar(10))
	END
END
