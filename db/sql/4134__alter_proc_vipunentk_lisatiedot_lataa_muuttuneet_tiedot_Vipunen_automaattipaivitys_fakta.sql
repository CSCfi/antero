USE [VipunenTK_lisatiedot]
GO
/****** Object:  StoredProcedure [dbo].[lataa_muuttuneet_tiedot_Vipunen_automaattipaivitys_fakta]    Script Date: 17.11.2020 19:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dbo].[lataa_muuttuneet_tiedot_Vipunen_automaattipaivitys_fakta] AS

--Vertaa [TK_H9098_CSC].[dbo].[TKsiirto_muutokset] ja [VipunenTK_lisatiedot].[dbo].[Vipunen_automaattipaivitys_fakta] tietoja, ja lisää jälkimmäiseen puuttuvat rivit siten että faktalataus_suoritettu saa arvon nolla.

MERGE dbo.Vipunen_automaattipaivitys_fakta AS target
USING 
(
  SELECT distinct
	Ajopvm
	,Taulu
  FROM TK_H9098_CSC.[dbo].[TKsiirto_muutokset]
  WHERE muutos in ('B Uusi taulu jossa sisältöä','C Rivilkm muuttunut, ei nollaan','D Taulu tyhjentynyt','G Kentän summa muuttunut')
) AS src
ON target.Ajopvm = src.Ajopvm and target.Taulu = src.Taulu

WHEN NOT MATCHED 
AND /*varmistetaan että aineistoa käyttävän faktan proseduuri ei ole asetettu nulliksi*/ 
src.Taulu IN
(
	SELECT distinct tk.Taulu
	FROM [TK_H9098_CSC].[dbo].[TKsiirto_muutokset] tk
	LEFT JOIN [VipunenTK_lisatiedot].[dbo].[Vipunen_aineisto_fakta_proseduuri] afp on	
		REPLACE(REPLACE(afp.aineisto_avain, 'TK_K', 'TK_'), 'TK_R', 'TK_')
		=
		REPLACE(REPLACE(CASE 
							WHEN Taulu LIKE '%_vos_%' THEN LEFT(Taulu, CHARINDEX('_sopv', Taulu) - 5) --tpo 7.1X sopv19
							WHEN LEN(LEFT(Taulu, CHARINDEX('_sopv', Taulu) - 1)) > 9 THEN LEFT(Taulu, LEN(LEFT(Taulu, CHARINDEX('_sopv', Taulu) - 6))) --sopv sis. monta tilv
							ELSE LEFT(Taulu, CHARINDEX('_sopv', Taulu) - 1) 
						END
						, 'TK_K'
						, 'TK_'
						)
				, 'TK_R'
				, 'TK_'
				)
	WHERE proseduuri is not null
)

THEN
  INSERT (
    Ajopvm
	,Taulu
	,Faktalataus_suoritettu
  )
  VALUES (
    Ajopvm
	,Taulu
	,0   
  );

  GO
USE [ANTERO]