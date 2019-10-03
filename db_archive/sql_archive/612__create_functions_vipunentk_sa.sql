USE [VipunenTK_SA]
GO
/****** Object:  UserDefinedFunction [dbo].[RefineDate]    Script Date: 21.6.2017 11:02:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RefineDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
-- Create function
CREATE function [dbo].[RefineDate] (@input varchar(8))
returns varchar(8)
as
begin

declare @t varchar(8)
--declare @input varchar(8)
declare @year varchar(4)
declare @month varchar(2)
declare @day varchar(2)

-- Test cases
--print [vipunen_tk].[RefineDate](''103102'')
--print [vipunen_tk].[RefineDate](''201020'')
--print [vipunen_tk].[RefineDate](''2010'')
--print [vipunen_tk].[RefineDate](''201010XX'')
--print [vipunen_tk].[RefineDate](''1010XX'')
--print [vipunen_tk].[RefineDate](''2010XX10'')
--print [vipunen_tk].[RefineDate](''0'')
--print [vipunen_tk].[RefineDate](''00000000'')
--print [vipunen_tk].[RefineDate](''XXXXXXXX'')

--print @input

-- We assume these are "empty" values and return ''''
if @input='''' or (isnumeric(@input)=1 and @input=0)
	return ''''
--	print ''Empty''

-- If century seems to be missing, assume it''s 20 and add it
if len(@input)=6 and substring(@input,1,2)!=''20''
	set @input=''20''+@input
--print @input

-- Split into year+month+day
set @year=substring(@input,1,4)
set @month=substring(@input,5,2)
set @day=substring(@input,7,2)
--print @year+@month+@day

-- Validate parts to be numeric
if isnumeric(@day)=0
	set @day=''''
if isnumeric(@month)=0
	set @month=''''
if isnumeric(@year)=0
	set @year=''''
--print @year+@month+@day

-- Anything left?
if @year+@month+@day=''''
	return ''''
--	print ''Empty''
--print @year+@month+@day

-- Check if seems DDMM then switch
if @month>12 begin
	set @t=@day
	set @day=@month
	set @month=@t
end
--print @year+@month+@day

-- Validate date and decrease at most 3 days
-- Assuming 31.2 -> 28.2 at most
declare @loop int=0
while @loop<3 and isdate(@year+@month+@day)=0 begin
	set @day=@day-1
	set @loop=@loop+1
end
--print @year+@month+@day

if isdate(@year+@month+@day)=0
	return @input

return @year+@month+@day

end

' 
END

GO
/****** Object:  UserDefinedFunction [dbo].[RefineDateBegin]    Script Date: 21.6.2017 11:02:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RefineDateBegin]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
-- Create function
CREATE function [dbo].[RefineDateBegin] (@input varchar(8))
returns varchar(8)
as
begin

declare @t varchar(8)
--declare @input varchar(8)
declare @year varchar(4)
declare @month varchar(2)
declare @day varchar(2)

-- Test cases
--print [vipunen_tk].[RefineDate](''103102'')
--print [vipunen_tk].[RefineDate](''201020'')
--print [vipunen_tk].[RefineDate](''2010'')
--print [vipunen_tk].[RefineDate](''201010XX'')
--print [vipunen_tk].[RefineDate](''1010XX'')
--print [vipunen_tk].[RefineDate](''2010XX10'')
--print [vipunen_tk].[RefineDate](''0'')
--print [vipunen_tk].[RefineDate](''00000000'')
--print [vipunen_tk].[RefineDate](''XXXXXXXX'')

--print @input

-- We assume these are "empty" values and return ''''
if @input='''' or (isnumeric(@input)=1 and @input=0)
	return ''''
--	print ''Empty''

-- If century seems to be missing, assume it''s 20 and add it
if len(@input)=6 and substring(@input,1,2)!=''20''
	set @input=''20''+@input
--print @input

-- Split into year+month+day
set @year=substring(@input,1,4)
set @month=substring(@input,5,2)
set @day=substring(@input,7,2)
--print @year+@month+@day

-- Validate parts to be numeric
if isnumeric(@day)=0
	set @day=''''
if isnumeric(@month)=0
	set @month=''''
if isnumeric(@year)=0
	set @year=''''
--print @year+@month+@day

-- Anything left?
if @year+@month+@day=''''
	return ''''
--	print ''Empty''
--print @year+@month+@day

-- Check if seems DDMM then switch
if @month>12 begin
	set @t=@day
	set @day=@month
	set @month=@t
end
--print @year+@month+@day

-- Validate date and decrease at most 3 days
-- Assuming 31.2 -> 28.2 at most
declare @loop int=0
while @loop<3 and isdate(@year+@month+@day)=0 begin
	set @day=@day-1
	set @loop=@loop+1
end
--print @year+@month+@day

if isdate(@year+@month+@day)=0
 if ISDATE(@year+''0101'')=1
   return @year+''0101''
   
if isdate(@year+@month+@day)=0
	return @input

return @year+@month+@day

end

' 
END

GO
/****** Object:  UserDefinedFunction [dbo].[RefineDateEnd]    Script Date: 21.6.2017 11:02:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RefineDateEnd]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
-- Create function
CREATE function [dbo].[RefineDateEnd] (@input varchar(8))
returns varchar(8)
as
begin

declare @t varchar(8)
--declare @input varchar(8)
declare @year varchar(4)
declare @month varchar(2)
declare @day varchar(2)

-- Test cases
--print [vipunen_tk].[RefineDate](''103102'')
--print [vipunen_tk].[RefineDate](''201020'')
--print [vipunen_tk].[RefineDate](''2010'')
--print [vipunen_tk].[RefineDate](''201010XX'')
--print [vipunen_tk].[RefineDate](''1010XX'')
--print [vipunen_tk].[RefineDate](''2010XX10'')
--print [vipunen_tk].[RefineDate](''0'')
--print [vipunen_tk].[RefineDate](''00000000'')
--print [vipunen_tk].[RefineDate](''XXXXXXXX'')

--print @input

-- We assume these are "empty" values and return ''''
if @input='''' or (isnumeric(@input)=1 and @input=0)
	return ''''
--	print ''Empty''

-- If century seems to be missing, assume it''s 20 and add it
if len(@input)=6 and substring(@input,1,2)!=''20''
	set @input=''20''+@input
--print @input

-- Split into year+month+day
set @year=substring(@input,1,4)
set @month=substring(@input,5,2)
set @day=substring(@input,7,2)
--print @year+@month+@day

-- Validate parts to be numeric
if isnumeric(@day)=0
	set @day=''''
if isnumeric(@month)=0
	set @month=''''
if isnumeric(@year)=0
	set @year=''''
--print @year+@month+@day

-- Anything left?
if @year+@month+@day=''''
	return ''''
--	print ''Empty''
--print @year+@month+@day

-- Check if seems DDMM then switch
if @month>12 begin
	set @t=@day
	set @day=@month
	set @month=@t
end
--print @year+@month+@day

-- Validate date and decrease at most 3 days
-- Assuming 31.2 -> 28.2 at most
declare @loop int=0
while @loop<3 and isdate(@year+@month+@day)=0 begin
	set @day=@day-1
	set @loop=@loop+1
end
--print @year+@month+@day

if isdate(@year+@month+@day)=0
 if ISDATE(@year+''1231'')=1
   return @year+''1231''
   
if isdate(@year+@month+@day)=0
	return @input

return @year+@month+@day

end

' 
END

GO

USE [ANTERO]