USE [VipunenTK_lisatiedot]
GO

IF NOT EXISTS (
  SELECT * FROM sys.columns 
  WHERE object_id = OBJECT_ID(N'[dbo].[Vipunen_automaattipaivitys_kuutio]') 
	AND name = 'skip'
)
ALTER TABLE [dbo].[Vipunen_automaattipaivitys_kuutio]
ADD [skip] int null default 0 with values
