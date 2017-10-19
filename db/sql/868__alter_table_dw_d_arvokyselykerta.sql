USE [ANTERO]
GO
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_arvokyselykerta' AND COLUMN_NAME='jarjestys_kyselykertaid')

BEGIN
	ALTER TABLE dw.d_arvokyselykerta ADD jarjestys_aineistotyyppi_kyselykertaid AS case when kyselykertaid = -1 then '99999' else cast(kyselykertaid as varchar(10))
	END
END
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_arvokyselykerta' AND COLUMN_NAME='jarjestys_kyselyid')

BEGIN
	ALTER TABLE dw.d_arvokyselykerta ADD jarjestys_aineistotyyppi_kyselyid AS case when kyselyid = -1 then '99999' else cast(kyselyid as varchar(10))
	END
END
