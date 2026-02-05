USE [VipunenTK_lisatiedot]
GO

/****** Object:  StoredProcedure [dbo].[tallenna_tk_toimituksen_kuutiot]    Script Date: 5.2.2026 13.40.14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE OR ALTER  PROCEDURE [dbo].[tallenna_tk_toimituksen_kuutiot] AS

TRUNCATE TABLE [VipunenTK_lisatiedot].[dbo].[Vipunen_tk_toimituksen_kuutio];

INSERT INTO [VipunenTK_lisatiedot].[dbo].[Vipunen_tk_toimituksen_kuutio]
SELECT DISTINCT [Kuutio] FROM [VipunenTK_lisatiedot].[dbo].[Vipunen_automaattipaivitys_kuutio] WHERE [Prosessoitu] = 0 and [skip] = 0;

GO


