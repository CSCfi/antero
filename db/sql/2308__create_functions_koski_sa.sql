USE [Koski_SA]
GO
/****** Object:  UserDefinedFunction [dbo].[Maximum]    Script Date: 27.6.2019 9:56:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Maximum]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[Maximum] (@Param1 date, @Param2 date, @param3 date = null)

Returns Table As

Return (
	Select 
		MaxValue = 
			case 
				when @param3 is null then
					Case 
						When @Param1 > @Param2 Then @Param1 
						Else @Param2 
					End 
				else 
					Case 
						When @Param1 >= @Param2 and @Param1 >= @param3 Then @Param1 
						when @Param2 >= @Param1 and @Param2 >= @param3 then @Param2
						Else @param3 
					End 
			end
)

' 
END

GO
/****** Object:  UserDefinedFunction [dbo].[Minimum]    Script Date: 27.6.2019 9:56:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Minimum]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[Minimum] (@Param1 date, @Param2 date, @param3 date = null)

Returns Table As

Return (
	Select 
		MinValue = 
			case 
				when @param3 is null then
					Case 
						When @Param1 < @Param2 Then @Param1 
						Else @Param2 
					End 
				else 
					Case 
						When @Param1 <= @Param2 and @Param1 <= @param3 Then @Param1 
						when @Param2 <= @Param1 and @Param2 <= @param3 then @Param2
						Else @param3 
					End 
			end
)
' 
END

GO
/****** Object:  UserDefinedFunction [dbo].[Same_month_and_year]    Script Date: 27.6.2019 9:56:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Same_month_and_year]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[Same_month_and_year] (@Param1 date, @Param2 date)

Returns Table As

Return (
	Select 
		isSame =
			Case 
				When year(@param1) = year(@param2) and month(@param1) = month(@param2) Then 1
				Else 0
			End 
)

' 
END

GO

USE [ANTERO]