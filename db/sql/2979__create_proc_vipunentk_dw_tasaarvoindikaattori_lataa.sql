USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[tasaarvoindikaattori_lataa]    Script Date: 8.4.2020 15:48:07 ******/
DROP PROCEDURE IF EXISTS [dbo].[tasaarvoindikaattori_lataa]
GO

/****** Object:  StoredProcedure [dbo].[tasaarvoindikaattori_lataa]    Script Date: 8.4.2020 15:48:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








CREATE PROCEDURE [dbo].[tasaarvoindikaattori_lataa] AS

DECLARE @ala_koodi nvarchar(20);
DECLARE @sektori nvarchar(20);

DECLARE ala_cursor CURSOR FAST_FORWARD FOR 
(
	SELECT DISTINCT OKM_ohjauksen_ala_koodi, 'AMK' as sektori
	FROM VipunenTK.dbo.d_koulutusluokitus
	WHERE OKM_ohjauksen_ala_koodi <> '998'

	UNION ALL

	SELECT DISTINCT OKM_ohjauksen_ala_koodi, 'YO' as sektori
	FROM VipunenTK.dbo.d_koulutusluokitus
	WHERE OKM_ohjauksen_ala_koodi <> '998'
);

TRUNCATE TABLE [VipunenTK].[dbo].[tasaarvoindikaattori];

-- ajetaan ensin yo vs. amk, sitten sektoreittain ohjausala vs. muut
INSERT INTO [VipunenTK].[dbo].[tasaarvoindikaattori]
EXEC [dbo].[tasaarvoindikaattori_r]	@ala_koodi = 'YO/AMK', @sektori = 'YO/AMK';

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