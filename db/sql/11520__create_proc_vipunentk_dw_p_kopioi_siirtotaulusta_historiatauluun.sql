USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[p_kopioi_siirtotaulusta_historiatauluun]    Script Date: 8.1.2026 14.51.40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO











CREATE OR ALTER PROCEDURE [dbo].[p_kopioi_siirtotaulusta_historiatauluun] AS

insert into [dbo].[_aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet_historia]
select * from [dbo].[_aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet_historia_siirto]

truncate table [dbo].[_aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet_historia_siirto]

GO


