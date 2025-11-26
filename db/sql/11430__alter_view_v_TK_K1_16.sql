USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dw].[v_TK_K1_16] AS 

--lähdenäkymä muodostettu erillisraporttia varten, tätä käytetään vain opiskelijavuosien painotukseen

SELECT * 
FROM [dw].[v_TK_K1_16_sis_estimaatti]
WHERE generoitu = 0

GO
