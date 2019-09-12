USE [VipunenTK_lisatiedot]
GO

/****** Object:  StoredProcedure [dbo].[lataa_muuttuneet_tiedot_Vipunen_automaattipaivitys_fakta]    Script Date: 12.9.2019 10:33:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[lataa_muuttuneet_tiedot_Vipunen_automaattipaivitys_fakta] AS

--Vertaa [TK_H9098_CSC].[dbo].[TKsiirto_muutokset] ja [VipunenTK_lisatiedot].[dbo].[Vipunen_automaattipaivitys_fakta] tietoja, ja lisää jälkimmäiseen puuttuvat rivit siten että faktalataus_suoritettu saa arvon nolla.

MERGE dbo.Vipunen_automaattipaivitys_fakta AS target
USING (
  SELECT distinct
	Ajopvm
	,Taulu
  FROM TK_H9098_CSC.[dbo].[TKsiirto_muutokset]
  WHERE muutos in ('B Uusi taulu jossa sisältöä','C Rivilkm muuttunut, ei nollaan','D Taulu tyhjentynyt','G Kentän summa muuttunut')
  AND Taulu not like 'TK_6%' AND Taulu not like '%K3_9%' AND Taulu not like '%K3_10%'
  ) AS src
ON target.Ajopvm = src.Ajopvm and target.Taulu = src.Taulu

WHEN NOT MATCHED AND /*varmistetaan että aineistolle löytyy fakta */ src.Taulu IN (SELECT distinct tk.Taulu FROM [TK_H9098_CSC].[dbo].[TKsiirto_muutokset] tk left join [VipunenTK_lisatiedot].[dbo].[Vipunen_aineisto_fakta_proseduuri] afp on afp.aineisto_avain=(CASE WHEN LEN(LEFT(Taulu, CHARINDEX('_sopv_', Taulu)-1))>9 THEN LEFT(Taulu, LEN(LEFT(Taulu, CHARINDEX('_sopv_', Taulu)-6))) ELSE LEFT(Taulu, CHARINDEX('_sopv_', Taulu)-1) 	END) WHERE afp.Fakta is not null) 
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