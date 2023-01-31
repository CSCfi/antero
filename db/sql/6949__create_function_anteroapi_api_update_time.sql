USE [AnteroAPI]
GO

/****** Object:  UserDefinedFunction [dbo].[api_update_time]    Script Date: 31.1.2023 9:25:09 ******/
DROP FUNCTION IF EXISTS [dbo].[api_update_time]
GO

/****** Object:  UserDefinedFunction [dbo].[api_update_time]    Script Date: 31.1.2023 9:25:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[api_update_time] (@Date datetime)
RETURNS DATE
AS
BEGIN

    RETURN (SELECT 
				case 
					when @Date > cast(concat(cast(@Date  as date), ' 01:35:00:000') as datetime)
					then DATEADD(DAY, 1, cast(@Date  as date))
					else cast(@Date  as date)
				end
			)
END;

GO

USE [ANTERO]