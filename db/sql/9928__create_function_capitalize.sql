USE [ANTERO]
GO

/****** Object:  UserDefinedFunction [dbo].[capitalize]    Script Date: 11.6.2024 9:49:13 ******/
DROP FUNCTION IF EXISTS [dbo].[capitalize]
GO

/****** Object:  UserDefinedFunction [dbo].[capitalize]    Script Date: 11.6.2024 9:49:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE FUNCTION [dbo].[capitalize] (@String NVARCHAR(MAX))
RETURNS NVARCHAR(MAX)
AS
BEGIN

    RETURN (SELECT CONCAT(UPPER(LEFT(@String, 1)), LOWER(SUBSTRING(@String, 2, LEN(@String) - 1))))
END;

GO

