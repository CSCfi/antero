USE [VipunenTK_lisatiedot]
GO
/****** Object:  StoredProcedure [dbo].[lataa_muuttuneiden_aineistojen_faktat]    Script Date: 6.11.2019 12:11:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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


DECLARE procedure_cursor CURSOR FOR 

(
SELECT distinct proseduuri
FROM [Vipunen_automaattipaivitys_fakta] f
JOIN v_VipunenTK_paivitys p ON p.aineisto=f.Taulu
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
			FROM [v_VipunenTK_paivitys]
			where proseduuri = @proc
			)
	END	

    FETCH NEXT FROM procedure_cursor 
	INTO @proc

END 
CLOSE procedure_cursor;
DEALLOCATE procedure_cursor;

GO
USE [ANTERO]