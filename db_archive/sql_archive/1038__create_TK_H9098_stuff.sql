USE [VipunenTK_lisatiedot]
GO
/****** Object:  Table [dbo].[Vipunen_aineisto_fakta_proseduuri]    Script Date: 8.12.2017 15:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vipunen_aineisto_fakta_proseduuri]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Vipunen_aineisto_fakta_proseduuri](
	[aineisto_avain] [varchar](255) NULL,
	[fakta] [varchar](255) NULL,
	[proseduuri] [varchar](255) NULL
) ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[VipunenTK_paivitys]    Script Date: 8.12.2017 15:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VipunenTK_paivitys]'))
EXEC dbo.sp_executesql @statement = N'


/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[VipunenTK_paivitys]
as

SELECT distinct 
tk.Taulu as aineisto
,afp.aineisto_avain
,proseduuri
,k.kuutio_nimi

  FROM [TK_H9098_CSC].[dbo].[TKsiirto_muutokset] tk
  left join [VipunenTK_lisatiedot].[dbo].[Vipunen_aineisto_fakta_proseduuri] afp on afp.aineisto_avain=
  (CASE 
		WHEN LEN(LEFT(Taulu, CHARINDEX(''_sopv_'', Taulu)-1))>9 THEN LEFT(Taulu, LEN(LEFT(Taulu, CHARINDEX(''_sopv_'', Taulu)-6))) 
		ELSE LEFT(Taulu, CHARINDEX(''_sopv_'', Taulu)-1) 
	END)
   left join VipunenTK_lisatiedot.dbo.Vipunen_aineisto_kuutio ak on ak.aineisto_avain=afp.aineisto_avain
   left join VipunenTK_lisatiedot.dbo.Vipunen_kuutio k on k.kuutio_avain=ak.kuutio_avain
 
  where siirtoaika=(select max(siirtoaika) from [TK_H9098_CSC].[dbo].[TKsiirto_muutokset])
  and proseduuri is not null
 



' 
GO
/****** Object:  Table [dbo].[Vipunen_automaattipaivitys_fakta]    Script Date: 8.12.2017 15:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vipunen_automaattipaivitys_fakta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Vipunen_automaattipaivitys_fakta](
	[Ajopvm] [nvarchar](250) NULL,
	[Taulu] [nvarchar](50) NULL,
	[Faktalataus_suoritettu] [int] NULL,
	[Aloitusaika] [datetime] NULL,
	[Lopetusaika] [datetime] NULL,
	[Kesto] [time](0) NULL,
	[Virhe] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[Vipunen_prosessoitavat_kuutiot]    Script Date: 8.12.2017 15:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Vipunen_prosessoitavat_kuutiot]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[Vipunen_prosessoitavat_kuutiot] AS



SELECT distinct k.kuutio_nimi
FROM [Vipunen_automaattipaivitys_fakta]
JOIN Vipunen_aineisto_kuutio ak ON ak.aineisto_avain=(CASE 
		WHEN LEN(LEFT(Taulu, CHARINDEX(''_sopv_'', Taulu)-1))>9 THEN LEFT(Taulu, LEN(LEFT(Taulu, CHARINDEX(''_sopv_'', Taulu)-6))) 
		ELSE LEFT(Taulu, CHARINDEX(''_sopv_'', Taulu)-1) 
	END)
JOIN Vipunen_kuutio k on k.kuutio_avain=ak.kuutio_avain
WHERE Faktalataus_suoritettu=0




' 
GO
/****** Object:  Table [dbo].[Vipunen_automaattipaivitys_kuutio]    Script Date: 8.12.2017 15:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vipunen_automaattipaivitys_kuutio]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Vipunen_automaattipaivitys_kuutio](
	[TK_aineisto_saapumispvm] [date] NOT NULL,
	[Aineisto] [nvarchar](250) NULL,
	[Kuutio] [nvarchar](250) NULL,
	[Prosessoitu] [int] NULL,
	[Aloitusaika] [datetime] NULL,
	[Lopetusaika] [datetime] NULL,
	[Kesto] [time](0) NULL,
	[Virhe] [nvarchar](4000) NULL
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[lataa_muuttuneet_tiedot_Vipunen_automaattipaivitys_fakta]    Script Date: 8.12.2017 15:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[lataa_muuttuneet_tiedot_Vipunen_automaattipaivitys_fakta]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[lataa_muuttuneet_tiedot_Vipunen_automaattipaivitys_fakta] AS' 
END
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
  AND Taulu not like 'TK_6%'
  ) AS src
ON target.Ajopvm = src.Ajopvm and target.Taulu = src.Taulu

WHEN NOT MATCHED THEN
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
/****** Object:  StoredProcedure [dbo].[lataa_muuttuneet_tiedot_Vipunen_automaattipaivitys_kuutio]    Script Date: 8.12.2017 15:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[lataa_muuttuneet_tiedot_Vipunen_automaattipaivitys_kuutio]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[lataa_muuttuneet_tiedot_Vipunen_automaattipaivitys_kuutio] AS' 
END
GO


ALTER PROCEDURE [dbo].[lataa_muuttuneet_tiedot_Vipunen_automaattipaivitys_kuutio] AS

--Lukee VipunenTK_lisatiedot.dbo.Vipunen_automaattipaivitys_fakta taulusta proseduurit, joiden faktalataus_suoritettu -arvo on nolla, ja ajaa proseduurit sekä muuttaa ajon jälkeen arvon ykköseksi, jos ajo menee läpi ilman virheitä.


MERGE dbo.Vipunen_automaattipaivitys_kuutio AS target
USING (
	SELECT distinct 
		Ajopvm
		,Taulu
		,kuutio_nimi
	FROM [Vipunen_automaattipaivitys_fakta] af
	JOIN dbo.Vipunen_aineisto_kuutio ak on ak.aineisto_avain=
		(CASE 
			WHEN LEN(LEFT(Taulu, CHARINDEX('_sopv_', Taulu)-1))>9 THEN LEFT(Taulu, LEN(LEFT(Taulu, CHARINDEX('_sopv_', Taulu)-6))) 
			ELSE LEFT(Taulu, CHARINDEX('_sopv_', Taulu)-1) 
		END)
	JOIN dbo.Vipunen_kuutio k on k.kuutio_avain=ak.kuutio_avain
	WHERE Faktalataus_suoritettu=0
  ) AS src
ON target.TK_aineisto_saapumispvm = src.Ajopvm and target.Kuutio = src.kuutio_nimi

WHEN NOT MATCHED THEN
  INSERT (
    TK_aineisto_saapumispvm
	,Aineisto
	,Kuutio
	,Prosessoitu

  )
  VALUES (
	Ajopvm
	,Taulu
	,kuutio_nimi
	,0
    
  );





GO
/****** Object:  StoredProcedure [dbo].[lataa_muuttuneiden_aineistojen_faktat]    Script Date: 8.12.2017 15:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[lataa_muuttuneiden_aineistojen_faktat]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[lataa_muuttuneiden_aineistojen_faktat] AS' 
END
GO

ALTER PROCEDURE [dbo].[lataa_muuttuneiden_aineistojen_faktat] AS

--Lukee VipunenTK_lisatiedot.dbo.Vipunen_automaattipaivitys_fakta taulusta proseduurit, joiden faktalataus_suoritettu -arvo on nolla, ja ajaa proseduurit sekä muuttaa ajon jälkeen arvon ykköseksi, jos ajo menee läpi ilman virheitä.

DECLARE @proc varchar(255);
DECLARE	@return_value int
DECLARE @output_value AS INT
DECLARE @SqlString nvarchar(2000)  
DECLARE @alkuaika datetime
DECLARE @loppuaika datetime
DECLARE @kesto time(0)
DECLARE @virhe nvarchar(max)


DECLARE procedure_cursor CURSOR FAST_FORWARD FOR 

(
SELECT distinct proseduuri
FROM [Vipunen_automaattipaivitys_fakta]
JOIN VipunenTK_paivitys ON VipunenTK_paivitys.aineisto=[Vipunen_automaattipaivitys_fakta].Taulu
WHERE Faktalataus_suoritettu=0
)

OPEN procedure_cursor;

FETCH NEXT FROM procedure_cursor
INTO @proc

WHILE @@FETCH_STATUS = 0
BEGIN
	BEGIN TRY
		SET @alkuaika = GETDATE()

		SET @SqlString = N'EXEC @rtn = VipunenTK_DW.[dbo].'+@proc
		EXEC sp_executesql @SqlString
		,@params = N'@rtn int OUTPUT' 
		,@rtn=@return_value OUTPUT
	
		SET @loppuaika = GETDATE()
		SET @kesto = @loppuaika-@alkuaika

	END TRY

	BEGIN CATCH
		SET @virhe = (SELECT ERROR_MESSAGE())
	END CATCH

	--IF @return_value = 0 
	
		BEGIN
	
			UPDATE [dbo].[Vipunen_automaattipaivitys_fakta] 
			SET Faktalataus_suoritettu=(CASE WHEN @return_value = 0 THEN 1 ELSE 0 END)
			,Aloitusaika=@alkuaika
			,Lopetusaika=@loppuaika
			,Kesto = @kesto
			,Virhe = @virhe
			where Taulu in
			(
			SELECT distinct aineisto
			FROM [VipunenTK_paivitys]
			where proseduuri = @proc
			)
		END

    FETCH NEXT FROM procedure_cursor 


END 
CLOSE procedure_cursor;
DEALLOCATE procedure_cursor;


GO
USE [ANTERO]
