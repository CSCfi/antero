--
--  DROP TABLE f_yo_rekrytointihaut
--
USE [ANTERO]
GO
IF EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_SCHEMA='dw'
	AND TABLE_NAME='f_yo_rekrytointihaut')

BEGIN
DROP TABLE [dw].[f_yo_rekrytointihaut]
END
