USE [Koski_SA]
GO

IF NOT EXISTS (
    SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[sa].[sa_koski_opiskeluoikeus_aikajakso]') 
	  AND name = 'opetuksen_jarjestaminen_vamman_sairauden_tai_rajoitteen_perusteella'
)
BEGIN
    ALTER TABLE [sa].[sa_koski_opiskeluoikeus_aikajakso] ADD [opetuksen_jarjestaminen_vamman_sairauden_tai_rajoitteen_perusteella] INT NULL;
END

GO

IF NOT EXISTS (
    SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[sa].[sa_koski_opiskeluoikeus_aikajakso]')
      AND name = 'tavoitekokonaisuuksittain_opiskelu'
)
BEGIN
    ALTER TABLE [sa].[sa_koski_opiskeluoikeus_aikajakso] ADD [tavoitekokonaisuuksittain_opiskelu] INT NULL;
END
GO

IF NOT EXISTS (
    SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[sa].[sa_koski_opiskeluoikeus_aikajakso]')
      AND name = 'toiminta_alueittain_opiskelu'
)
BEGIN
    ALTER TABLE [sa].[sa_koski_opiskeluoikeus_aikajakso] ADD [toiminta_alueittain_opiskelu] INT NULL;
END
GO