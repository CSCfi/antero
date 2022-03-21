USE [ANTERO]
GO

/****** Object:  Table [dw].[d_kausi]    Script Date: 7.5.2021 2:32:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS(
  SELECT 1 FROM sys.columns 
  WHERE Name = N'jarjestys2' AND Object_ID = Object_ID(N'dw.d_kausi')
)
BEGIN
  ALTER TABLE [dw].[d_kausi] 
  ADD [jarjestys2] AS (case when [koodi]='K' then '2' when [koodi]='S' then '1' else '9' end)
END

