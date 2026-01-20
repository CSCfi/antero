USE [Koski_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROCEDURE [sa].[luo_sa_koski_henkilo_master] AS

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_koski_henkilo_master]') AND type in (N'U'))
DROP TABLE [sa].[sa_koski_henkilo_master]

SELECT 
	[master_oid]
    ,[syntymaaika]
    ,[aidinkieli]
    ,[kansalaisuus]
    ,[turvakielto]
    ,[sukupuoli]
    ,[kotikunta]
    ,[linkitetyt_oidit]
    ,[yksiloity]
    ,[imp_created] = GETDATE()
    ,[source] = 'sa_koski_henkilo'
    ,[username] = SUSER_NAME()
INTO [sa].[sa_koski_henkilo_master]
FROM [sa].[sa_koski_henkilo]
WHERE [master_oid] = oppija_oid


DROP INDEX IF EXISTS [NC_sa_koski_henkilo_master] ON [sa].[sa_koski_henkilo_master]

CREATE UNIQUE NONCLUSTERED INDEX [NC_sa_koski_henkilo_master] ON [sa].[sa_koski_henkilo_master]
(
	[master_oid]
) 
INCLUDE 
(
    [syntymaaika]
    ,[aidinkieli]
    ,[kansalaisuus]
    ,[sukupuoli]
    ,[kotikunta]
    ,[turvakielto]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
