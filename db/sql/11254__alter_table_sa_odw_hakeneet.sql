USE [ANTERO]
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.columns
    WHERE Name = N'hakemus_luotu' AND Object_ID = Object_ID(N'sa.sa_odw_hakeneet')
)
BEGIN
    ALTER TABLE [ANTERO].[sa].[sa_odw_hakeneet]  ADD hakemus_luotu datetime NULL;
END

IF NOT EXISTS (
    SELECT 1
    FROM sys.columns
    WHERE Name = N'hakemus_paivitetty' AND Object_ID = Object_ID(N'sa.sa_odw_hakeneet')
)
BEGIN
    ALTER TABLE [ANTERO].[sa].[sa_odw_hakeneet] ADD hakemus_paivitetty datetime NULL;
END

GO
