USE [AnteroAPI]
GO

/****** Object:  UserDefinedFunction [dbo].[api_update_time]    Script Date: 8.2.2023 14:00:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER FUNCTION [dbo].[api_update_time] (@Date datetime)
RETURNS DATE
AS
BEGIN

    RETURN (SELECT 
				case 
					when @Date > cast(concat(cast(@Date  as date), ' 01:36:30:000') as datetime)
					then DATEADD(DAY, 1, cast(@Date  as date))
					else cast(@Date  as date)
				end
			)
END;

GO


USE [ANTERO]