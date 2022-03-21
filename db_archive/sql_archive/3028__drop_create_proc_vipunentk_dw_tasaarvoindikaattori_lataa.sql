USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[tasaarvoindikaattori_lataa]    Script Date: 29.4.2020 18:21:26 ******/
DROP PROCEDURE [dbo].[tasaarvoindikaattori_lataa]
GO

/****** Object:  StoredProcedure [dbo].[tasaarvoindikaattori_lataa]    Script Date: 29.4.2020 18:21:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










CREATE PROCEDURE [dbo].[tasaarvoindikaattori_lataa] AS

DECLARE @ala_koodi nvarchar(20);
DECLARE @sektori nvarchar(20);

DECLARE ala_cursor CURSOR FAST_FORWARD FOR 
(
	SELECT DISTINCT d.OKM_ohjauksen_ala_koodi, s.sektori
	FROM VipunenTK.dbo.d_koulutusluokitus d
	LEFT JOIN (SELECT 'AMK' as sektori UNION ALL SELECT 'YO') s on 1=1
	WHERE OKM_ohjauksen_ala_koodi <> '998'	

	UNION ALL
	
	SELECT 'Kaikki', 'YO' --YO vs. AMK
);

TRUNCATE TABLE [VipunenTK].[dbo].[tasaarvoindikaattori];

OPEN ala_cursor;

FETCH NEXT FROM ala_cursor
INTO @ala_koodi, @sektori;

WHILE @@FETCH_STATUS = 0
BEGIN
	 
	INSERT INTO [VipunenTK].[dbo].[tasaarvoindikaattori]
	EXEC [dbo].[tasaarvoindikaattori_r]	@ala_koodi = @ala_koodi, @sektori = @sektori

    FETCH NEXT FROM ala_cursor 
    INTO @ala_koodi, @sektori

END

CLOSE ala_cursor;
DEALLOCATE ala_cursor;









GO


USE [ANTERO]