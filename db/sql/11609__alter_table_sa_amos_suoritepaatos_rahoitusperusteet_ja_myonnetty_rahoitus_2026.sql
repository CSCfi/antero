use antero
go

IF EXISTS(
	SELECT 1 FROM sys.columns 
    WHERE Name = N'Perusrahoitus tavoitteellisten opiskelijavuosien perusteella, €'
    AND Object_ID = Object_ID(N'sa.sa_amos_suoritepaatos_rahoitusperusteet_ja_myonnetty_rahoitus_2026')
)	
BEGIN
	EXEC sp_rename 'sa.sa_amos_suoritepaatos_rahoitusperusteet_ja_myonnetty_rahoitus_2026.[Perusrahoitus tavoitteellisten opiskelijavuosien perusteella, €]', 'Tavoitteelliset opiskelijavuodet, €', 'COLUMN'
END
;