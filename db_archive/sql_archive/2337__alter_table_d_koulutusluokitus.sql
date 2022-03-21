USE ANTERO
GO

IF NOT EXISTS(
	SELECT 1 FROM sys.columns 
    WHERE Name = N'tutkintotyypin_ryhma_koodi' AND Object_ID = Object_ID(N'dw.d_koulutusluokitus')
)
BEGIN

    ALTER TABLE dw.d_koulutusluokitus
	ADD tutkintotyypin_ryhma_koodi varchar(2)

	ALTER TABLE dw.d_koulutusluokitus
	ADD tutkintotyypin_ryhma_fi varchar(60)

	ALTER TABLE dw.d_koulutusluokitus
	ADD tutkintotyypin_ryhma_sv varchar(60)

	ALTER TABLE dw.d_koulutusluokitus
	ADD tutkintotyypin_ryhma_en varchar(60)

END

GO

IF EXISTS(
	SELECT 1 FROM sys.columns 
    WHERE Name = N'tutkintotyypin_ryhma_koodi' AND Object_ID = Object_ID(N'dw.d_koulutusluokitus')
)
AND NOT EXISTS (
	SELECT 1 FROM sys.columns 
    WHERE Name = N'jarjestys_tutkintotyypin_ryhma_koodi' AND Object_ID = Object_ID(N'dw.d_koulutusluokitus')
)
BEGIN
	ALTER TABLE dw.d_koulutusluokitus
	ADD jarjestys_tutkintotyypin_ryhma_koodi AS (case when [tutkintotyypin_ryhma_koodi]=(-1) then '99999' else CONVERT([varchar](10),[tutkintotyypin_ryhma_koodi]) end)
END
