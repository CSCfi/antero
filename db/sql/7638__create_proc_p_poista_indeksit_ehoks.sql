USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [sa].[p_poista_indeksit_ehoks] AS

DROP INDEX IF EXISTS [NC_idx_sa_ehoks_hato__1] ON [sa].[sa_ehoks_hato]
DROP INDEX IF EXISTS [NC_idx_sa_ehoks_perustiedot_laajempi__ehoks_id] ON [sa].[sa_ehoks_perustiedot_laajempi]
DROP INDEX IF EXISTS [NC_idx_sa_ehoks_perustiedot_laajempi__opiskeluoikeus_oid] ON [sa].[sa_ehoks_perustiedot_laajempi]
