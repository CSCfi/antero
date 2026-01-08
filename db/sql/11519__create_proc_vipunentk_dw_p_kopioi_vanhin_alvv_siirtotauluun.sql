USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[p_kopioi_vanhin_alvv_siirtotauluun]    Script Date: 8.1.2026 14.44.45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










CREATE OR ALTER PROCEDURE [dbo].[p_kopioi_vanhin_alvv_siirtotauluun] AS

/*
Kopioidaan _aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet välitaulun vanhin alvv data siirto.
- min(alvv) antaa vanhimman alvv-vuoden välitaulusta
- max(alvv) antaa nuorimman alvv-vuoden historiataulusta
- välitaulun vanhin alvv-data kopioidaan vain jos ko alvv on nuorempi (siis suurempi) kuin nuorin alvv historiataulussa.
- Kopiointi tehdään myös jos historiataulu on tyhjä (jälkimmäinen ehto).
Mika 18.11.2025

*/

DECLARE @cur_min_alvv INT, @history_max_alvv INT;

SELECT @cur_min_alvv = min(alvv) FROM [dbo].[_aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet];
SELECT @history_max_alvv = max(alvv) FROM [dbo].[_aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet_historia];

TRUNCATE TABLE [dbo].[_aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet_historia_siirto]

IF (@cur_min_alvv > @history_max_alvv) or @history_max_alvv is null BEGIN
  INSERT INTO [dbo].[_aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet_historia_siirto]
  SELECT * 
    FROM [VipunenTK_DW].[dbo].[_aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet]
  WHERE alvv = @cur_min_alvv
  PRINT('Kopioitu välitauluun vanhimmat tiedot vuodelta ' + CAST(@cur_min_alvv AS NVARCHAR(10)))
  END
ELSE BEGIN
  PRINT('Välitaulun min. alvv pitää olla suurempi kuin historiataulun max alvv')
  PRINT('Välitaulun min. alvv: ' + CAST(@cur_min_alvv AS NVARCHAR(10)))
  PRINT('Historiataulun max. alvv: ' + CAST(@history_max_alvv AS NVARCHAR(10)))
END

GO


