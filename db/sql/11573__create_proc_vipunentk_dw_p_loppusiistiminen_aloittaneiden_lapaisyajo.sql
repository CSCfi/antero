USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_f_aloittaneiden_lapaisy]    Script Date: 16.1.2026 10.08.47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE OR ALTER PROCEDURE [dbo].[p_loppusiistiminen_aloittaneiden_lapaisyajo] AS

TRUNCATE TABLE [dbo].[_aloittaneiden_lapaisy_tiivistetty];
TRUNCATE TABLE [dbo].[_aloittaneiden_lapaisy_lasketut_sarakkeet];

GO

